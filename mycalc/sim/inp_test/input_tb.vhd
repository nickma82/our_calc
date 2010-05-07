library ieee ;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.std_logic_arith.all;

use ieee.numeric_std.all;

--ENTITY
entity input_tb is

end input_tb;


--ARCHITECTURE
architecture behav of input_tb is

--Variablen und Konstanten
constant clock_period:time := 20 ns;

signal sys_clk, sys_res_n: std_logic;
signal ps2_new_data : std_logic := '0';
signal inp_new_data : std_logic := '0';
signal inp_del : std_logic := '0';
signal inp_sendRS232 : std_logic := '0';
signal pars_start : std_logic := '0';
signal ps2_data, inp_data : std_logic_vector(7 downto 0) := x"00";


begin --behave

uut : entity work.input_ent

port map
	(
		sys_clk	=> sys_clk,
		sys_res_n => sys_res_n,
		ps2_new_data => ps2_new_data,
		ps2_data => ps2_data,
		inp_new_data => inp_new_data,
		inp_data => inp_data,
		inp_del => inp_del,
		inp_sendRS232 => inp_sendRS232,
		pars_start => pars_start
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
	sys_res_n <= '0';
	wait for 100 ns;
	sys_res_n <= '1';
	wait for 100 ns;

	-- BEGIN TESTS
	-- Eingabe '0'
	ps2_data <= x"70";
	wait for 20 ns;
	ps2_new_data <= '1';
	wait for 20 ns;
	ps2_new_data <= '0';
	wait for 10 ns;
	assert ps2_data(7 downto 0) = "00110000"
	wait for 100 ns;

	-- Eingabe '7'
	ps2_data <= x"6C";
	wait for 20 ns;
	ps2_new_data <= '1';
	wait for 20 ns;
	ps2_new_data <= '0';
	wait for 10 ns;
	assert ps2_data(7 downto 0) = x"37";
	wait for 100 ns;

	-- Eingabe BACKSPACE
	ps2_data <= x"66";
	wait for 20 ns;
	ps2_new_data <= '1';
	wait for 20 ns;
	ps2_new_data <= '0';
	wait for 10 ns;
	--assert inp_del = '1';
	wait for 100 ns;

	-- Eingabe ENTER
	ps2_data <= x"66";
	wait for 20 ns;
	ps2_new_data <= '1';
	wait for 20 ns;
	ps2_new_data <= '0';
	wait for 10 ns;
	--assert pars_start = '1';
	wait for 100 ns;
	
	-- Eingabe /
	ps2_data <= x"E0";
	wait for 20 ns;
	ps2_new_data <= '1';
	wait for 20 ns;
	ps2_new_data <= '0';
	wait for 20 ns;
	ps2_data <= x"4A";
	wait for 20 ns;
	ps2_new_data <= '1';
	wait for 20 ns;
	ps2_new_data <= '0';
	wait for 10 ns;
	--assert pars_start = '1';
	wait for 100 ns;

end process;

end architecture behav;
