library ieee ;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.std_logic_arith.all;

use ieee.numeric_std.all;

--ENTITY
entity struct_tb is

end struct_tb;


--ARCHITECTURE
architecture behav of struct_tb is

--Variablen und Konstanten
constant clock_period: time := 30 ns;

signal sys_clk, sys_res_n: std_logic;
signal btn_a : in std_logic;
signal led_a: out std_logic;
signal led_b: out std_logic;
signal ps2_data: inout std_logic;
signal ps2_clk: inout std_logic;
signal hsync_n: out std_logic;
signal vsync_n: out std_logic;
signal r: out std_logic_vector(RED_BITS-1 downto 0);
signal g: out std_logic_vector(GREEN_BITS-1 downto 0);
signal b: out std_logic_vector(BLUE_BITS-1 downto 0);
signal uart_tx: out std_logic;
signal uart_rx: in std_logic

begin --behave

uut : entity work.calc_top

port map
	(
		sys_clk	=> sys_clk,
		sys_res_n => sys_res_n,
		ps2_clk => ps2_clk,
		ps2_data => ps2_data,
		btn_a => btn_a,
		led_a => led_a,
		led_b => led_b,
		hsync_n => hsync_n,
		vsync_n => vsync_n,
		r => r,
		g => g,
		b => b,
		uart_tx => uart_tx,
		uart_rx => uart_rx
	);

clkgenerator : process
begin
	sys_clk <= '1';
	wait for clock_period/2;
	sys_clk <= '0';
	wait for clock_period/2;
end process clkgenerator;


process
begin
	sys_res_n <= '0';
	wait for 90 ns;
	sys_res_n <= '1';
	wait for 90 ns;

	-- BEGIN TESTS
	-- Eingabe '0'
	ps2_data <= x"70";
	wait for 30 ns;
	ps2_new_data <= '1';
	wait for 30 ns;
	ps2_new_data <= '0';
	wait for 30 ns;
	--assert inp_data(7 downto 0) = "00110000";
	wait for 90 ns;

	-- Eingabe '7'
	ps2_data <= x"6C";
	wait for 30 ns;
	ps2_new_data <= '1';
	wait for 30 ns;
	ps2_new_data <= '0';
	wait for 30 ns;
	--assert inp_data(7 downto 0) = x"37";
	wait for 90 ns;

	-- Eingabe BACKSPACE
	ps2_data <= x"66";
	wait for 30 ns;
	ps2_new_data <= '1';
	wait for 30 ns;
	ps2_new_data <= '0';
	wait for 30 ns;
	--assert inp_del = '1';
	wait for 90 ns;

	-- Eingabe ENTER
	ps2_data <= x"5A";
	wait for 30 ns;
	ps2_new_data <= '1';
	wait for 30 ns;
	ps2_new_data <= '0';
	wait for 30 ns;
	--assert pars_start = '1';
	wait for 90 ns;
	
	-- Eingabe '/'
	ps2_data <= x"E0";
	wait for 30 ns;
	ps2_new_data <= '1';
	wait for 30 ns;
	--ps2_new_data <= '0';
	wait for 30 ns;

	ps2_data <= x"4A";
	wait for 30 ns;
	ps2_new_data <= '1';
	wait for 30 ns;
	ps2_new_data <= '0';
	wait for 30 ns;
	--assert inp_data(7 downto 0) = x"2F";
	wait for 90 ns;

	-- falsche Eingabe 'M'
	ps2_data <= x"4D";
	wait for 30 ns;
	ps2_new_data <= '1';
	wait for 30 ns;
	ps2_new_data <= '0';
	wait for 30 ns;
	--assert inp_new_data = '0';
	wait for 90 ns;

	-- falsche Spezial Eingabe 'h'
	ps2_data <= x"E0";
	wait for 30 ns;
	ps2_new_data <= '1';
	wait for 30 ns;
	ps2_new_data <= '0';
	wait for 30 ns;

	ps2_data <= x"68";
	wait for 30 ns;
	ps2_new_data <= '1';
	wait for 30 ns;
	ps2_new_data <= '0';
	wait for 30 ns;
	--assert inp_new_data = '0';
	wait for 90 ns;

end process;

end architecture behav;
