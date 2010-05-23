
--Standard Inkludiert
library ieee;
use ieee.std_logic_1164.all;

--IP Inkludiert
use work.textmode_vga_pkg.all;
use work.textmode_vga_component_pkg.all;
use work.textmode_vga_platform_dependent_pkg.all;

use work.ps2_keyboard_controller_pkg.all;

--Konstanten
use work.big_pkg.all;

--Module Inkludiert
--use work.eingabe_pkg.all;
--use work.ausgabe_pkg.all;
--use work.serialhandler_pkg.all;
--use work.rs232_pkg.all;
--use work.parser_pkg.all;
--use work.alu.pkg.all;
use work.debounce_pkg.all;
use work.sync_pkg.all;
use work.pll_pkg.all;


architecture struct of calc_top is
	constant CLK_FREQ : integer := 33330000;
	constant TIMEOUT : time := 1 ms;
	constant RES_N_DEFAULT_VALUE : std_logic := '1';
	constant SYNC_STAGES : integer := 2;
	constant BTN_A_RESET_VALUE : std_logic := '1';
	
	signal sys_res_n_sync, btn_a_sync : std_logic;
	signal c0_pll_sig: std_logic;
	

	--PS2
	signal new_data : std_logic ;
	signal data : std_logic_vector (7 downto 0);

	--VGA
	signal vga_free:std_logic;
	signal vga_clk:std_logic;

begin
	sys_res_n_debounce_inst : debounce
	generic map
	(
	CLK_FREQ => CLK_FREQ,
	TIMEOUT => TIMEOUT,
	RESET_VALUE => RES_N_DEFAULT_VALUE,
	SYNC_STAGES => SYNC_STAGES
	)
	port map
	(
	sys_clk => sys_clk,
	sys_res_n => '1',
	data_in => sys_res_n,
	data_out => sys_res_n_sync
	);
	
	btn_a_debounce_inst : debounce
	generic map
	(
	CLK_FREQ => CLK_FREQ,
	TIMEOUT => TIMEOUT,
	RESET_VALUE => BTN_A_RESET_VALUE,
	SYNC_STAGES => SYNC_STAGES
	)
	port map
	(
	sys_clk => sys_clk,
	sys_res_n => sys_res_n_sync,
	data_in => btn_a,
	data_out => btn_a_sync
	);
	
	led_a <= not(btn_a_sync);
	
	pll_vga_clk: pll
	PORT MAP (
		inclk0	 => sys_clk,
		c0	 => c0_pll_sig
	);
	
	
	----- CALC CONNECTIVITY
	
	--PS2
	ps2_keyboard_controller_inst : ps2_keyboard_controller
	generic map
	(
		CLK_FREQ => 33330000,
		SYNC_STAGES => 2
	)
	port map
	(
		sys_clk => sys_clk,
		sys_res_n => sys_res_n_sync,
		new_data => new_data,
		data => data,
		ps2_clk => ps2_clk,
		ps2_data => ps2_data
	);

	--VGA
	textmode_vga_inst : textmode_vga
	generic map
	(
		VGA_CLK_FREQ => 25000000 ,
		BLINK_INTERVAL_MS => 1000 ,
		SYNC_STAGES => 2
	)
	port map
	(
		sys_clk => sys_clk,
		sys_res_n => sys_res_n_sync,
		command => vga_command,
		command_data => vga_command_data,
		free => vga_free,
		vga_clk => vga_clk,
		vga_res_n => sys_res_n_sync,
		vsync_n => vsync_n,
		hsync_n => hsync_n,
		r => r,
		g => g,
		b => b
	);
	
	--Input
	input_inst : input
	port map 
	(
		sys_clk => sys_clk,
		sys_res_n => sys_res_n_sync,
		new_data => new_data,
		data => data,
		start_comp => start_comp,
		ascii_code => ascii_code,
		new_ascii_code => new_ascii_code,
		new_ascii_ready => new_ascii_ready
	);
	
end architecture struct;
