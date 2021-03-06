library ieee ;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.std_logic_arith.all;

use ieee.numeric_std.all;

USE work.big_pkg.all;

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
signal pars_data	: RESULT_LINE;


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
	--pars_data <= x"00";
	inp_new_data <= '0';
	pars_new_data <= '0';
	vga_free <= '1';
	inp_del <= '0';
	

	sys_res_n <= '0';
	wait for 45 ns;
	sys_res_n <= '1';
	wait for 30 ns;

	--Init
	vga_free <= '0';
	wait for 90 ns;
	vga_free <= '1';
	wait for 90 ns;

	-- BEGIN TESTS
	-- vom Input '5'
	inp_data <= x"35";
	wait for 30 ns;
	inp_new_data <= '1';
	wait for 30 ns;
	inp_new_data <= '0';
	wait for 60 ns;
	vga_free <= '0';
	wait for 90 ns;
	vga_free <= '1';
	wait for 30 ns;

	-- vom Input '9'
	inp_data <= x"39";
	wait for 30 ns;
	inp_new_data <= '1';
	wait for 30 ns;
	inp_new_data <= '0';
	wait for 60 ns;
	vga_free <= '0';
	wait for 90 ns;
	vga_free <= '1';
	wait for 30 ns;

	-- vom Input Backspace
	wait for 30 ns;
	inp_del <= '1';
	wait for 30 ns;
	inp_del <= '0';
	wait for 60 ns;
	vga_free <= '0';
	wait for 90 ns;
	vga_free <= '1';
	wait for 60 ns;

	-- vom Parser
	pars_data(0) <= x"30";
	pars_data(1) <= x"31";
	pars_data(2) <= x"32";
	pars_data(3) <= x"33";
	pars_data(4) <= x"34";
	pars_data(5) <= x"35";
	pars_data(6) <= x"36";
	pars_data(7) <= x"37";
	pars_data(8) <= x"00";
	pars_data(9) <= x"00";
	pars_data(10)<= x"00";
	wait for 30 ns;
	pars_new_data <= '1';
	wait for 30 ns;
	pars_new_data <= '0';
	wait for 90 ns;
	--neue Zeile
	vga_free <= '0';
	wait for 90 ns;
	vga_free <= '1';
	wait for 90 ns;
	--Position setzen
	vga_free <= '0';
	wait for 90 ns;
	vga_free <= '1';
	wait for 90 ns;
	--erstes Zeichen
	vga_free <= '0';
	wait for 90 ns;
	vga_free <= '1';
	wait for 90 ns;
	--zweites Zeichen
	vga_free <= '0';
	wait for 90 ns;
	vga_free <= '1';
	wait for 90 ns;
	--drittes Zeichen
	vga_free <= '0';
	wait for 90 ns;
	vga_free <= '1';
	wait for 90 ns;
	--viertes Zeichen
	vga_free <= '0';
	wait for 90 ns;
	vga_free <= '1';
	wait for 90 ns;
	--fünftes Zeichen
	vga_free <= '0';
	wait for 90 ns;
	vga_free <= '1';
	wait for 90 ns;
	--sechstes Zeichen
	vga_free <= '0';
	wait for 90 ns;
	vga_free <= '1';
	wait for 90 ns;
	--siebentes Zeichen
	vga_free <= '0';
	wait for 90 ns;
	vga_free <= '1';
	wait for 90 ns;
	--achtes Zeichen
	vga_free <= '0';
	wait for 90 ns;
	vga_free <= '1';
	wait for 90 ns;
	--neuntes Zeichen
	vga_free <= '0';
	wait for 90 ns;
	vga_free <= '1';
	wait for 90 ns;
	--neue Zeile
	vga_free <= '0';
	wait for 90 ns;
	vga_free <= '1';
	wait for 90 ns;
	--Position setzen
	vga_free <= '0';
	wait for 90 ns;
	vga_free <= '1';
	wait for 90 ns;

end process;

end architecture behav;
