library ieee ;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.std_logic_arith.all;

use ieee.numeric_std.all;

--ENTITY
entity output_tb is

end output_tb;


--ARCHITECTURE
architecture behav of output_tb is

--Variablen und Konstanten
constant clock_period:time := 20 ns;

signal sys_clk, sys_res_n: std_logic;
signal vga_command	: std_logic_vector(7 downto 0);
signal vga_command_data	: std_logic_vector(31 downto 0);
signal vga_free		: std_logic;
signal inp_new_data	: std_logic;
signal inp_data		: std_logic_vector(7 downto 0);
signal inp_del		: std_logic;
signal pars_new_data	: std_logic;
signal pars_data	: std_logic_vector(31 downto 0);


begin --behave

uut : entity work.input_ent

port map
	(
		sys_clk	=> sys_clk,
		sys_res_n => sys_res_n,
		vga_command => vga_command,
		vga_command_data => vga_command_data,
		vga_free => vga_free,
		inp_new_data => inp_new_data,
		inp_data => inp_data,
		inp_del => inp_del,
		pars_new_data => pars_new_data,
		pars_data => pars_data
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
	wait for 20 ns;
	assert ps2_data(7 downto 0) = "00110000";
	wait for 100 ns;

end process;

end architecture behav;
