
--Standard Inkludiert
library ieee;
use ieee.std_logic_1164.all;

--IP Inkludiert
--use work.textmode_vga_pkg.all;
--use work.textmode_vga_component_pkg.all;
--use work.textmode_vga_platform_dependent_pkg.all;

--use work.ps2_keyboard_controller_pkg.all;

--Konstanten
use work.big_pkg.all;

--Module Inkludiert
--use work.input_pkg.all;
--use work.output_pkg.all;
--use work.ringbuffer_pkg.all;
--use work.serialhandler_pkg.all;
use work.rs232_pkg.all;
--use work.parser_pkg.all;
--use work.alu.pkg.all;
--use work.debounce_pkg.all;
--use work.sync_pkg.all;
--use work.pll_pkg.all;


architecture struct of calc_top is


begin
	--RS232
	rs232_inst : rs232_ent
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
end architecture struct;
