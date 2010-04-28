library ieee;
use ieee.std_logic_1164.all;
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
	
	
	
	
end architecture struct;
