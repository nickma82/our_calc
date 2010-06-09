library ieee ;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.std_logic_arith.all;

use ieee.numeric_std.all;

use work.big_pkg.all;

--ENTITY
entity ringbuffer2_tb is

end ringbuffer2_tb;


--ARCHITECTURE
architecture behav of ringbuffer2_tb is

--Variablen und Konstanten
constant clock_period:time := 30 ns;

signal sys_clk, sys_res_n: std_logic;
signal rb_busy		: std_logic := '0';
signal pars_new_data	: std_logic := '0';
signal pars_data	: RESULT_LINE;
signal pars_state	: parser_status_TYPE;
signal inp_new_data	: std_logic := '0';
signal inp_data		: std_logic_vector(7 downto 0) := x"00";
signal inp_del		: std_logic := '0';
signal rb_char_newline	: std_logic := '0';
signal rb_read_en	: std_logic := '0';
signal rb_read_lineNr	: std_logic_vector(7 downto 0) := x"00";
signal rb_read_data_rdy	: std_logic := '0';
signal rb_pars_en	: std_logic := '0';
signal rb_pars_lineNr	: std_logic_vector(7 downto 0) := x"00";
signal rb_pars_data_rdy	: std_logic := '0';
signal rb_read_data	: RAM_LINE;
signal wr		: std_logic;
signal address		: integer range 0 to 4200;
signal data_in		: std_logic_vector(7 downto 0);
signal data_out		: std_logic_vector(7 downto 0);		

begin --behave

ring : entity work.ringbuffer2_ent
	port map
	(
		sys_clk	=> sys_clk,
		sys_res_n => sys_res_n,
		rb_busy => rb_busy,
		pars_new_data => pars_new_data,
		pars_data => pars_data,
		pars_state => pars_state,
		inp_new_data => inp_new_data,
		inp_data => inp_data,
		inp_del => inp_del,
		rb_read_en => rb_read_en,
		rb_read_lineNr => rb_read_lineNr,
		rb_read_data_rdy => rb_read_data_rdy,
		rb_read_data => rb_read_data,
		rb_pars_en => rb_pars_en,
		rb_pars_lineNr => rb_pars_lineNr,
		rb_pars_data_rdy => rb_pars_data_rdy,
		wr => wr,
		address => address,
		data_in => data_in,
		data_out => data_out
	);

ram : entity work.ram_ent
	port map
	(
		sys_clk	=> sys_clk,
		sys_res_n => sys_res_n,
		wr => wr,
		address => address,
		data_in => data_in,
		data_out => data_out
	);

clkgenerator : process
begin
	sys_clk <= '0';
	wait for clock_period/2;
	sys_clk <= '1';
	wait for clock_period/2;
end process clkgenerator;


process
begin
	pars_data <= MSG_OVERFLOW;
	pars_state <= PGOOD;	

	sys_res_n <= '0';
	wait for 45 ns;
	sys_res_n <= '1';
	wait for 30 ns;
	
	inp_data <= x"32";
	wait for 30 ns;
	inp_new_data <= '1';
	wait for 30 ns;
	inp_new_data <= '0';
	wait for 60 ns;
	
	inp_data <= x"31";
	wait for 30 ns;
	inp_new_data <= '1';
	wait for 30 ns;
	inp_new_data <= '0';
	wait for 60 ns;
	
	inp_data <= x"2B";
	wait for 30 ns;
	inp_new_data <= '1';
	wait for 30 ns;
	inp_new_data <= '0';
	wait for 60 ns;

	inp_data <= x"39";
	wait for 30 ns;
	inp_new_data <= '1';
	wait for 30 ns;
	inp_new_data <= '0';
	wait for 60 ns;
	
	inp_data <= x"34";
	wait for 30 ns;
	inp_new_data <= '1';
	wait for 30 ns;
	inp_new_data <= '0';
	wait for 60 ns;
	
	--Zeichen löschen
	inp_del <= '1';
	wait for 30 ns;
	inp_del <= '0';
	wait for 60 ns;

	pars_new_data <= '1';
	wait for 30 ns;
	pars_new_data <= '0';
	wait for 500 ns;

	--Zeile abfragen
	rb_read_lineNr <= x"32";
	wait for 30 ns;
	rb_read_en <= '1';
	wait for 30 ns;
	rb_read_en <= '0';
	wait for 60 ns;

	wait for 5 us;

	

	--Zeile abfragen
	rb_read_lineNr <= x"31";
	wait for 30 ns;
	--rb_read_en <= '1';
	wait for 30 ns;
	rb_read_en <= '0';
	wait for 60 ns;

	wait for 5 us;


	wait for 30 ns;
	rb_char_newline <= '1';
	wait for 30 ns;
	rb_char_newline <= '0';
	wait for 30 ns;
	
end process;

end architecture behav;
