library ieee ;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.std_logic_arith.all;

use ieee.numeric_std.all;

--ENTITY
entity ram_tb is

end ram_tb;


--ARCHITECTURE
architecture behav of ram_tb is

--Variablen und Konstanten
constant clock_period:time := 20 ns;

signal sys_clk		: std_logic;
signal line_address 	: std_logic_vector(0 to LINE_COUNT -1);	
signal byte_address 	: std_logic_vector(0 to CHAR_COUNT -1);
signal data_out 	: std_logic_vector(DATA_WIDTH -1 downto 0);
signal wr 		: std_logic;
signal data_in 		: std_logic_vector(DATA_WIDTH -1 downto 0)


begin --behave

uut : entity work.input_ent

port map
	(
		sys_clk	=> sys_clk,
		line_address => line_address,
		byte_address => byte_address,
		data_out => data_out,
		wr => wr,
		data_in => data_in
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
	-- BEGIN TESTS
	-- Speichern in Adresse 0 : 0
	line_address <= x"0";
	wait for 20 ns;
	byte_address <= x"0";
	wait for 20 ns;
	data_in <= x"8D";
	wait for 20 ns;
	wr <= '1';
	wait for 20 ns;
	--assert vga_command_data(31 downto 0) = "xxxxx";
	wait for 100 ns;

	-- Speichern in Adresse 1 : 10
	line_address <= x"1";
	wait for 20 ns;
	byte_address <= x"A";
	wait for 20 ns;
	data_in <= x"F0";
	wait for 20 ns;
	wr <= '1';
	wait for 20 ns;
	--assert vga_command_data(31 downto 0) = "xxxxx";
	wait for 100 ns;

	-- aus Adresse laden 0 : 0
	line_address <= x"0";
	wait for 20 ns;
	byte_address <= x"0";
	wait for 20 ns;
	assert data_in = x"8D";
	wait for 100 ns;
end process;

end architecture behav;
