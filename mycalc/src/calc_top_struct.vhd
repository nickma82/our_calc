
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
use work.input_pkg.all;
use work.output_pkg.all;
use work.ringbuffer_pkg.all;
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

	--Input
	signal ps2_new_data : std_logic := '0';
	signal inp_new_data : std_logic := '0';
	signal inp_del : std_logic := '0';
	signal inp_sendRS232 : std_logic := '0';
	signal pars_start : std_logic := '0';
	signal inp_data : std_logic_vector(7 downto 0) := x"00";
	signal ps2_data_intern : std_logic_vector(7 downto 0) := x"00";

	--Output
	signal vga_command	: std_logic_vector(7 downto 0);
	signal vga_command_data	: std_logic_vector(31 downto 0);
	signal pars_new_data	: std_logic;
	signal pars_data	: std_logic_vector(7 downto 0);

	--Ringbuffer
	signal rb_busy		: std_logic := '0';
	signal rb_char_newline	: std_logic := '0';
	signal rb_read_en	: std_logic := '0';
	signal rb_read_lineNr	: std_logic_vector(7 downto 0) := x"00";
	signal rb_read_data_rdy	: std_logic := '0';
	signal rb_read_data	: RAM_LINE;	

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
	
	--pll_vga_clk: pll
	--PORT MAP (
	--	inclk0	 => sys_clk,
	--	c0	 => c0_pll_sig
	--);
	
	
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
	input_inst : input_ent
	port map 
	(
		sys_clk	=> sys_clk,
		sys_res_n => sys_res_n,
		ps2_new_data => ps2_new_data,
		ps2_data => ps2_data_intern,
		inp_new_data => inp_new_data,
		inp_data => inp_data,
		inp_del => inp_del,
		inp_sendRS232 => inp_sendRS232,
		pars_start => pars_start
	);

	--Output
	output_inst : output_ent
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
	
	--Ringbuffer
	ringbuffer_inst : ringbuffer_ent
	port map
	(
		sys_clk	=> sys_clk,
		sys_res_n => sys_res_n,
		rb_busy => rb_busy,
		pars_new_data => pars_new_data,
		pars_data => pars_data,
		inp_new_data => inp_new_data,
		inp_data => inp_data,
		inp_del => inp_del,
		rb_char_newline => rb_char_newline,
		rb_read_en => rb_read_en,
		rb_read_lineNr => rb_read_lineNr,
		rb_read_data_rdy => rb_read_data_rdy,
		rb_read_data => rb_read_data
	);

end architecture struct;
