library ieee ;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.std_logic_arith.all;

use ieee.numeric_std.all;

use work.big_pkg.all;

--ENTITY
entity Serial_Handler_tb is

end Serial_Handler_tb;


--ARCHITECTURE
architecture behav of Serial_Handler_tb is

--Variablen und Konstanten
constant clock_period:time := 30 ns;

signal sys_clk, sys_res_n: std_logic;
signal inp_sendRS232	: std_logic;
signal rb_busy		: std_logic;
signal rb_read_en	: std_logic;
signal rb_read_lineNr	: std_logic_vector(7 downto 0);
signal rb_read_data_rdy	: std_logic;
signal rb_read_data	: RAM_LINE;	
signal tx_rdy		: std_logic;
signal tx_go		: std_logic;
signal tx_data		: std_logic_vector(7 downto 0);
signal rx_recv		: std_logic;
signal rx_data		: std_logic_vector(7 downto 0);

begin --behave

uut : entity work.Serial_Handler_ent

port map
	(
		sys_clk	=> sys_clk,
		sys_res_n => sys_res_n,
		inp_sendRS232 => inp_sendRS232,
		rb_busy => rb_busy,
		rb_read_en => rb_read_en,
		rb_read_lineNr => rb_read_lineNr,
		rb_read_data_rdy => rb_read_data_rdy,
		rb_read_data => rb_read_data,
		tx_rdy => tx_rdy,
		tx_go => tx_go,
		tx_data => tx_data,
		rx_recv => rx_recv,
		rx_data => rx_data
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
	for i in 0 to 81 loop	
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

	rb_busy <= '1';
	rx_recv <= '0';
	inp_sendRS232 <= '0';
	rb_read_data_rdy <= '0';
	tx_rdy <= '0';
	rx_data <= x"00";

	wait for 15 ns;
	sys_res_n <= '0';
	wait for 90 ns;
	sys_res_n <= '1';
	wait for 90 ns;

	-- BEGIN TESTS
	--Histroy anfordern
	inp_sendRS232 <= '1';
	wait for 30 ns;
	inp_sendRS232 <= '0';
	wait for 60 ns;
	--Ringbuffer hat line rdy
	rb_read_data_rdy <= '1';
	wait for 30 ns;
	rb_read_data_rdy <= '0';
	wait for 30 ns;	

	--Byte können geschickt werden
	for i in 0 to 7 loop	
		tx_rdy <= '1';
		wait for 30 ns;
		tx_rdy <= '0';
		wait for 120 ns;
	end loop;
	
	--nächste Zeile anfordern
	--Ringbuffer hat line rdy
	rb_read_data_rdy <= '1';
	wait for 30 ns;
	rb_read_data_rdy <= '0';
	wait for 30 ns;	

	for i in 0 to 7 loop	
		tx_rdy <= '1';
		wait for 30 ns;
		tx_rdy <= '0';
		wait for 120 ns;
	end loop;

	rb_read_data <= (others => x"00");
	rb_read_data_rdy <= '1';
	wait for 30 ns;
	rb_read_data_rdy <= '0';
	wait for 30 ns;	

	for i in 0 to 7 loop	
		tx_rdy <= '1';
		wait for 30 ns;
		tx_rdy <= '0';
		wait for 120 ns;
	end loop;

	wait for 300 ns;

end process;

end architecture behav;
