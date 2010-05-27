library ieee ;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.std_logic_arith.all;

use ieee.numeric_std.all;

use work.big_pkg.all;
use work.parser_pkg.all;
use ieee.numeric_std.all;use work.big_pkg.all;

--ENTITY
entity char_unit_tb is

end char_unit_tb;


--ARCHITECTURE
architecture behav of char_unit_tb is

--Variablen und Konstanten
constant clock_period:time := 30 ns;

signal sys_clk, sys_res_n: std_logic;
signal rb_busy		: std_logic := '0';
signal rb_read_en	: std_logic := '0';
signal rb_read_lineNr	: std_logic_vector(7 downto 0) := x"00";
signal rb_read_data_rdy	: std_logic := '0';
signal rb_read_data	: RAM_LINE;
signal charUnit_en		: STD_LOGIC;
signal charUnit_get_next	: STD_LOGIC;
signal charUnit_next_valid	: STD_LOGIC := '0';
signal charUnit_digit		: ONEDIGIT; 		-- INTEGER 0 bis 9
signal charUnit_op		: alu_operator_TYPE := NOP; 	-- (ADDITION, SUBTRAKTION, MULTIPLIKATION, DIVISION, NOP);
signal charUnit_lastChar_type	: PARSER_CHAR_TYPE  := RESET;--(RESET, DIGIT, OP, EOL);
signal charUnit_char_type	: PARSER_CHAR_TYPE  := RESET;	--(RESET, DIGIT, OP, EOL);

begin --behave

uut : entity work.char_unit_ent

port map
	(
		sys_clk	=> sys_clk,
		sys_res_n => sys_res_n,
		charUnit_en => charUnit_en,
		charUnit_get_next => charUnit_get_next,
		charUnit_next_valid => charUnit_next_valid,
		charUnit_digit => charUnit_digit,
		charUnit_op => charUnit_op,
		charUnit_lastChar_type => charUnit_lastChar_type,
		charUnit_char_type => charUnit_char_type,
		rb_busy => rb_busy,
		rb_read_en => rb_read_en,
		rb_read_lineNr => rb_read_lineNr,
		rb_read_data_rdy => rb_read_data_rdy,
		rb_read_data => rb_read_data
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
	-- INIT
	charunit_en <= '0';
	charunit_get_next <= '0';
	
	for i in 0 to 80 loop	
		rb_read_data(i) <= x"00";
	end loop;
	--	12+901
	rb_read_data(0) <= x"31";
	rb_read_data(1) <= x"32";
	rb_read_data(2) <= x"2B";
	rb_read_data(3) <= x"39";
	rb_read_data(4) <= x"30";
	rb_read_data(5) <= x"31";
	rb_read_data(6) <= x"00";

	wait for 15 ns;
	sys_res_n <= '0';
	wait for 90 ns;
	sys_res_n <= '1';
	rb_busy <= '1';
	wait for 90 ns;

	-- BEGIN TESTS
	wait for 60 ns;
	charUnit_en <= '1';
	wait for 60 ns;
	rb_read_data_rdy <= '1';
	wait for 30 ns;
	rb_read_data_rdy <= '0';
	
	for i in 0 to 7 loop	
		wait for 90 ns;
		charUnit_get_next <= '1';
		wait for 120 ns;
		charUnit_get_next <= '0';
	end loop;
	
	wait for 300 ns;
end process;

end architecture behav;
