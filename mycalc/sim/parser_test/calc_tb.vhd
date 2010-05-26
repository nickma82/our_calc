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

	signal parse_data:	ASCII_CHAR;
	signal rb_busy: STD_LOGIC;
	signal rb_read_en:	STD_LOGIC;
	signal rb_read_lineNr:	LINE_NUM;
	signal rb_read_data_rdy: STD_LOGIC;
	signal rb_read_data:	 RAM_LINE;
	
	signal charUnit_en:	STD_LOGIC;
	signal charUnit_get_next: STD_LOGIC;
	signal charUnit_next_valid:	STD_LOGIC;
	signal charUnit_digit: 		ONEDIGIT;
	signal charUnit_op:		alu_operator_TYPE;
	signal charUnit_lastChar_type : PARSER_CHAR_TYPE;
	signal charUnit_char_type: 	PARSER_CHAR_TYPE;
	
	
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
		rb_read_en:	out STD_LOGIC; 	--Eine neue Zeile wird angefordert.
		rb_read_lineNr:	out LINE_NUM;	--Die neue Zeile die gelesen werden soll.
		rb_read_data_rdy:in STD_LOGIC;	--Die neue Zeile kann gelesen werden.
		rb_read_data:	in  RAM_LINE;
		
		-- TEST input
		en:		IN STD_LOGIC;
		get_next: 	IN STD_LOGIC;
		next_valid:	OUT STD_LOGIC;
		digit: 		OUT ONEDIGIT;
		op:		OUT alu_operator_TYPE;
		lastChar_type : OUT PARSER_CHAR_TYPE;
		char_type: 	OUT PARSER_CHAR_TYPE
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
		rb_read_data	=> rb_read_data,
		
		-- TEST input
		en	=> charUnit_en,
		get_next	=> charUnit_get_next,
		next_valid	=> charUnit_next_valid,
		digit	=> charUnit_digit,
		op	=> charUnit_op,
		lastChar_type	=> charUnit_lastChar_type,
		char_type	=> charUnit_char_type
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
  
  
  process
  	variable trigger_nextValid: std_logic := '0';
  begin
  	if (intern_charUnit_on_last /= intern_charUnit_on) then
  		intern_charUnit_on_last <= intern_charUnit_on;
  		if intern_charUnit_on = '1' then
  			trigger_nextValid := '1';
  		end if;
  	end if; 
  	
  	if (trigger_nextValid = '1' and charUnit_get_next = '1') then
  		charUnit_next_valid <= '1';
  	else
  		charUnit_next_valid <= '0';
  		trigger_nextValid := '0';
  	end if;
  	
  	
  	if stop = true then
  		wait;
  	end if;
  	wait for 15 ns;
  end process;
  
  
  process
  begin
    sys_res_n <= '0';
    --######## RESET Pins #######
	--parser
    ps_start <= '1';
    intern_charUnit_on <= '0';
	--test input digitUnit
	--##END RESET##
	
	wait for 100 ns;
    sys_res_n <= '1';
    -- BEGIN TESTS
    
	wait for 10 us;
	
	--(RESET, DIGIT, OP, EOL);
	intern_charUnit_on <= '0';
	wait for 500 ns;
	charUnit_digit <=  0; 
	charUnit_lastChar_type <= RESET;
	charUnit_char_type	<= DIGIT;
	charUnit_op		<= NOP;
	wait for 10 ns;
	intern_charUnit_on <= '1';
	wait for 2 us;
		
	for i in 0 to 7 loop
		--(RESET, DIGIT, OP, EOL);
		intern_charUnit_on <= '0';
		wait for 500 ns;
		charUnit_digit <=  i; 
		charUnit_lastChar_type <= DIGIT;
		charUnit_char_type	<= DIGIT;
		charUnit_op		<= NOP;
		wait for 10 ns;
		intern_charUnit_on <= '1';
		wait for 2 us;
	end loop;
    	
    	
    	--(RESET, DIGIT, OP, EOL);
	---------------------------OP
	intern_charUnit_on <= '0';
	wait for 500 ns; 
	charUnit_lastChar_type <= DIGIT;
	charUnit_char_type	<= OP;
	charUnit_op		<= SUBTRAKTION;
	wait for 10 ns;
	intern_charUnit_on <= '1';
	wait for 2 us;
    
	
	intern_charUnit_on <= '0';
	wait for 500 ns;
	charUnit_digit 		<=  2; 
	charUnit_lastChar_type <= OP;
	charUnit_char_type	<= DIGIT;
	charUnit_op			<= NOP;
	wait for 10 ns;
	intern_charUnit_on <= '1';
	wait for 2 us;
	
	---------------------------OP
	intern_charUnit_on <= '0';
	wait for 500 ns; 
	charUnit_lastChar_type <= DIGIT;
	charUnit_char_type		<= OP;
	charUnit_op				<= ADDITION;
	wait for 10 ns;
	intern_charUnit_on <= '1';
	wait for 2 us;
	
	intern_charUnit_on <= '0';
	wait for 500 ns;
	charUnit_digit 		<=  1; 
	charUnit_lastChar_type <= OP;
	charUnit_char_type	<= DIGIT;
	charUnit_op			<= NOP;
	wait for 10 ns;
	intern_charUnit_on <= '1';
	wait for 2 us;
	
	intern_charUnit_on <= '0';
	wait for 500 ns;
	charUnit_digit 		<=  2; 
	charUnit_lastChar_type <= DIGIT;
	charUnit_char_type	<= DIGIT;
	charUnit_op			<= NOP;
	wait for 10 ns;
	intern_charUnit_on <= '1';
	wait for 2 us;
	
	
	
	---------------------------DIGIT/OP
	intern_charUnit_on <= '0';
	wait for 500 ns; 
	charUnit_lastChar_type <= DIGIT;
	charUnit_char_type		<= OP;
	charUnit_op				<= MULTIPLIKATION;
	wait for 10 ns;
	intern_charUnit_on <= '1';
	wait for 2 us;
	
	---------------------------OP/OP
	intern_charUnit_on <= '0';
	wait for 500 ns; 
	charUnit_lastChar_type <= OP;
	charUnit_char_type		<= OP;
	charUnit_op				<= SUBTRAKTION;
	wait for 10 ns;
	intern_charUnit_on <= '1';
	wait for 2 us;
	
	-------------------------OP/DIGIT
	intern_charUnit_on <= '0';
	wait for 500 ns;
	charUnit_digit 		<=  2; 
	charUnit_lastChar_type <= OP;
	charUnit_char_type	<= DIGIT;
	charUnit_op			<= NOP;
	wait for 10 ns;
	intern_charUnit_on <= '1';
	wait for 2 us;
	
	
	---------------------------DIGIT/OP
	intern_charUnit_on <= '0';
	wait for 500 ns; 
	charUnit_lastChar_type <= DIGIT;
	charUnit_char_type		<= OP;
	charUnit_op				<= DIVISION;
	wait for 10 ns;
	intern_charUnit_on <= '1';
	wait for 2 us;
	
	
	-------------------------OP/DIGIT
	intern_charUnit_on <= '0';
	wait for 500 ns;
	charUnit_digit 		<=  4; 
	charUnit_lastChar_type <= OP;
	charUnit_char_type	<= DIGIT;
	charUnit_op			<= NOP;
	wait for 10 ns;
	intern_charUnit_on <= '1';
	wait for 2 us;
	
	---------------------------DIGIT/OP
	intern_charUnit_on <= '0';
	wait for 500 ns; 
	charUnit_lastChar_type <= DIGIT;
	charUnit_char_type		<= EOL;
	charUnit_op				<= NOP;
	wait for 10 ns;
	intern_charUnit_on <= '1';
	wait for 2 us;
	
--     wait for 500 ns;
--     calc_data <=  to_signed(-13, SIZEI); --Integer to Signed
--     calc_data2 <= to_signed(11, SIZEI);
--     calc_operator <= MULTIPLIKATION;
--     wait for 10 ns;
--     calc_start <= '1';
--     wait for 2 us;
--     -- coverage off
--     assert calc_result= to_signed(-143, SIZEI)
-- 		report "result failed" 	severity failure;
--     -- coverage on
--     calc_start <= '0';

	
	
    wait for 200 us;
    stop <= true;
    wait;
  end process;
end architecture behav;
