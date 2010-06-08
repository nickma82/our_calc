library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
--use work.alu_pkg.all;
use work.big_pkg.all;
use work.parser_pkg.all;

entity parser_tb is
	
end entity parser_tb;

architecture behav of parser_tb is
  signal sys_clk, sys_res_n: std_logic;
  signal stop : boolean := false;
  	
  	constant RESET_VALUE: std_logic := '0';
	constant SIZE: INTEGER := 32;
	

	signal ps_start:	STD_LOGIC;
	signal parse_new_data: 	STD_LOGIC;

	signal parse_data:	RESULT_LINE; 	--Der neue ASCII Code.
	signal parse_state:	parser_status_TYPE;	--
	
	signal rb_busy: STD_LOGIC;
	signal rb_read_en:	STD_LOGIC;
	signal rb_read_lineNr:	std_logic_vector(7 downto 0);
	signal rb_read_data_rdy: STD_LOGIC;
	signal rb_read_data:	 RAM_LINE;
	
	
	component parser_top is
	generic
	(
			RESET_VALUE : std_logic := '0'
	);
	port
	(	sys_clk, sys_res_n       : in    std_logic;	
			
		ps_start:	IN STD_LOGIC;
		parse_new_data: 	out STD_LOGIC;
		
		parse_data:	out ASCII_CHAR; --Der neue ASCII Code.
		rb_busy:	in  STD_LOGIC;
		rb_read_en:	inout STD_LOGIC; 	--Eine neue Zeile wird angefordert.
		rb_read_lineNr:	out std_logic_vector(7 downto 0);	--Die neue Zeile die gelesen werden soll.
		rb_read_data_rdy:in STD_LOGIC;	--Die neue Zeile kann gelesen werden.
		rb_read_data:	in  RAM_LINE
		
	);
	end component parser_top;
	
	
	signal intern_charUnit_on: std_logic := '0';
	signal intern_charUnit_on_last: std_logic := '0';
begin --behave
  --uut : entity work.parser_top
  uut: entity work.parser_top
	generic map
	(
			RESET_VALUE => RESET_VALUE
	)
	port map
	(	sys_clk => sys_clk,
		sys_res_n => sys_res_n,
			
		ps_start	=> ps_start,
		parse_new_data	=> parse_new_data,
		parse_data	=> parse_data,
		
		rb_busy	=> rb_busy,
		rb_read_en	=> rb_read_en,
		rb_read_lineNr	=> rb_read_lineNr,
		rb_read_data_rdy=> rb_read_data_rdy,
		rb_read_data	=> rb_read_data
	);
    
  process
  begin
    sys_clk <= '0';
    wait for 15 ns;
    sys_clk <= '1';
    if stop = true then
      wait;
    end if;
    wait for 15 ns;
  end process;
  
  

  
  --	Key		Hex
  --	Space	20
  --	0		30
  --	9		39
  --	*		2A
  --	+		2B
  --	-		2D
  --	/		2F
  --	EOF		00 ?
  process
  begin
    sys_res_n <= '0';
    --######## RESET Pins #######
	-- INIT
	for i in 0 to 80 loop	
		rb_read_data(i) <= x"00";
	end loop;
	--parser
	rb_read_data_rdy<= '0';
	ps_start <= '1';
    
	rb_read_data(0) <= x"31";
	rb_read_data(1) <= x"31"; 
	rb_read_data(2) <= x"2B"; --+
	rb_read_data(3) <= x"31";
	rb_read_data(4) <= x"32";
	rb_read_data(5) <= x"2A"; --*
	rb_read_data(6) <= x"31";
	rb_read_data(7) <= x"33";
	rb_read_data(8) <= x"2F"; --/
	rb_read_data(9) <= x"2D"; -- -
	rb_read_data(10) <= x"31";
	rb_read_data(11) <= x"33";
	rb_read_data(12) <= x"2B"; --+
	rb_read_data(13) <= x"31";
	rb_read_data(14) <= x"31";
	rb_read_data(15) <= x"00"; --EOF
	
	--test input digitUnit
	--##END RESET##
	wait for 100 ns;
    sys_res_n <= '1';
    -- BEGIN TESTS
    	
    	rb_busy<= '1';
	wait for 500 ns;
	rb_read_data_rdy<='1';
	
	
	
	wait for 100 us;
	ps_start<='0'; 
	rb_read_data(0) <= x"2B"; --+
	rb_read_data(1) <= x"31";
	rb_read_data(4) <= x"00"; --EOL
	wait for 500 ns;
	ps_start <= '1';
	
	wait for 100 us;
	ps_start<='0'; 
	rb_read_data(0) <= x"31";
	rb_read_data(1) <= x"33";
	rb_read_data(2) <= x"00";
	wait for 500 ns;
	ps_start <= '1';
	
	---space test
	wait for 100 us;
	ps_start<='0'; 
	rb_read_data(0) <= x"20"; --Space
	rb_read_data(1) <= x"33";
	rb_read_data(2) <= x"2B"; --+
	rb_read_data(3) <= x"20"; --Space
	rb_read_data(4) <= x"35";
	rb_read_data(5) <= x"00"; --EOL
	wait for 500 ns;
	ps_start <= '1';
	
	-- -2147483648
	wait for 100 us;
	ps_start<='0'; 
	rb_read_data(0) <= x"2D"; -- -
	rb_read_data(1) <= x"32"; 
	rb_read_data(2) <= x"31"; 
	rb_read_data(3) <= x"34";
	rb_read_data(4) <= x"37";
	rb_read_data(5) <= x"34";
	rb_read_data(6) <= x"38";
	rb_read_data(7) <= x"33";
	rb_read_data(8) <= x"36";
	rb_read_data(9) <= x"34";
	rb_read_data(10) <=x"38";
	rb_read_data(11) <=x"00"; --eol

	wait for 500 ns;
	ps_start <= '1';
	
	
    wait for 200 us;
    stop <= true;
    wait;
  end process;
end architecture behav;
