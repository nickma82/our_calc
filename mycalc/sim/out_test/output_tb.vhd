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
constant clock_period:time := 30 ns;

signal sys_clk, sys_res_n: std_logic;
signal vga_command	: std_logic_vector(7 downto 0);
signal vga_command_data	: std_logic_vector(31 downto 0);
signal vga_free		: std_logic;
signal inp_new_data	: std_logic;
signal inp_data		: std_logic_vector(7 downto 0);
signal inp_del		: std_logic;
signal pars_new_data	: std_logic;
signal pars_data	: std_logic_vector(7 downto 0);


begin --behave

uut : entity work.output_ent

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
	-- INIT
	inp_data <= x"00";
	pars_data <= x"00";
	inp_new_data <= '0';
	pars_new_data <= '0';
	vga_free <= '1';
	inp_del <= '0';
	

	sys_res_n <= '0';
	wait for 90 ns;
	sys_res_n <= '1';
	wait for 90 ns;

	-- BEGIN TESTS
	-- vom Input '5'
	inp_data <= x"35";
	wait for 30 ns;
	inp_new_data <= '1';
	vga_free <= '0';
	wait for 30 ns;
	inp_new_data <= '0';
	wait for 30 ns;
	vga_free <= '1';
	--assert vga_command_data(31 downto 0) = "xxxxx";
	wait for 30 ns;

	-- vom Input '9'
	inp_data <= x"39";
	wait for 30 ns;
	inp_new_data <= '1';
	vga_free <= '0';
	wait for 30 ns;
	inp_new_data <= '0';
	wait for 30 ns;
	vga_free <= '1';
	--assert vga_command_data(31 downto 0) = "xxxxx";
	wait for 30 ns;

	-- vom Input Backspace
	inp_data <= x"08";
	wait for 30 ns;
	inp_new_data <= '1';
	vga_free <= '0';
	wait for 30 ns;
	inp_new_data <= '0';
	wait for 30 ns;
	vga_free <= '1';
	--assert vga_command_data(31 downto 0) = "xxxxx";
	wait for 30 ns;

	-- vom Parser '='
	pars_data <= x"3D";
	wait for 30 ns;
	pars_new_data <= '1';
	vga_free <= '0';
	wait for 30 ns;
	pars_new_data <= '0';
	wait for 30 ns;
	vga_free <= '1';
	--assert vga_command_data(31 downto 0) = "xxxxx";
	wait for 30 ns;

	-- vom Parser '5'
	pars_data <= x"35";
	wait for 30 ns;
	pars_new_data <= '1';
	vga_free <= '0';
	wait for 30 ns;
	pars_new_data <= '0';
	wait for 30 ns;
	vga_free <= '1';
	--assert vga_command_data(31 downto 0) = "xxxxx";
	wait for 30 ns;
end process;

end architecture behav;
