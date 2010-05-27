library ieee ;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.std_logic_arith.all;

use ieee.numeric_std.all;

--ENTITY
entity rs232_tb is

end rs232_tb;


--ARCHITECTURE
architecture behav of rs232_tb is

--Variablen und Konstanten
constant clock_period:time := 30 ns;

signal sys_clk, sys_res_n: std_logic;
signal tx_rdy		: std_logic;
signal tx_go		: std_logic;
signal tx_data		: std_logic_vector(7 downto 0);
signal rx_recv		: std_logic;
signal rx_data		: std_logic_vector(7 downto 0);
signal uart_rx		: std_logic;
signal uart_tx		: std_logic;


begin --behave

uut : entity work.rs232_ent

port map
	(
		sys_clk	=> sys_clk,
		sys_res_n => sys_res_n,
		tx_rdy => tx_rdy,
		tx_go => tx_go,
		tx_data => tx_data,
		rx_recv => rx_recv,
		rx_data => rx_data,
		uart_rx => uart_rx,
		uart_tx => uart_tx
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
	sys_res_n <= '0';
	wait for 90 ns;
	sys_res_n <= '1';
	uart_rx <= '1';
	tx_data <= x"00";
	tx_go <= '0';
	wait for 90 ns;

	-- BEGIN TESTS
	--Receive Byte
	wait for 10 us;
	uart_rx <= '0';
	wait for 8.68 us;
	uart_rx <= '1';			--1 Bit
	wait for 8.68 us;
	uart_rx <= '0';			--2 Bit
	wait for 8.68 us;
	uart_rx <= '1';			--3 Bit
	wait for 8.68 us;
	uart_rx <= '0';			--4 Bit
	wait for 8.68 us;
	uart_rx <= '1';			--5 Bit
	wait for 8.68 us;
	uart_rx <= '0';			--6 Bit
	wait for 8.68 us;
	uart_rx <= '1';			--7 Bit
	wait for 8.68 us;
	uart_rx <= '0';			--8 Bit
	wait for 8.68 us;
	uart_rx <= '1';			--Stoppbit	

	--send Byte
	wait for 50 us;
	tx_data <= "11001100";
	tx_go <= '1';
	wait for 90 ns;
	tx_go <= '0';
	wait for 80 us;
end process;

end architecture behav;
