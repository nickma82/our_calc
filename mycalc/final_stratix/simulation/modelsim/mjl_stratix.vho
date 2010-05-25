-- Copyright (C) 1991-2009 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus II"
-- VERSION "Version 9.1 Build 222 10/21/2009 SJ Full Version"

-- DATE "05/25/2010 13:24:46"

-- 
-- Device: Altera EP1S25F672C6 Package FBGA672
-- 

-- 
-- This VHDL file should be used for ModelSim (VHDL) only
-- 

LIBRARY IEEE;
LIBRARY STRATIX;
USE IEEE.STD_LOGIC_1164.ALL;
USE STRATIX.STRATIX_COMPONENTS.ALL;

ENTITY 	calc_top IS
    PORT (
	sys_clk : IN std_logic;
	sys_res_n : IN std_logic;
	btn_a : IN std_logic;
	led_a : OUT std_logic;
	led_b : OUT std_logic;
	ps2_data : INOUT std_logic;
	ps2_clk : INOUT std_logic;
	hsync_n : OUT std_logic;
	vsync_n : OUT std_logic;
	r : OUT std_logic_vector(2 DOWNTO 0);
	g : OUT std_logic_vector(2 DOWNTO 0);
	b : OUT std_logic_vector(1 DOWNTO 0);
	uart_tx : OUT std_logic;
	uart_rx : IN std_logic
	);
END calc_top;

-- Design Ports Information
-- ps2_data	=>  Location: PIN_E21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ps2_clk	=>  Location: PIN_Y26,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- led_a	=>  Location: PIN_A6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- led_b	=>  Location: PIN_A7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- hsync_n	=>  Location: PIN_F1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- vsync_n	=>  Location: PIN_F2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- r[0]	=>  Location: PIN_E22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- r[1]	=>  Location: PIN_T4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- r[2]	=>  Location: PIN_T7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- g[0]	=>  Location: PIN_E23,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- g[1]	=>  Location: PIN_T5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- g[2]	=>  Location: PIN_T24,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- b[0]	=>  Location: PIN_E24,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- b[1]	=>  Location: PIN_T6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- uart_tx	=>  Location: PIN_D22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- uart_rx	=>  Location: PIN_D23,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- sys_clk	=>  Location: PIN_N3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- btn_a	=>  Location: PIN_A3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- sys_res_n	=>  Location: PIN_AF17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default

ARCHITECTURE structure OF calc_top IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_sys_clk : std_logic;
SIGNAL ww_sys_res_n : std_logic;
SIGNAL ww_btn_a : std_logic;
SIGNAL ww_led_a : std_logic;
SIGNAL ww_led_b : std_logic;
SIGNAL ww_hsync_n : std_logic;
SIGNAL ww_vsync_n : std_logic;
SIGNAL ww_r : std_logic_vector(2 DOWNTO 0);
SIGNAL ww_g : std_logic_vector(2 DOWNTO 0);
SIGNAL ww_b : std_logic_vector(1 DOWNTO 0);
SIGNAL ww_uart_tx : std_logic;
SIGNAL ww_uart_rx : std_logic;
SIGNAL \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a13_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a13_PORTAADDR_bus\ : std_logic_vector(11 DOWNTO 0);
SIGNAL \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a13_PORTBADDR_bus\ : std_logic_vector(11 DOWNTO 0);
SIGNAL \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a13_PORTBDATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a14_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a14_PORTAADDR_bus\ : std_logic_vector(11 DOWNTO 0);
SIGNAL \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a14_PORTBADDR_bus\ : std_logic_vector(11 DOWNTO 0);
SIGNAL \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a14_PORTBDATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a15_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a15_PORTAADDR_bus\ : std_logic_vector(11 DOWNTO 0);
SIGNAL \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a15_PORTBADDR_bus\ : std_logic_vector(11 DOWNTO 0);
SIGNAL \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a15_PORTBDATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a10_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a10_PORTAADDR_bus\ : std_logic_vector(11 DOWNTO 0);
SIGNAL \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a10_PORTBADDR_bus\ : std_logic_vector(11 DOWNTO 0);
SIGNAL \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a10_PORTBDATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a11_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a11_PORTAADDR_bus\ : std_logic_vector(11 DOWNTO 0);
SIGNAL \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a11_PORTBADDR_bus\ : std_logic_vector(11 DOWNTO 0);
SIGNAL \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a11_PORTBDATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a12_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a12_PORTAADDR_bus\ : std_logic_vector(11 DOWNTO 0);
SIGNAL \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a12_PORTBADDR_bus\ : std_logic_vector(11 DOWNTO 0);
SIGNAL \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a12_PORTBDATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a8_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a8_PORTAADDR_bus\ : std_logic_vector(11 DOWNTO 0);
SIGNAL \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a8_PORTBADDR_bus\ : std_logic_vector(11 DOWNTO 0);
SIGNAL \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a8_PORTBDATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a9_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a9_PORTAADDR_bus\ : std_logic_vector(11 DOWNTO 0);
SIGNAL \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a9_PORTBADDR_bus\ : std_logic_vector(11 DOWNTO 0);
SIGNAL \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a9_PORTBDATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \pll_vga_clk|altpll_component|pll_INCLK_bus\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \pll_vga_clk|altpll_component|pll_CLK_bus\ : std_logic_vector(5 DOWNTO 0);
SIGNAL \textmode_vga_inst|font_rom_inst|Mux0_rtl_1|auto_generated|ram_block1a0_PORTAADDR_bus\ : std_logic_vector(11 DOWNTO 0);
SIGNAL \textmode_vga_inst|font_rom_inst|Mux0_rtl_1|auto_generated|ram_block1a0_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \textmode_vga_inst|font_rom_inst|Mux0_rtl_1|auto_generated|ram_block1a1_PORTAADDR_bus\ : std_logic_vector(11 DOWNTO 0);
SIGNAL \textmode_vga_inst|font_rom_inst|Mux0_rtl_1|auto_generated|ram_block1a1_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a0_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a0_PORTAADDR_bus\ : std_logic_vector(11 DOWNTO 0);
SIGNAL \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a0_PORTBADDR_bus\ : std_logic_vector(11 DOWNTO 0);
SIGNAL \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a1_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a1_PORTAADDR_bus\ : std_logic_vector(11 DOWNTO 0);
SIGNAL \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a1_PORTBADDR_bus\ : std_logic_vector(11 DOWNTO 0);
SIGNAL \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a1_PORTBDATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a2_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a2_PORTAADDR_bus\ : std_logic_vector(11 DOWNTO 0);
SIGNAL \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a2_PORTBADDR_bus\ : std_logic_vector(11 DOWNTO 0);
SIGNAL \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a2_PORTBDATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a3_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a3_PORTAADDR_bus\ : std_logic_vector(11 DOWNTO 0);
SIGNAL \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a3_PORTBADDR_bus\ : std_logic_vector(11 DOWNTO 0);
SIGNAL \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a3_PORTBDATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a4_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a4_PORTAADDR_bus\ : std_logic_vector(11 DOWNTO 0);
SIGNAL \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a4_PORTBADDR_bus\ : std_logic_vector(11 DOWNTO 0);
SIGNAL \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a4_PORTBDATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a5_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a5_PORTAADDR_bus\ : std_logic_vector(11 DOWNTO 0);
SIGNAL \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a5_PORTBADDR_bus\ : std_logic_vector(11 DOWNTO 0);
SIGNAL \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a5_PORTBDATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a6_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a6_PORTAADDR_bus\ : std_logic_vector(11 DOWNTO 0);
SIGNAL \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a6_PORTBADDR_bus\ : std_logic_vector(11 DOWNTO 0);
SIGNAL \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a6_PORTBDATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a7_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a7_PORTAADDR_bus\ : std_logic_vector(11 DOWNTO 0);
SIGNAL \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a7_PORTBADDR_bus\ : std_logic_vector(11 DOWNTO 0);
SIGNAL \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a7_PORTBDATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \textmode_vga_inst|font_rom_inst|Mux0_rtl_1|auto_generated|ram_block1a3_PORTAADDR_bus\ : std_logic_vector(11 DOWNTO 0);
SIGNAL \textmode_vga_inst|font_rom_inst|Mux0_rtl_1|auto_generated|ram_block1a3_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \textmode_vga_inst|font_rom_inst|Mux0_rtl_1|auto_generated|ram_block1a2_PORTAADDR_bus\ : std_logic_vector(11 DOWNTO 0);
SIGNAL \textmode_vga_inst|font_rom_inst|Mux0_rtl_1|auto_generated|ram_block1a2_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \textmode_vga_inst|font_rom_inst|Mux0_rtl_1|auto_generated|ram_block1a7_PORTAADDR_bus\ : std_logic_vector(11 DOWNTO 0);
SIGNAL \textmode_vga_inst|font_rom_inst|Mux0_rtl_1|auto_generated|ram_block1a7_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \textmode_vga_inst|font_rom_inst|Mux0_rtl_1|auto_generated|ram_block1a5_PORTAADDR_bus\ : std_logic_vector(11 DOWNTO 0);
SIGNAL \textmode_vga_inst|font_rom_inst|Mux0_rtl_1|auto_generated|ram_block1a5_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \textmode_vga_inst|font_rom_inst|Mux0_rtl_1|auto_generated|ram_block1a4_PORTAADDR_bus\ : std_logic_vector(11 DOWNTO 0);
SIGNAL \textmode_vga_inst|font_rom_inst|Mux0_rtl_1|auto_generated|ram_block1a4_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \textmode_vga_inst|font_rom_inst|Mux0_rtl_1|auto_generated|ram_block1a6_PORTAADDR_bus\ : std_logic_vector(11 DOWNTO 0);
SIGNAL \textmode_vga_inst|font_rom_inst|Mux0_rtl_1|auto_generated|ram_block1a6_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \pll_vga_clk|altpll_component|pll~CLK1\ : std_logic;
SIGNAL \pll_vga_clk|altpll_component|pll~CLK2\ : std_logic;
SIGNAL \pll_vga_clk|altpll_component|pll~CLK3\ : std_logic;
SIGNAL \pll_vga_clk|altpll_component|pll~CLK4\ : std_logic;
SIGNAL \pll_vga_clk|altpll_component|pll~CLK5\ : std_logic;
SIGNAL \ps2_data~0\ : std_logic;
SIGNAL \ps2_clk~0\ : std_logic;
SIGNAL \sys_clk~combout\ : std_logic;
SIGNAL \sys_res_n_debounce_inst|fsm_inst|Selector0~2_combout\ : std_logic;
SIGNAL \sys_res_n_debounce_inst|counter_inst|cnt_int[3]~7\ : std_logic;
SIGNAL \sys_res_n_debounce_inst|counter_inst|cnt_int[3]~7COUT1_50\ : std_logic;
SIGNAL \sys_res_n_debounce_inst|counter_inst|cnt_int[4]~25\ : std_logic;
SIGNAL \sys_res_n_debounce_inst|counter_inst|cnt_int[4]~25COUT1_52\ : std_logic;
SIGNAL \sys_res_n_debounce_inst|counter_inst|cnt_int[5]~27\ : std_logic;
SIGNAL \sys_res_n_debounce_inst|counter_inst|cnt_int[5]~27COUT1_54\ : std_logic;
SIGNAL \sys_res_n_debounce_inst|counter_inst|cnt_int[6]~19\ : std_logic;
SIGNAL \sys_res_n_debounce_inst|counter_inst|cnt_int[6]~19COUT1_56\ : std_logic;
SIGNAL \sys_res_n_debounce_inst|counter_inst|cnt_int[7]~21\ : std_logic;
SIGNAL \sys_res_n_debounce_inst|counter_inst|cnt_int[8]~23\ : std_logic;
SIGNAL \sys_res_n_debounce_inst|counter_inst|cnt_int[8]~23COUT1_58\ : std_logic;
SIGNAL \sys_res_n_debounce_inst|counter_inst|cnt_int[9]~3\ : std_logic;
SIGNAL \sys_res_n_debounce_inst|counter_inst|cnt_int[9]~3COUT1_60\ : std_logic;
SIGNAL \sys_res_n_debounce_inst|counter_inst|cnt_int[10]~9\ : std_logic;
SIGNAL \sys_res_n_debounce_inst|counter_inst|cnt_int[10]~9COUT1_62\ : std_logic;
SIGNAL \sys_res_n_debounce_inst|counter_inst|cnt_int[11]~11\ : std_logic;
SIGNAL \sys_res_n_debounce_inst|counter_inst|cnt_int[11]~11COUT1_64\ : std_logic;
SIGNAL \sys_res_n_debounce_inst|counter_inst|cnt_int[12]~15\ : std_logic;
SIGNAL \sys_res_n_debounce_inst|counter_inst|cnt_int[13]~17\ : std_logic;
SIGNAL \sys_res_n_debounce_inst|counter_inst|cnt_int[13]~17COUT1_66\ : std_logic;
SIGNAL \sys_res_n_debounce_inst|counter_inst|cnt_int[14]~13\ : std_logic;
SIGNAL \sys_res_n_debounce_inst|counter_inst|cnt_int[14]~13COUT1_68\ : std_logic;
SIGNAL \sys_res_n_debounce_inst|counter_inst|LessThan0~0_combout\ : std_logic;
SIGNAL \sys_res_n_debounce_inst|counter_inst|LessThan0~1_combout\ : std_logic;
SIGNAL \sys_res_n_debounce_inst|counter_inst|LessThan0~2_combout\ : std_logic;
SIGNAL \sys_res_n_debounce_inst|fsm_inst|Equal0~1_combout\ : std_logic;
SIGNAL \sys_res_n_debounce_inst|fsm_inst|Equal0~2_combout\ : std_logic;
SIGNAL \sys_res_n_debounce_inst|counter_inst|LessThan0~3_combout\ : std_logic;
SIGNAL \sys_res_n_debounce_inst|counter_inst|cnt_int[0]~29\ : std_logic;
SIGNAL \sys_res_n_debounce_inst|counter_inst|cnt_int[0]~29COUT1_46\ : std_logic;
SIGNAL \sys_res_n_debounce_inst|counter_inst|cnt_int[1]~31\ : std_logic;
SIGNAL \sys_res_n_debounce_inst|counter_inst|cnt_int[1]~31COUT1_48\ : std_logic;
SIGNAL \sys_res_n_debounce_inst|counter_inst|cnt_int[2]~1\ : std_logic;
SIGNAL \sys_res_n_debounce_inst|fsm_inst|Equal0~3_combout\ : std_logic;
SIGNAL \sys_res_n_debounce_inst|fsm_inst|Equal0~0_combout\ : std_logic;
SIGNAL \sys_res_n_debounce_inst|fsm_inst|Equal0~4_combout\ : std_logic;
SIGNAL \sys_res_n_debounce_inst|fsm_inst|Equal0~5_combout\ : std_logic;
SIGNAL \sys_res_n_debounce_inst|fsm_inst|Selector1~0_combout\ : std_logic;
SIGNAL \sys_res_n_debounce_inst|fsm_inst|Selector1~1_combout\ : std_logic;
SIGNAL \sys_res_n_debounce_inst|fsm_inst|debounce_fsm_state.TIMEOUT0~regout\ : std_logic;
SIGNAL \sys_res_n_debounce_inst|fsm_inst|Selector2~1_combout\ : std_logic;
SIGNAL \sys_res_n~combout\ : std_logic;
SIGNAL \sys_res_n_debounce_inst|fsm_inst|Selector2~0\ : std_logic;
SIGNAL \sys_res_n_debounce_inst|fsm_inst|Selector2~2_combout\ : std_logic;
SIGNAL \sys_res_n_debounce_inst|fsm_inst|Selector2~3_combout\ : std_logic;
SIGNAL \sys_res_n_debounce_inst|fsm_inst|debounce_fsm_state.IDLE1~regout\ : std_logic;
SIGNAL \sys_res_n_debounce_inst|fsm_inst|debounce_fsm_state.TIMEOUT1~regout\ : std_logic;
SIGNAL \sys_res_n_debounce_inst|fsm_inst|Selector0~0_combout\ : std_logic;
SIGNAL \sys_res_n_debounce_inst|fsm_inst|debounce_fsm_state.IDLE0~regout\ : std_logic;
SIGNAL \sys_res_n_debounce_inst|fsm_inst|o~0_combout\ : std_logic;
SIGNAL \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.PREPARE_SEND_WAIT1~regout\ : std_logic;
SIGNAL \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector5~2_combout\ : std_logic;
SIGNAL \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_last~regout\ : std_logic;
SIGNAL \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.PREPARE_SEND_DATA~regout\ : std_logic;
SIGNAL \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector77~0_combout\ : std_logic;
SIGNAL \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector69~0_combout\ : std_logic;
SIGNAL \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector73~0_combout\ : std_logic;
SIGNAL \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector74~0_combout\ : std_logic;
SIGNAL \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector75~0_combout\ : std_logic;
SIGNAL \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector76~0_combout\ : std_logic;
SIGNAL \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout2[0]~5\ : std_logic;
SIGNAL \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout2[0]~5COUT1_27\ : std_logic;
SIGNAL \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout2[1]~7\ : std_logic;
SIGNAL \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout2[1]~7COUT1_29\ : std_logic;
SIGNAL \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout2[2]~1\ : std_logic;
SIGNAL \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout2[2]~1COUT1_31\ : std_logic;
SIGNAL \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout2[3]~3\ : std_logic;
SIGNAL \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout2[3]~3COUT1_33\ : std_logic;
SIGNAL \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout2[4]~13\ : std_logic;
SIGNAL \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector70~0_combout\ : std_logic;
SIGNAL \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector71~0_combout\ : std_logic;
SIGNAL \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector72~0_combout\ : std_logic;
SIGNAL \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout2[5]~15\ : std_logic;
SIGNAL \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout2[5]~15COUT1_35\ : std_logic;
SIGNAL \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout2[6]~11\ : std_logic;
SIGNAL \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout2[6]~11COUT1_37\ : std_logic;
SIGNAL \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout2[7]~17\ : std_logic;
SIGNAL \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout2[7]~17COUT1_39\ : std_logic;
SIGNAL \ps2_keyboard_controller_inst|ps2_transceiver_inst|Equal1~1_combout\ : std_logic;
SIGNAL \ps2_keyboard_controller_inst|ps2_transceiver_inst|Equal1~2_combout\ : std_logic;
SIGNAL \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.PREPARE_SEND_WAIT2~regout\ : std_logic;
SIGNAL \ps2_keyboard_controller_inst|ps2_transceiver_inst|Equal1~0_combout\ : std_logic;
SIGNAL \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector5~4_combout\ : std_logic;
SIGNAL \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.PREPARE_SEND_RELEASE_CLK~regout\ : std_logic;
SIGNAL \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_WAIT_DATA0~regout\ : std_logic;
SIGNAL \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_DATA0~regout\ : std_logic;
SIGNAL \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_WAIT_DATA1~regout\ : std_logic;
SIGNAL \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_DATA1~regout\ : std_logic;
SIGNAL \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_WAIT_DATA2~regout\ : std_logic;
SIGNAL \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_DATA2~regout\ : std_logic;
SIGNAL \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_WAIT_DATA3~regout\ : std_logic;
SIGNAL \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_DATA3~regout\ : std_logic;
SIGNAL \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_WAIT_DATA4~regout\ : std_logic;
SIGNAL \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_DATA4~regout\ : std_logic;
SIGNAL \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_WAIT_DATA5~regout\ : std_logic;
SIGNAL \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_DATA5~regout\ : std_logic;
SIGNAL \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_WAIT_DATA6~regout\ : std_logic;
SIGNAL \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_DATA6~regout\ : std_logic;
SIGNAL \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_WAIT_DATA7~regout\ : std_logic;
SIGNAL \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_DATA7~regout\ : std_logic;
SIGNAL \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_WAIT_PARITY~regout\ : std_logic;
SIGNAL \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_PARITY~regout\ : std_logic;
SIGNAL \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_WAIT_STOP~regout\ : std_logic;
SIGNAL \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_STOP~regout\ : std_logic;
SIGNAL \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_WAIT_ACK1~regout\ : std_logic;
SIGNAL \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_WAIT_ACK2~regout\ : std_logic;
SIGNAL \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector5~7_combout\ : std_logic;
SIGNAL \ps2_keyboard_controller_inst|ps2_transceiver_inst|process_0~0\ : std_logic;
SIGNAL \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector5~5\ : std_logic;
SIGNAL \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector30~0_combout\ : std_logic;
SIGNAL \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.RECEIVE_START~regout\ : std_logic;
SIGNAL \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.RECEIVE_WAIT_DATA0~regout\ : std_logic;
SIGNAL \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.RECEIVE_DATA0~regout\ : std_logic;
SIGNAL \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.RECEIVE_WAIT_DATA1~regout\ : std_logic;
SIGNAL \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.RECEIVE_DATA1~regout\ : std_logic;
SIGNAL \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.RECEIVE_WAIT_DATA2~regout\ : std_logic;
SIGNAL \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.RECEIVE_DATA2~regout\ : std_logic;
SIGNAL \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.RECEIVE_WAIT_DATA3~regout\ : std_logic;
SIGNAL \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.RECEIVE_DATA3~regout\ : std_logic;
SIGNAL \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.RECEIVE_WAIT_DATA4~regout\ : std_logic;
SIGNAL \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.RECEIVE_DATA4~regout\ : std_logic;
SIGNAL \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.RECEIVE_WAIT_DATA5~regout\ : std_logic;
SIGNAL \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.RECEIVE_DATA5~regout\ : std_logic;
SIGNAL \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.RECEIVE_WAIT_DATA6~regout\ : std_logic;
SIGNAL \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.RECEIVE_DATA6~regout\ : std_logic;
SIGNAL \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.RECEIVE_WAIT_DATA7~regout\ : std_logic;
SIGNAL \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.RECEIVE_DATA7~regout\ : std_logic;
SIGNAL \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.RECEIVE_WAIT_PARITY~regout\ : std_logic;
SIGNAL \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.RECEIVE_PARITY~regout\ : std_logic;
SIGNAL \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.RECEIVE_WAIT_STOP~regout\ : std_logic;
SIGNAL \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.RECEIVE_STOP~regout\ : std_logic;
SIGNAL \ps2_keyboard_controller_inst|ps2_transceiver_inst|new_data~regout\ : std_logic;
SIGNAL \ps2_keyboard_controller_inst|Selector4~0_combout\ : std_logic;
SIGNAL \ps2_keyboard_controller_inst|keyboard_state.INIT~regout\ : std_logic;
SIGNAL \ps2_keyboard_controller_inst|keyboard_state.INIT_WAIT_ACK~regout\ : std_logic;
SIGNAL \ps2_keyboard_controller_inst|ps2_transceiver_inst|WideOr32~1_combout\ : std_logic;
SIGNAL \ps2_keyboard_controller_inst|ps2_transceiver_inst|WideOr32~0_combout\ : std_logic;
SIGNAL \ps2_keyboard_controller_inst|ps2_transceiver_inst|WideOr32~combout\ : std_logic;
SIGNAL \ps2_keyboard_controller_inst|keyboard_state_next~12\ : std_logic;
SIGNAL \ps2_keyboard_controller_inst|keyboard_state.INIT_WAIT_BAT~regout\ : std_logic;
SIGNAL \ps2_keyboard_controller_inst|Selector3~0\ : std_logic;
SIGNAL \ps2_keyboard_controller_inst|Selector3~1\ : std_logic;
SIGNAL \ps2_keyboard_controller_inst|Selector3~2\ : std_logic;
SIGNAL \ps2_keyboard_controller_inst|keyboard_state.SET_INDICATORS_CMD~regout\ : std_logic;
SIGNAL \ps2_keyboard_controller_inst|keyboard_state.SET_INDICATORS_VALUE_WAIT_ACK~regout\ : std_logic;
SIGNAL \ps2_keyboard_controller_inst|keyboard_state.ENABLE~regout\ : std_logic;
SIGNAL \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector0~2_combout\ : std_logic;
SIGNAL \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector0~4_combout\ : std_logic;
SIGNAL \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_FINISH~regout\ : std_logic;
SIGNAL \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.IDLE~regout\ : std_logic;
SIGNAL \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector5~3_combout\ : std_logic;
SIGNAL \ps2_keyboard_controller_inst|ps2_transceiver_inst|process_0~1\ : std_logic;
SIGNAL \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector5~6_combout\ : std_logic;
SIGNAL \ps2_keyboard_controller_inst|ps2_transceiver_inst|WideOr1~4_combout\ : std_logic;
SIGNAL \ps2_keyboard_controller_inst|ps2_transceiver_inst|WideOr1~5_combout\ : std_logic;
SIGNAL \ps2_keyboard_controller_inst|ps2_transceiver_inst|WideOr1~1_combout\ : std_logic;
SIGNAL \ps2_keyboard_controller_inst|ps2_transceiver_inst|WideOr1~2_combout\ : std_logic;
SIGNAL \ps2_keyboard_controller_inst|ps2_transceiver_inst|WideOr1~0_combout\ : std_logic;
SIGNAL \ps2_keyboard_controller_inst|ps2_transceiver_inst|WideOr1~3_combout\ : std_logic;
SIGNAL \ps2_keyboard_controller_inst|ps2_transceiver_inst|WideOr1~6_combout\ : std_logic;
SIGNAL \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector3~1_combout\ : std_logic;
SIGNAL \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.PREPARE_SEND_ASSIGN_CLK~regout\ : std_logic;
SIGNAL \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector56~0_combout\ : std_logic;
SIGNAL \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector58~0_combout\ : std_logic;
SIGNAL \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector63~0_combout\ : std_logic;
SIGNAL \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector68~0_combout\ : std_logic;
SIGNAL \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1[0]~1\ : std_logic;
SIGNAL \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector64~0_combout\ : std_logic;
SIGNAL \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector65~0_combout\ : std_logic;
SIGNAL \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector66~0_combout\ : std_logic;
SIGNAL \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector67~0_combout\ : std_logic;
SIGNAL \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1[1]~5\ : std_logic;
SIGNAL \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1[1]~5COUT1_37\ : std_logic;
SIGNAL \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1[2]~7\ : std_logic;
SIGNAL \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1[2]~7COUT1_39\ : std_logic;
SIGNAL \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1[3]~3\ : std_logic;
SIGNAL \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1[3]~3COUT1_41\ : std_logic;
SIGNAL \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1[4]~9\ : std_logic;
SIGNAL \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1[4]~9COUT1_43\ : std_logic;
SIGNAL \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1[5]~11\ : std_logic;
SIGNAL \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector59~0_combout\ : std_logic;
SIGNAL \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector60~0_combout\ : std_logic;
SIGNAL \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector61~0_combout\ : std_logic;
SIGNAL \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector62~0_combout\ : std_logic;
SIGNAL \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1[6]~13\ : std_logic;
SIGNAL \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1[6]~13COUT1_45\ : std_logic;
SIGNAL \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1[7]~15\ : std_logic;
SIGNAL \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1[7]~15COUT1_47\ : std_logic;
SIGNAL \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1[8]~23\ : std_logic;
SIGNAL \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1[8]~23COUT1_49\ : std_logic;
SIGNAL \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1[9]~19\ : std_logic;
SIGNAL \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1[9]~19COUT1_51\ : std_logic;
SIGNAL \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1[10]~25\ : std_logic;
SIGNAL \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector57~0_combout\ : std_logic;
SIGNAL \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1[11]~21\ : std_logic;
SIGNAL \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1[11]~21COUT1_53\ : std_logic;
SIGNAL \ps2_keyboard_controller_inst|ps2_transceiver_inst|Equal0~1_combout\ : std_logic;
SIGNAL \ps2_keyboard_controller_inst|ps2_transceiver_inst|Equal0~2_combout\ : std_logic;
SIGNAL \ps2_keyboard_controller_inst|ps2_transceiver_inst|Equal0~0_combout\ : std_logic;
SIGNAL \ps2_keyboard_controller_inst|ps2_transceiver_inst|Equal0~3_combout\ : std_logic;
SIGNAL \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector5~9_combout\ : std_logic;
SIGNAL \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_READ_ACK~regout\ : std_logic;
SIGNAL \ps2_keyboard_controller_inst|keyboard_state.SET_INDICATORS_CMD_WAIT_ACK~regout\ : std_logic;
SIGNAL \ps2_keyboard_controller_inst|keyboard_state.SET_INDICATORS_VALUE~regout\ : std_logic;
SIGNAL \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector53~4_combout\ : std_logic;
SIGNAL \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector53~7_combout\ : std_logic;
SIGNAL \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector53~8_combout\ : std_logic;
SIGNAL \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector53~1_combout\ : std_logic;
SIGNAL \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector53~0_combout\ : std_logic;
SIGNAL \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector53~2_combout\ : std_logic;
SIGNAL \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector53~5_combout\ : std_logic;
SIGNAL \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector53~6_combout\ : std_logic;
SIGNAL \ps2_keyboard_controller_inst|ps2_transceiver_inst|parity_next~0_combout\ : std_logic;
SIGNAL \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector55~2_combout\ : std_logic;
SIGNAL \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector55~3_combout\ : std_logic;
SIGNAL \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector55~5_combout\ : std_logic;
SIGNAL \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector55~4_combout\ : std_logic;
SIGNAL \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector55~6_combout\ : std_logic;
SIGNAL \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector55~0_combout\ : std_logic;
SIGNAL \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector55~1_combout\ : std_logic;
SIGNAL \ps2_keyboard_controller_inst|ps2_transceiver_inst|parity~regout\ : std_logic;
SIGNAL \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector53~3_combout\ : std_logic;
SIGNAL \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_data_internal~regout\ : std_logic;
SIGNAL \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_data_hz~regout\ : std_logic;
SIGNAL \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_internal~regout\ : std_logic;
SIGNAL \btn_a_debounce_inst|fsm_inst|Selector2~5_combout\ : std_logic;
SIGNAL \btn_a_debounce_inst|counter_inst|cnt_int[0]~29COUT1_46\ : std_logic;
SIGNAL \btn_a_debounce_inst|counter_inst|cnt_int[1]~31\ : std_logic;
SIGNAL \btn_a_debounce_inst|counter_inst|cnt_int[1]~31COUT1_48\ : std_logic;
SIGNAL \btn_a_debounce_inst|counter_inst|cnt_int[2]~1\ : std_logic;
SIGNAL \btn_a_debounce_inst|counter_inst|cnt_int[3]~7\ : std_logic;
SIGNAL \btn_a_debounce_inst|counter_inst|cnt_int[3]~7COUT1_50\ : std_logic;
SIGNAL \btn_a_debounce_inst|counter_inst|cnt_int[4]~25\ : std_logic;
SIGNAL \btn_a_debounce_inst|counter_inst|cnt_int[4]~25COUT1_52\ : std_logic;
SIGNAL \btn_a_debounce_inst|counter_inst|cnt_int[5]~27\ : std_logic;
SIGNAL \btn_a_debounce_inst|counter_inst|cnt_int[5]~27COUT1_54\ : std_logic;
SIGNAL \btn_a_debounce_inst|counter_inst|cnt_int[6]~19\ : std_logic;
SIGNAL \btn_a_debounce_inst|counter_inst|cnt_int[6]~19COUT1_56\ : std_logic;
SIGNAL \btn_a_debounce_inst|counter_inst|cnt_int[7]~21\ : std_logic;
SIGNAL \btn_a_debounce_inst|counter_inst|cnt_int[8]~23\ : std_logic;
SIGNAL \btn_a_debounce_inst|counter_inst|cnt_int[8]~23COUT1_58\ : std_logic;
SIGNAL \btn_a_debounce_inst|counter_inst|cnt_int[9]~3\ : std_logic;
SIGNAL \btn_a_debounce_inst|counter_inst|cnt_int[9]~3COUT1_60\ : std_logic;
SIGNAL \btn_a_debounce_inst|counter_inst|cnt_int[10]~9\ : std_logic;
SIGNAL \btn_a_debounce_inst|counter_inst|cnt_int[10]~9COUT1_62\ : std_logic;
SIGNAL \btn_a_debounce_inst|counter_inst|cnt_int[11]~11\ : std_logic;
SIGNAL \btn_a_debounce_inst|counter_inst|cnt_int[11]~11COUT1_64\ : std_logic;
SIGNAL \btn_a_debounce_inst|counter_inst|cnt_int[12]~15\ : std_logic;
SIGNAL \btn_a_debounce_inst|counter_inst|cnt_int[13]~17\ : std_logic;
SIGNAL \btn_a_debounce_inst|counter_inst|cnt_int[13]~17COUT1_66\ : std_logic;
SIGNAL \btn_a_debounce_inst|counter_inst|cnt_int[14]~13\ : std_logic;
SIGNAL \btn_a_debounce_inst|counter_inst|cnt_int[14]~13COUT1_68\ : std_logic;
SIGNAL \btn_a_debounce_inst|counter_inst|LessThan0~0_combout\ : std_logic;
SIGNAL \btn_a_debounce_inst|counter_inst|LessThan0~1_combout\ : std_logic;
SIGNAL \btn_a_debounce_inst|counter_inst|LessThan0~2_combout\ : std_logic;
SIGNAL \btn_a_debounce_inst|fsm_inst|Equal0~1_combout\ : std_logic;
SIGNAL \btn_a_debounce_inst|fsm_inst|Equal0~2_combout\ : std_logic;
SIGNAL \btn_a_debounce_inst|counter_inst|LessThan0~3_combout\ : std_logic;
SIGNAL \btn_a_debounce_inst|counter_inst|cnt_int[0]~29\ : std_logic;
SIGNAL \btn_a_debounce_inst|fsm_inst|Equal0~4_combout\ : std_logic;
SIGNAL \btn_a_debounce_inst|fsm_inst|Equal0~0_combout\ : std_logic;
SIGNAL \btn_a_debounce_inst|fsm_inst|Equal0~3_combout\ : std_logic;
SIGNAL \btn_a_debounce_inst|fsm_inst|Equal0~5_combout\ : std_logic;
SIGNAL \btn_a~combout\ : std_logic;
SIGNAL \btn_a_debounce_inst|fsm_inst|Selector3~0\ : std_logic;
SIGNAL \btn_a_debounce_inst|fsm_inst|Selector3~1_combout\ : std_logic;
SIGNAL \btn_a_debounce_inst|fsm_inst|debounce_fsm_state.TIMEOUT1~regout\ : std_logic;
SIGNAL \btn_a_debounce_inst|fsm_inst|Selector2~3_combout\ : std_logic;
SIGNAL \btn_a_debounce_inst|fsm_inst|debounce_fsm_state.IDLE1~regout\ : std_logic;
SIGNAL \btn_a_debounce_inst|fsm_inst|Selector2~0_combout\ : std_logic;
SIGNAL \btn_a_debounce_inst|fsm_inst|Selector2~1_combout\ : std_logic;
SIGNAL \btn_a_debounce_inst|fsm_inst|Selector2~2_combout\ : std_logic;
SIGNAL \btn_a_debounce_inst|fsm_inst|Selector0~0_combout\ : std_logic;
SIGNAL \btn_a_debounce_inst|fsm_inst|debounce_fsm_state.IDLE0~regout\ : std_logic;
SIGNAL \btn_a_debounce_inst|fsm_inst|debounce_fsm_state.TIMEOUT0~regout\ : std_logic;
SIGNAL \btn_a_debounce_inst|fsm_inst|o~0_combout\ : std_logic;
SIGNAL \~GND~combout\ : std_logic;
SIGNAL \textmode_vga_inst|textmode_vga_h_sm_inst|WideOr11~0_combout\ : std_logic;
SIGNAL \textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int[0]~1\ : std_logic;
SIGNAL \textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int[0]~1COUT1_21\ : std_logic;
SIGNAL \textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int[1]~3\ : std_logic;
SIGNAL \textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int[1]~3COUT1_23\ : std_logic;
SIGNAL \textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int[2]~5\ : std_logic;
SIGNAL \textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int[2]~5COUT1_25\ : std_logic;
SIGNAL \textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int[3]~7\ : std_logic;
SIGNAL \textmode_vga_inst|textmode_vga_h_sm_inst|Equal5~0_combout\ : std_logic;
SIGNAL \textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int[4]~9\ : std_logic;
SIGNAL \textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int[4]~9COUT1_27\ : std_logic;
SIGNAL \textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int[5]~11\ : std_logic;
SIGNAL \textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int[5]~11COUT1_29\ : std_logic;
SIGNAL \textmode_vga_inst|textmode_vga_h_sm_inst|Equal5~1_combout\ : std_logic;
SIGNAL \textmode_vga_inst|textmode_vga_h_sm_inst|Selector4~0_combout\ : std_logic;
SIGNAL \textmode_vga_inst|textmode_vga_v_sm_inst|Selector23~0_combout\ : std_logic;
SIGNAL \textmode_vga_inst|textmode_vga_v_sm_inst|Selector24~0_combout\ : std_logic;
SIGNAL \textmode_vga_inst|textmode_vga_v_sm_inst|Selector26~0_combout\ : std_logic;
SIGNAL \textmode_vga_inst|textmode_vga_v_sm_inst|Selector27~0_combout\ : std_logic;
SIGNAL \textmode_vga_inst|textmode_vga_v_sm_inst|char_line_cnt_int[0]~3\ : std_logic;
SIGNAL \textmode_vga_inst|textmode_vga_v_sm_inst|char_line_cnt_int[0]~3COUT1_16\ : std_logic;
SIGNAL \textmode_vga_inst|textmode_vga_v_sm_inst|char_line_cnt_int[1]~1\ : std_logic;
SIGNAL \textmode_vga_inst|textmode_vga_v_sm_inst|char_line_cnt_int[1]~1COUT1_18\ : std_logic;
SIGNAL \textmode_vga_inst|textmode_vga_v_sm_inst|char_line_cnt_int[2]~7\ : std_logic;
SIGNAL \textmode_vga_inst|textmode_vga_v_sm_inst|char_line_cnt_int[2]~7COUT1_20\ : std_logic;
SIGNAL \textmode_vga_inst|textmode_vga_v_sm_inst|char_line_cnt_int[3]~5\ : std_logic;
SIGNAL \textmode_vga_inst|textmode_vga_v_sm_inst|char_line_cnt_int[3]~5COUT1_22\ : std_logic;
SIGNAL \textmode_vga_inst|textmode_vga_v_sm_inst|textmode_vga_v_sm_state.VDATA~regout\ : std_logic;
SIGNAL \textmode_vga_inst|textmode_vga_v_sm_inst|Add1~2\ : std_logic;
SIGNAL \textmode_vga_inst|textmode_vga_v_sm_inst|Add1~2COUT1_31\ : std_logic;
SIGNAL \textmode_vga_inst|textmode_vga_v_sm_inst|Add1~5_combout\ : std_logic;
SIGNAL \textmode_vga_inst|textmode_vga_v_sm_inst|Add1~7\ : std_logic;
SIGNAL \textmode_vga_inst|textmode_vga_v_sm_inst|Add1~7COUT1_33\ : std_logic;
SIGNAL \textmode_vga_inst|textmode_vga_v_sm_inst|Add1~10_combout\ : std_logic;
SIGNAL \textmode_vga_inst|textmode_vga_v_sm_inst|Add1~12\ : std_logic;
SIGNAL \textmode_vga_inst|textmode_vga_v_sm_inst|Add1~12COUT1_35\ : std_logic;
SIGNAL \textmode_vga_inst|textmode_vga_v_sm_inst|Add1~15_combout\ : std_logic;
SIGNAL \textmode_vga_inst|textmode_vga_v_sm_inst|Add1~17\ : std_logic;
SIGNAL \textmode_vga_inst|textmode_vga_v_sm_inst|Add1~17COUT1_37\ : std_logic;
SIGNAL \textmode_vga_inst|textmode_vga_v_sm_inst|Add1~20_combout\ : std_logic;
SIGNAL \textmode_vga_inst|textmode_vga_v_sm_inst|Equal2~0_combout\ : std_logic;
SIGNAL \textmode_vga_inst|textmode_vga_v_sm_inst|Selector10~0_combout\ : std_logic;
SIGNAL \textmode_vga_inst|textmode_vga_v_sm_inst|textmode_vga_v_sm_state.VFRONT_FIRST~regout\ : std_logic;
SIGNAL \textmode_vga_inst|textmode_vga_v_sm_inst|textmode_vga_v_sm_state.VSYNC~regout\ : std_logic;
SIGNAL \textmode_vga_inst|textmode_vga_v_sm_inst|vcnt[0]~5\ : std_logic;
SIGNAL \textmode_vga_inst|textmode_vga_v_sm_inst|vcnt[0]~5COUT1_16\ : std_logic;
SIGNAL \textmode_vga_inst|textmode_vga_v_sm_inst|vcnt[1]~7\ : std_logic;
SIGNAL \textmode_vga_inst|textmode_vga_v_sm_inst|vcnt[1]~7COUT1_18\ : std_logic;
SIGNAL \textmode_vga_inst|textmode_vga_v_sm_inst|vcnt[2]~1\ : std_logic;
SIGNAL \textmode_vga_inst|textmode_vga_v_sm_inst|vcnt[2]~1COUT1_20\ : std_logic;
SIGNAL \textmode_vga_inst|textmode_vga_v_sm_inst|Equal4~0_combout\ : std_logic;
SIGNAL \textmode_vga_inst|textmode_vga_v_sm_inst|Equal0~0_combout\ : std_logic;
SIGNAL \textmode_vga_inst|textmode_vga_v_sm_inst|textmode_vga_v_sm_state.VSYNC_NEXT~regout\ : std_logic;
SIGNAL \textmode_vga_inst|textmode_vga_v_sm_inst|textmode_vga_v_sm_state.VBACK_FIRST~regout\ : std_logic;
SIGNAL \textmode_vga_inst|textmode_vga_v_sm_inst|textmode_vga_v_sm_state.VBACK~regout\ : std_logic;
SIGNAL \textmode_vga_inst|textmode_vga_v_sm_inst|textmode_vga_v_sm_state.VBACK_NEXT~regout\ : std_logic;
SIGNAL \textmode_vga_inst|textmode_vga_v_sm_inst|WideOr3~0_combout\ : std_logic;
SIGNAL \textmode_vga_inst|textmode_vga_v_sm_inst|WideOr3~1_combout\ : std_logic;
SIGNAL \textmode_vga_inst|textmode_vga_v_sm_inst|Equal4~1_combout\ : std_logic;
SIGNAL \textmode_vga_inst|textmode_vga_v_sm_inst|textmode_vga_v_sm_state.VFRONT_NEXT~regout\ : std_logic;
SIGNAL \textmode_vga_inst|textmode_vga_v_sm_inst|textmode_vga_v_sm_state.VFRONT~regout\ : std_logic;
SIGNAL \textmode_vga_inst|textmode_vga_v_sm_inst|textmode_vga_v_sm_state.VSYNC_FIRST~regout\ : std_logic;
SIGNAL \textmode_vga_inst|textmode_vga_v_sm_inst|WideOr7~0_combout\ : std_logic;
SIGNAL \textmode_vga_inst|textmode_vga_v_sm_inst|vcnt[3]~9\ : std_logic;
SIGNAL \textmode_vga_inst|textmode_vga_v_sm_inst|vcnt[3]~9COUT1_22\ : std_logic;
SIGNAL \textmode_vga_inst|textmode_vga_v_sm_inst|Equal1~0_combout\ : std_logic;
SIGNAL \textmode_vga_inst|textmode_vga_v_sm_inst|textmode_vga_v_sm_state.VDATA_FIRST~regout\ : std_logic;
SIGNAL \textmode_vga_inst|textmode_vga_v_sm_inst|Selector25~0_combout\ : std_logic;
SIGNAL \textmode_vga_inst|textmode_vga_v_sm_inst|Equal3~0_combout\ : std_logic;
SIGNAL \textmode_vga_inst|textmode_vga_v_sm_inst|textmode_vga_v_sm_state.VDATA_NEXTCHAR~regout\ : std_logic;
SIGNAL \textmode_vga_inst|textmode_vga_v_sm_inst|WideOr9~0_combout\ : std_logic;
SIGNAL \textmode_vga_inst|textmode_vga_v_sm_inst|Add1~0_combout\ : std_logic;
SIGNAL \textmode_vga_inst|textmode_vga_v_sm_inst|textmode_vga_v_sm_state.VDATA_NEXTLINE~regout\ : std_logic;
SIGNAL \textmode_vga_inst|textmode_vga_v_sm_inst|WideOr9~combout\ : std_logic;
SIGNAL \textmode_vga_inst|textmode_vga_h_sm_inst|WideOr12~1_combout\ : std_logic;
SIGNAL \textmode_vga_inst|textmode_vga_h_sm_inst|hcnt[0]~1\ : std_logic;
SIGNAL \textmode_vga_inst|textmode_vga_h_sm_inst|hcnt[0]~1COUT1_21\ : std_logic;
SIGNAL \textmode_vga_inst|textmode_vga_h_sm_inst|hcnt[1]~3\ : std_logic;
SIGNAL \textmode_vga_inst|textmode_vga_h_sm_inst|hcnt[1]~3COUT1_23\ : std_logic;
SIGNAL \textmode_vga_inst|textmode_vga_h_sm_inst|hcnt[2]~5\ : std_logic;
SIGNAL \textmode_vga_inst|textmode_vga_h_sm_inst|hcnt[2]~5COUT1_25\ : std_logic;
SIGNAL \textmode_vga_inst|textmode_vga_h_sm_inst|hcnt[3]~7\ : std_logic;
SIGNAL \textmode_vga_inst|textmode_vga_h_sm_inst|hcnt[4]~9\ : std_logic;
SIGNAL \textmode_vga_inst|textmode_vga_h_sm_inst|hcnt[4]~9COUT1_27\ : std_logic;
SIGNAL \textmode_vga_inst|textmode_vga_h_sm_inst|hcnt[5]~13\ : std_logic;
SIGNAL \textmode_vga_inst|textmode_vga_h_sm_inst|hcnt[5]~13COUT1_29\ : std_logic;
SIGNAL \textmode_vga_inst|textmode_vga_h_sm_inst|Equal1~0_combout\ : std_logic;
SIGNAL \textmode_vga_inst|textmode_vga_h_sm_inst|Equal1~1_combout\ : std_logic;
SIGNAL \textmode_vga_inst|textmode_vga_h_sm_inst|Selector4~1_combout\ : std_logic;
SIGNAL \textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.BLACK_CHAR_NEW~regout\ : std_logic;
SIGNAL \textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.BLACK_PIXEL~regout\ : std_logic;
SIGNAL \textmode_vga_inst|textmode_vga_h_sm_inst|WideOr2~0_combout\ : std_logic;
SIGNAL \textmode_vga_inst|textmode_vga_h_sm_inst|Selector2~1_combout\ : std_logic;
SIGNAL \textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.HFRONT~regout\ : std_logic;
SIGNAL \textmode_vga_inst|textmode_vga_h_sm_inst|Selector2~0_combout\ : std_logic;
SIGNAL \textmode_vga_inst|textmode_vga_h_sm_inst|Equal0~0_combout\ : std_logic;
SIGNAL \textmode_vga_inst|textmode_vga_h_sm_inst|Equal0~1_combout\ : std_logic;
SIGNAL \textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.HSYNC~regout\ : std_logic;
SIGNAL \textmode_vga_inst|textmode_vga_h_sm_inst|Selector2~2_combout\ : std_logic;
SIGNAL \textmode_vga_inst|textmode_vga_h_sm_inst|Selector2~3_combout\ : std_logic;
SIGNAL \textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.HBACK_FIRST~regout\ : std_logic;
SIGNAL \textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.HBACK~regout\ : std_logic;
SIGNAL \textmode_vga_inst|textmode_vga_h_sm_inst|WideOr12~0_combout\ : std_logic;
SIGNAL \textmode_vga_inst|textmode_vga_h_sm_inst|WideOr12~combout\ : std_logic;
SIGNAL \textmode_vga_inst|textmode_vga_h_sm_inst|Add0~0_combout\ : std_logic;
SIGNAL \pll_vga_clk|altpll_component|_clk0\ : std_logic;
SIGNAL \textmode_vga_inst|console_sm_inst|state.STATE_SCROLL_CLEAR_LINE_LOOP~regout\ : std_logic;
SIGNAL \textmode_vga_inst|console_sm_inst|Selector7~2_combout\ : std_logic;
SIGNAL \textmode_vga_inst|console_sm_inst|Selector16~0_combout\ : std_logic;
SIGNAL \textmode_vga_inst|console_sm_inst|Selector7~1_combout\ : std_logic;
SIGNAL \textmode_vga_inst|console_sm_inst|Selector18~1_combout\ : std_logic;
SIGNAL \textmode_vga_inst|console_sm_inst|state.STATE_SCROLL_CLEAR_LINE_FINISH~regout\ : std_logic;
SIGNAL \textmode_vga_inst|console_sm_sync_inst|Selector3~0_combout\ : std_logic;
SIGNAL \textmode_vga_inst|console_sm_sync_inst|command_req_sys~regout\ : std_logic;
SIGNAL \textmode_vga_inst|console_sm_inst|Selector18~0\ : std_logic;
SIGNAL \textmode_vga_inst|console_sm_inst|Selector3~3_combout\ : std_logic;
SIGNAL \textmode_vga_inst|console_sm_inst|state.STATE_NEW_LINE_SIMPLE~regout\ : std_logic;
SIGNAL \textmode_vga_inst|console_sm_inst|state.STATE_SET_CHAR_NEW_LINE_AND_CARRIAGE_RETURN_SIMPLE~regout\ : std_logic;
SIGNAL \textmode_vga_inst|console_sm_inst|WideOr8~0_combout\ : std_logic;
SIGNAL \textmode_vga_inst|console_sm_inst|line_int[0]~1\ : std_logic;
SIGNAL \textmode_vga_inst|console_sm_inst|line_int[0]~1COUT1_16\ : std_logic;
SIGNAL \textmode_vga_inst|console_sm_inst|line_int[1]~3\ : std_logic;
SIGNAL \textmode_vga_inst|console_sm_inst|line_int[1]~3COUT1_18\ : std_logic;
SIGNAL \textmode_vga_inst|console_sm_inst|line_int[2]~5\ : std_logic;
SIGNAL \textmode_vga_inst|console_sm_inst|line_int[2]~5COUT1_20\ : std_logic;
SIGNAL \textmode_vga_inst|console_sm_inst|LessThan0~0_combout\ : std_logic;
SIGNAL \textmode_vga_inst|console_sm_inst|line_int[3]~7\ : std_logic;
SIGNAL \textmode_vga_inst|console_sm_inst|line_int[3]~7COUT1_22\ : std_logic;
SIGNAL \textmode_vga_inst|console_sm_inst|LessThan0~1_combout\ : std_logic;
SIGNAL \textmode_vga_inst|console_sm_inst|state.STATE_NEW_LINE_SCROLL~regout\ : std_logic;
SIGNAL \textmode_vga_inst|console_sm_inst|WideOr3~0_combout\ : std_logic;
SIGNAL \textmode_vga_inst|console_sm_inst|ack~regout\ : std_logic;
SIGNAL \textmode_vga_inst|console_sm_sync_inst|sync_state.STATE_WAIT_ACK_RELEASE~regout\ : std_logic;
SIGNAL \textmode_vga_inst|console_sm_sync_inst|Selector1~0_combout\ : std_logic;
SIGNAL \textmode_vga_inst|console_sm_sync_inst|sync_state.STATE_WAIT_ACK~regout\ : std_logic;
SIGNAL \textmode_vga_inst|console_sm_sync_inst|sync_state.STATE_FINISHED~regout\ : std_logic;
SIGNAL \textmode_vga_inst|console_sm_sync_inst|sync_state.STATE_IDLE~regout\ : std_logic;
SIGNAL \textmode_vga_inst|console_sm_inst|state.STATE_SET_CHAR~regout\ : std_logic;
SIGNAL \textmode_vga_inst|console_sm_inst|WideOr10~0_combout\ : std_logic;
SIGNAL \textmode_vga_inst|console_sm_inst|WideOr12~0_combout\ : std_logic;
SIGNAL \textmode_vga_inst|console_sm_inst|WideOr9~0_combout\ : std_logic;
SIGNAL \textmode_vga_inst|console_sm_inst|column_int[0]~1\ : std_logic;
SIGNAL \textmode_vga_inst|console_sm_inst|column_int[0]~1COUT1_21\ : std_logic;
SIGNAL \textmode_vga_inst|console_sm_inst|column_int[1]~3\ : std_logic;
SIGNAL \textmode_vga_inst|console_sm_inst|column_int[1]~3COUT1_23\ : std_logic;
SIGNAL \textmode_vga_inst|console_sm_inst|column_int[2]~5\ : std_logic;
SIGNAL \textmode_vga_inst|console_sm_inst|column_int[2]~5COUT1_25\ : std_logic;
SIGNAL \textmode_vga_inst|console_sm_inst|column_int[3]~7\ : std_logic;
SIGNAL \textmode_vga_inst|console_sm_inst|column_int[4]~9\ : std_logic;
SIGNAL \textmode_vga_inst|console_sm_inst|column_int[4]~9COUT1_27\ : std_logic;
SIGNAL \textmode_vga_inst|console_sm_inst|column_int[5]~11\ : std_logic;
SIGNAL \textmode_vga_inst|console_sm_inst|column_int[5]~11COUT1_29\ : std_logic;
SIGNAL \textmode_vga_inst|console_sm_inst|Equal8~0_combout\ : std_logic;
SIGNAL \textmode_vga_inst|console_sm_inst|LessThan1~0_combout\ : std_logic;
SIGNAL \textmode_vga_inst|console_sm_inst|WideOr0~0_combout\ : std_logic;
SIGNAL \textmode_vga_inst|console_sm_inst|Selector7~0_combout\ : std_logic;
SIGNAL \textmode_vga_inst|console_sm_inst|Selector7~3_combout\ : std_logic;
SIGNAL \textmode_vga_inst|console_sm_inst|state.STATE_SET_CHAR_NEW_LINE_AND_CARRIAGE_RETURN_SCROLL~regout\ : std_logic;
SIGNAL \textmode_vga_inst|console_sm_inst|WideOr10~1_combout\ : std_logic;
SIGNAL \textmode_vga_inst|console_sm_inst|Equal8~1_combout\ : std_logic;
SIGNAL \textmode_vga_inst|console_sm_inst|Equal8~2_combout\ : std_logic;
SIGNAL \textmode_vga_inst|console_sm_inst|Selector14~0_combout\ : std_logic;
SIGNAL \textmode_vga_inst|console_sm_inst|state.STATE_IDLE~regout\ : std_logic;
SIGNAL \textmode_vga_inst|console_sm_inst|WideOr1~0\ : std_logic;
SIGNAL \textmode_vga_inst|console_sm_inst|state.STATE_WAIT_REQ_RELEASE~regout\ : std_logic;
SIGNAL \textmode_vga_inst|console_sm_inst|WideOr3~1_combout\ : std_logic;
SIGNAL \textmode_vga_inst|console_sm_inst|Selector34~0_combout\ : std_logic;
SIGNAL \textmode_vga_inst|console_sm_inst|Selector35~0_combout\ : std_logic;
SIGNAL \textmode_vga_inst|console_sm_inst|Selector36~0_combout\ : std_logic;
SIGNAL \textmode_vga_inst|console_sm_inst|Selector37~0_combout\ : std_logic;
SIGNAL \textmode_vga_inst|console_sm_inst|scroll_int[0]~1\ : std_logic;
SIGNAL \textmode_vga_inst|console_sm_inst|scroll_int[0]~1COUT1_16\ : std_logic;
SIGNAL \textmode_vga_inst|console_sm_inst|scroll_int[1]~3\ : std_logic;
SIGNAL \textmode_vga_inst|console_sm_inst|scroll_int[1]~3COUT1_18\ : std_logic;
SIGNAL \textmode_vga_inst|console_sm_inst|scroll_int[2]~5\ : std_logic;
SIGNAL \textmode_vga_inst|console_sm_inst|scroll_int[2]~5COUT1_20\ : std_logic;
SIGNAL \textmode_vga_inst|console_sm_inst|scroll_int[3]~7\ : std_logic;
SIGNAL \textmode_vga_inst|console_sm_inst|scroll_int[3]~7COUT1_22\ : std_logic;
SIGNAL \textmode_vga_inst|console_sm_inst|Selector10~1_combout\ : std_logic;
SIGNAL \textmode_vga_inst|console_sm_inst|state.STATE_SCROLL_TOP~regout\ : std_logic;
SIGNAL \textmode_vga_inst|console_sm_inst|Selector38~0_combout\ : std_logic;
SIGNAL \textmode_vga_inst|console_sm_inst|LessThan2~0_combout\ : std_logic;
SIGNAL \textmode_vga_inst|console_sm_inst|state.STATE_SCROLL_NEXT~regout\ : std_logic;
SIGNAL \textmode_vga_inst|console_sm_inst|state.STATE_SCROLL_CLEAR_LINE~regout\ : std_logic;
SIGNAL \textmode_vga_inst|video_memory_inst|Add2~0_combout\ : std_logic;
SIGNAL \textmode_vga_inst|video_memory_inst|Add2~2\ : std_logic;
SIGNAL \textmode_vga_inst|video_memory_inst|Add2~2COUT1_36\ : std_logic;
SIGNAL \textmode_vga_inst|video_memory_inst|Add2~12\ : std_logic;
SIGNAL \textmode_vga_inst|video_memory_inst|Add2~12COUT1_38\ : std_logic;
SIGNAL \textmode_vga_inst|video_memory_inst|Add2~17\ : std_logic;
SIGNAL \textmode_vga_inst|video_memory_inst|Add2~17COUT1_40\ : std_logic;
SIGNAL \textmode_vga_inst|video_memory_inst|Add2~22\ : std_logic;
SIGNAL \textmode_vga_inst|video_memory_inst|Add2~27\ : std_logic;
SIGNAL \textmode_vga_inst|video_memory_inst|Add2~27COUT1_42\ : std_logic;
SIGNAL \textmode_vga_inst|video_memory_inst|Add2~5_combout\ : std_logic;
SIGNAL \textmode_vga_inst|video_memory_inst|Add2~20_combout\ : std_logic;
SIGNAL \textmode_vga_inst|video_memory_inst|Add2~15_combout\ : std_logic;
SIGNAL \textmode_vga_inst|video_memory_inst|Add2~10_combout\ : std_logic;
SIGNAL \textmode_vga_inst|video_memory_inst|LessThan1~0_combout\ : std_logic;
SIGNAL \textmode_vga_inst|video_memory_inst|Add2~25_combout\ : std_logic;
SIGNAL \textmode_vga_inst|video_memory_inst|LessThan1~1_combout\ : std_logic;
SIGNAL \textmode_vga_inst|video_memory_inst|Add3~0_combout\ : std_logic;
SIGNAL \textmode_vga_inst|video_memory_inst|Add3~2\ : std_logic;
SIGNAL \textmode_vga_inst|video_memory_inst|Add3~2COUT1_25\ : std_logic;
SIGNAL \textmode_vga_inst|video_memory_inst|Add3~5_combout\ : std_logic;
SIGNAL \textmode_vga_inst|video_memory_inst|Add3~7\ : std_logic;
SIGNAL \textmode_vga_inst|video_memory_inst|Add3~7COUT1_27\ : std_logic;
SIGNAL \textmode_vga_inst|video_memory_inst|Add3~10_combout\ : std_logic;
SIGNAL \textmode_vga_inst|video_memory_inst|Add3~12\ : std_logic;
SIGNAL \textmode_vga_inst|video_memory_inst|Add3~12COUT1_29\ : std_logic;
SIGNAL \textmode_vga_inst|video_memory_inst|Add3~15_combout\ : std_logic;
SIGNAL \textmode_vga_inst|video_memory_inst|ram.raddr_a[7]~0_combout\ : std_logic;
SIGNAL \textmode_vga_inst|video_memory_inst|ram.raddr_a[7]~2\ : std_logic;
SIGNAL \textmode_vga_inst|video_memory_inst|ram.raddr_a[7]~2COUT1_8\ : std_logic;
SIGNAL \textmode_vga_inst|video_memory_inst|Add0~7\ : std_logic;
SIGNAL \textmode_vga_inst|video_memory_inst|Add0~7COUT1_30\ : std_logic;
SIGNAL \textmode_vga_inst|video_memory_inst|Add0~12\ : std_logic;
SIGNAL \textmode_vga_inst|video_memory_inst|Add0~12COUT1_32\ : std_logic;
SIGNAL \textmode_vga_inst|video_memory_inst|Add0~17\ : std_logic;
SIGNAL \textmode_vga_inst|video_memory_inst|Add0~20_combout\ : std_logic;
SIGNAL \textmode_vga_inst|video_memory_inst|Add0~22\ : std_logic;
SIGNAL \textmode_vga_inst|video_memory_inst|Add0~22COUT1_34\ : std_logic;
SIGNAL \textmode_vga_inst|video_memory_inst|Add0~0_combout\ : std_logic;
SIGNAL \textmode_vga_inst|video_memory_inst|Add0~10_combout\ : std_logic;
SIGNAL \textmode_vga_inst|video_memory_inst|Add0~5_combout\ : std_logic;
SIGNAL \textmode_vga_inst|video_memory_inst|LessThan0~0_combout\ : std_logic;
SIGNAL \textmode_vga_inst|video_memory_inst|Add0~15_combout\ : std_logic;
SIGNAL \textmode_vga_inst|video_memory_inst|LessThan0~1_combout\ : std_logic;
SIGNAL \textmode_vga_inst|video_memory_inst|Add1~0_combout\ : std_logic;
SIGNAL \textmode_vga_inst|video_memory_inst|Add1~2\ : std_logic;
SIGNAL \textmode_vga_inst|video_memory_inst|Add1~2COUT1_25\ : std_logic;
SIGNAL \textmode_vga_inst|video_memory_inst|Add1~5_combout\ : std_logic;
SIGNAL \textmode_vga_inst|video_memory_inst|Add1~7\ : std_logic;
SIGNAL \textmode_vga_inst|video_memory_inst|Add1~7COUT1_27\ : std_logic;
SIGNAL \textmode_vga_inst|video_memory_inst|Add1~10_combout\ : std_logic;
SIGNAL \textmode_vga_inst|video_memory_inst|Add1~12\ : std_logic;
SIGNAL \textmode_vga_inst|video_memory_inst|Add1~12COUT1_29\ : std_logic;
SIGNAL \textmode_vga_inst|video_memory_inst|Add1~15_combout\ : std_logic;
SIGNAL \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a0~portbdataout\ : std_logic;
SIGNAL \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a1~portbdataout\ : std_logic;
SIGNAL \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a2~portbdataout\ : std_logic;
SIGNAL \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a3~portbdataout\ : std_logic;
SIGNAL \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a4~portbdataout\ : std_logic;
SIGNAL \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a5~portbdataout\ : std_logic;
SIGNAL \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a6~portbdataout\ : std_logic;
SIGNAL \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a7~portbdataout\ : std_logic;
SIGNAL \textmode_vga_inst|font_rom_inst|Mux0_rtl_1|auto_generated|ram_block1a1~portadataout\ : std_logic;
SIGNAL \textmode_vga_inst|font_rom_inst|Mux0_rtl_1|auto_generated|ram_block1a0~portadataout\ : std_logic;
SIGNAL \textmode_vga_inst|textmode_vga_h_sm_inst|h_sm_next_state~5_combout\ : std_logic;
SIGNAL \textmode_vga_inst|textmode_vga_h_sm_inst|h_sm_next_state~6_combout\ : std_logic;
SIGNAL \textmode_vga_inst|textmode_vga_h_sm_inst|h_sm_next_state~0_combout\ : std_logic;
SIGNAL \textmode_vga_inst|textmode_vga_h_sm_inst|h_sm_next_state~1_combout\ : std_logic;
SIGNAL \textmode_vga_inst|textmode_vga_h_sm_inst|h_sm_next_state~2_combout\ : std_logic;
SIGNAL \textmode_vga_inst|textmode_vga_h_sm_inst|h_sm_next_state~3_combout\ : std_logic;
SIGNAL \textmode_vga_inst|textmode_vga_h_sm_inst|h_sm_next_state~4_combout\ : std_logic;
SIGNAL \textmode_vga_inst|blink_interval_inst|cnt[0]~21\ : std_logic;
SIGNAL \textmode_vga_inst|blink_interval_inst|cnt[0]~21COUT1_71\ : std_logic;
SIGNAL \textmode_vga_inst|blink_interval_inst|cnt[1]~23\ : std_logic;
SIGNAL \textmode_vga_inst|blink_interval_inst|cnt[2]~25\ : std_logic;
SIGNAL \textmode_vga_inst|blink_interval_inst|cnt[2]~25COUT1_73\ : std_logic;
SIGNAL \textmode_vga_inst|blink_interval_inst|cnt[3]~27\ : std_logic;
SIGNAL \textmode_vga_inst|blink_interval_inst|cnt[3]~27COUT1_75\ : std_logic;
SIGNAL \textmode_vga_inst|blink_interval_inst|cnt[4]~29\ : std_logic;
SIGNAL \textmode_vga_inst|blink_interval_inst|cnt[4]~29COUT1_77\ : std_logic;
SIGNAL \textmode_vga_inst|blink_interval_inst|cnt[5]~31\ : std_logic;
SIGNAL \textmode_vga_inst|blink_interval_inst|cnt[5]~31COUT1_79\ : std_logic;
SIGNAL \textmode_vga_inst|blink_interval_inst|cnt[6]~41\ : std_logic;
SIGNAL \textmode_vga_inst|blink_interval_inst|cnt[7]~33\ : std_logic;
SIGNAL \textmode_vga_inst|blink_interval_inst|cnt[7]~33COUT1_81\ : std_logic;
SIGNAL \textmode_vga_inst|blink_interval_inst|cnt[8]~35\ : std_logic;
SIGNAL \textmode_vga_inst|blink_interval_inst|cnt[8]~35COUT1_83\ : std_logic;
SIGNAL \textmode_vga_inst|blink_interval_inst|cnt[9]~37\ : std_logic;
SIGNAL \textmode_vga_inst|blink_interval_inst|cnt[9]~37COUT1_85\ : std_logic;
SIGNAL \textmode_vga_inst|blink_interval_inst|cnt[10]~39\ : std_logic;
SIGNAL \textmode_vga_inst|blink_interval_inst|cnt[10]~39COUT1_87\ : std_logic;
SIGNAL \textmode_vga_inst|blink_interval_inst|cnt[11]~43\ : std_logic;
SIGNAL \textmode_vga_inst|blink_interval_inst|cnt[12]~45\ : std_logic;
SIGNAL \textmode_vga_inst|blink_interval_inst|cnt[12]~45COUT1_89\ : std_logic;
SIGNAL \textmode_vga_inst|blink_interval_inst|cnt[13]~47\ : std_logic;
SIGNAL \textmode_vga_inst|blink_interval_inst|cnt[13]~47COUT1_91\ : std_logic;
SIGNAL \textmode_vga_inst|blink_interval_inst|cnt[14]~49\ : std_logic;
SIGNAL \textmode_vga_inst|blink_interval_inst|cnt[14]~49COUT1_93\ : std_logic;
SIGNAL \textmode_vga_inst|blink_interval_inst|cnt[15]~11\ : std_logic;
SIGNAL \textmode_vga_inst|blink_interval_inst|cnt[15]~11COUT1_95\ : std_logic;
SIGNAL \textmode_vga_inst|blink_interval_inst|cnt[16]~15\ : std_logic;
SIGNAL \textmode_vga_inst|blink_interval_inst|cnt[17]~13\ : std_logic;
SIGNAL \textmode_vga_inst|blink_interval_inst|cnt[17]~13COUT1_97\ : std_logic;
SIGNAL \textmode_vga_inst|blink_interval_inst|cnt[18]~17\ : std_logic;
SIGNAL \textmode_vga_inst|blink_interval_inst|cnt[18]~17COUT1_99\ : std_logic;
SIGNAL \textmode_vga_inst|blink_interval_inst|cnt[19]~19\ : std_logic;
SIGNAL \textmode_vga_inst|blink_interval_inst|cnt[19]~19COUT1_101\ : std_logic;
SIGNAL \textmode_vga_inst|blink_interval_inst|cnt[20]~3\ : std_logic;
SIGNAL \textmode_vga_inst|blink_interval_inst|cnt[20]~3COUT1_103\ : std_logic;
SIGNAL \textmode_vga_inst|blink_interval_inst|cnt[21]~5\ : std_logic;
SIGNAL \textmode_vga_inst|blink_interval_inst|LessThan0~0_combout\ : std_logic;
SIGNAL \textmode_vga_inst|blink_interval_inst|cnt[22]~7\ : std_logic;
SIGNAL \textmode_vga_inst|blink_interval_inst|cnt[22]~7COUT1_105\ : std_logic;
SIGNAL \textmode_vga_inst|blink_interval_inst|cnt[23]~1\ : std_logic;
SIGNAL \textmode_vga_inst|blink_interval_inst|cnt[23]~1COUT1_107\ : std_logic;
SIGNAL \textmode_vga_inst|blink_interval_inst|LessThan0~1_combout\ : std_logic;
SIGNAL \textmode_vga_inst|blink_interval_inst|LessThan0~5_combout\ : std_logic;
SIGNAL \textmode_vga_inst|blink_interval_inst|LessThan0~2_combout\ : std_logic;
SIGNAL \textmode_vga_inst|blink_interval_inst|LessThan0~3_combout\ : std_logic;
SIGNAL \textmode_vga_inst|blink_interval_inst|LessThan0~4_combout\ : std_logic;
SIGNAL \textmode_vga_inst|blink_interval_inst|LessThan0~6_combout\ : std_logic;
SIGNAL \textmode_vga_inst|blink_interval_inst|LessThan0~7_combout\ : std_logic;
SIGNAL \textmode_vga_inst|blink_interval_inst|LessThan0~8_combout\ : std_logic;
SIGNAL \textmode_vga_inst|blink_interval_inst|active_int~regout\ : std_logic;
SIGNAL \textmode_vga_inst|textmode_vga_h_sm_inst|h_sm_next_state~7_combout\ : std_logic;
SIGNAL \textmode_vga_inst|textmode_vga_h_sm_inst|Selector9~3_combout\ : std_logic;
SIGNAL \textmode_vga_inst|textmode_vga_h_sm_inst|Selector9~5_combout\ : std_logic;
SIGNAL \textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.PIXEL_FG~regout\ : std_logic;
SIGNAL \textmode_vga_inst|textmode_vga_h_sm_inst|WideOr5~4_combout\ : std_logic;
SIGNAL \textmode_vga_inst|textmode_vga_h_sm_inst|Selector6~0_combout\ : std_logic;
SIGNAL \textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.CHAR_NEW_BG~regout\ : std_logic;
SIGNAL \textmode_vga_inst|textmode_vga_h_sm_inst|WideOr13~0_combout\ : std_logic;
SIGNAL \textmode_vga_inst|textmode_vga_h_sm_inst|Mux0~0\ : std_logic;
SIGNAL \textmode_vga_inst|font_rom_inst|Mux0_rtl_1|auto_generated|ram_block1a3~portadataout\ : std_logic;
SIGNAL \textmode_vga_inst|font_rom_inst|Mux0_rtl_1|auto_generated|ram_block1a2~portadataout\ : std_logic;
SIGNAL \textmode_vga_inst|textmode_vga_h_sm_inst|Mux0~1\ : std_logic;
SIGNAL \textmode_vga_inst|textmode_vga_h_sm_inst|Equal4~1_combout\ : std_logic;
SIGNAL \textmode_vga_inst|font_rom_inst|Mux0_rtl_1|auto_generated|ram_block1a5~portadataout\ : std_logic;
SIGNAL \textmode_vga_inst|font_rom_inst|Mux0_rtl_1|auto_generated|ram_block1a4~portadataout\ : std_logic;
SIGNAL \textmode_vga_inst|textmode_vga_h_sm_inst|Mux0~2\ : std_logic;
SIGNAL \textmode_vga_inst|font_rom_inst|Mux0_rtl_1|auto_generated|ram_block1a7~portadataout\ : std_logic;
SIGNAL \textmode_vga_inst|font_rom_inst|Mux0_rtl_1|auto_generated|ram_block1a6~portadataout\ : std_logic;
SIGNAL \textmode_vga_inst|textmode_vga_h_sm_inst|Mux0~3\ : std_logic;
SIGNAL \textmode_vga_inst|textmode_vga_h_sm_inst|Mux0~4_combout\ : std_logic;
SIGNAL \textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.PIXEL_BG~regout\ : std_logic;
SIGNAL \textmode_vga_inst|textmode_vga_h_sm_inst|Selector9~2_combout\ : std_logic;
SIGNAL \textmode_vga_inst|textmode_vga_h_sm_inst|Selector13~0_combout\ : std_logic;
SIGNAL \textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.CHAR_NEW_CURSOR~regout\ : std_logic;
SIGNAL \textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.PIXEL_CURSOR~regout\ : std_logic;
SIGNAL \textmode_vga_inst|textmode_vga_h_sm_inst|Selector8~0_combout\ : std_logic;
SIGNAL \textmode_vga_inst|textmode_vga_h_sm_inst|Selector8~1_combout\ : std_logic;
SIGNAL \textmode_vga_inst|textmode_vga_h_sm_inst|Selector8~2_combout\ : std_logic;
SIGNAL \textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.CHAR_NEW_FG~regout\ : std_logic;
SIGNAL \textmode_vga_inst|textmode_vga_h_sm_inst|WideOr13~1_combout\ : std_logic;
SIGNAL \textmode_vga_inst|textmode_vga_h_sm_inst|Equal4~0_combout\ : std_logic;
SIGNAL \textmode_vga_inst|textmode_vga_h_sm_inst|Selector10~0_combout\ : std_logic;
SIGNAL \textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.HFRONT_FIRST~regout\ : std_logic;
SIGNAL \textmode_vga_inst|textmode_vga_h_sm_inst|WideOr9~0_combout\ : std_logic;
SIGNAL \textmode_vga_inst|textmode_vga_h_sm_inst|Equal6~0_combout\ : std_logic;
SIGNAL \textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.HFRONT_LAST~regout\ : std_logic;
SIGNAL \textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.HSYNC_FIRST~regout\ : std_logic;
SIGNAL \textmode_vga_inst|textmode_vga_h_sm_inst|hsync_n~0_combout\ : std_logic;
SIGNAL \textmode_vga_inst|textmode_vga_v_sm_inst|WideOr6~combout\ : std_logic;
SIGNAL \textmode_vga_inst|console_sm_inst|data[8]~0_combout\ : std_logic;
SIGNAL \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a13~portbdataout\ : std_logic;
SIGNAL \textmode_vga_inst|textmode_vga_h_sm_inst|Selector34~0_combout\ : std_logic;
SIGNAL \textmode_vga_inst|textmode_vga_h_sm_inst|rgb~0_combout\ : std_logic;
SIGNAL \textmode_vga_inst|textmode_vga_h_sm_inst|Selector34~1_combout\ : std_logic;
SIGNAL \textmode_vga_inst|textmode_vga_h_sm_inst|Selector35~0_combout\ : std_logic;
SIGNAL \textmode_vga_inst|textmode_vga_h_sm_inst|Selector35~combout\ : std_logic;
SIGNAL \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a14~portbdataout\ : std_logic;
SIGNAL \textmode_vga_inst|textmode_vga_h_sm_inst|Selector34~combout\ : std_logic;
SIGNAL \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a15~portbdataout\ : std_logic;
SIGNAL \textmode_vga_inst|textmode_vga_h_sm_inst|Selector33~combout\ : std_logic;
SIGNAL \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a10~portbdataout\ : std_logic;
SIGNAL \textmode_vga_inst|textmode_vga_h_sm_inst|Selector38~combout\ : std_logic;
SIGNAL \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a11~portbdataout\ : std_logic;
SIGNAL \textmode_vga_inst|textmode_vga_h_sm_inst|Selector37~combout\ : std_logic;
SIGNAL \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a12~portbdataout\ : std_logic;
SIGNAL \textmode_vga_inst|textmode_vga_h_sm_inst|Selector36~combout\ : std_logic;
SIGNAL \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a8~portbdataout\ : std_logic;
SIGNAL \textmode_vga_inst|textmode_vga_h_sm_inst|Selector40~combout\ : std_logic;
SIGNAL \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a9~portbdataout\ : std_logic;
SIGNAL \textmode_vga_inst|textmode_vga_h_sm_inst|Selector39~combout\ : std_logic;
SIGNAL \textmode_vga_inst|blink_interval_inst|cnt\ : std_logic_vector(24 DOWNTO 0);
SIGNAL \textmode_vga_inst|console_sm_sync_inst|ack_sync\ : std_logic_vector(0 TO 1);
SIGNAL \textmode_vga_inst|console_sm_sync_inst|command_data_latched\ : std_logic_vector(31 DOWNTO 0);
SIGNAL \textmode_vga_inst|console_sm_sync_inst|command_req_sync\ : std_logic_vector(0 TO 1);
SIGNAL \textmode_vga_inst|console_sm_inst|column_int\ : std_logic_vector(6 DOWNTO 0);
SIGNAL \textmode_vga_inst|console_sm_inst|column_save\ : std_logic_vector(6 DOWNTO 0);
SIGNAL \textmode_vga_inst|console_sm_inst|line_int\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \textmode_vga_inst|console_sm_inst|scroll_int\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \textmode_vga_inst|textmode_vga_v_sm_inst|char_height_pixel_int\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \textmode_vga_inst|textmode_vga_v_sm_inst|char_line_cnt_int\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \textmode_vga_inst|textmode_vga_v_sm_inst|vcnt\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int\ : std_logic_vector(6 DOWNTO 0);
SIGNAL \textmode_vga_inst|textmode_vga_h_sm_inst|char_width_pixel\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \textmode_vga_inst|textmode_vga_h_sm_inst|current_char\ : std_logic_vector(0 TO 7);
SIGNAL \textmode_vga_inst|textmode_vga_h_sm_inst|current_color\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \textmode_vga_inst|textmode_vga_h_sm_inst|hcnt\ : std_logic_vector(6 DOWNTO 0);
SIGNAL \ps2_keyboard_controller_inst|ps2_transceiver_inst|output_data_internal\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout2\ : std_logic_vector(8 DOWNTO 0);
SIGNAL \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_sync\ : std_logic_vector(1 TO 2);
SIGNAL \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_data_sync\ : std_logic_vector(1 TO 2);
SIGNAL \sys_res_n_debounce_inst|counter_inst|cnt_int\ : std_logic_vector(15 DOWNTO 0);
SIGNAL \sys_res_n_debounce_inst|sync_inst|sync\ : std_logic_vector(1 TO 2);
SIGNAL \btn_a_debounce_inst|counter_inst|cnt_int\ : std_logic_vector(15 DOWNTO 0);
SIGNAL \btn_a_debounce_inst|sync_inst|sync\ : std_logic_vector(1 TO 2);
SIGNAL \textmode_vga_inst|textmode_vga_h_sm_inst|ALT_INV_textmode_vga_h_sm_state.HSYNC_FIRST~regout\ : std_logic;
SIGNAL \textmode_vga_inst|textmode_vga_h_sm_inst|ALT_INV_hsync_n~0_combout\ : std_logic;
SIGNAL \textmode_vga_inst|textmode_vga_v_sm_inst|ALT_INV_WideOr6~combout\ : std_logic;
SIGNAL \textmode_vga_inst|textmode_vga_v_sm_inst|ALT_INV_textmode_vga_v_sm_state.VDATA_NEXTCHAR~regout\ : std_logic;
SIGNAL \ps2_keyboard_controller_inst|ps2_transceiver_inst|ALT_INV_ps2_data_internal~regout\ : std_logic;
SIGNAL \ps2_keyboard_controller_inst|ps2_transceiver_inst|ALT_INV_ps2_clk_internal~regout\ : std_logic;
SIGNAL \textmode_vga_inst|console_sm_inst|ALT_INV_state.STATE_SCROLL_NEXT~regout\ : std_logic;
SIGNAL \ps2_keyboard_controller_inst|ps2_transceiver_inst|ALT_INV_ps2_transceiver_state.PREPARE_SEND_WAIT1~regout\ : std_logic;
SIGNAL \ps2_keyboard_controller_inst|ps2_transceiver_inst|ALT_INV_ps2_transceiver_state.PREPARE_SEND_WAIT2~regout\ : std_logic;

BEGIN

ww_sys_clk <= sys_clk;
ww_sys_res_n <= sys_res_n;
ww_btn_a <= btn_a;
led_a <= ww_led_a;
led_b <= ww_led_b;
hsync_n <= ww_hsync_n;
vsync_n <= ww_vsync_n;
r <= ww_r;
g <= ww_g;
b <= ww_b;
uart_tx <= ww_uart_tx;
ww_uart_rx <= uart_rx;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a13_PORTADATAIN_bus\(0) <= \textmode_vga_inst|console_sm_inst|data[8]~0_combout\;

\textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a13_PORTAADDR_bus\ <= (\textmode_vga_inst|video_memory_inst|Add3~15_combout\ & \textmode_vga_inst|video_memory_inst|Add3~10_combout\ & 
\textmode_vga_inst|video_memory_inst|Add3~5_combout\ & \textmode_vga_inst|video_memory_inst|Add3~0_combout\ & \textmode_vga_inst|video_memory_inst|Add2~0_combout\ & \textmode_vga_inst|console_sm_inst|column_int\(6) & 
\textmode_vga_inst|console_sm_inst|column_int\(5) & \textmode_vga_inst|console_sm_inst|column_int\(4) & \textmode_vga_inst|console_sm_inst|column_int\(3) & \textmode_vga_inst|console_sm_inst|column_int\(2) & 
\textmode_vga_inst|console_sm_inst|column_int\(1) & \textmode_vga_inst|console_sm_inst|column_int\(0));

\textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a13_PORTBADDR_bus\ <= (\textmode_vga_inst|video_memory_inst|Add1~15_combout\ & \textmode_vga_inst|video_memory_inst|Add1~10_combout\ & 
\textmode_vga_inst|video_memory_inst|Add1~5_combout\ & \textmode_vga_inst|video_memory_inst|Add1~0_combout\ & \textmode_vga_inst|video_memory_inst|ram.raddr_a[7]~0_combout\ & \textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int\(6) & 
\textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int\(5) & \textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int\(4) & \textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int\(3) & \textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int\(2) & 
\textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int\(1) & \textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int\(0));

\textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a13~portbdataout\ <= \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a13_PORTBDATAOUT_bus\(0);

\textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a14_PORTADATAIN_bus\(0) <= \textmode_vga_inst|console_sm_inst|data[8]~0_combout\;

\textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a14_PORTAADDR_bus\ <= (\textmode_vga_inst|video_memory_inst|Add3~15_combout\ & \textmode_vga_inst|video_memory_inst|Add3~10_combout\ & 
\textmode_vga_inst|video_memory_inst|Add3~5_combout\ & \textmode_vga_inst|video_memory_inst|Add3~0_combout\ & \textmode_vga_inst|video_memory_inst|Add2~0_combout\ & \textmode_vga_inst|console_sm_inst|column_int\(6) & 
\textmode_vga_inst|console_sm_inst|column_int\(5) & \textmode_vga_inst|console_sm_inst|column_int\(4) & \textmode_vga_inst|console_sm_inst|column_int\(3) & \textmode_vga_inst|console_sm_inst|column_int\(2) & 
\textmode_vga_inst|console_sm_inst|column_int\(1) & \textmode_vga_inst|console_sm_inst|column_int\(0));

\textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a14_PORTBADDR_bus\ <= (\textmode_vga_inst|video_memory_inst|Add1~15_combout\ & \textmode_vga_inst|video_memory_inst|Add1~10_combout\ & 
\textmode_vga_inst|video_memory_inst|Add1~5_combout\ & \textmode_vga_inst|video_memory_inst|Add1~0_combout\ & \textmode_vga_inst|video_memory_inst|ram.raddr_a[7]~0_combout\ & \textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int\(6) & 
\textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int\(5) & \textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int\(4) & \textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int\(3) & \textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int\(2) & 
\textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int\(1) & \textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int\(0));

\textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a14~portbdataout\ <= \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a14_PORTBDATAOUT_bus\(0);

\textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a15_PORTADATAIN_bus\(0) <= \textmode_vga_inst|console_sm_inst|data[8]~0_combout\;

\textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a15_PORTAADDR_bus\ <= (\textmode_vga_inst|video_memory_inst|Add3~15_combout\ & \textmode_vga_inst|video_memory_inst|Add3~10_combout\ & 
\textmode_vga_inst|video_memory_inst|Add3~5_combout\ & \textmode_vga_inst|video_memory_inst|Add3~0_combout\ & \textmode_vga_inst|video_memory_inst|Add2~0_combout\ & \textmode_vga_inst|console_sm_inst|column_int\(6) & 
\textmode_vga_inst|console_sm_inst|column_int\(5) & \textmode_vga_inst|console_sm_inst|column_int\(4) & \textmode_vga_inst|console_sm_inst|column_int\(3) & \textmode_vga_inst|console_sm_inst|column_int\(2) & 
\textmode_vga_inst|console_sm_inst|column_int\(1) & \textmode_vga_inst|console_sm_inst|column_int\(0));

\textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a15_PORTBADDR_bus\ <= (\textmode_vga_inst|video_memory_inst|Add1~15_combout\ & \textmode_vga_inst|video_memory_inst|Add1~10_combout\ & 
\textmode_vga_inst|video_memory_inst|Add1~5_combout\ & \textmode_vga_inst|video_memory_inst|Add1~0_combout\ & \textmode_vga_inst|video_memory_inst|ram.raddr_a[7]~0_combout\ & \textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int\(6) & 
\textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int\(5) & \textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int\(4) & \textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int\(3) & \textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int\(2) & 
\textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int\(1) & \textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int\(0));

\textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a15~portbdataout\ <= \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a15_PORTBDATAOUT_bus\(0);

\textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a10_PORTADATAIN_bus\(0) <= \textmode_vga_inst|console_sm_inst|data[8]~0_combout\;

\textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a10_PORTAADDR_bus\ <= (\textmode_vga_inst|video_memory_inst|Add3~15_combout\ & \textmode_vga_inst|video_memory_inst|Add3~10_combout\ & 
\textmode_vga_inst|video_memory_inst|Add3~5_combout\ & \textmode_vga_inst|video_memory_inst|Add3~0_combout\ & \textmode_vga_inst|video_memory_inst|Add2~0_combout\ & \textmode_vga_inst|console_sm_inst|column_int\(6) & 
\textmode_vga_inst|console_sm_inst|column_int\(5) & \textmode_vga_inst|console_sm_inst|column_int\(4) & \textmode_vga_inst|console_sm_inst|column_int\(3) & \textmode_vga_inst|console_sm_inst|column_int\(2) & 
\textmode_vga_inst|console_sm_inst|column_int\(1) & \textmode_vga_inst|console_sm_inst|column_int\(0));

\textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a10_PORTBADDR_bus\ <= (\textmode_vga_inst|video_memory_inst|Add1~15_combout\ & \textmode_vga_inst|video_memory_inst|Add1~10_combout\ & 
\textmode_vga_inst|video_memory_inst|Add1~5_combout\ & \textmode_vga_inst|video_memory_inst|Add1~0_combout\ & \textmode_vga_inst|video_memory_inst|ram.raddr_a[7]~0_combout\ & \textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int\(6) & 
\textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int\(5) & \textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int\(4) & \textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int\(3) & \textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int\(2) & 
\textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int\(1) & \textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int\(0));

\textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a10~portbdataout\ <= \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a10_PORTBDATAOUT_bus\(0);

\textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a11_PORTADATAIN_bus\(0) <= \textmode_vga_inst|console_sm_inst|data[8]~0_combout\;

\textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a11_PORTAADDR_bus\ <= (\textmode_vga_inst|video_memory_inst|Add3~15_combout\ & \textmode_vga_inst|video_memory_inst|Add3~10_combout\ & 
\textmode_vga_inst|video_memory_inst|Add3~5_combout\ & \textmode_vga_inst|video_memory_inst|Add3~0_combout\ & \textmode_vga_inst|video_memory_inst|Add2~0_combout\ & \textmode_vga_inst|console_sm_inst|column_int\(6) & 
\textmode_vga_inst|console_sm_inst|column_int\(5) & \textmode_vga_inst|console_sm_inst|column_int\(4) & \textmode_vga_inst|console_sm_inst|column_int\(3) & \textmode_vga_inst|console_sm_inst|column_int\(2) & 
\textmode_vga_inst|console_sm_inst|column_int\(1) & \textmode_vga_inst|console_sm_inst|column_int\(0));

\textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a11_PORTBADDR_bus\ <= (\textmode_vga_inst|video_memory_inst|Add1~15_combout\ & \textmode_vga_inst|video_memory_inst|Add1~10_combout\ & 
\textmode_vga_inst|video_memory_inst|Add1~5_combout\ & \textmode_vga_inst|video_memory_inst|Add1~0_combout\ & \textmode_vga_inst|video_memory_inst|ram.raddr_a[7]~0_combout\ & \textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int\(6) & 
\textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int\(5) & \textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int\(4) & \textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int\(3) & \textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int\(2) & 
\textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int\(1) & \textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int\(0));

\textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a11~portbdataout\ <= \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a11_PORTBDATAOUT_bus\(0);

\textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a12_PORTADATAIN_bus\(0) <= \textmode_vga_inst|console_sm_inst|data[8]~0_combout\;

\textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a12_PORTAADDR_bus\ <= (\textmode_vga_inst|video_memory_inst|Add3~15_combout\ & \textmode_vga_inst|video_memory_inst|Add3~10_combout\ & 
\textmode_vga_inst|video_memory_inst|Add3~5_combout\ & \textmode_vga_inst|video_memory_inst|Add3~0_combout\ & \textmode_vga_inst|video_memory_inst|Add2~0_combout\ & \textmode_vga_inst|console_sm_inst|column_int\(6) & 
\textmode_vga_inst|console_sm_inst|column_int\(5) & \textmode_vga_inst|console_sm_inst|column_int\(4) & \textmode_vga_inst|console_sm_inst|column_int\(3) & \textmode_vga_inst|console_sm_inst|column_int\(2) & 
\textmode_vga_inst|console_sm_inst|column_int\(1) & \textmode_vga_inst|console_sm_inst|column_int\(0));

\textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a12_PORTBADDR_bus\ <= (\textmode_vga_inst|video_memory_inst|Add1~15_combout\ & \textmode_vga_inst|video_memory_inst|Add1~10_combout\ & 
\textmode_vga_inst|video_memory_inst|Add1~5_combout\ & \textmode_vga_inst|video_memory_inst|Add1~0_combout\ & \textmode_vga_inst|video_memory_inst|ram.raddr_a[7]~0_combout\ & \textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int\(6) & 
\textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int\(5) & \textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int\(4) & \textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int\(3) & \textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int\(2) & 
\textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int\(1) & \textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int\(0));

\textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a12~portbdataout\ <= \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a12_PORTBDATAOUT_bus\(0);

\textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a8_PORTADATAIN_bus\(0) <= \textmode_vga_inst|console_sm_inst|data[8]~0_combout\;

\textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a8_PORTAADDR_bus\ <= (\textmode_vga_inst|video_memory_inst|Add3~15_combout\ & \textmode_vga_inst|video_memory_inst|Add3~10_combout\ & 
\textmode_vga_inst|video_memory_inst|Add3~5_combout\ & \textmode_vga_inst|video_memory_inst|Add3~0_combout\ & \textmode_vga_inst|video_memory_inst|Add2~0_combout\ & \textmode_vga_inst|console_sm_inst|column_int\(6) & 
\textmode_vga_inst|console_sm_inst|column_int\(5) & \textmode_vga_inst|console_sm_inst|column_int\(4) & \textmode_vga_inst|console_sm_inst|column_int\(3) & \textmode_vga_inst|console_sm_inst|column_int\(2) & 
\textmode_vga_inst|console_sm_inst|column_int\(1) & \textmode_vga_inst|console_sm_inst|column_int\(0));

\textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a8_PORTBADDR_bus\ <= (\textmode_vga_inst|video_memory_inst|Add1~15_combout\ & \textmode_vga_inst|video_memory_inst|Add1~10_combout\ & 
\textmode_vga_inst|video_memory_inst|Add1~5_combout\ & \textmode_vga_inst|video_memory_inst|Add1~0_combout\ & \textmode_vga_inst|video_memory_inst|ram.raddr_a[7]~0_combout\ & \textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int\(6) & 
\textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int\(5) & \textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int\(4) & \textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int\(3) & \textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int\(2) & 
\textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int\(1) & \textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int\(0));

\textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a8~portbdataout\ <= \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a8_PORTBDATAOUT_bus\(0);

\textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a9_PORTADATAIN_bus\(0) <= \textmode_vga_inst|console_sm_inst|data[8]~0_combout\;

\textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a9_PORTAADDR_bus\ <= (\textmode_vga_inst|video_memory_inst|Add3~15_combout\ & \textmode_vga_inst|video_memory_inst|Add3~10_combout\ & 
\textmode_vga_inst|video_memory_inst|Add3~5_combout\ & \textmode_vga_inst|video_memory_inst|Add3~0_combout\ & \textmode_vga_inst|video_memory_inst|Add2~0_combout\ & \textmode_vga_inst|console_sm_inst|column_int\(6) & 
\textmode_vga_inst|console_sm_inst|column_int\(5) & \textmode_vga_inst|console_sm_inst|column_int\(4) & \textmode_vga_inst|console_sm_inst|column_int\(3) & \textmode_vga_inst|console_sm_inst|column_int\(2) & 
\textmode_vga_inst|console_sm_inst|column_int\(1) & \textmode_vga_inst|console_sm_inst|column_int\(0));

\textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a9_PORTBADDR_bus\ <= (\textmode_vga_inst|video_memory_inst|Add1~15_combout\ & \textmode_vga_inst|video_memory_inst|Add1~10_combout\ & 
\textmode_vga_inst|video_memory_inst|Add1~5_combout\ & \textmode_vga_inst|video_memory_inst|Add1~0_combout\ & \textmode_vga_inst|video_memory_inst|ram.raddr_a[7]~0_combout\ & \textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int\(6) & 
\textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int\(5) & \textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int\(4) & \textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int\(3) & \textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int\(2) & 
\textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int\(1) & \textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int\(0));

\textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a9~portbdataout\ <= \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a9_PORTBDATAOUT_bus\(0);

\pll_vga_clk|altpll_component|pll_INCLK_bus\ <= (gnd & \sys_clk~combout\);

\pll_vga_clk|altpll_component|_clk0\ <= \pll_vga_clk|altpll_component|pll_CLK_bus\(0);
\pll_vga_clk|altpll_component|pll~CLK1\ <= \pll_vga_clk|altpll_component|pll_CLK_bus\(1);
\pll_vga_clk|altpll_component|pll~CLK2\ <= \pll_vga_clk|altpll_component|pll_CLK_bus\(2);
\pll_vga_clk|altpll_component|pll~CLK3\ <= \pll_vga_clk|altpll_component|pll_CLK_bus\(3);
\pll_vga_clk|altpll_component|pll~CLK4\ <= \pll_vga_clk|altpll_component|pll_CLK_bus\(4);
\pll_vga_clk|altpll_component|pll~CLK5\ <= \pll_vga_clk|altpll_component|pll_CLK_bus\(5);

\textmode_vga_inst|font_rom_inst|Mux0_rtl_1|auto_generated|ram_block1a0_PORTAADDR_bus\ <= (\textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a7~portbdataout\ & 
\textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a6~portbdataout\ & \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a5~portbdataout\ & 
\textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a4~portbdataout\ & \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a3~portbdataout\ & 
\textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a2~portbdataout\ & \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a1~portbdataout\ & 
\textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a0~portbdataout\ & \textmode_vga_inst|textmode_vga_v_sm_inst|char_height_pixel_int\(3) & \textmode_vga_inst|textmode_vga_v_sm_inst|char_height_pixel_int\(2) & 
\textmode_vga_inst|textmode_vga_v_sm_inst|char_height_pixel_int\(1) & \textmode_vga_inst|textmode_vga_v_sm_inst|char_height_pixel_int\(0));

\textmode_vga_inst|font_rom_inst|Mux0_rtl_1|auto_generated|ram_block1a0~portadataout\ <= \textmode_vga_inst|font_rom_inst|Mux0_rtl_1|auto_generated|ram_block1a0_PORTADATAOUT_bus\(0);

\textmode_vga_inst|font_rom_inst|Mux0_rtl_1|auto_generated|ram_block1a1_PORTAADDR_bus\ <= (\textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a7~portbdataout\ & 
\textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a6~portbdataout\ & \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a5~portbdataout\ & 
\textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a4~portbdataout\ & \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a3~portbdataout\ & 
\textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a2~portbdataout\ & \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a1~portbdataout\ & 
\textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a0~portbdataout\ & \textmode_vga_inst|textmode_vga_v_sm_inst|char_height_pixel_int\(3) & \textmode_vga_inst|textmode_vga_v_sm_inst|char_height_pixel_int\(2) & 
\textmode_vga_inst|textmode_vga_v_sm_inst|char_height_pixel_int\(1) & \textmode_vga_inst|textmode_vga_v_sm_inst|char_height_pixel_int\(0));

\textmode_vga_inst|font_rom_inst|Mux0_rtl_1|auto_generated|ram_block1a1~portadataout\ <= \textmode_vga_inst|font_rom_inst|Mux0_rtl_1|auto_generated|ram_block1a1_PORTADATAOUT_bus\(0);

\textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a0_PORTADATAIN_bus\(0) <= \~GND~combout\;

\textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a0_PORTAADDR_bus\ <= (\textmode_vga_inst|video_memory_inst|Add3~15_combout\ & \textmode_vga_inst|video_memory_inst|Add3~10_combout\ & 
\textmode_vga_inst|video_memory_inst|Add3~5_combout\ & \textmode_vga_inst|video_memory_inst|Add3~0_combout\ & \textmode_vga_inst|video_memory_inst|Add2~0_combout\ & \textmode_vga_inst|console_sm_inst|column_int\(6) & 
\textmode_vga_inst|console_sm_inst|column_int\(5) & \textmode_vga_inst|console_sm_inst|column_int\(4) & \textmode_vga_inst|console_sm_inst|column_int\(3) & \textmode_vga_inst|console_sm_inst|column_int\(2) & 
\textmode_vga_inst|console_sm_inst|column_int\(1) & \textmode_vga_inst|console_sm_inst|column_int\(0));

\textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a0_PORTBADDR_bus\ <= (\textmode_vga_inst|video_memory_inst|Add1~15_combout\ & \textmode_vga_inst|video_memory_inst|Add1~10_combout\ & 
\textmode_vga_inst|video_memory_inst|Add1~5_combout\ & \textmode_vga_inst|video_memory_inst|Add1~0_combout\ & \textmode_vga_inst|video_memory_inst|ram.raddr_a[7]~0_combout\ & \textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int\(6) & 
\textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int\(5) & \textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int\(4) & \textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int\(3) & \textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int\(2) & 
\textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int\(1) & \textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int\(0));

\textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a0~portbdataout\ <= \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(0);

\textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a1_PORTADATAIN_bus\(0) <= \~GND~combout\;

\textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a1_PORTAADDR_bus\ <= (\textmode_vga_inst|video_memory_inst|Add3~15_combout\ & \textmode_vga_inst|video_memory_inst|Add3~10_combout\ & 
\textmode_vga_inst|video_memory_inst|Add3~5_combout\ & \textmode_vga_inst|video_memory_inst|Add3~0_combout\ & \textmode_vga_inst|video_memory_inst|Add2~0_combout\ & \textmode_vga_inst|console_sm_inst|column_int\(6) & 
\textmode_vga_inst|console_sm_inst|column_int\(5) & \textmode_vga_inst|console_sm_inst|column_int\(4) & \textmode_vga_inst|console_sm_inst|column_int\(3) & \textmode_vga_inst|console_sm_inst|column_int\(2) & 
\textmode_vga_inst|console_sm_inst|column_int\(1) & \textmode_vga_inst|console_sm_inst|column_int\(0));

\textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a1_PORTBADDR_bus\ <= (\textmode_vga_inst|video_memory_inst|Add1~15_combout\ & \textmode_vga_inst|video_memory_inst|Add1~10_combout\ & 
\textmode_vga_inst|video_memory_inst|Add1~5_combout\ & \textmode_vga_inst|video_memory_inst|Add1~0_combout\ & \textmode_vga_inst|video_memory_inst|ram.raddr_a[7]~0_combout\ & \textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int\(6) & 
\textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int\(5) & \textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int\(4) & \textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int\(3) & \textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int\(2) & 
\textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int\(1) & \textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int\(0));

\textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a1~portbdataout\ <= \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a1_PORTBDATAOUT_bus\(0);

\textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a2_PORTADATAIN_bus\(0) <= \~GND~combout\;

\textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a2_PORTAADDR_bus\ <= (\textmode_vga_inst|video_memory_inst|Add3~15_combout\ & \textmode_vga_inst|video_memory_inst|Add3~10_combout\ & 
\textmode_vga_inst|video_memory_inst|Add3~5_combout\ & \textmode_vga_inst|video_memory_inst|Add3~0_combout\ & \textmode_vga_inst|video_memory_inst|Add2~0_combout\ & \textmode_vga_inst|console_sm_inst|column_int\(6) & 
\textmode_vga_inst|console_sm_inst|column_int\(5) & \textmode_vga_inst|console_sm_inst|column_int\(4) & \textmode_vga_inst|console_sm_inst|column_int\(3) & \textmode_vga_inst|console_sm_inst|column_int\(2) & 
\textmode_vga_inst|console_sm_inst|column_int\(1) & \textmode_vga_inst|console_sm_inst|column_int\(0));

\textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a2_PORTBADDR_bus\ <= (\textmode_vga_inst|video_memory_inst|Add1~15_combout\ & \textmode_vga_inst|video_memory_inst|Add1~10_combout\ & 
\textmode_vga_inst|video_memory_inst|Add1~5_combout\ & \textmode_vga_inst|video_memory_inst|Add1~0_combout\ & \textmode_vga_inst|video_memory_inst|ram.raddr_a[7]~0_combout\ & \textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int\(6) & 
\textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int\(5) & \textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int\(4) & \textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int\(3) & \textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int\(2) & 
\textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int\(1) & \textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int\(0));

\textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a2~portbdataout\ <= \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a2_PORTBDATAOUT_bus\(0);

\textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a3_PORTADATAIN_bus\(0) <= \~GND~combout\;

\textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a3_PORTAADDR_bus\ <= (\textmode_vga_inst|video_memory_inst|Add3~15_combout\ & \textmode_vga_inst|video_memory_inst|Add3~10_combout\ & 
\textmode_vga_inst|video_memory_inst|Add3~5_combout\ & \textmode_vga_inst|video_memory_inst|Add3~0_combout\ & \textmode_vga_inst|video_memory_inst|Add2~0_combout\ & \textmode_vga_inst|console_sm_inst|column_int\(6) & 
\textmode_vga_inst|console_sm_inst|column_int\(5) & \textmode_vga_inst|console_sm_inst|column_int\(4) & \textmode_vga_inst|console_sm_inst|column_int\(3) & \textmode_vga_inst|console_sm_inst|column_int\(2) & 
\textmode_vga_inst|console_sm_inst|column_int\(1) & \textmode_vga_inst|console_sm_inst|column_int\(0));

\textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a3_PORTBADDR_bus\ <= (\textmode_vga_inst|video_memory_inst|Add1~15_combout\ & \textmode_vga_inst|video_memory_inst|Add1~10_combout\ & 
\textmode_vga_inst|video_memory_inst|Add1~5_combout\ & \textmode_vga_inst|video_memory_inst|Add1~0_combout\ & \textmode_vga_inst|video_memory_inst|ram.raddr_a[7]~0_combout\ & \textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int\(6) & 
\textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int\(5) & \textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int\(4) & \textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int\(3) & \textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int\(2) & 
\textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int\(1) & \textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int\(0));

\textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a3~portbdataout\ <= \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a3_PORTBDATAOUT_bus\(0);

\textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a4_PORTADATAIN_bus\(0) <= \~GND~combout\;

\textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a4_PORTAADDR_bus\ <= (\textmode_vga_inst|video_memory_inst|Add3~15_combout\ & \textmode_vga_inst|video_memory_inst|Add3~10_combout\ & 
\textmode_vga_inst|video_memory_inst|Add3~5_combout\ & \textmode_vga_inst|video_memory_inst|Add3~0_combout\ & \textmode_vga_inst|video_memory_inst|Add2~0_combout\ & \textmode_vga_inst|console_sm_inst|column_int\(6) & 
\textmode_vga_inst|console_sm_inst|column_int\(5) & \textmode_vga_inst|console_sm_inst|column_int\(4) & \textmode_vga_inst|console_sm_inst|column_int\(3) & \textmode_vga_inst|console_sm_inst|column_int\(2) & 
\textmode_vga_inst|console_sm_inst|column_int\(1) & \textmode_vga_inst|console_sm_inst|column_int\(0));

\textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a4_PORTBADDR_bus\ <= (\textmode_vga_inst|video_memory_inst|Add1~15_combout\ & \textmode_vga_inst|video_memory_inst|Add1~10_combout\ & 
\textmode_vga_inst|video_memory_inst|Add1~5_combout\ & \textmode_vga_inst|video_memory_inst|Add1~0_combout\ & \textmode_vga_inst|video_memory_inst|ram.raddr_a[7]~0_combout\ & \textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int\(6) & 
\textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int\(5) & \textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int\(4) & \textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int\(3) & \textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int\(2) & 
\textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int\(1) & \textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int\(0));

\textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a4~portbdataout\ <= \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a4_PORTBDATAOUT_bus\(0);

\textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a5_PORTADATAIN_bus\(0) <= \~GND~combout\;

\textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a5_PORTAADDR_bus\ <= (\textmode_vga_inst|video_memory_inst|Add3~15_combout\ & \textmode_vga_inst|video_memory_inst|Add3~10_combout\ & 
\textmode_vga_inst|video_memory_inst|Add3~5_combout\ & \textmode_vga_inst|video_memory_inst|Add3~0_combout\ & \textmode_vga_inst|video_memory_inst|Add2~0_combout\ & \textmode_vga_inst|console_sm_inst|column_int\(6) & 
\textmode_vga_inst|console_sm_inst|column_int\(5) & \textmode_vga_inst|console_sm_inst|column_int\(4) & \textmode_vga_inst|console_sm_inst|column_int\(3) & \textmode_vga_inst|console_sm_inst|column_int\(2) & 
\textmode_vga_inst|console_sm_inst|column_int\(1) & \textmode_vga_inst|console_sm_inst|column_int\(0));

\textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a5_PORTBADDR_bus\ <= (\textmode_vga_inst|video_memory_inst|Add1~15_combout\ & \textmode_vga_inst|video_memory_inst|Add1~10_combout\ & 
\textmode_vga_inst|video_memory_inst|Add1~5_combout\ & \textmode_vga_inst|video_memory_inst|Add1~0_combout\ & \textmode_vga_inst|video_memory_inst|ram.raddr_a[7]~0_combout\ & \textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int\(6) & 
\textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int\(5) & \textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int\(4) & \textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int\(3) & \textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int\(2) & 
\textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int\(1) & \textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int\(0));

\textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a5~portbdataout\ <= \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a5_PORTBDATAOUT_bus\(0);

\textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a6_PORTADATAIN_bus\(0) <= \~GND~combout\;

\textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a6_PORTAADDR_bus\ <= (\textmode_vga_inst|video_memory_inst|Add3~15_combout\ & \textmode_vga_inst|video_memory_inst|Add3~10_combout\ & 
\textmode_vga_inst|video_memory_inst|Add3~5_combout\ & \textmode_vga_inst|video_memory_inst|Add3~0_combout\ & \textmode_vga_inst|video_memory_inst|Add2~0_combout\ & \textmode_vga_inst|console_sm_inst|column_int\(6) & 
\textmode_vga_inst|console_sm_inst|column_int\(5) & \textmode_vga_inst|console_sm_inst|column_int\(4) & \textmode_vga_inst|console_sm_inst|column_int\(3) & \textmode_vga_inst|console_sm_inst|column_int\(2) & 
\textmode_vga_inst|console_sm_inst|column_int\(1) & \textmode_vga_inst|console_sm_inst|column_int\(0));

\textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a6_PORTBADDR_bus\ <= (\textmode_vga_inst|video_memory_inst|Add1~15_combout\ & \textmode_vga_inst|video_memory_inst|Add1~10_combout\ & 
\textmode_vga_inst|video_memory_inst|Add1~5_combout\ & \textmode_vga_inst|video_memory_inst|Add1~0_combout\ & \textmode_vga_inst|video_memory_inst|ram.raddr_a[7]~0_combout\ & \textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int\(6) & 
\textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int\(5) & \textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int\(4) & \textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int\(3) & \textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int\(2) & 
\textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int\(1) & \textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int\(0));

\textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a6~portbdataout\ <= \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a6_PORTBDATAOUT_bus\(0);

\textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a7_PORTADATAIN_bus\(0) <= \~GND~combout\;

\textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a7_PORTAADDR_bus\ <= (\textmode_vga_inst|video_memory_inst|Add3~15_combout\ & \textmode_vga_inst|video_memory_inst|Add3~10_combout\ & 
\textmode_vga_inst|video_memory_inst|Add3~5_combout\ & \textmode_vga_inst|video_memory_inst|Add3~0_combout\ & \textmode_vga_inst|video_memory_inst|Add2~0_combout\ & \textmode_vga_inst|console_sm_inst|column_int\(6) & 
\textmode_vga_inst|console_sm_inst|column_int\(5) & \textmode_vga_inst|console_sm_inst|column_int\(4) & \textmode_vga_inst|console_sm_inst|column_int\(3) & \textmode_vga_inst|console_sm_inst|column_int\(2) & 
\textmode_vga_inst|console_sm_inst|column_int\(1) & \textmode_vga_inst|console_sm_inst|column_int\(0));

\textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a7_PORTBADDR_bus\ <= (\textmode_vga_inst|video_memory_inst|Add1~15_combout\ & \textmode_vga_inst|video_memory_inst|Add1~10_combout\ & 
\textmode_vga_inst|video_memory_inst|Add1~5_combout\ & \textmode_vga_inst|video_memory_inst|Add1~0_combout\ & \textmode_vga_inst|video_memory_inst|ram.raddr_a[7]~0_combout\ & \textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int\(6) & 
\textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int\(5) & \textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int\(4) & \textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int\(3) & \textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int\(2) & 
\textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int\(1) & \textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int\(0));

\textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a7~portbdataout\ <= \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a7_PORTBDATAOUT_bus\(0);

\textmode_vga_inst|font_rom_inst|Mux0_rtl_1|auto_generated|ram_block1a3_PORTAADDR_bus\ <= (\textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a7~portbdataout\ & 
\textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a6~portbdataout\ & \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a5~portbdataout\ & 
\textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a4~portbdataout\ & \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a3~portbdataout\ & 
\textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a2~portbdataout\ & \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a1~portbdataout\ & 
\textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a0~portbdataout\ & \textmode_vga_inst|textmode_vga_v_sm_inst|char_height_pixel_int\(3) & \textmode_vga_inst|textmode_vga_v_sm_inst|char_height_pixel_int\(2) & 
\textmode_vga_inst|textmode_vga_v_sm_inst|char_height_pixel_int\(1) & \textmode_vga_inst|textmode_vga_v_sm_inst|char_height_pixel_int\(0));

\textmode_vga_inst|font_rom_inst|Mux0_rtl_1|auto_generated|ram_block1a3~portadataout\ <= \textmode_vga_inst|font_rom_inst|Mux0_rtl_1|auto_generated|ram_block1a3_PORTADATAOUT_bus\(0);

\textmode_vga_inst|font_rom_inst|Mux0_rtl_1|auto_generated|ram_block1a2_PORTAADDR_bus\ <= (\textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a7~portbdataout\ & 
\textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a6~portbdataout\ & \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a5~portbdataout\ & 
\textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a4~portbdataout\ & \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a3~portbdataout\ & 
\textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a2~portbdataout\ & \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a1~portbdataout\ & 
\textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a0~portbdataout\ & \textmode_vga_inst|textmode_vga_v_sm_inst|char_height_pixel_int\(3) & \textmode_vga_inst|textmode_vga_v_sm_inst|char_height_pixel_int\(2) & 
\textmode_vga_inst|textmode_vga_v_sm_inst|char_height_pixel_int\(1) & \textmode_vga_inst|textmode_vga_v_sm_inst|char_height_pixel_int\(0));

\textmode_vga_inst|font_rom_inst|Mux0_rtl_1|auto_generated|ram_block1a2~portadataout\ <= \textmode_vga_inst|font_rom_inst|Mux0_rtl_1|auto_generated|ram_block1a2_PORTADATAOUT_bus\(0);

\textmode_vga_inst|font_rom_inst|Mux0_rtl_1|auto_generated|ram_block1a7_PORTAADDR_bus\ <= (\textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a7~portbdataout\ & 
\textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a6~portbdataout\ & \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a5~portbdataout\ & 
\textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a4~portbdataout\ & \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a3~portbdataout\ & 
\textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a2~portbdataout\ & \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a1~portbdataout\ & 
\textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a0~portbdataout\ & \textmode_vga_inst|textmode_vga_v_sm_inst|char_height_pixel_int\(3) & \textmode_vga_inst|textmode_vga_v_sm_inst|char_height_pixel_int\(2) & 
\textmode_vga_inst|textmode_vga_v_sm_inst|char_height_pixel_int\(1) & \textmode_vga_inst|textmode_vga_v_sm_inst|char_height_pixel_int\(0));

\textmode_vga_inst|font_rom_inst|Mux0_rtl_1|auto_generated|ram_block1a7~portadataout\ <= \textmode_vga_inst|font_rom_inst|Mux0_rtl_1|auto_generated|ram_block1a7_PORTADATAOUT_bus\(0);

\textmode_vga_inst|font_rom_inst|Mux0_rtl_1|auto_generated|ram_block1a5_PORTAADDR_bus\ <= (\textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a7~portbdataout\ & 
\textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a6~portbdataout\ & \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a5~portbdataout\ & 
\textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a4~portbdataout\ & \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a3~portbdataout\ & 
\textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a2~portbdataout\ & \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a1~portbdataout\ & 
\textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a0~portbdataout\ & \textmode_vga_inst|textmode_vga_v_sm_inst|char_height_pixel_int\(3) & \textmode_vga_inst|textmode_vga_v_sm_inst|char_height_pixel_int\(2) & 
\textmode_vga_inst|textmode_vga_v_sm_inst|char_height_pixel_int\(1) & \textmode_vga_inst|textmode_vga_v_sm_inst|char_height_pixel_int\(0));

\textmode_vga_inst|font_rom_inst|Mux0_rtl_1|auto_generated|ram_block1a5~portadataout\ <= \textmode_vga_inst|font_rom_inst|Mux0_rtl_1|auto_generated|ram_block1a5_PORTADATAOUT_bus\(0);

\textmode_vga_inst|font_rom_inst|Mux0_rtl_1|auto_generated|ram_block1a4_PORTAADDR_bus\ <= (\textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a7~portbdataout\ & 
\textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a6~portbdataout\ & \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a5~portbdataout\ & 
\textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a4~portbdataout\ & \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a3~portbdataout\ & 
\textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a2~portbdataout\ & \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a1~portbdataout\ & 
\textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a0~portbdataout\ & \textmode_vga_inst|textmode_vga_v_sm_inst|char_height_pixel_int\(3) & \textmode_vga_inst|textmode_vga_v_sm_inst|char_height_pixel_int\(2) & 
\textmode_vga_inst|textmode_vga_v_sm_inst|char_height_pixel_int\(1) & \textmode_vga_inst|textmode_vga_v_sm_inst|char_height_pixel_int\(0));

\textmode_vga_inst|font_rom_inst|Mux0_rtl_1|auto_generated|ram_block1a4~portadataout\ <= \textmode_vga_inst|font_rom_inst|Mux0_rtl_1|auto_generated|ram_block1a4_PORTADATAOUT_bus\(0);

\textmode_vga_inst|font_rom_inst|Mux0_rtl_1|auto_generated|ram_block1a6_PORTAADDR_bus\ <= (\textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a7~portbdataout\ & 
\textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a6~portbdataout\ & \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a5~portbdataout\ & 
\textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a4~portbdataout\ & \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a3~portbdataout\ & 
\textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a2~portbdataout\ & \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a1~portbdataout\ & 
\textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a0~portbdataout\ & \textmode_vga_inst|textmode_vga_v_sm_inst|char_height_pixel_int\(3) & \textmode_vga_inst|textmode_vga_v_sm_inst|char_height_pixel_int\(2) & 
\textmode_vga_inst|textmode_vga_v_sm_inst|char_height_pixel_int\(1) & \textmode_vga_inst|textmode_vga_v_sm_inst|char_height_pixel_int\(0));

\textmode_vga_inst|font_rom_inst|Mux0_rtl_1|auto_generated|ram_block1a6~portadataout\ <= \textmode_vga_inst|font_rom_inst|Mux0_rtl_1|auto_generated|ram_block1a6_PORTADATAOUT_bus\(0);
\textmode_vga_inst|textmode_vga_h_sm_inst|ALT_INV_textmode_vga_h_sm_state.HSYNC_FIRST~regout\ <= NOT \textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.HSYNC_FIRST~regout\;
\textmode_vga_inst|textmode_vga_h_sm_inst|ALT_INV_hsync_n~0_combout\ <= NOT \textmode_vga_inst|textmode_vga_h_sm_inst|hsync_n~0_combout\;
\textmode_vga_inst|textmode_vga_v_sm_inst|ALT_INV_WideOr6~combout\ <= NOT \textmode_vga_inst|textmode_vga_v_sm_inst|WideOr6~combout\;
\textmode_vga_inst|textmode_vga_v_sm_inst|ALT_INV_textmode_vga_v_sm_state.VDATA_NEXTCHAR~regout\ <= NOT \textmode_vga_inst|textmode_vga_v_sm_inst|textmode_vga_v_sm_state.VDATA_NEXTCHAR~regout\;
\ps2_keyboard_controller_inst|ps2_transceiver_inst|ALT_INV_ps2_data_internal~regout\ <= NOT \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_data_internal~regout\;
\ps2_keyboard_controller_inst|ps2_transceiver_inst|ALT_INV_ps2_clk_internal~regout\ <= NOT \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_internal~regout\;
\textmode_vga_inst|console_sm_inst|ALT_INV_state.STATE_SCROLL_NEXT~regout\ <= NOT \textmode_vga_inst|console_sm_inst|state.STATE_SCROLL_NEXT~regout\;
\ps2_keyboard_controller_inst|ps2_transceiver_inst|ALT_INV_ps2_transceiver_state.PREPARE_SEND_WAIT1~regout\ <= NOT \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.PREPARE_SEND_WAIT1~regout\;
\ps2_keyboard_controller_inst|ps2_transceiver_inst|ALT_INV_ps2_transceiver_state.PREPARE_SEND_WAIT2~regout\ <= NOT \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.PREPARE_SEND_WAIT2~regout\;

-- Location: PIN_E21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ps2_data~I\ : stratix_io
-- pragma translate_off
GENERIC MAP (
	ddio_mode => "none",
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "bidir",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ALT_INV_ps2_data_internal~regout\,
	oe => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_data_hz~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	padio => ps2_data,
	combout => \ps2_data~0\);

-- Location: PIN_Y26,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ps2_clk~I\ : stratix_io
-- pragma translate_off
GENERIC MAP (
	ddio_mode => "none",
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	open_drain_output => "true",
	operation_mode => "bidir",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ALT_INV_ps2_clk_internal~regout\,
	oe => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	padio => ps2_clk,
	combout => \ps2_clk~0\);

-- Location: PIN_N3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\sys_clk~I\ : stratix_io
-- pragma translate_off
GENERIC MAP (
	ddio_mode => "none",
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_sys_clk,
	combout => \sys_clk~combout\);

-- Location: LC_X28_Y25_N5
\sys_res_n_debounce_inst|fsm_inst|Selector0~2\ : stratix_lcell
-- Equation(s):
-- \sys_res_n_debounce_inst|fsm_inst|Selector0~2_combout\ = ((\sys_res_n_debounce_inst|fsm_inst|debounce_fsm_state.IDLE0~regout\) # ((!\sys_res_n_debounce_inst|fsm_inst|debounce_fsm_state.IDLE1~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "cfcf",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \sys_res_n_debounce_inst|fsm_inst|debounce_fsm_state.IDLE0~regout\,
	datac => \sys_res_n_debounce_inst|fsm_inst|debounce_fsm_state.IDLE1~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \sys_res_n_debounce_inst|fsm_inst|Selector0~2_combout\);

-- Location: LC_X28_Y27_N5
\sys_res_n_debounce_inst|counter_inst|cnt_int[3]\ : stratix_lcell
-- Equation(s):
-- \sys_res_n_debounce_inst|counter_inst|cnt_int\(3) = DFFEAS((\sys_res_n_debounce_inst|counter_inst|cnt_int\(3) $ ((\sys_res_n_debounce_inst|counter_inst|cnt_int[2]~1\))), GLOBAL(\sys_clk~combout\), VCC, , , , , 
-- \sys_res_n_debounce_inst|fsm_inst|Selector0~2_combout\, )
-- \sys_res_n_debounce_inst|counter_inst|cnt_int[3]~7\ = CARRY(((!\sys_res_n_debounce_inst|counter_inst|cnt_int[2]~1\) # (!\sys_res_n_debounce_inst|counter_inst|cnt_int\(3))))
-- \sys_res_n_debounce_inst|counter_inst|cnt_int[3]~7COUT1_50\ = CARRY(((!\sys_res_n_debounce_inst|counter_inst|cnt_int[2]~1\) # (!\sys_res_n_debounce_inst|counter_inst|cnt_int\(3))))

-- pragma translate_off
GENERIC MAP (
	cin_used => "true",
	lut_mask => "3c3f",
	operation_mode => "arithmetic",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~combout\,
	datab => \sys_res_n_debounce_inst|counter_inst|cnt_int\(3),
	aclr => GND,
	sclr => \sys_res_n_debounce_inst|fsm_inst|Selector0~2_combout\,
	cin => \sys_res_n_debounce_inst|counter_inst|cnt_int[2]~1\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \sys_res_n_debounce_inst|counter_inst|cnt_int\(3),
	cout0 => \sys_res_n_debounce_inst|counter_inst|cnt_int[3]~7\,
	cout1 => \sys_res_n_debounce_inst|counter_inst|cnt_int[3]~7COUT1_50\);

-- Location: LC_X28_Y27_N6
\sys_res_n_debounce_inst|counter_inst|cnt_int[4]\ : stratix_lcell
-- Equation(s):
-- \sys_res_n_debounce_inst|counter_inst|cnt_int\(4) = DFFEAS((\sys_res_n_debounce_inst|counter_inst|cnt_int\(4) $ ((!(!\sys_res_n_debounce_inst|counter_inst|cnt_int[2]~1\ & \sys_res_n_debounce_inst|counter_inst|cnt_int[3]~7\) # 
-- (\sys_res_n_debounce_inst|counter_inst|cnt_int[2]~1\ & \sys_res_n_debounce_inst|counter_inst|cnt_int[3]~7COUT1_50\)))), GLOBAL(\sys_clk~combout\), VCC, , , , , \sys_res_n_debounce_inst|fsm_inst|Selector0~2_combout\, )
-- \sys_res_n_debounce_inst|counter_inst|cnt_int[4]~25\ = CARRY(((\sys_res_n_debounce_inst|counter_inst|cnt_int\(4) & !\sys_res_n_debounce_inst|counter_inst|cnt_int[3]~7\)))
-- \sys_res_n_debounce_inst|counter_inst|cnt_int[4]~25COUT1_52\ = CARRY(((\sys_res_n_debounce_inst|counter_inst|cnt_int\(4) & !\sys_res_n_debounce_inst|counter_inst|cnt_int[3]~7COUT1_50\)))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	cin_used => "true",
	lut_mask => "c30c",
	operation_mode => "arithmetic",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~combout\,
	datab => \sys_res_n_debounce_inst|counter_inst|cnt_int\(4),
	aclr => GND,
	sclr => \sys_res_n_debounce_inst|fsm_inst|Selector0~2_combout\,
	cin => \sys_res_n_debounce_inst|counter_inst|cnt_int[2]~1\,
	cin0 => \sys_res_n_debounce_inst|counter_inst|cnt_int[3]~7\,
	cin1 => \sys_res_n_debounce_inst|counter_inst|cnt_int[3]~7COUT1_50\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \sys_res_n_debounce_inst|counter_inst|cnt_int\(4),
	cout0 => \sys_res_n_debounce_inst|counter_inst|cnt_int[4]~25\,
	cout1 => \sys_res_n_debounce_inst|counter_inst|cnt_int[4]~25COUT1_52\);

-- Location: LC_X28_Y27_N7
\sys_res_n_debounce_inst|counter_inst|cnt_int[5]\ : stratix_lcell
-- Equation(s):
-- \sys_res_n_debounce_inst|counter_inst|cnt_int\(5) = DFFEAS(\sys_res_n_debounce_inst|counter_inst|cnt_int\(5) $ (((((!\sys_res_n_debounce_inst|counter_inst|cnt_int[2]~1\ & \sys_res_n_debounce_inst|counter_inst|cnt_int[4]~25\) # 
-- (\sys_res_n_debounce_inst|counter_inst|cnt_int[2]~1\ & \sys_res_n_debounce_inst|counter_inst|cnt_int[4]~25COUT1_52\))))), GLOBAL(\sys_clk~combout\), VCC, , , , , \sys_res_n_debounce_inst|fsm_inst|Selector0~2_combout\, )
-- \sys_res_n_debounce_inst|counter_inst|cnt_int[5]~27\ = CARRY(((!\sys_res_n_debounce_inst|counter_inst|cnt_int[4]~25\)) # (!\sys_res_n_debounce_inst|counter_inst|cnt_int\(5)))
-- \sys_res_n_debounce_inst|counter_inst|cnt_int[5]~27COUT1_54\ = CARRY(((!\sys_res_n_debounce_inst|counter_inst|cnt_int[4]~25COUT1_52\)) # (!\sys_res_n_debounce_inst|counter_inst|cnt_int\(5)))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	cin_used => "true",
	lut_mask => "5a5f",
	operation_mode => "arithmetic",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~combout\,
	dataa => \sys_res_n_debounce_inst|counter_inst|cnt_int\(5),
	aclr => GND,
	sclr => \sys_res_n_debounce_inst|fsm_inst|Selector0~2_combout\,
	cin => \sys_res_n_debounce_inst|counter_inst|cnt_int[2]~1\,
	cin0 => \sys_res_n_debounce_inst|counter_inst|cnt_int[4]~25\,
	cin1 => \sys_res_n_debounce_inst|counter_inst|cnt_int[4]~25COUT1_52\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \sys_res_n_debounce_inst|counter_inst|cnt_int\(5),
	cout0 => \sys_res_n_debounce_inst|counter_inst|cnt_int[5]~27\,
	cout1 => \sys_res_n_debounce_inst|counter_inst|cnt_int[5]~27COUT1_54\);

-- Location: LC_X28_Y27_N8
\sys_res_n_debounce_inst|counter_inst|cnt_int[6]\ : stratix_lcell
-- Equation(s):
-- \sys_res_n_debounce_inst|counter_inst|cnt_int\(6) = DFFEAS(\sys_res_n_debounce_inst|counter_inst|cnt_int\(6) $ ((((!(!\sys_res_n_debounce_inst|counter_inst|cnt_int[2]~1\ & \sys_res_n_debounce_inst|counter_inst|cnt_int[5]~27\) # 
-- (\sys_res_n_debounce_inst|counter_inst|cnt_int[2]~1\ & \sys_res_n_debounce_inst|counter_inst|cnt_int[5]~27COUT1_54\))))), GLOBAL(\sys_clk~combout\), VCC, , , , , \sys_res_n_debounce_inst|fsm_inst|Selector0~2_combout\, )
-- \sys_res_n_debounce_inst|counter_inst|cnt_int[6]~19\ = CARRY((\sys_res_n_debounce_inst|counter_inst|cnt_int\(6) & ((!\sys_res_n_debounce_inst|counter_inst|cnt_int[5]~27\))))
-- \sys_res_n_debounce_inst|counter_inst|cnt_int[6]~19COUT1_56\ = CARRY((\sys_res_n_debounce_inst|counter_inst|cnt_int\(6) & ((!\sys_res_n_debounce_inst|counter_inst|cnt_int[5]~27COUT1_54\))))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	cin_used => "true",
	lut_mask => "a50a",
	operation_mode => "arithmetic",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~combout\,
	dataa => \sys_res_n_debounce_inst|counter_inst|cnt_int\(6),
	aclr => GND,
	sclr => \sys_res_n_debounce_inst|fsm_inst|Selector0~2_combout\,
	cin => \sys_res_n_debounce_inst|counter_inst|cnt_int[2]~1\,
	cin0 => \sys_res_n_debounce_inst|counter_inst|cnt_int[5]~27\,
	cin1 => \sys_res_n_debounce_inst|counter_inst|cnt_int[5]~27COUT1_54\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \sys_res_n_debounce_inst|counter_inst|cnt_int\(6),
	cout0 => \sys_res_n_debounce_inst|counter_inst|cnt_int[6]~19\,
	cout1 => \sys_res_n_debounce_inst|counter_inst|cnt_int[6]~19COUT1_56\);

-- Location: LC_X28_Y27_N9
\sys_res_n_debounce_inst|counter_inst|cnt_int[7]\ : stratix_lcell
-- Equation(s):
-- \sys_res_n_debounce_inst|counter_inst|cnt_int\(7) = DFFEAS((\sys_res_n_debounce_inst|counter_inst|cnt_int\(7) $ (((!\sys_res_n_debounce_inst|counter_inst|cnt_int[2]~1\ & \sys_res_n_debounce_inst|counter_inst|cnt_int[6]~19\) # 
-- (\sys_res_n_debounce_inst|counter_inst|cnt_int[2]~1\ & \sys_res_n_debounce_inst|counter_inst|cnt_int[6]~19COUT1_56\)))), GLOBAL(\sys_clk~combout\), VCC, , , , , \sys_res_n_debounce_inst|fsm_inst|Selector0~2_combout\, )
-- \sys_res_n_debounce_inst|counter_inst|cnt_int[7]~21\ = CARRY(((!\sys_res_n_debounce_inst|counter_inst|cnt_int[6]~19COUT1_56\) # (!\sys_res_n_debounce_inst|counter_inst|cnt_int\(7))))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	cin_used => "true",
	lut_mask => "3c3f",
	operation_mode => "arithmetic",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~combout\,
	datab => \sys_res_n_debounce_inst|counter_inst|cnt_int\(7),
	aclr => GND,
	sclr => \sys_res_n_debounce_inst|fsm_inst|Selector0~2_combout\,
	cin => \sys_res_n_debounce_inst|counter_inst|cnt_int[2]~1\,
	cin0 => \sys_res_n_debounce_inst|counter_inst|cnt_int[6]~19\,
	cin1 => \sys_res_n_debounce_inst|counter_inst|cnt_int[6]~19COUT1_56\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \sys_res_n_debounce_inst|counter_inst|cnt_int\(7),
	cout => \sys_res_n_debounce_inst|counter_inst|cnt_int[7]~21\);

-- Location: LC_X28_Y26_N0
\sys_res_n_debounce_inst|counter_inst|cnt_int[8]\ : stratix_lcell
-- Equation(s):
-- \sys_res_n_debounce_inst|counter_inst|cnt_int\(8) = DFFEAS((\sys_res_n_debounce_inst|counter_inst|cnt_int\(8) $ ((!\sys_res_n_debounce_inst|counter_inst|cnt_int[7]~21\))), GLOBAL(\sys_clk~combout\), VCC, , , , , 
-- \sys_res_n_debounce_inst|fsm_inst|Selector0~2_combout\, )
-- \sys_res_n_debounce_inst|counter_inst|cnt_int[8]~23\ = CARRY(((\sys_res_n_debounce_inst|counter_inst|cnt_int\(8) & !\sys_res_n_debounce_inst|counter_inst|cnt_int[7]~21\)))
-- \sys_res_n_debounce_inst|counter_inst|cnt_int[8]~23COUT1_58\ = CARRY(((\sys_res_n_debounce_inst|counter_inst|cnt_int\(8) & !\sys_res_n_debounce_inst|counter_inst|cnt_int[7]~21\)))

-- pragma translate_off
GENERIC MAP (
	cin_used => "true",
	lut_mask => "c30c",
	operation_mode => "arithmetic",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~combout\,
	datab => \sys_res_n_debounce_inst|counter_inst|cnt_int\(8),
	aclr => GND,
	sclr => \sys_res_n_debounce_inst|fsm_inst|Selector0~2_combout\,
	cin => \sys_res_n_debounce_inst|counter_inst|cnt_int[7]~21\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \sys_res_n_debounce_inst|counter_inst|cnt_int\(8),
	cout0 => \sys_res_n_debounce_inst|counter_inst|cnt_int[8]~23\,
	cout1 => \sys_res_n_debounce_inst|counter_inst|cnt_int[8]~23COUT1_58\);

-- Location: LC_X28_Y26_N1
\sys_res_n_debounce_inst|counter_inst|cnt_int[9]\ : stratix_lcell
-- Equation(s):
-- \sys_res_n_debounce_inst|counter_inst|cnt_int\(9) = DFFEAS((\sys_res_n_debounce_inst|counter_inst|cnt_int\(9) $ (((!\sys_res_n_debounce_inst|counter_inst|cnt_int[7]~21\ & \sys_res_n_debounce_inst|counter_inst|cnt_int[8]~23\) # 
-- (\sys_res_n_debounce_inst|counter_inst|cnt_int[7]~21\ & \sys_res_n_debounce_inst|counter_inst|cnt_int[8]~23COUT1_58\)))), GLOBAL(\sys_clk~combout\), VCC, , , , , \sys_res_n_debounce_inst|fsm_inst|Selector0~2_combout\, )
-- \sys_res_n_debounce_inst|counter_inst|cnt_int[9]~3\ = CARRY(((!\sys_res_n_debounce_inst|counter_inst|cnt_int[8]~23\) # (!\sys_res_n_debounce_inst|counter_inst|cnt_int\(9))))
-- \sys_res_n_debounce_inst|counter_inst|cnt_int[9]~3COUT1_60\ = CARRY(((!\sys_res_n_debounce_inst|counter_inst|cnt_int[8]~23COUT1_58\) # (!\sys_res_n_debounce_inst|counter_inst|cnt_int\(9))))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	cin_used => "true",
	lut_mask => "3c3f",
	operation_mode => "arithmetic",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~combout\,
	datab => \sys_res_n_debounce_inst|counter_inst|cnt_int\(9),
	aclr => GND,
	sclr => \sys_res_n_debounce_inst|fsm_inst|Selector0~2_combout\,
	cin => \sys_res_n_debounce_inst|counter_inst|cnt_int[7]~21\,
	cin0 => \sys_res_n_debounce_inst|counter_inst|cnt_int[8]~23\,
	cin1 => \sys_res_n_debounce_inst|counter_inst|cnt_int[8]~23COUT1_58\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \sys_res_n_debounce_inst|counter_inst|cnt_int\(9),
	cout0 => \sys_res_n_debounce_inst|counter_inst|cnt_int[9]~3\,
	cout1 => \sys_res_n_debounce_inst|counter_inst|cnt_int[9]~3COUT1_60\);

-- Location: LC_X28_Y26_N2
\sys_res_n_debounce_inst|counter_inst|cnt_int[10]\ : stratix_lcell
-- Equation(s):
-- \sys_res_n_debounce_inst|counter_inst|cnt_int\(10) = DFFEAS(\sys_res_n_debounce_inst|counter_inst|cnt_int\(10) $ ((((!(!\sys_res_n_debounce_inst|counter_inst|cnt_int[7]~21\ & \sys_res_n_debounce_inst|counter_inst|cnt_int[9]~3\) # 
-- (\sys_res_n_debounce_inst|counter_inst|cnt_int[7]~21\ & \sys_res_n_debounce_inst|counter_inst|cnt_int[9]~3COUT1_60\))))), GLOBAL(\sys_clk~combout\), VCC, , , , , \sys_res_n_debounce_inst|fsm_inst|Selector0~2_combout\, )
-- \sys_res_n_debounce_inst|counter_inst|cnt_int[10]~9\ = CARRY((\sys_res_n_debounce_inst|counter_inst|cnt_int\(10) & ((!\sys_res_n_debounce_inst|counter_inst|cnt_int[9]~3\))))
-- \sys_res_n_debounce_inst|counter_inst|cnt_int[10]~9COUT1_62\ = CARRY((\sys_res_n_debounce_inst|counter_inst|cnt_int\(10) & ((!\sys_res_n_debounce_inst|counter_inst|cnt_int[9]~3COUT1_60\))))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	cin_used => "true",
	lut_mask => "a50a",
	operation_mode => "arithmetic",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~combout\,
	dataa => \sys_res_n_debounce_inst|counter_inst|cnt_int\(10),
	aclr => GND,
	sclr => \sys_res_n_debounce_inst|fsm_inst|Selector0~2_combout\,
	cin => \sys_res_n_debounce_inst|counter_inst|cnt_int[7]~21\,
	cin0 => \sys_res_n_debounce_inst|counter_inst|cnt_int[9]~3\,
	cin1 => \sys_res_n_debounce_inst|counter_inst|cnt_int[9]~3COUT1_60\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \sys_res_n_debounce_inst|counter_inst|cnt_int\(10),
	cout0 => \sys_res_n_debounce_inst|counter_inst|cnt_int[10]~9\,
	cout1 => \sys_res_n_debounce_inst|counter_inst|cnt_int[10]~9COUT1_62\);

-- Location: LC_X28_Y26_N3
\sys_res_n_debounce_inst|counter_inst|cnt_int[11]\ : stratix_lcell
-- Equation(s):
-- \sys_res_n_debounce_inst|counter_inst|cnt_int\(11) = DFFEAS(\sys_res_n_debounce_inst|counter_inst|cnt_int\(11) $ (((((!\sys_res_n_debounce_inst|counter_inst|cnt_int[7]~21\ & \sys_res_n_debounce_inst|counter_inst|cnt_int[10]~9\) # 
-- (\sys_res_n_debounce_inst|counter_inst|cnt_int[7]~21\ & \sys_res_n_debounce_inst|counter_inst|cnt_int[10]~9COUT1_62\))))), GLOBAL(\sys_clk~combout\), VCC, , , , , \sys_res_n_debounce_inst|fsm_inst|Selector0~2_combout\, )
-- \sys_res_n_debounce_inst|counter_inst|cnt_int[11]~11\ = CARRY(((!\sys_res_n_debounce_inst|counter_inst|cnt_int[10]~9\)) # (!\sys_res_n_debounce_inst|counter_inst|cnt_int\(11)))
-- \sys_res_n_debounce_inst|counter_inst|cnt_int[11]~11COUT1_64\ = CARRY(((!\sys_res_n_debounce_inst|counter_inst|cnt_int[10]~9COUT1_62\)) # (!\sys_res_n_debounce_inst|counter_inst|cnt_int\(11)))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	cin_used => "true",
	lut_mask => "5a5f",
	operation_mode => "arithmetic",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~combout\,
	dataa => \sys_res_n_debounce_inst|counter_inst|cnt_int\(11),
	aclr => GND,
	sclr => \sys_res_n_debounce_inst|fsm_inst|Selector0~2_combout\,
	cin => \sys_res_n_debounce_inst|counter_inst|cnt_int[7]~21\,
	cin0 => \sys_res_n_debounce_inst|counter_inst|cnt_int[10]~9\,
	cin1 => \sys_res_n_debounce_inst|counter_inst|cnt_int[10]~9COUT1_62\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \sys_res_n_debounce_inst|counter_inst|cnt_int\(11),
	cout0 => \sys_res_n_debounce_inst|counter_inst|cnt_int[11]~11\,
	cout1 => \sys_res_n_debounce_inst|counter_inst|cnt_int[11]~11COUT1_64\);

-- Location: LC_X28_Y26_N4
\sys_res_n_debounce_inst|counter_inst|cnt_int[12]\ : stratix_lcell
-- Equation(s):
-- \sys_res_n_debounce_inst|counter_inst|cnt_int\(12) = DFFEAS(\sys_res_n_debounce_inst|counter_inst|cnt_int\(12) $ ((((!(!\sys_res_n_debounce_inst|counter_inst|cnt_int[7]~21\ & \sys_res_n_debounce_inst|counter_inst|cnt_int[11]~11\) # 
-- (\sys_res_n_debounce_inst|counter_inst|cnt_int[7]~21\ & \sys_res_n_debounce_inst|counter_inst|cnt_int[11]~11COUT1_64\))))), GLOBAL(\sys_clk~combout\), VCC, , , , , \sys_res_n_debounce_inst|fsm_inst|Selector0~2_combout\, )
-- \sys_res_n_debounce_inst|counter_inst|cnt_int[12]~15\ = CARRY((\sys_res_n_debounce_inst|counter_inst|cnt_int\(12) & ((!\sys_res_n_debounce_inst|counter_inst|cnt_int[11]~11COUT1_64\))))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	cin_used => "true",
	lut_mask => "a50a",
	operation_mode => "arithmetic",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~combout\,
	dataa => \sys_res_n_debounce_inst|counter_inst|cnt_int\(12),
	aclr => GND,
	sclr => \sys_res_n_debounce_inst|fsm_inst|Selector0~2_combout\,
	cin => \sys_res_n_debounce_inst|counter_inst|cnt_int[7]~21\,
	cin0 => \sys_res_n_debounce_inst|counter_inst|cnt_int[11]~11\,
	cin1 => \sys_res_n_debounce_inst|counter_inst|cnt_int[11]~11COUT1_64\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \sys_res_n_debounce_inst|counter_inst|cnt_int\(12),
	cout => \sys_res_n_debounce_inst|counter_inst|cnt_int[12]~15\);

-- Location: LC_X28_Y26_N5
\sys_res_n_debounce_inst|counter_inst|cnt_int[13]\ : stratix_lcell
-- Equation(s):
-- \sys_res_n_debounce_inst|counter_inst|cnt_int\(13) = DFFEAS((\sys_res_n_debounce_inst|counter_inst|cnt_int\(13) $ ((\sys_res_n_debounce_inst|counter_inst|cnt_int[12]~15\))), GLOBAL(\sys_clk~combout\), VCC, , , , , 
-- \sys_res_n_debounce_inst|fsm_inst|Selector0~2_combout\, )
-- \sys_res_n_debounce_inst|counter_inst|cnt_int[13]~17\ = CARRY(((!\sys_res_n_debounce_inst|counter_inst|cnt_int[12]~15\) # (!\sys_res_n_debounce_inst|counter_inst|cnt_int\(13))))
-- \sys_res_n_debounce_inst|counter_inst|cnt_int[13]~17COUT1_66\ = CARRY(((!\sys_res_n_debounce_inst|counter_inst|cnt_int[12]~15\) # (!\sys_res_n_debounce_inst|counter_inst|cnt_int\(13))))

-- pragma translate_off
GENERIC MAP (
	cin_used => "true",
	lut_mask => "3c3f",
	operation_mode => "arithmetic",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~combout\,
	datab => \sys_res_n_debounce_inst|counter_inst|cnt_int\(13),
	aclr => GND,
	sclr => \sys_res_n_debounce_inst|fsm_inst|Selector0~2_combout\,
	cin => \sys_res_n_debounce_inst|counter_inst|cnt_int[12]~15\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \sys_res_n_debounce_inst|counter_inst|cnt_int\(13),
	cout0 => \sys_res_n_debounce_inst|counter_inst|cnt_int[13]~17\,
	cout1 => \sys_res_n_debounce_inst|counter_inst|cnt_int[13]~17COUT1_66\);

-- Location: LC_X28_Y26_N6
\sys_res_n_debounce_inst|counter_inst|cnt_int[14]\ : stratix_lcell
-- Equation(s):
-- \sys_res_n_debounce_inst|counter_inst|cnt_int\(14) = DFFEAS((\sys_res_n_debounce_inst|counter_inst|cnt_int\(14) $ ((!(!\sys_res_n_debounce_inst|counter_inst|cnt_int[12]~15\ & \sys_res_n_debounce_inst|counter_inst|cnt_int[13]~17\) # 
-- (\sys_res_n_debounce_inst|counter_inst|cnt_int[12]~15\ & \sys_res_n_debounce_inst|counter_inst|cnt_int[13]~17COUT1_66\)))), GLOBAL(\sys_clk~combout\), VCC, , , , , \sys_res_n_debounce_inst|fsm_inst|Selector0~2_combout\, )
-- \sys_res_n_debounce_inst|counter_inst|cnt_int[14]~13\ = CARRY(((\sys_res_n_debounce_inst|counter_inst|cnt_int\(14) & !\sys_res_n_debounce_inst|counter_inst|cnt_int[13]~17\)))
-- \sys_res_n_debounce_inst|counter_inst|cnt_int[14]~13COUT1_68\ = CARRY(((\sys_res_n_debounce_inst|counter_inst|cnt_int\(14) & !\sys_res_n_debounce_inst|counter_inst|cnt_int[13]~17COUT1_66\)))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	cin_used => "true",
	lut_mask => "c30c",
	operation_mode => "arithmetic",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~combout\,
	datab => \sys_res_n_debounce_inst|counter_inst|cnt_int\(14),
	aclr => GND,
	sclr => \sys_res_n_debounce_inst|fsm_inst|Selector0~2_combout\,
	cin => \sys_res_n_debounce_inst|counter_inst|cnt_int[12]~15\,
	cin0 => \sys_res_n_debounce_inst|counter_inst|cnt_int[13]~17\,
	cin1 => \sys_res_n_debounce_inst|counter_inst|cnt_int[13]~17COUT1_66\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \sys_res_n_debounce_inst|counter_inst|cnt_int\(14),
	cout0 => \sys_res_n_debounce_inst|counter_inst|cnt_int[14]~13\,
	cout1 => \sys_res_n_debounce_inst|counter_inst|cnt_int[14]~13COUT1_68\);

-- Location: LC_X28_Y26_N7
\sys_res_n_debounce_inst|counter_inst|cnt_int[15]\ : stratix_lcell
-- Equation(s):
-- \sys_res_n_debounce_inst|counter_inst|cnt_int\(15) = DFFEAS(\sys_res_n_debounce_inst|counter_inst|cnt_int\(15) $ (((((!\sys_res_n_debounce_inst|counter_inst|cnt_int[12]~15\ & \sys_res_n_debounce_inst|counter_inst|cnt_int[14]~13\) # 
-- (\sys_res_n_debounce_inst|counter_inst|cnt_int[12]~15\ & \sys_res_n_debounce_inst|counter_inst|cnt_int[14]~13COUT1_68\))))), GLOBAL(\sys_clk~combout\), VCC, , , , , \sys_res_n_debounce_inst|fsm_inst|Selector0~2_combout\, )

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	cin_used => "true",
	lut_mask => "5a5a",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~combout\,
	dataa => \sys_res_n_debounce_inst|counter_inst|cnt_int\(15),
	aclr => GND,
	sclr => \sys_res_n_debounce_inst|fsm_inst|Selector0~2_combout\,
	cin => \sys_res_n_debounce_inst|counter_inst|cnt_int[12]~15\,
	cin0 => \sys_res_n_debounce_inst|counter_inst|cnt_int[14]~13\,
	cin1 => \sys_res_n_debounce_inst|counter_inst|cnt_int[14]~13COUT1_68\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \sys_res_n_debounce_inst|counter_inst|cnt_int\(15));

-- Location: LC_X28_Y27_N1
\sys_res_n_debounce_inst|counter_inst|LessThan0~0\ : stratix_lcell
-- Equation(s):
-- \sys_res_n_debounce_inst|counter_inst|LessThan0~0_combout\ = (!\sys_res_n_debounce_inst|counter_inst|cnt_int\(3) & (((!\sys_res_n_debounce_inst|counter_inst|cnt_int\(0) & !\sys_res_n_debounce_inst|counter_inst|cnt_int\(1))) # 
-- (!\sys_res_n_debounce_inst|counter_inst|cnt_int\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0133",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \sys_res_n_debounce_inst|counter_inst|cnt_int\(0),
	datab => \sys_res_n_debounce_inst|counter_inst|cnt_int\(3),
	datac => \sys_res_n_debounce_inst|counter_inst|cnt_int\(1),
	datad => \sys_res_n_debounce_inst|counter_inst|cnt_int\(2),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \sys_res_n_debounce_inst|counter_inst|LessThan0~0_combout\);

-- Location: LC_X28_Y25_N6
\sys_res_n_debounce_inst|counter_inst|LessThan0~1\ : stratix_lcell
-- Equation(s):
-- \sys_res_n_debounce_inst|counter_inst|LessThan0~1_combout\ = (\sys_res_n_debounce_inst|counter_inst|cnt_int\(7)) # (((\sys_res_n_debounce_inst|counter_inst|cnt_int\(8)) # (\sys_res_n_debounce_inst|counter_inst|cnt_int\(6))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "fffa",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \sys_res_n_debounce_inst|counter_inst|cnt_int\(7),
	datac => \sys_res_n_debounce_inst|counter_inst|cnt_int\(8),
	datad => \sys_res_n_debounce_inst|counter_inst|cnt_int\(6),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \sys_res_n_debounce_inst|counter_inst|LessThan0~1_combout\);

-- Location: LC_X28_Y25_N1
\sys_res_n_debounce_inst|counter_inst|LessThan0~2\ : stratix_lcell
-- Equation(s):
-- \sys_res_n_debounce_inst|counter_inst|LessThan0~2_combout\ = (\sys_res_n_debounce_inst|counter_inst|LessThan0~1_combout\) # ((\sys_res_n_debounce_inst|counter_inst|cnt_int\(4) & (!\sys_res_n_debounce_inst|counter_inst|LessThan0~0_combout\ & 
-- \sys_res_n_debounce_inst|counter_inst|cnt_int\(5))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "ff20",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \sys_res_n_debounce_inst|counter_inst|cnt_int\(4),
	datab => \sys_res_n_debounce_inst|counter_inst|LessThan0~0_combout\,
	datac => \sys_res_n_debounce_inst|counter_inst|cnt_int\(5),
	datad => \sys_res_n_debounce_inst|counter_inst|LessThan0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \sys_res_n_debounce_inst|counter_inst|LessThan0~2_combout\);

-- Location: LC_X28_Y26_N9
\sys_res_n_debounce_inst|fsm_inst|Equal0~1\ : stratix_lcell
-- Equation(s):
-- \sys_res_n_debounce_inst|fsm_inst|Equal0~1_combout\ = (((!\sys_res_n_debounce_inst|counter_inst|cnt_int\(11) & !\sys_res_n_debounce_inst|counter_inst|cnt_int\(10))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "000f",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datac => \sys_res_n_debounce_inst|counter_inst|cnt_int\(11),
	datad => \sys_res_n_debounce_inst|counter_inst|cnt_int\(10),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \sys_res_n_debounce_inst|fsm_inst|Equal0~1_combout\);

-- Location: LC_X28_Y26_N8
\sys_res_n_debounce_inst|fsm_inst|Equal0~2\ : stratix_lcell
-- Equation(s):
-- \sys_res_n_debounce_inst|fsm_inst|Equal0~2_combout\ = (!\sys_res_n_debounce_inst|counter_inst|cnt_int\(12) & (\sys_res_n_debounce_inst|fsm_inst|Equal0~1_combout\ & (!\sys_res_n_debounce_inst|counter_inst|cnt_int\(13) & 
-- !\sys_res_n_debounce_inst|counter_inst|cnt_int\(14))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0004",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \sys_res_n_debounce_inst|counter_inst|cnt_int\(12),
	datab => \sys_res_n_debounce_inst|fsm_inst|Equal0~1_combout\,
	datac => \sys_res_n_debounce_inst|counter_inst|cnt_int\(13),
	datad => \sys_res_n_debounce_inst|counter_inst|cnt_int\(14),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \sys_res_n_debounce_inst|fsm_inst|Equal0~2_combout\);

-- Location: LC_X28_Y25_N2
\sys_res_n_debounce_inst|counter_inst|LessThan0~3\ : stratix_lcell
-- Equation(s):
-- \sys_res_n_debounce_inst|counter_inst|LessThan0~3_combout\ = ((\sys_res_n_debounce_inst|fsm_inst|Equal0~2_combout\ & ((!\sys_res_n_debounce_inst|counter_inst|cnt_int\(9)) # (!\sys_res_n_debounce_inst|counter_inst|LessThan0~2_combout\)))) # 
-- (!\sys_res_n_debounce_inst|counter_inst|cnt_int\(15))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "75f5",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \sys_res_n_debounce_inst|counter_inst|cnt_int\(15),
	datab => \sys_res_n_debounce_inst|counter_inst|LessThan0~2_combout\,
	datac => \sys_res_n_debounce_inst|fsm_inst|Equal0~2_combout\,
	datad => \sys_res_n_debounce_inst|counter_inst|cnt_int\(9),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \sys_res_n_debounce_inst|counter_inst|LessThan0~3_combout\);

-- Location: LC_X28_Y27_N2
\sys_res_n_debounce_inst|counter_inst|cnt_int[0]\ : stratix_lcell
-- Equation(s):
-- \sys_res_n_debounce_inst|counter_inst|cnt_int\(0) = DFFEAS(\sys_res_n_debounce_inst|counter_inst|cnt_int\(0) $ ((\sys_res_n_debounce_inst|counter_inst|LessThan0~3_combout\)), GLOBAL(\sys_clk~combout\), VCC, , , , , 
-- \sys_res_n_debounce_inst|fsm_inst|Selector0~2_combout\, )
-- \sys_res_n_debounce_inst|counter_inst|cnt_int[0]~29\ = CARRY((\sys_res_n_debounce_inst|counter_inst|cnt_int\(0) & (\sys_res_n_debounce_inst|counter_inst|LessThan0~3_combout\)))
-- \sys_res_n_debounce_inst|counter_inst|cnt_int[0]~29COUT1_46\ = CARRY((\sys_res_n_debounce_inst|counter_inst|cnt_int\(0) & (\sys_res_n_debounce_inst|counter_inst|LessThan0~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "6688",
	operation_mode => "arithmetic",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~combout\,
	dataa => \sys_res_n_debounce_inst|counter_inst|cnt_int\(0),
	datab => \sys_res_n_debounce_inst|counter_inst|LessThan0~3_combout\,
	aclr => GND,
	sclr => \sys_res_n_debounce_inst|fsm_inst|Selector0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \sys_res_n_debounce_inst|counter_inst|cnt_int\(0),
	cout0 => \sys_res_n_debounce_inst|counter_inst|cnt_int[0]~29\,
	cout1 => \sys_res_n_debounce_inst|counter_inst|cnt_int[0]~29COUT1_46\);

-- Location: LC_X28_Y27_N3
\sys_res_n_debounce_inst|counter_inst|cnt_int[1]\ : stratix_lcell
-- Equation(s):
-- \sys_res_n_debounce_inst|counter_inst|cnt_int\(1) = DFFEAS(\sys_res_n_debounce_inst|counter_inst|cnt_int\(1) $ ((((\sys_res_n_debounce_inst|counter_inst|cnt_int[0]~29\)))), GLOBAL(\sys_clk~combout\), VCC, , , , , 
-- \sys_res_n_debounce_inst|fsm_inst|Selector0~2_combout\, )
-- \sys_res_n_debounce_inst|counter_inst|cnt_int[1]~31\ = CARRY(((!\sys_res_n_debounce_inst|counter_inst|cnt_int[0]~29\)) # (!\sys_res_n_debounce_inst|counter_inst|cnt_int\(1)))
-- \sys_res_n_debounce_inst|counter_inst|cnt_int[1]~31COUT1_48\ = CARRY(((!\sys_res_n_debounce_inst|counter_inst|cnt_int[0]~29COUT1_46\)) # (!\sys_res_n_debounce_inst|counter_inst|cnt_int\(1)))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	lut_mask => "5a5f",
	operation_mode => "arithmetic",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~combout\,
	dataa => \sys_res_n_debounce_inst|counter_inst|cnt_int\(1),
	aclr => GND,
	sclr => \sys_res_n_debounce_inst|fsm_inst|Selector0~2_combout\,
	cin0 => \sys_res_n_debounce_inst|counter_inst|cnt_int[0]~29\,
	cin1 => \sys_res_n_debounce_inst|counter_inst|cnt_int[0]~29COUT1_46\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \sys_res_n_debounce_inst|counter_inst|cnt_int\(1),
	cout0 => \sys_res_n_debounce_inst|counter_inst|cnt_int[1]~31\,
	cout1 => \sys_res_n_debounce_inst|counter_inst|cnt_int[1]~31COUT1_48\);

-- Location: LC_X28_Y27_N4
\sys_res_n_debounce_inst|counter_inst|cnt_int[2]\ : stratix_lcell
-- Equation(s):
-- \sys_res_n_debounce_inst|counter_inst|cnt_int\(2) = DFFEAS(\sys_res_n_debounce_inst|counter_inst|cnt_int\(2) $ ((((!\sys_res_n_debounce_inst|counter_inst|cnt_int[1]~31\)))), GLOBAL(\sys_clk~combout\), VCC, , , , , 
-- \sys_res_n_debounce_inst|fsm_inst|Selector0~2_combout\, )
-- \sys_res_n_debounce_inst|counter_inst|cnt_int[2]~1\ = CARRY((\sys_res_n_debounce_inst|counter_inst|cnt_int\(2) & ((!\sys_res_n_debounce_inst|counter_inst|cnt_int[1]~31COUT1_48\))))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	lut_mask => "a50a",
	operation_mode => "arithmetic",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~combout\,
	dataa => \sys_res_n_debounce_inst|counter_inst|cnt_int\(2),
	aclr => GND,
	sclr => \sys_res_n_debounce_inst|fsm_inst|Selector0~2_combout\,
	cin0 => \sys_res_n_debounce_inst|counter_inst|cnt_int[1]~31\,
	cin1 => \sys_res_n_debounce_inst|counter_inst|cnt_int[1]~31COUT1_48\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \sys_res_n_debounce_inst|counter_inst|cnt_int\(2),
	cout => \sys_res_n_debounce_inst|counter_inst|cnt_int[2]~1\);

-- Location: LC_X28_Y25_N8
\sys_res_n_debounce_inst|fsm_inst|Equal0~3\ : stratix_lcell
-- Equation(s):
-- \sys_res_n_debounce_inst|fsm_inst|Equal0~3_combout\ = (!\sys_res_n_debounce_inst|counter_inst|cnt_int\(7) & (((!\sys_res_n_debounce_inst|counter_inst|cnt_int\(8) & !\sys_res_n_debounce_inst|counter_inst|cnt_int\(6)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0005",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \sys_res_n_debounce_inst|counter_inst|cnt_int\(7),
	datac => \sys_res_n_debounce_inst|counter_inst|cnt_int\(8),
	datad => \sys_res_n_debounce_inst|counter_inst|cnt_int\(6),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \sys_res_n_debounce_inst|fsm_inst|Equal0~3_combout\);

-- Location: LC_X28_Y25_N0
\sys_res_n_debounce_inst|fsm_inst|Equal0~0\ : stratix_lcell
-- Equation(s):
-- \sys_res_n_debounce_inst|fsm_inst|Equal0~0_combout\ = (\sys_res_n_debounce_inst|counter_inst|cnt_int\(15) & (\sys_res_n_debounce_inst|counter_inst|cnt_int\(9) & (\sys_res_n_debounce_inst|counter_inst|cnt_int\(2) & 
-- !\sys_res_n_debounce_inst|counter_inst|cnt_int\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0080",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \sys_res_n_debounce_inst|counter_inst|cnt_int\(15),
	datab => \sys_res_n_debounce_inst|counter_inst|cnt_int\(9),
	datac => \sys_res_n_debounce_inst|counter_inst|cnt_int\(2),
	datad => \sys_res_n_debounce_inst|counter_inst|cnt_int\(3),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \sys_res_n_debounce_inst|fsm_inst|Equal0~0_combout\);

-- Location: LC_X28_Y27_N0
\sys_res_n_debounce_inst|fsm_inst|Equal0~4\ : stratix_lcell
-- Equation(s):
-- \sys_res_n_debounce_inst|fsm_inst|Equal0~4_combout\ = (!\sys_res_n_debounce_inst|counter_inst|cnt_int\(1) & (\sys_res_n_debounce_inst|counter_inst|cnt_int\(4) & (\sys_res_n_debounce_inst|counter_inst|cnt_int\(5) & 
-- \sys_res_n_debounce_inst|counter_inst|cnt_int\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "4000",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \sys_res_n_debounce_inst|counter_inst|cnt_int\(1),
	datab => \sys_res_n_debounce_inst|counter_inst|cnt_int\(4),
	datac => \sys_res_n_debounce_inst|counter_inst|cnt_int\(5),
	datad => \sys_res_n_debounce_inst|counter_inst|cnt_int\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \sys_res_n_debounce_inst|fsm_inst|Equal0~4_combout\);

-- Location: LC_X28_Y25_N9
\sys_res_n_debounce_inst|fsm_inst|Equal0~5\ : stratix_lcell
-- Equation(s):
-- \sys_res_n_debounce_inst|fsm_inst|Equal0~5_combout\ = (\sys_res_n_debounce_inst|fsm_inst|Equal0~3_combout\ & (\sys_res_n_debounce_inst|fsm_inst|Equal0~0_combout\ & (\sys_res_n_debounce_inst|fsm_inst|Equal0~2_combout\ & 
-- \sys_res_n_debounce_inst|fsm_inst|Equal0~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "8000",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \sys_res_n_debounce_inst|fsm_inst|Equal0~3_combout\,
	datab => \sys_res_n_debounce_inst|fsm_inst|Equal0~0_combout\,
	datac => \sys_res_n_debounce_inst|fsm_inst|Equal0~2_combout\,
	datad => \sys_res_n_debounce_inst|fsm_inst|Equal0~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \sys_res_n_debounce_inst|fsm_inst|Equal0~5_combout\);

-- Location: LC_X27_Y25_N1
\sys_res_n_debounce_inst|fsm_inst|Selector1~0\ : stratix_lcell
-- Equation(s):
-- \sys_res_n_debounce_inst|fsm_inst|Selector1~0_combout\ = (\sys_res_n_debounce_inst|fsm_inst|debounce_fsm_state.TIMEOUT1~regout\ & ((\sys_res_n_debounce_inst|sync_inst|sync\(2)) # ((\sys_res_n_debounce_inst|fsm_inst|Equal0~5_combout\)))) # 
-- (!\sys_res_n_debounce_inst|fsm_inst|debounce_fsm_state.TIMEOUT1~regout\ & (\sys_res_n_debounce_inst|fsm_inst|debounce_fsm_state.TIMEOUT0~regout\ & ((\sys_res_n_debounce_inst|fsm_inst|Equal0~5_combout\) # (!\sys_res_n_debounce_inst|sync_inst|sync\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "ede0",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \sys_res_n_debounce_inst|sync_inst|sync\(2),
	datab => \sys_res_n_debounce_inst|fsm_inst|Equal0~5_combout\,
	datac => \sys_res_n_debounce_inst|fsm_inst|debounce_fsm_state.TIMEOUT1~regout\,
	datad => \sys_res_n_debounce_inst|fsm_inst|debounce_fsm_state.TIMEOUT0~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \sys_res_n_debounce_inst|fsm_inst|Selector1~0_combout\);

-- Location: LC_X27_Y25_N0
\sys_res_n_debounce_inst|fsm_inst|Selector1~1\ : stratix_lcell
-- Equation(s):
-- \sys_res_n_debounce_inst|fsm_inst|Selector1~1_combout\ = (!\sys_res_n_debounce_inst|fsm_inst|Selector1~0_combout\ & ((\sys_res_n_debounce_inst|sync_inst|sync\(2) & (!\sys_res_n_debounce_inst|fsm_inst|debounce_fsm_state.IDLE0~regout\)) # 
-- (!\sys_res_n_debounce_inst|sync_inst|sync\(2) & ((\sys_res_n_debounce_inst|fsm_inst|debounce_fsm_state.IDLE1~regout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1310",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \sys_res_n_debounce_inst|fsm_inst|debounce_fsm_state.IDLE0~regout\,
	datab => \sys_res_n_debounce_inst|fsm_inst|Selector1~0_combout\,
	datac => \sys_res_n_debounce_inst|sync_inst|sync\(2),
	datad => \sys_res_n_debounce_inst|fsm_inst|debounce_fsm_state.IDLE1~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \sys_res_n_debounce_inst|fsm_inst|Selector1~1_combout\);

-- Location: LC_X27_Y25_N6
\sys_res_n_debounce_inst|fsm_inst|debounce_fsm_state.TIMEOUT0\ : stratix_lcell
-- Equation(s):
-- \sys_res_n_debounce_inst|fsm_inst|debounce_fsm_state.TIMEOUT0~regout\ = DFFEAS((\sys_res_n_debounce_inst|fsm_inst|debounce_fsm_state.IDLE0~regout\ & ((\sys_res_n_debounce_inst|sync_inst|sync\(2)) # ((\sys_res_n_debounce_inst|fsm_inst|Selector1~1_combout\ 
-- & \sys_res_n_debounce_inst|fsm_inst|debounce_fsm_state.TIMEOUT0~regout\)))) # (!\sys_res_n_debounce_inst|fsm_inst|debounce_fsm_state.IDLE0~regout\ & (\sys_res_n_debounce_inst|fsm_inst|Selector1~1_combout\ & 
-- ((\sys_res_n_debounce_inst|fsm_inst|debounce_fsm_state.TIMEOUT0~regout\)))), GLOBAL(\sys_clk~combout\), VCC, , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "eca0",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~combout\,
	dataa => \sys_res_n_debounce_inst|fsm_inst|debounce_fsm_state.IDLE0~regout\,
	datab => \sys_res_n_debounce_inst|fsm_inst|Selector1~1_combout\,
	datac => \sys_res_n_debounce_inst|sync_inst|sync\(2),
	datad => \sys_res_n_debounce_inst|fsm_inst|debounce_fsm_state.TIMEOUT0~regout\,
	aclr => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \sys_res_n_debounce_inst|fsm_inst|debounce_fsm_state.TIMEOUT0~regout\);

-- Location: LC_X27_Y25_N2
\sys_res_n_debounce_inst|fsm_inst|Selector2~1\ : stratix_lcell
-- Equation(s):
-- \sys_res_n_debounce_inst|fsm_inst|Selector2~1_combout\ = (\sys_res_n_debounce_inst|sync_inst|sync\(2) & ((\sys_res_n_debounce_inst|fsm_inst|debounce_fsm_state.TIMEOUT0~regout\) # ((\sys_res_n_debounce_inst|fsm_inst|debounce_fsm_state.IDLE0~regout\ & 
-- \sys_res_n_debounce_inst|fsm_inst|debounce_fsm_state.IDLE1~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "e0c0",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \sys_res_n_debounce_inst|fsm_inst|debounce_fsm_state.IDLE0~regout\,
	datab => \sys_res_n_debounce_inst|fsm_inst|debounce_fsm_state.TIMEOUT0~regout\,
	datac => \sys_res_n_debounce_inst|sync_inst|sync\(2),
	datad => \sys_res_n_debounce_inst|fsm_inst|debounce_fsm_state.IDLE1~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \sys_res_n_debounce_inst|fsm_inst|Selector2~1_combout\);

-- Location: PIN_AF17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\sys_res_n~I\ : stratix_io
-- pragma translate_off
GENERIC MAP (
	ddio_mode => "none",
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_sys_res_n,
	combout => \sys_res_n~combout\);

-- Location: LC_X28_Y25_N7
\sys_res_n_debounce_inst|sync_inst|sync[1]\ : stratix_lcell
-- Equation(s):
-- \sys_res_n_debounce_inst|sync_inst|sync\(1) = DFFEAS(GND, GLOBAL(\sys_clk~combout\), VCC, , , \sys_res_n~combout\, , , VCC)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~combout\,
	datac => \sys_res_n~combout\,
	aclr => GND,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \sys_res_n_debounce_inst|sync_inst|sync\(1));

-- Location: LC_X28_Y25_N4
\sys_res_n_debounce_inst|sync_inst|sync[2]\ : stratix_lcell
-- Equation(s):
-- \sys_res_n_debounce_inst|fsm_inst|Selector2~0\ = (\sys_res_n_debounce_inst|fsm_inst|debounce_fsm_state.IDLE1~regout\ & (\sys_res_n_debounce_inst|fsm_inst|debounce_fsm_state.TIMEOUT0~regout\ & ((!L1_sync[2]) # 
-- (!\sys_res_n_debounce_inst|fsm_inst|debounce_fsm_state.IDLE0~regout\)))) # (!\sys_res_n_debounce_inst|fsm_inst|debounce_fsm_state.IDLE1~regout\ & (((\sys_res_n_debounce_inst|fsm_inst|debounce_fsm_state.TIMEOUT0~regout\) # (!L1_sync[2]))))
-- \sys_res_n_debounce_inst|sync_inst|sync\(2) = DFFEAS(\sys_res_n_debounce_inst|fsm_inst|Selector2~0\, GLOBAL(\sys_clk~combout\), VCC, , , \sys_res_n_debounce_inst|sync_inst|sync\(1), , , VCC)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "7f03",
	operation_mode => "normal",
	output_mode => "reg_and_comb",
	register_cascade_mode => "off",
	sum_lutc_input => "qfbk",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~combout\,
	dataa => \sys_res_n_debounce_inst|fsm_inst|debounce_fsm_state.IDLE0~regout\,
	datab => \sys_res_n_debounce_inst|fsm_inst|debounce_fsm_state.IDLE1~regout\,
	datac => \sys_res_n_debounce_inst|sync_inst|sync\(1),
	datad => \sys_res_n_debounce_inst|fsm_inst|debounce_fsm_state.TIMEOUT0~regout\,
	aclr => GND,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \sys_res_n_debounce_inst|fsm_inst|Selector2~0\,
	regout => \sys_res_n_debounce_inst|sync_inst|sync\(2));

-- Location: LC_X27_Y25_N5
\sys_res_n_debounce_inst|fsm_inst|Selector2~2\ : stratix_lcell
-- Equation(s):
-- \sys_res_n_debounce_inst|fsm_inst|Selector2~2_combout\ = (\sys_res_n_debounce_inst|fsm_inst|Selector2~0\ & ((\sys_res_n_debounce_inst|fsm_inst|Equal0~5_combout\ & ((\sys_res_n_debounce_inst|fsm_inst|debounce_fsm_state.TIMEOUT1~regout\))) # 
-- (!\sys_res_n_debounce_inst|fsm_inst|Equal0~5_combout\ & (\sys_res_n_debounce_inst|fsm_inst|Selector2~1_combout\)))) # (!\sys_res_n_debounce_inst|fsm_inst|Selector2~0\ & (((\sys_res_n_debounce_inst|fsm_inst|debounce_fsm_state.TIMEOUT1~regout\)) # 
-- (!\sys_res_n_debounce_inst|fsm_inst|Selector2~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "e2f5",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \sys_res_n_debounce_inst|fsm_inst|Selector2~1_combout\,
	datab => \sys_res_n_debounce_inst|fsm_inst|Equal0~5_combout\,
	datac => \sys_res_n_debounce_inst|fsm_inst|debounce_fsm_state.TIMEOUT1~regout\,
	datad => \sys_res_n_debounce_inst|fsm_inst|Selector2~0\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \sys_res_n_debounce_inst|fsm_inst|Selector2~2_combout\);

-- Location: LC_X27_Y25_N7
\sys_res_n_debounce_inst|fsm_inst|Selector2~3\ : stratix_lcell
-- Equation(s):
-- \sys_res_n_debounce_inst|fsm_inst|Selector2~3_combout\ = (\sys_res_n_debounce_inst|fsm_inst|Equal0~5_combout\ & (((!\sys_res_n_debounce_inst|fsm_inst|debounce_fsm_state.TIMEOUT1~regout\ & 
-- !\sys_res_n_debounce_inst|fsm_inst|debounce_fsm_state.TIMEOUT0~regout\)))) # (!\sys_res_n_debounce_inst|fsm_inst|Equal0~5_combout\ & ((\sys_res_n_debounce_inst|sync_inst|sync\(2) & (!\sys_res_n_debounce_inst|fsm_inst|debounce_fsm_state.TIMEOUT1~regout\)) 
-- # (!\sys_res_n_debounce_inst|sync_inst|sync\(2) & ((!\sys_res_n_debounce_inst|fsm_inst|debounce_fsm_state.TIMEOUT0~regout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "021f",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \sys_res_n_debounce_inst|sync_inst|sync\(2),
	datab => \sys_res_n_debounce_inst|fsm_inst|Equal0~5_combout\,
	datac => \sys_res_n_debounce_inst|fsm_inst|debounce_fsm_state.TIMEOUT1~regout\,
	datad => \sys_res_n_debounce_inst|fsm_inst|debounce_fsm_state.TIMEOUT0~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \sys_res_n_debounce_inst|fsm_inst|Selector2~3_combout\);

-- Location: LC_X27_Y25_N9
\sys_res_n_debounce_inst|fsm_inst|debounce_fsm_state.IDLE1\ : stratix_lcell
-- Equation(s):
-- \sys_res_n_debounce_inst|fsm_inst|debounce_fsm_state.IDLE1~regout\ = DFFEAS((\sys_res_n_debounce_inst|fsm_inst|Selector2~3_combout\ & (((\sys_res_n_debounce_inst|fsm_inst|debounce_fsm_state.IDLE1~regout\) # 
-- (!\sys_res_n_debounce_inst|fsm_inst|Selector2~2_combout\)))) # (!\sys_res_n_debounce_inst|fsm_inst|Selector2~3_combout\ & (!\sys_res_n_debounce_inst|sync_inst|sync\(2))), GLOBAL(\sys_clk~combout\), VCC, , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "f535",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~combout\,
	dataa => \sys_res_n_debounce_inst|sync_inst|sync\(2),
	datab => \sys_res_n_debounce_inst|fsm_inst|Selector2~2_combout\,
	datac => \sys_res_n_debounce_inst|fsm_inst|Selector2~3_combout\,
	datad => \sys_res_n_debounce_inst|fsm_inst|debounce_fsm_state.IDLE1~regout\,
	aclr => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \sys_res_n_debounce_inst|fsm_inst|debounce_fsm_state.IDLE1~regout\);

-- Location: LC_X27_Y25_N3
\sys_res_n_debounce_inst|fsm_inst|debounce_fsm_state.TIMEOUT1\ : stratix_lcell
-- Equation(s):
-- \sys_res_n_debounce_inst|fsm_inst|debounce_fsm_state.TIMEOUT1~regout\ = DFFEAS((\sys_res_n_debounce_inst|sync_inst|sync\(2) & (\sys_res_n_debounce_inst|fsm_inst|Selector1~1_combout\ & 
-- (\sys_res_n_debounce_inst|fsm_inst|debounce_fsm_state.TIMEOUT1~regout\))) # (!\sys_res_n_debounce_inst|sync_inst|sync\(2) & (((\sys_res_n_debounce_inst|fsm_inst|Selector1~1_combout\ & \sys_res_n_debounce_inst|fsm_inst|debounce_fsm_state.TIMEOUT1~regout\)) 
-- # (!\sys_res_n_debounce_inst|fsm_inst|debounce_fsm_state.IDLE1~regout\))), GLOBAL(\sys_clk~combout\), VCC, , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "c0d5",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~combout\,
	dataa => \sys_res_n_debounce_inst|sync_inst|sync\(2),
	datab => \sys_res_n_debounce_inst|fsm_inst|Selector1~1_combout\,
	datac => \sys_res_n_debounce_inst|fsm_inst|debounce_fsm_state.TIMEOUT1~regout\,
	datad => \sys_res_n_debounce_inst|fsm_inst|debounce_fsm_state.IDLE1~regout\,
	aclr => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \sys_res_n_debounce_inst|fsm_inst|debounce_fsm_state.TIMEOUT1~regout\);

-- Location: LC_X27_Y25_N4
\sys_res_n_debounce_inst|fsm_inst|Selector0~0\ : stratix_lcell
-- Equation(s):
-- \sys_res_n_debounce_inst|fsm_inst|Selector0~0_combout\ = (\sys_res_n_debounce_inst|fsm_inst|debounce_fsm_state.TIMEOUT1~regout\ & (!\sys_res_n_debounce_inst|sync_inst|sync\(2) & ((\sys_res_n_debounce_inst|fsm_inst|Equal0~5_combout\) # 
-- (\sys_res_n_debounce_inst|fsm_inst|debounce_fsm_state.IDLE0~regout\)))) # (!\sys_res_n_debounce_inst|fsm_inst|debounce_fsm_state.TIMEOUT1~regout\ & (((\sys_res_n_debounce_inst|fsm_inst|debounce_fsm_state.IDLE0~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "5f08",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \sys_res_n_debounce_inst|fsm_inst|debounce_fsm_state.TIMEOUT1~regout\,
	datab => \sys_res_n_debounce_inst|fsm_inst|Equal0~5_combout\,
	datac => \sys_res_n_debounce_inst|sync_inst|sync\(2),
	datad => \sys_res_n_debounce_inst|fsm_inst|debounce_fsm_state.IDLE0~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \sys_res_n_debounce_inst|fsm_inst|Selector0~0_combout\);

-- Location: LC_X27_Y25_N8
\sys_res_n_debounce_inst|fsm_inst|debounce_fsm_state.IDLE0\ : stratix_lcell
-- Equation(s):
-- \sys_res_n_debounce_inst|fsm_inst|debounce_fsm_state.IDLE0~regout\ = DFFEAS((\sys_res_n_debounce_inst|fsm_inst|Selector2~2_combout\ & (\sys_res_n_debounce_inst|fsm_inst|Selector0~0_combout\)) # (!\sys_res_n_debounce_inst|fsm_inst|Selector2~2_combout\ & 
-- (((!\sys_res_n_debounce_inst|sync_inst|sync\(2) & \sys_res_n_debounce_inst|fsm_inst|debounce_fsm_state.TIMEOUT0~regout\)))), GLOBAL(\sys_clk~combout\), VCC, , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "8b88",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~combout\,
	dataa => \sys_res_n_debounce_inst|fsm_inst|Selector0~0_combout\,
	datab => \sys_res_n_debounce_inst|fsm_inst|Selector2~2_combout\,
	datac => \sys_res_n_debounce_inst|sync_inst|sync\(2),
	datad => \sys_res_n_debounce_inst|fsm_inst|debounce_fsm_state.TIMEOUT0~regout\,
	aclr => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \sys_res_n_debounce_inst|fsm_inst|debounce_fsm_state.IDLE0~regout\);

-- Location: LC_X28_Y25_N3
\sys_res_n_debounce_inst|fsm_inst|o~0\ : stratix_lcell
-- Equation(s):
-- \sys_res_n_debounce_inst|fsm_inst|o~0_combout\ = ((\sys_res_n_debounce_inst|fsm_inst|debounce_fsm_state.IDLE0~regout\) # ((\sys_res_n_debounce_inst|fsm_inst|debounce_fsm_state.TIMEOUT0~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "ffcc",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \sys_res_n_debounce_inst|fsm_inst|debounce_fsm_state.IDLE0~regout\,
	datad => \sys_res_n_debounce_inst|fsm_inst|debounce_fsm_state.TIMEOUT0~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\);

-- Location: LC_X72_Y44_N6
\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.PREPARE_SEND_WAIT1\ : stratix_lcell
-- Equation(s):
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.PREPARE_SEND_WAIT1~regout\ = DFFEAS((\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.PREPARE_SEND_ASSIGN_CLK~regout\) # 
-- ((\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.PREPARE_SEND_WAIT1~regout\ & ((!\ps2_keyboard_controller_inst|ps2_transceiver_inst|Equal0~3_combout\)))), GLOBAL(\sys_clk~combout\), 
-- !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "aaee",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~combout\,
	dataa => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.PREPARE_SEND_ASSIGN_CLK~regout\,
	datab => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.PREPARE_SEND_WAIT1~regout\,
	datad => \ps2_keyboard_controller_inst|ps2_transceiver_inst|Equal0~3_combout\,
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.PREPARE_SEND_WAIT1~regout\);

-- Location: LC_X72_Y44_N3
\ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector5~2\ : stratix_lcell
-- Equation(s):
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector5~2_combout\ = ((\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.PREPARE_SEND_WAIT1~regout\ & ((\ps2_keyboard_controller_inst|ps2_transceiver_inst|Equal0~3_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "cc00",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.PREPARE_SEND_WAIT1~regout\,
	datad => \ps2_keyboard_controller_inst|ps2_transceiver_inst|Equal0~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector5~2_combout\);

-- Location: LC_X73_Y45_N5
\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_sync[1]\ : stratix_lcell
-- Equation(s):
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_sync\(1) = DFFEAS((((!\ps2_clk~0\))), GLOBAL(\sys_clk~combout\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "00ff",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~combout\,
	datad => \ps2_clk~0\,
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_sync\(1));

-- Location: LC_X73_Y45_N8
\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_sync[2]\ : stratix_lcell
-- Equation(s):
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|process_0~1\ = ((!\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_last~regout\ & (N1_ps2_clk_sync[2])))
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_sync\(2) = DFFEAS(\ps2_keyboard_controller_inst|ps2_transceiver_inst|process_0~1\, GLOBAL(\sys_clk~combout\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , 
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_sync\(1), , , VCC)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "3030",
	operation_mode => "normal",
	output_mode => "reg_and_comb",
	register_cascade_mode => "off",
	sum_lutc_input => "qfbk",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~combout\,
	datab => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_last~regout\,
	datac => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_sync\(1),
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \ps2_keyboard_controller_inst|ps2_transceiver_inst|process_0~1\,
	regout => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_sync\(2));

-- Location: LC_X72_Y45_N9
\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_last\ : stratix_lcell
-- Equation(s):
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|process_0~0\ = ((!\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_sync\(2) & (N1_ps2_clk_last)))
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_last~regout\ = DFFEAS(\ps2_keyboard_controller_inst|ps2_transceiver_inst|process_0~0\, GLOBAL(\sys_clk~combout\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , 
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_sync\(2), , , VCC)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "3030",
	operation_mode => "normal",
	output_mode => "reg_and_comb",
	register_cascade_mode => "off",
	sum_lutc_input => "qfbk",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~combout\,
	datab => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_sync\(2),
	datac => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_sync\(2),
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \ps2_keyboard_controller_inst|ps2_transceiver_inst|process_0~0\,
	regout => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_last~regout\);

-- Location: LC_X72_Y44_N9
\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.PREPARE_SEND_DATA\ : stratix_lcell
-- Equation(s):
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.PREPARE_SEND_DATA~regout\ = DFFEAS((!\ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector5~7_combout\ & 
-- ((\ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector5~2_combout\) # ((\ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector5~9_combout\ & 
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.PREPARE_SEND_DATA~regout\)))), GLOBAL(\sys_clk~combout\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "3230",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~combout\,
	dataa => \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector5~9_combout\,
	datab => \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector5~7_combout\,
	datac => \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector5~2_combout\,
	datad => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.PREPARE_SEND_DATA~regout\,
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.PREPARE_SEND_DATA~regout\);

-- Location: LC_X71_Y43_N1
\ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector77~0\ : stratix_lcell
-- Equation(s):
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector77~0_combout\ = (\ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout2\(0) & 
-- (((!\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.PREPARE_SEND_DATA~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "00aa",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout2\(0),
	datad => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.PREPARE_SEND_DATA~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector77~0_combout\);

-- Location: LC_X71_Y43_N4
\ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector69~0\ : stratix_lcell
-- Equation(s):
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector69~0_combout\ = ((\ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout2\(8) & 
-- ((!\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.PREPARE_SEND_DATA~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "00cc",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout2\(8),
	datad => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.PREPARE_SEND_DATA~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector69~0_combout\);

-- Location: LC_X70_Y44_N5
\ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector73~0\ : stratix_lcell
-- Equation(s):
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector73~0_combout\ = (((\ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout2\(4) & !\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.PREPARE_SEND_DATA~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "00f0",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datac => \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout2\(4),
	datad => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.PREPARE_SEND_DATA~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector73~0_combout\);

-- Location: LC_X71_Y43_N6
\ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector74~0\ : stratix_lcell
-- Equation(s):
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector74~0_combout\ = (((\ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout2\(3) & !\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.PREPARE_SEND_DATA~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "00f0",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datac => \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout2\(3),
	datad => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.PREPARE_SEND_DATA~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector74~0_combout\);

-- Location: LC_X71_Y43_N0
\ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector75~0\ : stratix_lcell
-- Equation(s):
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector75~0_combout\ = ((\ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout2\(2) & 
-- ((!\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.PREPARE_SEND_DATA~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "00cc",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout2\(2),
	datad => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.PREPARE_SEND_DATA~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector75~0_combout\);

-- Location: LC_X71_Y43_N7
\ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector76~0\ : stratix_lcell
-- Equation(s):
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector76~0_combout\ = (\ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout2\(1) & 
-- (((!\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.PREPARE_SEND_DATA~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "00aa",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout2\(1),
	datad => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.PREPARE_SEND_DATA~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector76~0_combout\);

-- Location: LC_X70_Y43_N0
\ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout2[0]\ : stratix_lcell
-- Equation(s):
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout2\(0) = DFFEAS(((!\ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout2\(0))), GLOBAL(\sys_clk~combout\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , 
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector77~0_combout\, , , !\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.PREPARE_SEND_WAIT2~regout\)
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout2[0]~5\ = CARRY(((\ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout2\(0))))
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout2[0]~5COUT1_27\ = CARRY(((\ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout2\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "33cc",
	operation_mode => "arithmetic",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~combout\,
	datab => \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout2\(0),
	datac => \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector77~0_combout\,
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	sload => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ALT_INV_ps2_transceiver_state.PREPARE_SEND_WAIT2~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout2\(0),
	cout0 => \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout2[0]~5\,
	cout1 => \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout2[0]~5COUT1_27\);

-- Location: LC_X70_Y43_N1
\ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout2[1]\ : stratix_lcell
-- Equation(s):
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout2\(1) = DFFEAS((\ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout2\(1) $ ((\ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout2[0]~5\))), 
-- GLOBAL(\sys_clk~combout\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector76~0_combout\, , , 
-- !\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.PREPARE_SEND_WAIT2~regout\)
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout2[1]~7\ = CARRY(((!\ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout2[0]~5\) # (!\ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout2\(1))))
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout2[1]~7COUT1_29\ = CARRY(((!\ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout2[0]~5COUT1_27\) # (!\ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout2\(1))))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	lut_mask => "3c3f",
	operation_mode => "arithmetic",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~combout\,
	datab => \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout2\(1),
	datac => \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector76~0_combout\,
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	sload => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ALT_INV_ps2_transceiver_state.PREPARE_SEND_WAIT2~regout\,
	cin0 => \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout2[0]~5\,
	cin1 => \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout2[0]~5COUT1_27\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout2\(1),
	cout0 => \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout2[1]~7\,
	cout1 => \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout2[1]~7COUT1_29\);

-- Location: LC_X70_Y43_N2
\ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout2[2]\ : stratix_lcell
-- Equation(s):
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout2\(2) = DFFEAS(\ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout2\(2) $ ((((!\ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout2[1]~7\)))), 
-- GLOBAL(\sys_clk~combout\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector75~0_combout\, , , 
-- !\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.PREPARE_SEND_WAIT2~regout\)
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout2[2]~1\ = CARRY((\ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout2\(2) & ((!\ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout2[1]~7\))))
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout2[2]~1COUT1_31\ = CARRY((\ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout2\(2) & ((!\ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout2[1]~7COUT1_29\))))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	lut_mask => "a50a",
	operation_mode => "arithmetic",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~combout\,
	dataa => \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout2\(2),
	datac => \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector75~0_combout\,
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	sload => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ALT_INV_ps2_transceiver_state.PREPARE_SEND_WAIT2~regout\,
	cin0 => \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout2[1]~7\,
	cin1 => \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout2[1]~7COUT1_29\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout2\(2),
	cout0 => \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout2[2]~1\,
	cout1 => \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout2[2]~1COUT1_31\);

-- Location: LC_X70_Y43_N3
\ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout2[3]\ : stratix_lcell
-- Equation(s):
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout2\(3) = DFFEAS(\ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout2\(3) $ ((((\ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout2[2]~1\)))), 
-- GLOBAL(\sys_clk~combout\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector74~0_combout\, , , 
-- !\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.PREPARE_SEND_WAIT2~regout\)
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout2[3]~3\ = CARRY(((!\ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout2[2]~1\)) # (!\ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout2\(3)))
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout2[3]~3COUT1_33\ = CARRY(((!\ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout2[2]~1COUT1_31\)) # (!\ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout2\(3)))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	lut_mask => "5a5f",
	operation_mode => "arithmetic",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~combout\,
	dataa => \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout2\(3),
	datac => \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector74~0_combout\,
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	sload => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ALT_INV_ps2_transceiver_state.PREPARE_SEND_WAIT2~regout\,
	cin0 => \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout2[2]~1\,
	cin1 => \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout2[2]~1COUT1_31\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout2\(3),
	cout0 => \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout2[3]~3\,
	cout1 => \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout2[3]~3COUT1_33\);

-- Location: LC_X70_Y43_N4
\ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout2[4]\ : stratix_lcell
-- Equation(s):
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout2\(4) = DFFEAS(\ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout2\(4) $ ((((!\ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout2[3]~3\)))), 
-- GLOBAL(\sys_clk~combout\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector73~0_combout\, , , 
-- !\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.PREPARE_SEND_WAIT2~regout\)
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout2[4]~13\ = CARRY((\ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout2\(4) & ((!\ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout2[3]~3COUT1_33\))))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	lut_mask => "a50a",
	operation_mode => "arithmetic",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~combout\,
	dataa => \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout2\(4),
	datac => \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector73~0_combout\,
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	sload => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ALT_INV_ps2_transceiver_state.PREPARE_SEND_WAIT2~regout\,
	cin0 => \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout2[3]~3\,
	cin1 => \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout2[3]~3COUT1_33\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout2\(4),
	cout => \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout2[4]~13\);

-- Location: LC_X71_Y43_N5
\ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector70~0\ : stratix_lcell
-- Equation(s):
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector70~0_combout\ = (\ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout2\(7) & 
-- (((!\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.PREPARE_SEND_DATA~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "00aa",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout2\(7),
	datad => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.PREPARE_SEND_DATA~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector70~0_combout\);

-- Location: LC_X70_Y44_N0
\ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector71~0\ : stratix_lcell
-- Equation(s):
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector71~0_combout\ = (((\ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout2\(6) & !\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.PREPARE_SEND_DATA~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "00f0",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datac => \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout2\(6),
	datad => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.PREPARE_SEND_DATA~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector71~0_combout\);

-- Location: LC_X70_Y44_N2
\ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector72~0\ : stratix_lcell
-- Equation(s):
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector72~0_combout\ = (((\ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout2\(5) & !\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.PREPARE_SEND_DATA~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "00f0",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datac => \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout2\(5),
	datad => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.PREPARE_SEND_DATA~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector72~0_combout\);

-- Location: LC_X70_Y43_N5
\ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout2[5]\ : stratix_lcell
-- Equation(s):
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout2\(5) = DFFEAS((\ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout2\(5) $ ((\ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout2[4]~13\))), 
-- GLOBAL(\sys_clk~combout\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector72~0_combout\, , , 
-- !\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.PREPARE_SEND_WAIT2~regout\)
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout2[5]~15\ = CARRY(((!\ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout2[4]~13\) # (!\ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout2\(5))))
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout2[5]~15COUT1_35\ = CARRY(((!\ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout2[4]~13\) # (!\ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout2\(5))))

-- pragma translate_off
GENERIC MAP (
	cin_used => "true",
	lut_mask => "3c3f",
	operation_mode => "arithmetic",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~combout\,
	datab => \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout2\(5),
	datac => \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector72~0_combout\,
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	sload => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ALT_INV_ps2_transceiver_state.PREPARE_SEND_WAIT2~regout\,
	cin => \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout2[4]~13\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout2\(5),
	cout0 => \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout2[5]~15\,
	cout1 => \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout2[5]~15COUT1_35\);

-- Location: LC_X70_Y43_N6
\ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout2[6]\ : stratix_lcell
-- Equation(s):
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout2\(6) = DFFEAS((\ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout2\(6) $ ((!(!\ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout2[4]~13\ & 
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout2[5]~15\) # (\ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout2[4]~13\ & \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout2[5]~15COUT1_35\)))), 
-- GLOBAL(\sys_clk~combout\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector71~0_combout\, , , 
-- !\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.PREPARE_SEND_WAIT2~regout\)
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout2[6]~11\ = CARRY(((\ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout2\(6) & !\ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout2[5]~15\)))
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout2[6]~11COUT1_37\ = CARRY(((\ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout2\(6) & !\ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout2[5]~15COUT1_35\)))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	cin_used => "true",
	lut_mask => "c30c",
	operation_mode => "arithmetic",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~combout\,
	datab => \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout2\(6),
	datac => \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector71~0_combout\,
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	sload => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ALT_INV_ps2_transceiver_state.PREPARE_SEND_WAIT2~regout\,
	cin => \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout2[4]~13\,
	cin0 => \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout2[5]~15\,
	cin1 => \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout2[5]~15COUT1_35\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout2\(6),
	cout0 => \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout2[6]~11\,
	cout1 => \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout2[6]~11COUT1_37\);

-- Location: LC_X70_Y43_N7
\ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout2[7]\ : stratix_lcell
-- Equation(s):
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout2\(7) = DFFEAS(\ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout2\(7) $ (((((!\ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout2[4]~13\ & 
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout2[6]~11\) # (\ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout2[4]~13\ & \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout2[6]~11COUT1_37\))))), 
-- GLOBAL(\sys_clk~combout\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector70~0_combout\, , , 
-- !\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.PREPARE_SEND_WAIT2~regout\)
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout2[7]~17\ = CARRY(((!\ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout2[6]~11\)) # (!\ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout2\(7)))
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout2[7]~17COUT1_39\ = CARRY(((!\ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout2[6]~11COUT1_37\)) # 
-- (!\ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout2\(7)))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	cin_used => "true",
	lut_mask => "5a5f",
	operation_mode => "arithmetic",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~combout\,
	dataa => \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout2\(7),
	datac => \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector70~0_combout\,
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	sload => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ALT_INV_ps2_transceiver_state.PREPARE_SEND_WAIT2~regout\,
	cin => \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout2[4]~13\,
	cin0 => \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout2[6]~11\,
	cin1 => \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout2[6]~11COUT1_37\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout2\(7),
	cout0 => \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout2[7]~17\,
	cout1 => \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout2[7]~17COUT1_39\);

-- Location: LC_X70_Y43_N8
\ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout2[8]\ : stratix_lcell
-- Equation(s):
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout2\(8) = DFFEAS((((!\ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout2[4]~13\ & \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout2[7]~17\) # 
-- (\ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout2[4]~13\ & \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout2[7]~17COUT1_39\) $ (!\ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout2\(8)))), 
-- GLOBAL(\sys_clk~combout\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector69~0_combout\, , , 
-- !\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.PREPARE_SEND_WAIT2~regout\)

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	cin_used => "true",
	lut_mask => "f00f",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~combout\,
	datac => \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector69~0_combout\,
	datad => \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout2\(8),
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	sload => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ALT_INV_ps2_transceiver_state.PREPARE_SEND_WAIT2~regout\,
	cin => \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout2[4]~13\,
	cin0 => \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout2[7]~17\,
	cin1 => \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout2[7]~17COUT1_39\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout2\(8));

-- Location: LC_X70_Y43_N9
\ps2_keyboard_controller_inst|ps2_transceiver_inst|Equal1~1\ : stratix_lcell
-- Equation(s):
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|Equal1~1_combout\ = (!\ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout2\(4) & (!\ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout2\(5) & 
-- (!\ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout2\(7) & \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout2\(6))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout2\(4),
	datab => \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout2\(5),
	datac => \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout2\(7),
	datad => \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout2\(6),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \ps2_keyboard_controller_inst|ps2_transceiver_inst|Equal1~1_combout\);

-- Location: LC_X71_Y43_N3
\ps2_keyboard_controller_inst|ps2_transceiver_inst|Equal1~2\ : stratix_lcell
-- Equation(s):
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|Equal1~2_combout\ = ((\ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout2\(8) & (\ps2_keyboard_controller_inst|ps2_transceiver_inst|Equal1~1_combout\ & 
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|Equal1~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "c000",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout2\(8),
	datac => \ps2_keyboard_controller_inst|ps2_transceiver_inst|Equal1~1_combout\,
	datad => \ps2_keyboard_controller_inst|ps2_transceiver_inst|Equal1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \ps2_keyboard_controller_inst|ps2_transceiver_inst|Equal1~2_combout\);

-- Location: LC_X71_Y43_N9
\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.PREPARE_SEND_WAIT2\ : stratix_lcell
-- Equation(s):
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.PREPARE_SEND_WAIT2~regout\ = DFFEAS(((\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.PREPARE_SEND_DATA~regout\) # 
-- ((\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.PREPARE_SEND_WAIT2~regout\ & !\ps2_keyboard_controller_inst|ps2_transceiver_inst|Equal1~2_combout\))), GLOBAL(\sys_clk~combout\), 
-- !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "ff0c",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~combout\,
	datab => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.PREPARE_SEND_WAIT2~regout\,
	datac => \ps2_keyboard_controller_inst|ps2_transceiver_inst|Equal1~2_combout\,
	datad => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.PREPARE_SEND_DATA~regout\,
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.PREPARE_SEND_WAIT2~regout\);

-- Location: LC_X71_Y43_N2
\ps2_keyboard_controller_inst|ps2_transceiver_inst|Equal1~0\ : stratix_lcell
-- Equation(s):
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|Equal1~0_combout\ = (!\ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout2\(0) & (\ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout2\(2) & 
-- (\ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout2\(3) & !\ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout2\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0040",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout2\(0),
	datab => \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout2\(2),
	datac => \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout2\(3),
	datad => \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout2\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \ps2_keyboard_controller_inst|ps2_transceiver_inst|Equal1~0_combout\);

-- Location: LC_X71_Y43_N8
\ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector5~4\ : stratix_lcell
-- Equation(s):
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector5~4_combout\ = (\ps2_keyboard_controller_inst|ps2_transceiver_inst|Equal1~0_combout\ & (\ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout2\(8) & 
-- (\ps2_keyboard_controller_inst|ps2_transceiver_inst|Equal1~1_combout\ & \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.PREPARE_SEND_WAIT2~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "8000",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ps2_keyboard_controller_inst|ps2_transceiver_inst|Equal1~0_combout\,
	datab => \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout2\(8),
	datac => \ps2_keyboard_controller_inst|ps2_transceiver_inst|Equal1~1_combout\,
	datad => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.PREPARE_SEND_WAIT2~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector5~4_combout\);

-- Location: LC_X72_Y44_N1
\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.PREPARE_SEND_RELEASE_CLK\ : stratix_lcell
-- Equation(s):
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.PREPARE_SEND_RELEASE_CLK~regout\ = DFFEAS((!\ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector5~7_combout\ & 
-- ((\ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector5~9_combout\ & ((\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.PREPARE_SEND_RELEASE_CLK~regout\))) # 
-- (!\ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector5~9_combout\ & (\ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector5~4_combout\)))), GLOBAL(\sys_clk~combout\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "3210",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~combout\,
	dataa => \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector5~9_combout\,
	datab => \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector5~7_combout\,
	datac => \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector5~4_combout\,
	datad => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.PREPARE_SEND_RELEASE_CLK~regout\,
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.PREPARE_SEND_RELEASE_CLK~regout\);

-- Location: LC_X70_Y45_N9
\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_WAIT_DATA0\ : stratix_lcell
-- Equation(s):
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_WAIT_DATA0~regout\ = DFFEAS((\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.PREPARE_SEND_RELEASE_CLK~regout\) # 
-- ((\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_WAIT_DATA0~regout\ & ((\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_last~regout\) # (!\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_sync\(2))))), 
-- GLOBAL(\sys_clk~combout\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "eaee",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~combout\,
	dataa => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.PREPARE_SEND_RELEASE_CLK~regout\,
	datab => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_WAIT_DATA0~regout\,
	datac => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_last~regout\,
	datad => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_sync\(2),
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_WAIT_DATA0~regout\);

-- Location: LC_X70_Y45_N5
\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_DATA0\ : stratix_lcell
-- Equation(s):
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_DATA0~regout\ = DFFEAS(((\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_WAIT_DATA0~regout\ & 
-- (!\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_last~regout\ & \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_sync\(2)))), GLOBAL(\sys_clk~combout\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0c00",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~combout\,
	datab => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_WAIT_DATA0~regout\,
	datac => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_last~regout\,
	datad => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_sync\(2),
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_DATA0~regout\);

-- Location: LC_X70_Y45_N8
\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_WAIT_DATA1\ : stratix_lcell
-- Equation(s):
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_WAIT_DATA1~regout\ = DFFEAS((\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_DATA0~regout\) # 
-- ((\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_WAIT_DATA1~regout\ & ((\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_last~regout\) # (!\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_sync\(2))))), 
-- GLOBAL(\sys_clk~combout\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "ecee",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~combout\,
	dataa => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_WAIT_DATA1~regout\,
	datab => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_DATA0~regout\,
	datac => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_last~regout\,
	datad => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_sync\(2),
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_WAIT_DATA1~regout\);

-- Location: LC_X70_Y45_N2
\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_DATA1\ : stratix_lcell
-- Equation(s):
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_DATA1~regout\ = DFFEAS((\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_WAIT_DATA1~regout\ & 
-- (!\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_last~regout\ & ((\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_sync\(2))))), GLOBAL(\sys_clk~combout\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "2200",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~combout\,
	dataa => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_WAIT_DATA1~regout\,
	datab => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_last~regout\,
	datad => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_sync\(2),
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_DATA1~regout\);

-- Location: LC_X70_Y45_N7
\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_WAIT_DATA2\ : stratix_lcell
-- Equation(s):
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_WAIT_DATA2~regout\ = DFFEAS((\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_DATA1~regout\) # 
-- ((\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_WAIT_DATA2~regout\ & ((\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_last~regout\) # (!\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_sync\(2))))), 
-- GLOBAL(\sys_clk~combout\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "eafa",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~combout\,
	dataa => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_DATA1~regout\,
	datab => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_last~regout\,
	datac => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_WAIT_DATA2~regout\,
	datad => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_sync\(2),
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_WAIT_DATA2~regout\);

-- Location: LC_X70_Y45_N1
\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_DATA2\ : stratix_lcell
-- Equation(s):
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_DATA2~regout\ = DFFEAS(((!\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_last~regout\ & 
-- (\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_WAIT_DATA2~regout\ & \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_sync\(2)))), GLOBAL(\sys_clk~combout\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), 
-- , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "3000",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~combout\,
	datab => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_last~regout\,
	datac => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_WAIT_DATA2~regout\,
	datad => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_sync\(2),
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_DATA2~regout\);

-- Location: LC_X70_Y45_N6
\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_WAIT_DATA3\ : stratix_lcell
-- Equation(s):
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_WAIT_DATA3~regout\ = DFFEAS((\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_DATA2~regout\) # 
-- ((\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_WAIT_DATA3~regout\ & ((\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_last~regout\) # (!\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_sync\(2))))), 
-- GLOBAL(\sys_clk~combout\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "fdcc",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~combout\,
	dataa => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_sync\(2),
	datab => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_DATA2~regout\,
	datac => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_last~regout\,
	datad => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_WAIT_DATA3~regout\,
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_WAIT_DATA3~regout\);

-- Location: LC_X70_Y45_N4
\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_DATA3\ : stratix_lcell
-- Equation(s):
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_DATA3~regout\ = DFFEAS(((\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_WAIT_DATA3~regout\ & 
-- (!\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_last~regout\ & \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_sync\(2)))), GLOBAL(\sys_clk~combout\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0c00",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~combout\,
	datab => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_WAIT_DATA3~regout\,
	datac => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_last~regout\,
	datad => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_sync\(2),
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_DATA3~regout\);

-- Location: LC_X71_Y45_N3
\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_WAIT_DATA4\ : stratix_lcell
-- Equation(s):
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_WAIT_DATA4~regout\ = DFFEAS((\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_DATA3~regout\) # 
-- ((\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_WAIT_DATA4~regout\ & ((\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_last~regout\) # (!\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_sync\(2))))), 
-- GLOBAL(\sys_clk~combout\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "ecfc",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~combout\,
	dataa => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_last~regout\,
	datab => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_DATA3~regout\,
	datac => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_WAIT_DATA4~regout\,
	datad => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_sync\(2),
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_WAIT_DATA4~regout\);

-- Location: LC_X71_Y45_N5
\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_DATA4\ : stratix_lcell
-- Equation(s):
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_DATA4~regout\ = DFFEAS((!\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_last~regout\ & 
-- (((\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_WAIT_DATA4~regout\ & \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_sync\(2))))), GLOBAL(\sys_clk~combout\), 
-- !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "5000",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~combout\,
	dataa => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_last~regout\,
	datac => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_WAIT_DATA4~regout\,
	datad => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_sync\(2),
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_DATA4~regout\);

-- Location: LC_X71_Y45_N6
\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_WAIT_DATA5\ : stratix_lcell
-- Equation(s):
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_WAIT_DATA5~regout\ = DFFEAS((\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_DATA4~regout\) # 
-- ((\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_WAIT_DATA5~regout\ & ((\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_last~regout\) # (!\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_sync\(2))))), 
-- GLOBAL(\sys_clk~combout\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "eaee",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~combout\,
	dataa => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_DATA4~regout\,
	datab => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_WAIT_DATA5~regout\,
	datac => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_last~regout\,
	datad => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_sync\(2),
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_WAIT_DATA5~regout\);

-- Location: LC_X71_Y45_N1
\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_DATA5\ : stratix_lcell
-- Equation(s):
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_DATA5~regout\ = DFFEAS(((\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_WAIT_DATA5~regout\ & 
-- (!\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_last~regout\ & \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_sync\(2)))), GLOBAL(\sys_clk~combout\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0c00",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~combout\,
	datab => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_WAIT_DATA5~regout\,
	datac => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_last~regout\,
	datad => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_sync\(2),
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_DATA5~regout\);

-- Location: LC_X71_Y45_N8
\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_WAIT_DATA6\ : stratix_lcell
-- Equation(s):
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_WAIT_DATA6~regout\ = DFFEAS((\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_DATA5~regout\) # 
-- ((\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_WAIT_DATA6~regout\ & ((\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_last~regout\) # (!\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_sync\(2))))), 
-- GLOBAL(\sys_clk~combout\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "ecee",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~combout\,
	dataa => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_WAIT_DATA6~regout\,
	datab => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_DATA5~regout\,
	datac => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_last~regout\,
	datad => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_sync\(2),
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_WAIT_DATA6~regout\);

-- Location: LC_X71_Y45_N2
\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_DATA6\ : stratix_lcell
-- Equation(s):
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_DATA6~regout\ = DFFEAS((\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_WAIT_DATA6~regout\ & 
-- (((!\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_last~regout\ & \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_sync\(2))))), GLOBAL(\sys_clk~combout\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0a00",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~combout\,
	dataa => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_WAIT_DATA6~regout\,
	datac => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_last~regout\,
	datad => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_sync\(2),
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_DATA6~regout\);

-- Location: LC_X71_Y45_N9
\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_WAIT_DATA7\ : stratix_lcell
-- Equation(s):
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_WAIT_DATA7~regout\ = DFFEAS((\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_DATA6~regout\) # 
-- ((\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_WAIT_DATA7~regout\ & ((\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_last~regout\) # (!\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_sync\(2))))), 
-- GLOBAL(\sys_clk~combout\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "eaee",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~combout\,
	dataa => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_DATA6~regout\,
	datab => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_WAIT_DATA7~regout\,
	datac => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_last~regout\,
	datad => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_sync\(2),
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_WAIT_DATA7~regout\);

-- Location: LC_X71_Y45_N0
\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_DATA7\ : stratix_lcell
-- Equation(s):
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_DATA7~regout\ = DFFEAS(((\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_WAIT_DATA7~regout\ & 
-- (!\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_last~regout\ & \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_sync\(2)))), GLOBAL(\sys_clk~combout\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0c00",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~combout\,
	datab => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_WAIT_DATA7~regout\,
	datac => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_last~regout\,
	datad => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_sync\(2),
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_DATA7~regout\);

-- Location: LC_X71_Y44_N7
\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_WAIT_PARITY\ : stratix_lcell
-- Equation(s):
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_WAIT_PARITY~regout\ = DFFEAS((\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_DATA7~regout\) # 
-- ((\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_WAIT_PARITY~regout\ & ((\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_last~regout\) # (!\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_sync\(2))))), 
-- GLOBAL(\sys_clk~combout\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "ecfc",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~combout\,
	dataa => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_last~regout\,
	datab => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_DATA7~regout\,
	datac => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_WAIT_PARITY~regout\,
	datad => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_sync\(2),
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_WAIT_PARITY~regout\);

-- Location: LC_X71_Y44_N5
\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_PARITY\ : stratix_lcell
-- Equation(s):
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_PARITY~regout\ = DFFEAS((!\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_last~regout\ & 
-- (((\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_WAIT_PARITY~regout\ & \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_sync\(2))))), GLOBAL(\sys_clk~combout\), 
-- !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "5000",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~combout\,
	dataa => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_last~regout\,
	datac => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_WAIT_PARITY~regout\,
	datad => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_sync\(2),
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_PARITY~regout\);

-- Location: LC_X71_Y44_N4
\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_WAIT_STOP\ : stratix_lcell
-- Equation(s):
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_WAIT_STOP~regout\ = DFFEAS((\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_PARITY~regout\) # 
-- ((\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_WAIT_STOP~regout\ & ((\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_last~regout\) # (!\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_sync\(2))))), 
-- GLOBAL(\sys_clk~combout\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "ecee",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~combout\,
	dataa => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_WAIT_STOP~regout\,
	datab => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_PARITY~regout\,
	datac => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_last~regout\,
	datad => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_sync\(2),
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_WAIT_STOP~regout\);

-- Location: LC_X71_Y44_N2
\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_STOP\ : stratix_lcell
-- Equation(s):
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_STOP~regout\ = DFFEAS((\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_WAIT_STOP~regout\ & 
-- (((!\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_last~regout\ & \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_sync\(2))))), GLOBAL(\sys_clk~combout\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0a00",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~combout\,
	dataa => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_WAIT_STOP~regout\,
	datac => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_last~regout\,
	datad => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_sync\(2),
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_STOP~regout\);

-- Location: LC_X71_Y44_N9
\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_WAIT_ACK1\ : stratix_lcell
-- Equation(s):
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_WAIT_ACK1~regout\ = DFFEAS((\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_STOP~regout\) # 
-- ((\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_WAIT_ACK1~regout\ & ((\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_last~regout\) # (!\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_sync\(2))))), 
-- GLOBAL(\sys_clk~combout\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "eaee",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~combout\,
	dataa => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_STOP~regout\,
	datab => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_WAIT_ACK1~regout\,
	datac => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_last~regout\,
	datad => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_sync\(2),
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_WAIT_ACK1~regout\);

-- Location: LC_X71_Y44_N6
\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_WAIT_ACK2\ : stratix_lcell
-- Equation(s):
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_WAIT_ACK2~regout\ = DFFEAS((\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_WAIT_ACK2~regout\ & 
-- (((\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_sync\(2)) # (!\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_last~regout\)))) # (!\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_WAIT_ACK2~regout\ & 
-- (\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_WAIT_ACK1~regout\ & (!\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_last~regout\ & \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_sync\(2)))), 
-- GLOBAL(\sys_clk~combout\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "ae0a",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~combout\,
	dataa => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_WAIT_ACK2~regout\,
	datab => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_WAIT_ACK1~regout\,
	datac => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_last~regout\,
	datad => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_sync\(2),
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_WAIT_ACK2~regout\);

-- Location: LC_X71_Y44_N8
\ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector5~7\ : stratix_lcell
-- Equation(s):
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector5~7_combout\ = ((\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_WAIT_ACK2~regout\ & (\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_last~regout\ & 
-- !\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_sync\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "00c0",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_WAIT_ACK2~regout\,
	datac => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_last~regout\,
	datad => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_sync\(2),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector5~7_combout\);

-- Location: LC_X72_Y45_N1
\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_data_sync[1]\ : stratix_lcell
-- Equation(s):
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_data_sync\(1) = DFFEAS((((!\ps2_data~0\))), GLOBAL(\sys_clk~combout\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "00ff",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~combout\,
	datad => \ps2_data~0\,
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_data_sync\(1));

-- Location: LC_X72_Y45_N3
\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_data_sync[2]\ : stratix_lcell
-- Equation(s):
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector5~5\ = (!\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.IDLE~regout\ & ((\ps2_keyboard_controller_inst|ps2_transceiver_inst|process_0~0\ & ((N1_ps2_data_sync[2]))) # 
-- (!\ps2_keyboard_controller_inst|ps2_transceiver_inst|process_0~0\ & (!\ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector0~2_combout\))))
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_data_sync\(2) = DFFEAS(\ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector5~5\, GLOBAL(\sys_clk~combout\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , 
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_data_sync\(1), , , VCC)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "00d1",
	operation_mode => "normal",
	output_mode => "reg_and_comb",
	register_cascade_mode => "off",
	sum_lutc_input => "qfbk",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~combout\,
	dataa => \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector0~2_combout\,
	datab => \ps2_keyboard_controller_inst|ps2_transceiver_inst|process_0~0\,
	datac => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_data_sync\(1),
	datad => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.IDLE~regout\,
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector5~5\,
	regout => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_data_sync\(2));

-- Location: LC_X72_Y45_N8
\ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector30~0\ : stratix_lcell
-- Equation(s):
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector30~0_combout\ = (\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_last~regout\ & (!\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_WAIT_ACK2~regout\ & 
-- (!\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_sync\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0202",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_last~regout\,
	datab => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_WAIT_ACK2~regout\,
	datac => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_sync\(2),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector30~0_combout\);

-- Location: LC_X72_Y45_N2
\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.RECEIVE_START\ : stratix_lcell
-- Equation(s):
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.RECEIVE_START~regout\ = DFFEAS((\ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector5~5\ & ((\ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector30~0_combout\) # 
-- ((\ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector3~1_combout\ & \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.RECEIVE_START~regout\)))) # (!\ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector5~5\ & 
-- (((\ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector3~1_combout\ & \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.RECEIVE_START~regout\)))), GLOBAL(\sys_clk~combout\), 
-- !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "f888",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~combout\,
	dataa => \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector5~5\,
	datab => \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector30~0_combout\,
	datac => \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector3~1_combout\,
	datad => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.RECEIVE_START~regout\,
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.RECEIVE_START~regout\);

-- Location: LC_X71_Y44_N3
\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.RECEIVE_WAIT_DATA0\ : stratix_lcell
-- Equation(s):
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.RECEIVE_WAIT_DATA0~regout\ = DFFEAS((\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.RECEIVE_START~regout\) # 
-- ((\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.RECEIVE_WAIT_DATA0~regout\ & ((\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_last~regout\) # (!\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_sync\(2))))), 
-- GLOBAL(\sys_clk~combout\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "ecee",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~combout\,
	dataa => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.RECEIVE_WAIT_DATA0~regout\,
	datab => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.RECEIVE_START~regout\,
	datac => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_last~regout\,
	datad => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_sync\(2),
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.RECEIVE_WAIT_DATA0~regout\);

-- Location: LC_X71_Y44_N0
\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.RECEIVE_DATA0\ : stratix_lcell
-- Equation(s):
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.RECEIVE_DATA0~regout\ = DFFEAS((!\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_last~regout\ & 
-- (((\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.RECEIVE_WAIT_DATA0~regout\ & \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_sync\(2))))), GLOBAL(\sys_clk~combout\), 
-- !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "5000",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~combout\,
	dataa => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_last~regout\,
	datac => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.RECEIVE_WAIT_DATA0~regout\,
	datad => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_sync\(2),
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.RECEIVE_DATA0~regout\);

-- Location: LC_X73_Y44_N1
\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.RECEIVE_WAIT_DATA1\ : stratix_lcell
-- Equation(s):
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.RECEIVE_WAIT_DATA1~regout\ = DFFEAS((\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.RECEIVE_DATA0~regout\) # 
-- ((\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.RECEIVE_WAIT_DATA1~regout\ & ((\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_last~regout\) # (!\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_sync\(2))))), 
-- GLOBAL(\sys_clk~combout\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "eafa",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~combout\,
	dataa => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.RECEIVE_DATA0~regout\,
	datab => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_last~regout\,
	datac => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.RECEIVE_WAIT_DATA1~regout\,
	datad => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_sync\(2),
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.RECEIVE_WAIT_DATA1~regout\);

-- Location: LC_X73_Y44_N9
\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.RECEIVE_DATA1\ : stratix_lcell
-- Equation(s):
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.RECEIVE_DATA1~regout\ = DFFEAS(((\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.RECEIVE_WAIT_DATA1~regout\ & 
-- (!\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_last~regout\ & \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_sync\(2)))), GLOBAL(\sys_clk~combout\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0c00",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~combout\,
	datab => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.RECEIVE_WAIT_DATA1~regout\,
	datac => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_last~regout\,
	datad => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_sync\(2),
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.RECEIVE_DATA1~regout\);

-- Location: LC_X73_Y44_N2
\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.RECEIVE_WAIT_DATA2\ : stratix_lcell
-- Equation(s):
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.RECEIVE_WAIT_DATA2~regout\ = DFFEAS((\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.RECEIVE_DATA1~regout\) # 
-- ((\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.RECEIVE_WAIT_DATA2~regout\ & ((\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_last~regout\) # (!\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_sync\(2))))), 
-- GLOBAL(\sys_clk~combout\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "ecee",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~combout\,
	dataa => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.RECEIVE_WAIT_DATA2~regout\,
	datab => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.RECEIVE_DATA1~regout\,
	datac => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_last~regout\,
	datad => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_sync\(2),
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.RECEIVE_WAIT_DATA2~regout\);

-- Location: LC_X73_Y44_N8
\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.RECEIVE_DATA2\ : stratix_lcell
-- Equation(s):
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.RECEIVE_DATA2~regout\ = DFFEAS((\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.RECEIVE_WAIT_DATA2~regout\ & 
-- (((!\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_last~regout\ & \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_sync\(2))))), GLOBAL(\sys_clk~combout\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0a00",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~combout\,
	dataa => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.RECEIVE_WAIT_DATA2~regout\,
	datac => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_last~regout\,
	datad => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_sync\(2),
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.RECEIVE_DATA2~regout\);

-- Location: LC_X73_Y44_N7
\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.RECEIVE_WAIT_DATA3\ : stratix_lcell
-- Equation(s):
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.RECEIVE_WAIT_DATA3~regout\ = DFFEAS((\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.RECEIVE_DATA2~regout\) # 
-- ((\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.RECEIVE_WAIT_DATA3~regout\ & ((\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_last~regout\) # (!\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_sync\(2))))), 
-- GLOBAL(\sys_clk~combout\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "ffa2",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~combout\,
	dataa => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.RECEIVE_WAIT_DATA3~regout\,
	datab => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_sync\(2),
	datac => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_last~regout\,
	datad => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.RECEIVE_DATA2~regout\,
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.RECEIVE_WAIT_DATA3~regout\);

-- Location: LC_X73_Y44_N6
\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.RECEIVE_DATA3\ : stratix_lcell
-- Equation(s):
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.RECEIVE_DATA3~regout\ = DFFEAS((\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.RECEIVE_WAIT_DATA3~regout\ & 
-- (((!\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_last~regout\ & \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_sync\(2))))), GLOBAL(\sys_clk~combout\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0a00",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~combout\,
	dataa => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.RECEIVE_WAIT_DATA3~regout\,
	datac => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_last~regout\,
	datad => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_sync\(2),
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.RECEIVE_DATA3~regout\);

-- Location: LC_X73_Y44_N0
\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.RECEIVE_WAIT_DATA4\ : stratix_lcell
-- Equation(s):
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.RECEIVE_WAIT_DATA4~regout\ = DFFEAS((\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.RECEIVE_DATA3~regout\) # 
-- ((\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.RECEIVE_WAIT_DATA4~regout\ & ((\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_last~regout\) # (!\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_sync\(2))))), 
-- GLOBAL(\sys_clk~combout\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "eaee",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~combout\,
	dataa => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.RECEIVE_DATA3~regout\,
	datab => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.RECEIVE_WAIT_DATA4~regout\,
	datac => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_last~regout\,
	datad => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_sync\(2),
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.RECEIVE_WAIT_DATA4~regout\);

-- Location: LC_X73_Y43_N7
\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.RECEIVE_DATA4\ : stratix_lcell
-- Equation(s):
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.RECEIVE_DATA4~regout\ = DFFEAS(((\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.RECEIVE_WAIT_DATA4~regout\ & 
-- (!\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_last~regout\ & \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_sync\(2)))), GLOBAL(\sys_clk~combout\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0c00",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~combout\,
	datab => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.RECEIVE_WAIT_DATA4~regout\,
	datac => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_last~regout\,
	datad => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_sync\(2),
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.RECEIVE_DATA4~regout\);

-- Location: LC_X73_Y43_N4
\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.RECEIVE_WAIT_DATA5\ : stratix_lcell
-- Equation(s):
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.RECEIVE_WAIT_DATA5~regout\ = DFFEAS((\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.RECEIVE_DATA4~regout\) # 
-- ((\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.RECEIVE_WAIT_DATA5~regout\ & ((\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_last~regout\) # (!\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_sync\(2))))), 
-- GLOBAL(\sys_clk~combout\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "fbaa",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~combout\,
	dataa => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.RECEIVE_DATA4~regout\,
	datab => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_sync\(2),
	datac => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_last~regout\,
	datad => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.RECEIVE_WAIT_DATA5~regout\,
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.RECEIVE_WAIT_DATA5~regout\);

-- Location: LC_X73_Y43_N9
\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.RECEIVE_DATA5\ : stratix_lcell
-- Equation(s):
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.RECEIVE_DATA5~regout\ = DFFEAS((\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.RECEIVE_WAIT_DATA5~regout\ & 
-- (((!\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_last~regout\ & \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_sync\(2))))), GLOBAL(\sys_clk~combout\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0a00",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~combout\,
	dataa => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.RECEIVE_WAIT_DATA5~regout\,
	datac => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_last~regout\,
	datad => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_sync\(2),
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.RECEIVE_DATA5~regout\);

-- Location: LC_X73_Y43_N3
\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.RECEIVE_WAIT_DATA6\ : stratix_lcell
-- Equation(s):
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.RECEIVE_WAIT_DATA6~regout\ = DFFEAS((\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.RECEIVE_DATA5~regout\) # 
-- ((\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.RECEIVE_WAIT_DATA6~regout\ & ((\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_last~regout\) # (!\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_sync\(2))))), 
-- GLOBAL(\sys_clk~combout\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "ecee",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~combout\,
	dataa => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.RECEIVE_WAIT_DATA6~regout\,
	datab => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.RECEIVE_DATA5~regout\,
	datac => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_last~regout\,
	datad => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_sync\(2),
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.RECEIVE_WAIT_DATA6~regout\);

-- Location: LC_X73_Y43_N8
\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.RECEIVE_DATA6\ : stratix_lcell
-- Equation(s):
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.RECEIVE_DATA6~regout\ = DFFEAS((\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.RECEIVE_WAIT_DATA6~regout\ & 
-- (((!\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_last~regout\ & \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_sync\(2))))), GLOBAL(\sys_clk~combout\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0a00",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~combout\,
	dataa => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.RECEIVE_WAIT_DATA6~regout\,
	datac => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_last~regout\,
	datad => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_sync\(2),
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.RECEIVE_DATA6~regout\);

-- Location: LC_X73_Y43_N5
\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.RECEIVE_WAIT_DATA7\ : stratix_lcell
-- Equation(s):
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.RECEIVE_WAIT_DATA7~regout\ = DFFEAS((\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.RECEIVE_DATA6~regout\) # 
-- ((\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.RECEIVE_WAIT_DATA7~regout\ & ((\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_last~regout\) # (!\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_sync\(2))))), 
-- GLOBAL(\sys_clk~combout\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "eaee",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~combout\,
	dataa => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.RECEIVE_DATA6~regout\,
	datab => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.RECEIVE_WAIT_DATA7~regout\,
	datac => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_last~regout\,
	datad => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_sync\(2),
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.RECEIVE_WAIT_DATA7~regout\);

-- Location: LC_X73_Y43_N6
\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.RECEIVE_DATA7\ : stratix_lcell
-- Equation(s):
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.RECEIVE_DATA7~regout\ = DFFEAS(((\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.RECEIVE_WAIT_DATA7~regout\ & 
-- (!\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_last~regout\ & \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_sync\(2)))), GLOBAL(\sys_clk~combout\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0c00",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~combout\,
	datab => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.RECEIVE_WAIT_DATA7~regout\,
	datac => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_last~regout\,
	datad => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_sync\(2),
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.RECEIVE_DATA7~regout\);

-- Location: LC_X73_Y43_N0
\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.RECEIVE_WAIT_PARITY\ : stratix_lcell
-- Equation(s):
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.RECEIVE_WAIT_PARITY~regout\ = DFFEAS((\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.RECEIVE_DATA7~regout\) # 
-- ((\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.RECEIVE_WAIT_PARITY~regout\ & ((\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_last~regout\) # 
-- (!\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_sync\(2))))), GLOBAL(\sys_clk~combout\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "eaee",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~combout\,
	dataa => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.RECEIVE_DATA7~regout\,
	datab => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.RECEIVE_WAIT_PARITY~regout\,
	datac => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_last~regout\,
	datad => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_sync\(2),
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.RECEIVE_WAIT_PARITY~regout\);

-- Location: LC_X73_Y45_N6
\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.RECEIVE_PARITY\ : stratix_lcell
-- Equation(s):
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.RECEIVE_PARITY~regout\ = DFFEAS(((\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.RECEIVE_WAIT_PARITY~regout\ & 
-- (!\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_last~regout\ & \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_sync\(2)))), GLOBAL(\sys_clk~combout\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0c00",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~combout\,
	datab => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.RECEIVE_WAIT_PARITY~regout\,
	datac => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_last~regout\,
	datad => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_sync\(2),
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.RECEIVE_PARITY~regout\);

-- Location: LC_X73_Y45_N4
\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.RECEIVE_WAIT_STOP\ : stratix_lcell
-- Equation(s):
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.RECEIVE_WAIT_STOP~regout\ = DFFEAS((\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.RECEIVE_PARITY~regout\) # 
-- ((\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.RECEIVE_WAIT_STOP~regout\ & ((\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_last~regout\) # (!\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_sync\(2))))), 
-- GLOBAL(\sys_clk~combout\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "ecee",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~combout\,
	dataa => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.RECEIVE_WAIT_STOP~regout\,
	datab => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.RECEIVE_PARITY~regout\,
	datac => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_last~regout\,
	datad => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_sync\(2),
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.RECEIVE_WAIT_STOP~regout\);

-- Location: LC_X73_Y45_N2
\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.RECEIVE_STOP\ : stratix_lcell
-- Equation(s):
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.RECEIVE_STOP~regout\ = DFFEAS((\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.RECEIVE_WAIT_STOP~regout\ & 
-- (((!\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_last~regout\ & \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_sync\(2))))), GLOBAL(\sys_clk~combout\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0a00",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~combout\,
	dataa => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.RECEIVE_WAIT_STOP~regout\,
	datac => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_last~regout\,
	datad => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_sync\(2),
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.RECEIVE_STOP~regout\);

-- Location: LC_X73_Y46_N5
\ps2_keyboard_controller_inst|ps2_transceiver_inst|new_data\ : stratix_lcell
-- Equation(s):
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|new_data~regout\ = DFFEAS(GND, GLOBAL(\sys_clk~combout\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , 
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.RECEIVE_STOP~regout\, , , VCC)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~combout\,
	datac => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.RECEIVE_STOP~regout\,
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \ps2_keyboard_controller_inst|ps2_transceiver_inst|new_data~regout\);

-- Location: LC_X72_Y46_N1
\ps2_keyboard_controller_inst|Selector4~0\ : stratix_lcell
-- Equation(s):
-- \ps2_keyboard_controller_inst|Selector4~0_combout\ = (((\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_READ_ACK~regout\ & \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_data_sync\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "f000",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datac => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_READ_ACK~regout\,
	datad => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_data_sync\(2),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \ps2_keyboard_controller_inst|Selector4~0_combout\);

-- Location: LC_X72_Y46_N9
\ps2_keyboard_controller_inst|keyboard_state.INIT\ : stratix_lcell
-- Equation(s):
-- \ps2_keyboard_controller_inst|keyboard_state.INIT~regout\ = DFFEAS((((\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_READ_ACK~regout\) # (\ps2_keyboard_controller_inst|keyboard_state.INIT~regout\))), 
-- GLOBAL(\sys_clk~combout\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "fff0",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~combout\,
	datac => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_READ_ACK~regout\,
	datad => \ps2_keyboard_controller_inst|keyboard_state.INIT~regout\,
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \ps2_keyboard_controller_inst|keyboard_state.INIT~regout\);

-- Location: LC_X72_Y46_N5
\ps2_keyboard_controller_inst|keyboard_state.INIT_WAIT_ACK\ : stratix_lcell
-- Equation(s):
-- \ps2_keyboard_controller_inst|keyboard_state.INIT_WAIT_ACK~regout\ = DFFEAS((\ps2_keyboard_controller_inst|ps2_transceiver_inst|new_data~regout\ & (((\ps2_keyboard_controller_inst|Selector4~0_combout\ & 
-- !\ps2_keyboard_controller_inst|keyboard_state.INIT~regout\)))) # (!\ps2_keyboard_controller_inst|ps2_transceiver_inst|new_data~regout\ & ((\ps2_keyboard_controller_inst|keyboard_state.INIT_WAIT_ACK~regout\) # 
-- ((\ps2_keyboard_controller_inst|Selector4~0_combout\ & !\ps2_keyboard_controller_inst|keyboard_state.INIT~regout\)))), GLOBAL(\sys_clk~combout\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "44f4",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~combout\,
	dataa => \ps2_keyboard_controller_inst|ps2_transceiver_inst|new_data~regout\,
	datab => \ps2_keyboard_controller_inst|keyboard_state.INIT_WAIT_ACK~regout\,
	datac => \ps2_keyboard_controller_inst|Selector4~0_combout\,
	datad => \ps2_keyboard_controller_inst|keyboard_state.INIT~regout\,
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \ps2_keyboard_controller_inst|keyboard_state.INIT_WAIT_ACK~regout\);

-- Location: LC_X73_Y43_N1
\ps2_keyboard_controller_inst|ps2_transceiver_inst|WideOr32~1\ : stratix_lcell
-- Equation(s):
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|WideOr32~1_combout\ = (\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.RECEIVE_DATA6~regout\) # 
-- ((\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.RECEIVE_DATA7~regout\) # ((\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.RECEIVE_DATA4~regout\) # 
-- (\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.RECEIVE_DATA5~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "fffe",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.RECEIVE_DATA6~regout\,
	datab => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.RECEIVE_DATA7~regout\,
	datac => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.RECEIVE_DATA4~regout\,
	datad => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.RECEIVE_DATA5~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \ps2_keyboard_controller_inst|ps2_transceiver_inst|WideOr32~1_combout\);

-- Location: LC_X73_Y44_N4
\ps2_keyboard_controller_inst|ps2_transceiver_inst|WideOr32~0\ : stratix_lcell
-- Equation(s):
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|WideOr32~0_combout\ = (((\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.RECEIVE_DATA0~regout\) # 
-- (\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.RECEIVE_DATA1~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "fff0",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datac => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.RECEIVE_DATA0~regout\,
	datad => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.RECEIVE_DATA1~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \ps2_keyboard_controller_inst|ps2_transceiver_inst|WideOr32~0_combout\);

-- Location: LC_X73_Y44_N5
\ps2_keyboard_controller_inst|ps2_transceiver_inst|WideOr32\ : stratix_lcell
-- Equation(s):
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|WideOr32~combout\ = (\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.RECEIVE_DATA2~regout\) # 
-- ((\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.RECEIVE_DATA3~regout\) # ((\ps2_keyboard_controller_inst|ps2_transceiver_inst|WideOr32~1_combout\) # (\ps2_keyboard_controller_inst|ps2_transceiver_inst|WideOr32~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "fffe",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.RECEIVE_DATA2~regout\,
	datab => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.RECEIVE_DATA3~regout\,
	datac => \ps2_keyboard_controller_inst|ps2_transceiver_inst|WideOr32~1_combout\,
	datad => \ps2_keyboard_controller_inst|ps2_transceiver_inst|WideOr32~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \ps2_keyboard_controller_inst|ps2_transceiver_inst|WideOr32~combout\);

-- Location: LC_X73_Y46_N1
\ps2_keyboard_controller_inst|ps2_transceiver_inst|output_data_internal[7]\ : stratix_lcell
-- Equation(s):
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|output_data_internal\(7) = DFFEAS((((!\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_data_sync\(2)))), GLOBAL(\sys_clk~combout\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , 
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|WideOr32~combout\, , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "00ff",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~combout\,
	datad => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_data_sync\(2),
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	ena => \ps2_keyboard_controller_inst|ps2_transceiver_inst|WideOr32~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \ps2_keyboard_controller_inst|ps2_transceiver_inst|output_data_internal\(7));

-- Location: LC_X73_Y46_N4
\ps2_keyboard_controller_inst|ps2_transceiver_inst|output_data_internal[5]\ : stratix_lcell
-- Equation(s):
-- \ps2_keyboard_controller_inst|Selector3~0\ = (!\ps2_keyboard_controller_inst|ps2_transceiver_inst|output_data_internal\(2) & (\ps2_keyboard_controller_inst|ps2_transceiver_inst|output_data_internal\(7) & (N1_output_data_internal[5] & 
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|output_data_internal\(3))))
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|output_data_internal\(5) = DFFEAS(\ps2_keyboard_controller_inst|Selector3~0\, GLOBAL(\sys_clk~combout\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , 
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|WideOr32~combout\, \ps2_keyboard_controller_inst|ps2_transceiver_inst|output_data_internal\(6), , , VCC)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "4000",
	operation_mode => "normal",
	output_mode => "reg_and_comb",
	register_cascade_mode => "off",
	sum_lutc_input => "qfbk",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~combout\,
	dataa => \ps2_keyboard_controller_inst|ps2_transceiver_inst|output_data_internal\(2),
	datab => \ps2_keyboard_controller_inst|ps2_transceiver_inst|output_data_internal\(7),
	datac => \ps2_keyboard_controller_inst|ps2_transceiver_inst|output_data_internal\(6),
	datad => \ps2_keyboard_controller_inst|ps2_transceiver_inst|output_data_internal\(3),
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	sload => VCC,
	ena => \ps2_keyboard_controller_inst|ps2_transceiver_inst|WideOr32~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \ps2_keyboard_controller_inst|Selector3~0\,
	regout => \ps2_keyboard_controller_inst|ps2_transceiver_inst|output_data_internal\(5));

-- Location: LC_X73_Y46_N2
\ps2_keyboard_controller_inst|ps2_transceiver_inst|output_data_internal[4]\ : stratix_lcell
-- Equation(s):
-- \ps2_keyboard_controller_inst|keyboard_state_next~12\ = (((!\ps2_keyboard_controller_inst|Selector3~1\) # (!N1_output_data_internal[4]))) # (!\ps2_keyboard_controller_inst|ps2_transceiver_inst|output_data_internal\(6))
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|output_data_internal\(4) = DFFEAS(\ps2_keyboard_controller_inst|keyboard_state_next~12\, GLOBAL(\sys_clk~combout\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , 
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|WideOr32~combout\, \ps2_keyboard_controller_inst|ps2_transceiver_inst|output_data_internal\(5), , , VCC)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "5fff",
	operation_mode => "normal",
	output_mode => "reg_and_comb",
	register_cascade_mode => "off",
	sum_lutc_input => "qfbk",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~combout\,
	dataa => \ps2_keyboard_controller_inst|ps2_transceiver_inst|output_data_internal\(6),
	datac => \ps2_keyboard_controller_inst|ps2_transceiver_inst|output_data_internal\(5),
	datad => \ps2_keyboard_controller_inst|Selector3~1\,
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	sload => VCC,
	ena => \ps2_keyboard_controller_inst|ps2_transceiver_inst|WideOr32~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \ps2_keyboard_controller_inst|keyboard_state_next~12\,
	regout => \ps2_keyboard_controller_inst|ps2_transceiver_inst|output_data_internal\(4));

-- Location: LC_X72_Y46_N0
\ps2_keyboard_controller_inst|keyboard_state.INIT_WAIT_BAT\ : stratix_lcell
-- Equation(s):
-- \ps2_keyboard_controller_inst|keyboard_state.INIT_WAIT_BAT~regout\ = DFFEAS((\ps2_keyboard_controller_inst|ps2_transceiver_inst|new_data~regout\ & (((\ps2_keyboard_controller_inst|keyboard_state.INIT_WAIT_ACK~regout\ & 
-- !\ps2_keyboard_controller_inst|keyboard_state_next~12\)))) # (!\ps2_keyboard_controller_inst|ps2_transceiver_inst|new_data~regout\ & ((\ps2_keyboard_controller_inst|keyboard_state.INIT_WAIT_BAT~regout\) # 
-- ((\ps2_keyboard_controller_inst|keyboard_state.INIT_WAIT_ACK~regout\ & !\ps2_keyboard_controller_inst|keyboard_state_next~12\)))), GLOBAL(\sys_clk~combout\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "44f4",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~combout\,
	dataa => \ps2_keyboard_controller_inst|ps2_transceiver_inst|new_data~regout\,
	datab => \ps2_keyboard_controller_inst|keyboard_state.INIT_WAIT_BAT~regout\,
	datac => \ps2_keyboard_controller_inst|keyboard_state.INIT_WAIT_ACK~regout\,
	datad => \ps2_keyboard_controller_inst|keyboard_state_next~12\,
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \ps2_keyboard_controller_inst|keyboard_state.INIT_WAIT_BAT~regout\);

-- Location: LC_X73_Y46_N3
\ps2_keyboard_controller_inst|ps2_transceiver_inst|output_data_internal[6]\ : stratix_lcell
-- Equation(s):
-- \ps2_keyboard_controller_inst|Selector3~2\ = (\ps2_keyboard_controller_inst|keyboard_state.INIT_WAIT_BAT~regout\ & (((!N1_output_data_internal[6] & !\ps2_keyboard_controller_inst|ps2_transceiver_inst|output_data_internal\(4)))))
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|output_data_internal\(6) = DFFEAS(\ps2_keyboard_controller_inst|Selector3~2\, GLOBAL(\sys_clk~combout\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , 
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|WideOr32~combout\, \ps2_keyboard_controller_inst|ps2_transceiver_inst|output_data_internal\(7), , , VCC)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "000a",
	operation_mode => "normal",
	output_mode => "reg_and_comb",
	register_cascade_mode => "off",
	sum_lutc_input => "qfbk",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~combout\,
	dataa => \ps2_keyboard_controller_inst|keyboard_state.INIT_WAIT_BAT~regout\,
	datac => \ps2_keyboard_controller_inst|ps2_transceiver_inst|output_data_internal\(7),
	datad => \ps2_keyboard_controller_inst|ps2_transceiver_inst|output_data_internal\(4),
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	sload => VCC,
	ena => \ps2_keyboard_controller_inst|ps2_transceiver_inst|WideOr32~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \ps2_keyboard_controller_inst|Selector3~2\,
	regout => \ps2_keyboard_controller_inst|ps2_transceiver_inst|output_data_internal\(6));

-- Location: LC_X73_Y46_N9
\ps2_keyboard_controller_inst|ps2_transceiver_inst|output_data_internal[3]\ : stratix_lcell
-- Equation(s):
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|output_data_internal\(3) = DFFEAS((((\ps2_keyboard_controller_inst|ps2_transceiver_inst|output_data_internal\(4)))), GLOBAL(\sys_clk~combout\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , 
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|WideOr32~combout\, , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "ff00",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~combout\,
	datad => \ps2_keyboard_controller_inst|ps2_transceiver_inst|output_data_internal\(4),
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	ena => \ps2_keyboard_controller_inst|ps2_transceiver_inst|WideOr32~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \ps2_keyboard_controller_inst|ps2_transceiver_inst|output_data_internal\(3));

-- Location: LC_X73_Y46_N6
\ps2_keyboard_controller_inst|ps2_transceiver_inst|output_data_internal[2]\ : stratix_lcell
-- Equation(s):
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|output_data_internal\(2) = DFFEAS((((\ps2_keyboard_controller_inst|ps2_transceiver_inst|output_data_internal\(3)))), GLOBAL(\sys_clk~combout\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , 
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|WideOr32~combout\, , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "ff00",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~combout\,
	datad => \ps2_keyboard_controller_inst|ps2_transceiver_inst|output_data_internal\(3),
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	ena => \ps2_keyboard_controller_inst|ps2_transceiver_inst|WideOr32~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \ps2_keyboard_controller_inst|ps2_transceiver_inst|output_data_internal\(2));

-- Location: LC_X73_Y46_N7
\ps2_keyboard_controller_inst|ps2_transceiver_inst|output_data_internal[1]\ : stratix_lcell
-- Equation(s):
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|output_data_internal\(1) = DFFEAS((((\ps2_keyboard_controller_inst|ps2_transceiver_inst|output_data_internal\(2)))), GLOBAL(\sys_clk~combout\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , 
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|WideOr32~combout\, , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "ff00",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~combout\,
	datad => \ps2_keyboard_controller_inst|ps2_transceiver_inst|output_data_internal\(2),
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	ena => \ps2_keyboard_controller_inst|ps2_transceiver_inst|WideOr32~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \ps2_keyboard_controller_inst|ps2_transceiver_inst|output_data_internal\(1));

-- Location: LC_X73_Y46_N8
\ps2_keyboard_controller_inst|ps2_transceiver_inst|output_data_internal[0]\ : stratix_lcell
-- Equation(s):
-- \ps2_keyboard_controller_inst|Selector3~1\ = (\ps2_keyboard_controller_inst|ps2_transceiver_inst|output_data_internal\(1) & (\ps2_keyboard_controller_inst|ps2_transceiver_inst|new_data~regout\ & (!N1_output_data_internal[0] & 
-- \ps2_keyboard_controller_inst|Selector3~0\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0800",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "qfbk",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~combout\,
	dataa => \ps2_keyboard_controller_inst|ps2_transceiver_inst|output_data_internal\(1),
	datab => \ps2_keyboard_controller_inst|ps2_transceiver_inst|new_data~regout\,
	datac => \ps2_keyboard_controller_inst|ps2_transceiver_inst|output_data_internal\(1),
	datad => \ps2_keyboard_controller_inst|Selector3~0\,
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	sload => VCC,
	ena => \ps2_keyboard_controller_inst|ps2_transceiver_inst|WideOr32~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \ps2_keyboard_controller_inst|Selector3~1\,
	regout => \ps2_keyboard_controller_inst|ps2_transceiver_inst|output_data_internal\(0));

-- Location: LC_X72_Y46_N4
\ps2_keyboard_controller_inst|keyboard_state.SET_INDICATORS_CMD\ : stratix_lcell
-- Equation(s):
-- \ps2_keyboard_controller_inst|keyboard_state.SET_INDICATORS_CMD~regout\ = DFFEAS((\ps2_keyboard_controller_inst|keyboard_state.SET_INDICATORS_CMD~regout\ & (((\ps2_keyboard_controller_inst|Selector3~1\ & \ps2_keyboard_controller_inst|Selector3~2\)) # 
-- (!\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_READ_ACK~regout\))) # (!\ps2_keyboard_controller_inst|keyboard_state.SET_INDICATORS_CMD~regout\ & (((\ps2_keyboard_controller_inst|Selector3~1\ & 
-- \ps2_keyboard_controller_inst|Selector3~2\)))), GLOBAL(\sys_clk~combout\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "f222",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~combout\,
	dataa => \ps2_keyboard_controller_inst|keyboard_state.SET_INDICATORS_CMD~regout\,
	datab => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_READ_ACK~regout\,
	datac => \ps2_keyboard_controller_inst|Selector3~1\,
	datad => \ps2_keyboard_controller_inst|Selector3~2\,
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \ps2_keyboard_controller_inst|keyboard_state.SET_INDICATORS_CMD~regout\);

-- Location: LC_X72_Y46_N3
\ps2_keyboard_controller_inst|keyboard_state.SET_INDICATORS_VALUE_WAIT_ACK\ : stratix_lcell
-- Equation(s):
-- \ps2_keyboard_controller_inst|keyboard_state.SET_INDICATORS_VALUE_WAIT_ACK~regout\ = DFFEAS((\ps2_keyboard_controller_inst|keyboard_state.SET_INDICATORS_VALUE~regout\ & ((\ps2_keyboard_controller_inst|Selector4~0_combout\) # 
-- ((\ps2_keyboard_controller_inst|keyboard_state.SET_INDICATORS_VALUE_WAIT_ACK~regout\ & !\ps2_keyboard_controller_inst|ps2_transceiver_inst|new_data~regout\)))) # (!\ps2_keyboard_controller_inst|keyboard_state.SET_INDICATORS_VALUE~regout\ & 
-- (((\ps2_keyboard_controller_inst|keyboard_state.SET_INDICATORS_VALUE_WAIT_ACK~regout\ & !\ps2_keyboard_controller_inst|ps2_transceiver_inst|new_data~regout\)))), GLOBAL(\sys_clk~combout\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , , , , 
-- )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "88f8",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~combout\,
	dataa => \ps2_keyboard_controller_inst|keyboard_state.SET_INDICATORS_VALUE~regout\,
	datab => \ps2_keyboard_controller_inst|Selector4~0_combout\,
	datac => \ps2_keyboard_controller_inst|keyboard_state.SET_INDICATORS_VALUE_WAIT_ACK~regout\,
	datad => \ps2_keyboard_controller_inst|ps2_transceiver_inst|new_data~regout\,
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \ps2_keyboard_controller_inst|keyboard_state.SET_INDICATORS_VALUE_WAIT_ACK~regout\);

-- Location: LC_X72_Y46_N6
\ps2_keyboard_controller_inst|keyboard_state.ENABLE\ : stratix_lcell
-- Equation(s):
-- \ps2_keyboard_controller_inst|keyboard_state.ENABLE~regout\ = DFFEAS((\ps2_keyboard_controller_inst|keyboard_state.SET_INDICATORS_VALUE_WAIT_ACK~regout\ & (((\ps2_keyboard_controller_inst|keyboard_state.ENABLE~regout\ & 
-- !\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_READ_ACK~regout\)) # (!\ps2_keyboard_controller_inst|keyboard_state_next~12\))) # (!\ps2_keyboard_controller_inst|keyboard_state.SET_INDICATORS_VALUE_WAIT_ACK~regout\ & 
-- (\ps2_keyboard_controller_inst|keyboard_state.ENABLE~regout\ & (!\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_READ_ACK~regout\))), GLOBAL(\sys_clk~combout\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , , , 
-- , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0cae",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~combout\,
	dataa => \ps2_keyboard_controller_inst|keyboard_state.SET_INDICATORS_VALUE_WAIT_ACK~regout\,
	datab => \ps2_keyboard_controller_inst|keyboard_state.ENABLE~regout\,
	datac => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_READ_ACK~regout\,
	datad => \ps2_keyboard_controller_inst|keyboard_state_next~12\,
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \ps2_keyboard_controller_inst|keyboard_state.ENABLE~regout\);

-- Location: LC_X72_Y46_N2
\ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector0~2\ : stratix_lcell
-- Equation(s):
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector0~2_combout\ = (!\ps2_keyboard_controller_inst|keyboard_state.SET_INDICATORS_CMD~regout\ & (!\ps2_keyboard_controller_inst|keyboard_state.ENABLE~regout\ & 
-- (!\ps2_keyboard_controller_inst|keyboard_state.SET_INDICATORS_VALUE~regout\ & \ps2_keyboard_controller_inst|keyboard_state.INIT~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ps2_keyboard_controller_inst|keyboard_state.SET_INDICATORS_CMD~regout\,
	datab => \ps2_keyboard_controller_inst|keyboard_state.ENABLE~regout\,
	datac => \ps2_keyboard_controller_inst|keyboard_state.SET_INDICATORS_VALUE~regout\,
	datad => \ps2_keyboard_controller_inst|keyboard_state.INIT~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector0~2_combout\);

-- Location: LC_X72_Y45_N7
\ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector0~4\ : stratix_lcell
-- Equation(s):
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector0~4_combout\ = (\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_sync\(2) & (((\ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector0~2_combout\)))) # 
-- (!\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_sync\(2) & ((\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_last~regout\ & (!\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_data_sync\(2))) # 
-- (!\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_last~regout\ & ((\ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector0~2_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "df10",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_data_sync\(2),
	datab => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_sync\(2),
	datac => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_last~regout\,
	datad => \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector0~4_combout\);

-- Location: LC_X72_Y45_N5
\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_FINISH\ : stratix_lcell
-- Equation(s):
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_FINISH~regout\ = DFFEAS(GND, GLOBAL(\sys_clk~combout\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , 
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_READ_ACK~regout\, , , VCC)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~combout\,
	datac => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_READ_ACK~regout\,
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_FINISH~regout\);

-- Location: LC_X72_Y45_N6
\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.IDLE\ : stratix_lcell
-- Equation(s):
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.IDLE~regout\ = DFFEAS((!\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_FINISH~regout\ & 
-- (!\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.RECEIVE_STOP~regout\ & ((\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.IDLE~regout\) # 
-- (!\ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector0~4_combout\)))), GLOBAL(\sys_clk~combout\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "000d",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~combout\,
	dataa => \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector0~4_combout\,
	datab => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.IDLE~regout\,
	datac => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_FINISH~regout\,
	datad => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.RECEIVE_STOP~regout\,
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.IDLE~regout\);

-- Location: LC_X72_Y44_N2
\ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector5~3\ : stratix_lcell
-- Equation(s):
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector5~3_combout\ = (\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.IDLE~regout\ & 
-- (!\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_WAIT_ACK2~regout\ & (!\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.PREPARE_SEND_WAIT2~regout\ & 
-- !\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.PREPARE_SEND_WAIT1~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0002",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.IDLE~regout\,
	datab => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_WAIT_ACK2~regout\,
	datac => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.PREPARE_SEND_WAIT2~regout\,
	datad => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.PREPARE_SEND_WAIT1~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector5~3_combout\);

-- Location: LC_X72_Y44_N7
\ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector5~6\ : stratix_lcell
-- Equation(s):
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector5~6_combout\ = (!\ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector5~5\ & (!\ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector5~4_combout\ & 
-- ((!\ps2_keyboard_controller_inst|ps2_transceiver_inst|process_0~1\) # (!\ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector5~3_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0103",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector5~3_combout\,
	datab => \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector5~5\,
	datac => \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector5~4_combout\,
	datad => \ps2_keyboard_controller_inst|ps2_transceiver_inst|process_0~1\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector5~6_combout\);

-- Location: LC_X73_Y44_N3
\ps2_keyboard_controller_inst|ps2_transceiver_inst|WideOr1~4\ : stratix_lcell
-- Equation(s):
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|WideOr1~4_combout\ = (\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.RECEIVE_WAIT_DATA2~regout\) # 
-- ((\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.RECEIVE_WAIT_DATA1~regout\) # ((\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.RECEIVE_WAIT_DATA3~regout\) # 
-- (\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.RECEIVE_WAIT_DATA4~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "fffe",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.RECEIVE_WAIT_DATA2~regout\,
	datab => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.RECEIVE_WAIT_DATA1~regout\,
	datac => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.RECEIVE_WAIT_DATA3~regout\,
	datad => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.RECEIVE_WAIT_DATA4~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \ps2_keyboard_controller_inst|ps2_transceiver_inst|WideOr1~4_combout\);

-- Location: LC_X73_Y43_N2
\ps2_keyboard_controller_inst|ps2_transceiver_inst|WideOr1~5\ : stratix_lcell
-- Equation(s):
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|WideOr1~5_combout\ = (\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.RECEIVE_WAIT_DATA5~regout\) # 
-- ((\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.RECEIVE_WAIT_DATA7~regout\) # ((\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.RECEIVE_WAIT_DATA6~regout\) # 
-- (\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.RECEIVE_WAIT_PARITY~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "fffe",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.RECEIVE_WAIT_DATA5~regout\,
	datab => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.RECEIVE_WAIT_DATA7~regout\,
	datac => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.RECEIVE_WAIT_DATA6~regout\,
	datad => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.RECEIVE_WAIT_PARITY~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \ps2_keyboard_controller_inst|ps2_transceiver_inst|WideOr1~5_combout\);

-- Location: LC_X71_Y45_N7
\ps2_keyboard_controller_inst|ps2_transceiver_inst|WideOr1~1\ : stratix_lcell
-- Equation(s):
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|WideOr1~1_combout\ = (\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_WAIT_DATA6~regout\) # 
-- ((\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_WAIT_DATA7~regout\) # ((\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_WAIT_DATA4~regout\) # 
-- (\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_WAIT_DATA5~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "fffe",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_WAIT_DATA6~regout\,
	datab => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_WAIT_DATA7~regout\,
	datac => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_WAIT_DATA4~regout\,
	datad => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_WAIT_DATA5~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \ps2_keyboard_controller_inst|ps2_transceiver_inst|WideOr1~1_combout\);

-- Location: LC_X71_Y44_N1
\ps2_keyboard_controller_inst|ps2_transceiver_inst|WideOr1~2\ : stratix_lcell
-- Equation(s):
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|WideOr1~2_combout\ = (\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_WAIT_PARITY~regout\) # 
-- ((\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_WAIT_ACK1~regout\) # ((\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.RECEIVE_WAIT_DATA0~regout\) # 
-- (\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_WAIT_STOP~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "fffe",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_WAIT_PARITY~regout\,
	datab => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_WAIT_ACK1~regout\,
	datac => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.RECEIVE_WAIT_DATA0~regout\,
	datad => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_WAIT_STOP~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \ps2_keyboard_controller_inst|ps2_transceiver_inst|WideOr1~2_combout\);

-- Location: LC_X70_Y45_N3
\ps2_keyboard_controller_inst|ps2_transceiver_inst|WideOr1~0\ : stratix_lcell
-- Equation(s):
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|WideOr1~0_combout\ = (\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_WAIT_DATA1~regout\) # 
-- ((\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_WAIT_DATA0~regout\) # ((\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_WAIT_DATA2~regout\) # 
-- (\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_WAIT_DATA3~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "fffe",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_WAIT_DATA1~regout\,
	datab => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_WAIT_DATA0~regout\,
	datac => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_WAIT_DATA2~regout\,
	datad => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_WAIT_DATA3~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \ps2_keyboard_controller_inst|ps2_transceiver_inst|WideOr1~0_combout\);

-- Location: LC_X71_Y45_N4
\ps2_keyboard_controller_inst|ps2_transceiver_inst|WideOr1~3\ : stratix_lcell
-- Equation(s):
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|WideOr1~3_combout\ = (\ps2_keyboard_controller_inst|ps2_transceiver_inst|WideOr1~1_combout\) # ((\ps2_keyboard_controller_inst|ps2_transceiver_inst|WideOr1~2_combout\) # 
-- ((\ps2_keyboard_controller_inst|ps2_transceiver_inst|WideOr1~0_combout\) # (!\ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector5~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "feff",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ps2_keyboard_controller_inst|ps2_transceiver_inst|WideOr1~1_combout\,
	datab => \ps2_keyboard_controller_inst|ps2_transceiver_inst|WideOr1~2_combout\,
	datac => \ps2_keyboard_controller_inst|ps2_transceiver_inst|WideOr1~0_combout\,
	datad => \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector5~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \ps2_keyboard_controller_inst|ps2_transceiver_inst|WideOr1~3_combout\);

-- Location: LC_X73_Y45_N0
\ps2_keyboard_controller_inst|ps2_transceiver_inst|WideOr1~6\ : stratix_lcell
-- Equation(s):
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|WideOr1~6_combout\ = (\ps2_keyboard_controller_inst|ps2_transceiver_inst|WideOr1~4_combout\) # ((\ps2_keyboard_controller_inst|ps2_transceiver_inst|WideOr1~5_combout\) # 
-- ((\ps2_keyboard_controller_inst|ps2_transceiver_inst|WideOr1~3_combout\) # (\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.RECEIVE_WAIT_STOP~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "fffe",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ps2_keyboard_controller_inst|ps2_transceiver_inst|WideOr1~4_combout\,
	datab => \ps2_keyboard_controller_inst|ps2_transceiver_inst|WideOr1~5_combout\,
	datac => \ps2_keyboard_controller_inst|ps2_transceiver_inst|WideOr1~3_combout\,
	datad => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.RECEIVE_WAIT_STOP~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \ps2_keyboard_controller_inst|ps2_transceiver_inst|WideOr1~6_combout\);

-- Location: LC_X72_Y44_N0
\ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector3~1\ : stratix_lcell
-- Equation(s):
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector3~1_combout\ = (!\ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector5~2_combout\ & (!\ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector5~7_combout\ & 
-- (\ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector5~6_combout\ & \ps2_keyboard_controller_inst|ps2_transceiver_inst|WideOr1~6_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector5~2_combout\,
	datab => \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector5~7_combout\,
	datac => \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector5~6_combout\,
	datad => \ps2_keyboard_controller_inst|ps2_transceiver_inst|WideOr1~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector3~1_combout\);

-- Location: LC_X72_Y45_N4
\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.PREPARE_SEND_ASSIGN_CLK\ : stratix_lcell
-- Equation(s):
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.PREPARE_SEND_ASSIGN_CLK~regout\ = DFFEAS((\ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector3~1_combout\ & 
-- ((\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.PREPARE_SEND_ASSIGN_CLK~regout\) # ((!\ps2_keyboard_controller_inst|ps2_transceiver_inst|process_0~0\ & \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector5~5\)))) # 
-- (!\ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector3~1_combout\ & (!\ps2_keyboard_controller_inst|ps2_transceiver_inst|process_0~0\ & ((\ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector5~5\)))), GLOBAL(\sys_clk~combout\), 
-- !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "b3a0",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~combout\,
	dataa => \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector3~1_combout\,
	datab => \ps2_keyboard_controller_inst|ps2_transceiver_inst|process_0~0\,
	datac => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.PREPARE_SEND_ASSIGN_CLK~regout\,
	datad => \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector5~5\,
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.PREPARE_SEND_ASSIGN_CLK~regout\);

-- Location: LC_X74_Y44_N4
\ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector56~0\ : stratix_lcell
-- Equation(s):
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector56~0_combout\ = (((!\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.PREPARE_SEND_ASSIGN_CLK~regout\ & 
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1\(12))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0f00",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datac => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.PREPARE_SEND_ASSIGN_CLK~regout\,
	datad => \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1\(12),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector56~0_combout\);

-- Location: LC_X74_Y44_N1
\ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector58~0\ : stratix_lcell
-- Equation(s):
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector58~0_combout\ = (((!\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.PREPARE_SEND_ASSIGN_CLK~regout\ & 
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1\(10))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0f00",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datac => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.PREPARE_SEND_ASSIGN_CLK~regout\,
	datad => \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1\(10),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector58~0_combout\);

-- Location: LC_X74_Y44_N6
\ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector63~0\ : stratix_lcell
-- Equation(s):
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector63~0_combout\ = (((!\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.PREPARE_SEND_ASSIGN_CLK~regout\ & 
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1\(5))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0f00",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datac => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.PREPARE_SEND_ASSIGN_CLK~regout\,
	datad => \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1\(5),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector63~0_combout\);

-- Location: LC_X74_Y45_N8
\ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector68~0\ : stratix_lcell
-- Equation(s):
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector68~0_combout\ = ((!\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.PREPARE_SEND_ASSIGN_CLK~regout\ & 
-- ((\ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "3300",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.PREPARE_SEND_ASSIGN_CLK~regout\,
	datad => \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector68~0_combout\);

-- Location: LC_X74_Y46_N4
\ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1[0]\ : stratix_lcell
-- Equation(s):
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1\(0) = DFFEAS((!\ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1\(0)), GLOBAL(\sys_clk~combout\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , 
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector68~0_combout\, , , !\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.PREPARE_SEND_WAIT1~regout\)
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1[0]~1\ = CARRY((\ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "55aa",
	operation_mode => "arithmetic",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~combout\,
	dataa => \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1\(0),
	datac => \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector68~0_combout\,
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	sload => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ALT_INV_ps2_transceiver_state.PREPARE_SEND_WAIT1~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1\(0),
	cout => \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1[0]~1\);

-- Location: LC_X74_Y44_N5
\ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector64~0\ : stratix_lcell
-- Equation(s):
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector64~0_combout\ = (((!\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.PREPARE_SEND_ASSIGN_CLK~regout\ & 
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1\(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0f00",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datac => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.PREPARE_SEND_ASSIGN_CLK~regout\,
	datad => \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1\(4),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector64~0_combout\);

-- Location: LC_X74_Y46_N3
\ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector65~0\ : stratix_lcell
-- Equation(s):
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector65~0_combout\ = (!\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.PREPARE_SEND_ASSIGN_CLK~regout\ & 
-- (((\ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "5050",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.PREPARE_SEND_ASSIGN_CLK~regout\,
	datac => \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1\(3),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector65~0_combout\);

-- Location: LC_X74_Y46_N1
\ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector66~0\ : stratix_lcell
-- Equation(s):
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector66~0_combout\ = (((!\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.PREPARE_SEND_ASSIGN_CLK~regout\ & 
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0f00",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datac => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.PREPARE_SEND_ASSIGN_CLK~regout\,
	datad => \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1\(2),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector66~0_combout\);

-- Location: LC_X74_Y46_N2
\ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector67~0\ : stratix_lcell
-- Equation(s):
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector67~0_combout\ = (!\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.PREPARE_SEND_ASSIGN_CLK~regout\ & 
-- (((\ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "5050",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.PREPARE_SEND_ASSIGN_CLK~regout\,
	datac => \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector67~0_combout\);

-- Location: LC_X74_Y46_N5
\ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1[1]\ : stratix_lcell
-- Equation(s):
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1\(1) = DFFEAS((\ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1\(1) $ ((\ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1[0]~1\))), 
-- GLOBAL(\sys_clk~combout\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector67~0_combout\, , , 
-- !\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.PREPARE_SEND_WAIT1~regout\)
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1[1]~5\ = CARRY(((!\ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1[0]~1\) # (!\ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1\(1))))
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1[1]~5COUT1_37\ = CARRY(((!\ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1[0]~1\) # (!\ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1\(1))))

-- pragma translate_off
GENERIC MAP (
	cin_used => "true",
	lut_mask => "3c3f",
	operation_mode => "arithmetic",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~combout\,
	datab => \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1\(1),
	datac => \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector67~0_combout\,
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	sload => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ALT_INV_ps2_transceiver_state.PREPARE_SEND_WAIT1~regout\,
	cin => \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1[0]~1\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1\(1),
	cout0 => \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1[1]~5\,
	cout1 => \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1[1]~5COUT1_37\);

-- Location: LC_X74_Y46_N6
\ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1[2]\ : stratix_lcell
-- Equation(s):
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1\(2) = DFFEAS((\ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1\(2) $ ((!(!\ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1[0]~1\ & 
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1[1]~5\) # (\ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1[0]~1\ & \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1[1]~5COUT1_37\)))), 
-- GLOBAL(\sys_clk~combout\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector66~0_combout\, , , 
-- !\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.PREPARE_SEND_WAIT1~regout\)
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1[2]~7\ = CARRY(((\ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1\(2) & !\ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1[1]~5\)))
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1[2]~7COUT1_39\ = CARRY(((\ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1\(2) & !\ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1[1]~5COUT1_37\)))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	cin_used => "true",
	lut_mask => "c30c",
	operation_mode => "arithmetic",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~combout\,
	datab => \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1\(2),
	datac => \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector66~0_combout\,
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	sload => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ALT_INV_ps2_transceiver_state.PREPARE_SEND_WAIT1~regout\,
	cin => \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1[0]~1\,
	cin0 => \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1[1]~5\,
	cin1 => \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1[1]~5COUT1_37\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1\(2),
	cout0 => \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1[2]~7\,
	cout1 => \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1[2]~7COUT1_39\);

-- Location: LC_X74_Y46_N7
\ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1[3]\ : stratix_lcell
-- Equation(s):
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1\(3) = DFFEAS(\ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1\(3) $ (((((!\ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1[0]~1\ & 
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1[2]~7\) # (\ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1[0]~1\ & \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1[2]~7COUT1_39\))))), 
-- GLOBAL(\sys_clk~combout\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector65~0_combout\, , , 
-- !\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.PREPARE_SEND_WAIT1~regout\)
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1[3]~3\ = CARRY(((!\ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1[2]~7\)) # (!\ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1\(3)))
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1[3]~3COUT1_41\ = CARRY(((!\ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1[2]~7COUT1_39\)) # (!\ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1\(3)))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	cin_used => "true",
	lut_mask => "5a5f",
	operation_mode => "arithmetic",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~combout\,
	dataa => \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1\(3),
	datac => \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector65~0_combout\,
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	sload => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ALT_INV_ps2_transceiver_state.PREPARE_SEND_WAIT1~regout\,
	cin => \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1[0]~1\,
	cin0 => \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1[2]~7\,
	cin1 => \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1[2]~7COUT1_39\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1\(3),
	cout0 => \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1[3]~3\,
	cout1 => \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1[3]~3COUT1_41\);

-- Location: LC_X74_Y46_N8
\ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1[4]\ : stratix_lcell
-- Equation(s):
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1\(4) = DFFEAS(\ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1\(4) $ ((((!(!\ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1[0]~1\ & 
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1[3]~3\) # (\ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1[0]~1\ & \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1[3]~3COUT1_41\))))), 
-- GLOBAL(\sys_clk~combout\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector64~0_combout\, , , 
-- !\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.PREPARE_SEND_WAIT1~regout\)
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1[4]~9\ = CARRY((\ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1\(4) & ((!\ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1[3]~3\))))
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1[4]~9COUT1_43\ = CARRY((\ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1\(4) & ((!\ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1[3]~3COUT1_41\))))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	cin_used => "true",
	lut_mask => "a50a",
	operation_mode => "arithmetic",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~combout\,
	dataa => \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1\(4),
	datac => \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector64~0_combout\,
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	sload => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ALT_INV_ps2_transceiver_state.PREPARE_SEND_WAIT1~regout\,
	cin => \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1[0]~1\,
	cin0 => \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1[3]~3\,
	cin1 => \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1[3]~3COUT1_41\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1\(4),
	cout0 => \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1[4]~9\,
	cout1 => \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1[4]~9COUT1_43\);

-- Location: LC_X74_Y46_N9
\ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1[5]\ : stratix_lcell
-- Equation(s):
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1\(5) = DFFEAS((\ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1\(5) $ (((!\ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1[0]~1\ & 
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1[4]~9\) # (\ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1[0]~1\ & \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1[4]~9COUT1_43\)))), 
-- GLOBAL(\sys_clk~combout\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector63~0_combout\, , , 
-- !\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.PREPARE_SEND_WAIT1~regout\)
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1[5]~11\ = CARRY(((!\ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1[4]~9COUT1_43\) # (!\ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1\(5))))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	cin_used => "true",
	lut_mask => "3c3f",
	operation_mode => "arithmetic",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~combout\,
	datab => \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1\(5),
	datac => \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector63~0_combout\,
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	sload => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ALT_INV_ps2_transceiver_state.PREPARE_SEND_WAIT1~regout\,
	cin => \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1[0]~1\,
	cin0 => \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1[4]~9\,
	cin1 => \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1[4]~9COUT1_43\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1\(5),
	cout => \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1[5]~11\);

-- Location: LC_X74_Y44_N2
\ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector59~0\ : stratix_lcell
-- Equation(s):
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector59~0_combout\ = (((!\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.PREPARE_SEND_ASSIGN_CLK~regout\ & 
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1\(9))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0f00",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datac => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.PREPARE_SEND_ASSIGN_CLK~regout\,
	datad => \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1\(9),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector59~0_combout\);

-- Location: LC_X74_Y45_N9
\ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector60~0\ : stratix_lcell
-- Equation(s):
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector60~0_combout\ = ((!\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.PREPARE_SEND_ASSIGN_CLK~regout\ & 
-- ((\ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1\(8)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "3300",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.PREPARE_SEND_ASSIGN_CLK~regout\,
	datad => \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1\(8),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector60~0_combout\);

-- Location: LC_X74_Y45_N7
\ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector61~0\ : stratix_lcell
-- Equation(s):
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector61~0_combout\ = (\ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1\(7) & 
-- (((!\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.PREPARE_SEND_ASSIGN_CLK~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "00aa",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1\(7),
	datad => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.PREPARE_SEND_ASSIGN_CLK~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector61~0_combout\);

-- Location: LC_X74_Y44_N0
\ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector62~0\ : stratix_lcell
-- Equation(s):
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector62~0_combout\ = ((\ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1\(6) & 
-- (!\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.PREPARE_SEND_ASSIGN_CLK~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0c0c",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1\(6),
	datac => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.PREPARE_SEND_ASSIGN_CLK~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector62~0_combout\);

-- Location: LC_X74_Y45_N0
\ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1[6]\ : stratix_lcell
-- Equation(s):
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1\(6) = DFFEAS((\ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1\(6) $ ((!\ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1[5]~11\))), 
-- GLOBAL(\sys_clk~combout\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector62~0_combout\, , , 
-- !\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.PREPARE_SEND_WAIT1~regout\)
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1[6]~13\ = CARRY(((\ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1\(6) & !\ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1[5]~11\)))
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1[6]~13COUT1_45\ = CARRY(((\ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1\(6) & !\ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1[5]~11\)))

-- pragma translate_off
GENERIC MAP (
	cin_used => "true",
	lut_mask => "c30c",
	operation_mode => "arithmetic",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~combout\,
	datab => \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1\(6),
	datac => \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector62~0_combout\,
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	sload => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ALT_INV_ps2_transceiver_state.PREPARE_SEND_WAIT1~regout\,
	cin => \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1[5]~11\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1\(6),
	cout0 => \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1[6]~13\,
	cout1 => \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1[6]~13COUT1_45\);

-- Location: LC_X74_Y45_N1
\ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1[7]\ : stratix_lcell
-- Equation(s):
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1\(7) = DFFEAS(\ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1\(7) $ (((((!\ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1[5]~11\ & 
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1[6]~13\) # (\ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1[5]~11\ & \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1[6]~13COUT1_45\))))), 
-- GLOBAL(\sys_clk~combout\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector61~0_combout\, , , 
-- !\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.PREPARE_SEND_WAIT1~regout\)
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1[7]~15\ = CARRY(((!\ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1[6]~13\)) # (!\ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1\(7)))
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1[7]~15COUT1_47\ = CARRY(((!\ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1[6]~13COUT1_45\)) # 
-- (!\ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1\(7)))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	cin_used => "true",
	lut_mask => "5a5f",
	operation_mode => "arithmetic",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~combout\,
	dataa => \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1\(7),
	datac => \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector61~0_combout\,
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	sload => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ALT_INV_ps2_transceiver_state.PREPARE_SEND_WAIT1~regout\,
	cin => \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1[5]~11\,
	cin0 => \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1[6]~13\,
	cin1 => \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1[6]~13COUT1_45\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1\(7),
	cout0 => \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1[7]~15\,
	cout1 => \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1[7]~15COUT1_47\);

-- Location: LC_X74_Y45_N2
\ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1[8]\ : stratix_lcell
-- Equation(s):
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1\(8) = DFFEAS(\ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1\(8) $ ((((!(!\ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1[5]~11\ & 
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1[7]~15\) # (\ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1[5]~11\ & \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1[7]~15COUT1_47\))))), 
-- GLOBAL(\sys_clk~combout\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector60~0_combout\, , , 
-- !\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.PREPARE_SEND_WAIT1~regout\)
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1[8]~23\ = CARRY((\ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1\(8) & ((!\ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1[7]~15\))))
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1[8]~23COUT1_49\ = CARRY((\ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1\(8) & ((!\ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1[7]~15COUT1_47\))))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	cin_used => "true",
	lut_mask => "a50a",
	operation_mode => "arithmetic",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~combout\,
	dataa => \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1\(8),
	datac => \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector60~0_combout\,
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	sload => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ALT_INV_ps2_transceiver_state.PREPARE_SEND_WAIT1~regout\,
	cin => \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1[5]~11\,
	cin0 => \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1[7]~15\,
	cin1 => \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1[7]~15COUT1_47\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1\(8),
	cout0 => \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1[8]~23\,
	cout1 => \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1[8]~23COUT1_49\);

-- Location: LC_X74_Y45_N3
\ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1[9]\ : stratix_lcell
-- Equation(s):
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1\(9) = DFFEAS(\ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1\(9) $ (((((!\ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1[5]~11\ & 
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1[8]~23\) # (\ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1[5]~11\ & \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1[8]~23COUT1_49\))))), 
-- GLOBAL(\sys_clk~combout\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector59~0_combout\, , , 
-- !\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.PREPARE_SEND_WAIT1~regout\)
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1[9]~19\ = CARRY(((!\ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1[8]~23\)) # (!\ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1\(9)))
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1[9]~19COUT1_51\ = CARRY(((!\ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1[8]~23COUT1_49\)) # 
-- (!\ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1\(9)))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	cin_used => "true",
	lut_mask => "5a5f",
	operation_mode => "arithmetic",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~combout\,
	dataa => \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1\(9),
	datac => \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector59~0_combout\,
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	sload => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ALT_INV_ps2_transceiver_state.PREPARE_SEND_WAIT1~regout\,
	cin => \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1[5]~11\,
	cin0 => \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1[8]~23\,
	cin1 => \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1[8]~23COUT1_49\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1\(9),
	cout0 => \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1[9]~19\,
	cout1 => \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1[9]~19COUT1_51\);

-- Location: LC_X74_Y45_N4
\ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1[10]\ : stratix_lcell
-- Equation(s):
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1\(10) = DFFEAS(\ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1\(10) $ ((((!(!\ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1[5]~11\ & 
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1[9]~19\) # (\ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1[5]~11\ & \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1[9]~19COUT1_51\))))), 
-- GLOBAL(\sys_clk~combout\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector58~0_combout\, , , 
-- !\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.PREPARE_SEND_WAIT1~regout\)
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1[10]~25\ = CARRY((\ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1\(10) & ((!\ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1[9]~19COUT1_51\))))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	cin_used => "true",
	lut_mask => "a50a",
	operation_mode => "arithmetic",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~combout\,
	dataa => \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1\(10),
	datac => \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector58~0_combout\,
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	sload => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ALT_INV_ps2_transceiver_state.PREPARE_SEND_WAIT1~regout\,
	cin => \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1[5]~11\,
	cin0 => \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1[9]~19\,
	cin1 => \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1[9]~19COUT1_51\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1\(10),
	cout => \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1[10]~25\);

-- Location: LC_X74_Y44_N3
\ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector57~0\ : stratix_lcell
-- Equation(s):
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector57~0_combout\ = ((\ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1\(11) & 
-- (!\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.PREPARE_SEND_ASSIGN_CLK~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0c0c",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1\(11),
	datac => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.PREPARE_SEND_ASSIGN_CLK~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector57~0_combout\);

-- Location: LC_X74_Y45_N5
\ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1[11]\ : stratix_lcell
-- Equation(s):
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1\(11) = DFFEAS((\ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1\(11) $ ((\ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1[10]~25\))), 
-- GLOBAL(\sys_clk~combout\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector57~0_combout\, , , 
-- !\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.PREPARE_SEND_WAIT1~regout\)
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1[11]~21\ = CARRY(((!\ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1[10]~25\) # (!\ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1\(11))))
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1[11]~21COUT1_53\ = CARRY(((!\ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1[10]~25\) # (!\ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1\(11))))

-- pragma translate_off
GENERIC MAP (
	cin_used => "true",
	lut_mask => "3c3f",
	operation_mode => "arithmetic",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~combout\,
	datab => \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1\(11),
	datac => \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector57~0_combout\,
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	sload => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ALT_INV_ps2_transceiver_state.PREPARE_SEND_WAIT1~regout\,
	cin => \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1[10]~25\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1\(11),
	cout0 => \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1[11]~21\,
	cout1 => \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1[11]~21COUT1_53\);

-- Location: LC_X74_Y45_N6
\ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1[12]\ : stratix_lcell
-- Equation(s):
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1\(12) = DFFEAS((((!\ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1[10]~25\ & \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1[11]~21\) # 
-- (\ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1[10]~25\ & \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1[11]~21COUT1_53\) $ (!\ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1\(12)))), 
-- GLOBAL(\sys_clk~combout\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector56~0_combout\, , , 
-- !\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.PREPARE_SEND_WAIT1~regout\)

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	cin_used => "true",
	lut_mask => "f00f",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~combout\,
	datac => \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector56~0_combout\,
	datad => \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1\(12),
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	sload => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ALT_INV_ps2_transceiver_state.PREPARE_SEND_WAIT1~regout\,
	cin => \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1[10]~25\,
	cin0 => \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1[11]~21\,
	cin1 => \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1[11]~21COUT1_53\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1\(12));

-- Location: LC_X74_Y44_N9
\ps2_keyboard_controller_inst|ps2_transceiver_inst|Equal0~1\ : stratix_lcell
-- Equation(s):
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|Equal0~1_combout\ = (!\ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1\(5) & (!\ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1\(6) & 
-- (!\ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1\(7) & !\ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1\(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1\(5),
	datab => \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1\(6),
	datac => \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1\(7),
	datad => \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1\(4),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \ps2_keyboard_controller_inst|ps2_transceiver_inst|Equal0~1_combout\);

-- Location: LC_X74_Y44_N7
\ps2_keyboard_controller_inst|ps2_transceiver_inst|Equal0~2\ : stratix_lcell
-- Equation(s):
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|Equal0~2_combout\ = (\ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1\(9) & (\ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1\(11) & 
-- (!\ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1\(8) & !\ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1\(10))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0008",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1\(9),
	datab => \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1\(11),
	datac => \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1\(8),
	datad => \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1\(10),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \ps2_keyboard_controller_inst|ps2_transceiver_inst|Equal0~2_combout\);

-- Location: LC_X74_Y46_N0
\ps2_keyboard_controller_inst|ps2_transceiver_inst|Equal0~0\ : stratix_lcell
-- Equation(s):
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|Equal0~0_combout\ = (\ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1\(3) & (!\ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1\(2) & 
-- (!\ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1\(1) & \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0200",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1\(3),
	datab => \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1\(2),
	datac => \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1\(1),
	datad => \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \ps2_keyboard_controller_inst|ps2_transceiver_inst|Equal0~0_combout\);

-- Location: LC_X74_Y44_N8
\ps2_keyboard_controller_inst|ps2_transceiver_inst|Equal0~3\ : stratix_lcell
-- Equation(s):
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|Equal0~3_combout\ = (\ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1\(12) & (\ps2_keyboard_controller_inst|ps2_transceiver_inst|Equal0~1_combout\ & 
-- (\ps2_keyboard_controller_inst|ps2_transceiver_inst|Equal0~2_combout\ & \ps2_keyboard_controller_inst|ps2_transceiver_inst|Equal0~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "8000",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ps2_keyboard_controller_inst|ps2_transceiver_inst|prepare_timeout1\(12),
	datab => \ps2_keyboard_controller_inst|ps2_transceiver_inst|Equal0~1_combout\,
	datac => \ps2_keyboard_controller_inst|ps2_transceiver_inst|Equal0~2_combout\,
	datad => \ps2_keyboard_controller_inst|ps2_transceiver_inst|Equal0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \ps2_keyboard_controller_inst|ps2_transceiver_inst|Equal0~3_combout\);

-- Location: LC_X72_Y44_N4
\ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector5~9\ : stratix_lcell
-- Equation(s):
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector5~9_combout\ = (\ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector5~6_combout\ & (\ps2_keyboard_controller_inst|ps2_transceiver_inst|WideOr1~6_combout\ & 
-- ((!\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.PREPARE_SEND_WAIT1~regout\) # (!\ps2_keyboard_controller_inst|ps2_transceiver_inst|Equal0~3_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "7000",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ps2_keyboard_controller_inst|ps2_transceiver_inst|Equal0~3_combout\,
	datab => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.PREPARE_SEND_WAIT1~regout\,
	datac => \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector5~6_combout\,
	datad => \ps2_keyboard_controller_inst|ps2_transceiver_inst|WideOr1~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector5~9_combout\);

-- Location: LC_X72_Y44_N8
\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_READ_ACK\ : stratix_lcell
-- Equation(s):
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_READ_ACK~regout\ = DFFEAS((\ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector5~7_combout\) # ((\ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector5~9_combout\ & 
-- ((\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_READ_ACK~regout\)))), GLOBAL(\sys_clk~combout\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "eecc",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~combout\,
	dataa => \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector5~9_combout\,
	datab => \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector5~7_combout\,
	datad => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_READ_ACK~regout\,
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_READ_ACK~regout\);

-- Location: LC_X72_Y46_N7
\ps2_keyboard_controller_inst|keyboard_state.SET_INDICATORS_CMD_WAIT_ACK\ : stratix_lcell
-- Equation(s):
-- \ps2_keyboard_controller_inst|keyboard_state.SET_INDICATORS_CMD_WAIT_ACK~regout\ = DFFEAS((\ps2_keyboard_controller_inst|keyboard_state.SET_INDICATORS_CMD~regout\ & ((\ps2_keyboard_controller_inst|Selector4~0_combout\) # 
-- ((\ps2_keyboard_controller_inst|keyboard_state.SET_INDICATORS_CMD_WAIT_ACK~regout\ & !\ps2_keyboard_controller_inst|ps2_transceiver_inst|new_data~regout\)))) # (!\ps2_keyboard_controller_inst|keyboard_state.SET_INDICATORS_CMD~regout\ & 
-- (((\ps2_keyboard_controller_inst|keyboard_state.SET_INDICATORS_CMD_WAIT_ACK~regout\ & !\ps2_keyboard_controller_inst|ps2_transceiver_inst|new_data~regout\)))), GLOBAL(\sys_clk~combout\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "88f8",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~combout\,
	dataa => \ps2_keyboard_controller_inst|keyboard_state.SET_INDICATORS_CMD~regout\,
	datab => \ps2_keyboard_controller_inst|Selector4~0_combout\,
	datac => \ps2_keyboard_controller_inst|keyboard_state.SET_INDICATORS_CMD_WAIT_ACK~regout\,
	datad => \ps2_keyboard_controller_inst|ps2_transceiver_inst|new_data~regout\,
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \ps2_keyboard_controller_inst|keyboard_state.SET_INDICATORS_CMD_WAIT_ACK~regout\);

-- Location: LC_X72_Y46_N8
\ps2_keyboard_controller_inst|keyboard_state.SET_INDICATORS_VALUE\ : stratix_lcell
-- Equation(s):
-- \ps2_keyboard_controller_inst|keyboard_state.SET_INDICATORS_VALUE~regout\ = DFFEAS((\ps2_keyboard_controller_inst|keyboard_state.SET_INDICATORS_VALUE~regout\ & (((\ps2_keyboard_controller_inst|keyboard_state.SET_INDICATORS_CMD_WAIT_ACK~regout\ & 
-- !\ps2_keyboard_controller_inst|keyboard_state_next~12\)) # (!\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_READ_ACK~regout\))) # (!\ps2_keyboard_controller_inst|keyboard_state.SET_INDICATORS_VALUE~regout\ & 
-- (((\ps2_keyboard_controller_inst|keyboard_state.SET_INDICATORS_CMD_WAIT_ACK~regout\ & !\ps2_keyboard_controller_inst|keyboard_state_next~12\)))), GLOBAL(\sys_clk~combout\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "22f2",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~combout\,
	dataa => \ps2_keyboard_controller_inst|keyboard_state.SET_INDICATORS_VALUE~regout\,
	datab => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_READ_ACK~regout\,
	datac => \ps2_keyboard_controller_inst|keyboard_state.SET_INDICATORS_CMD_WAIT_ACK~regout\,
	datad => \ps2_keyboard_controller_inst|keyboard_state_next~12\,
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \ps2_keyboard_controller_inst|keyboard_state.SET_INDICATORS_VALUE~regout\);

-- Location: LC_X71_Y46_N9
\ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector53~4\ : stratix_lcell
-- Equation(s):
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector53~4_combout\ = (!\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_DATA7~regout\ & 
-- (!\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_DATA6~regout\ & (!\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_DATA2~regout\ & 
-- !\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_DATA5~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_DATA7~regout\,
	datab => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_DATA6~regout\,
	datac => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_DATA2~regout\,
	datad => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_DATA5~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector53~4_combout\);

-- Location: LC_X70_Y46_N0
\ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector53~7\ : stratix_lcell
-- Equation(s):
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector53~7_combout\ = (\ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector53~4_combout\ & (((!\ps2_keyboard_controller_inst|keyboard_state.INIT~regout\)))) # 
-- (!\ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector53~4_combout\ & (\ps2_keyboard_controller_inst|keyboard_state.INIT~regout\ & ((\ps2_keyboard_controller_inst|keyboard_state.SET_INDICATORS_CMD~regout\) # 
-- (\ps2_keyboard_controller_inst|keyboard_state.ENABLE~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "32cc",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ps2_keyboard_controller_inst|keyboard_state.SET_INDICATORS_CMD~regout\,
	datab => \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector53~4_combout\,
	datac => \ps2_keyboard_controller_inst|keyboard_state.ENABLE~regout\,
	datad => \ps2_keyboard_controller_inst|keyboard_state.INIT~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector53~7_combout\);

-- Location: LC_X70_Y46_N5
\ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector53~8\ : stratix_lcell
-- Equation(s):
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector53~8_combout\ = (\ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector53~7_combout\ & (((!\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_DATA1~regout\ & 
-- !\ps2_keyboard_controller_inst|keyboard_state.INIT~regout\)))) # (!\ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector53~7_combout\ & (\ps2_keyboard_controller_inst|keyboard_state.INIT~regout\ & 
-- ((!\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_DATA1~regout\) # (!\ps2_keyboard_controller_inst|keyboard_state.SET_INDICATORS_VALUE~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "130c",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ps2_keyboard_controller_inst|keyboard_state.SET_INDICATORS_VALUE~regout\,
	datab => \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector53~7_combout\,
	datac => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_DATA1~regout\,
	datad => \ps2_keyboard_controller_inst|keyboard_state.INIT~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector53~8_combout\);

-- Location: LC_X70_Y46_N7
\ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector53~1\ : stratix_lcell
-- Equation(s):
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector53~1_combout\ = ((\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_DATA4~regout\ & ((\ps2_keyboard_controller_inst|keyboard_state.ENABLE~regout\) # 
-- (!\ps2_keyboard_controller_inst|keyboard_state.INIT~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "c0f0",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \ps2_keyboard_controller_inst|keyboard_state.ENABLE~regout\,
	datac => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_DATA4~regout\,
	datad => \ps2_keyboard_controller_inst|keyboard_state.INIT~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector53~1_combout\);

-- Location: LC_X70_Y46_N2
\ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector53~0\ : stratix_lcell
-- Equation(s):
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector53~0_combout\ = (!\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_DATA0~regout\ & 
-- (((!\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_DATA3~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0505",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_DATA0~regout\,
	datac => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_DATA3~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector53~0_combout\);

-- Location: LC_X70_Y46_N4
\ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector53~2\ : stratix_lcell
-- Equation(s):
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector53~2_combout\ = (\ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector53~1_combout\) # ((!\ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector53~0_combout\ & 
-- ((\ps2_keyboard_controller_inst|keyboard_state.SET_INDICATORS_CMD~regout\) # (!\ps2_keyboard_controller_inst|keyboard_state.INIT~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "f0fb",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ps2_keyboard_controller_inst|keyboard_state.SET_INDICATORS_CMD~regout\,
	datab => \ps2_keyboard_controller_inst|keyboard_state.INIT~regout\,
	datac => \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector53~1_combout\,
	datad => \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector53~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector53~2_combout\);

-- Location: LC_X70_Y46_N1
\ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector53~5\ : stratix_lcell
-- Equation(s):
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector53~5_combout\ = (\ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector53~0_combout\ & (!\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_DATA1~regout\ & 
-- (!\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_DATA4~regout\ & \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector53~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0200",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector53~0_combout\,
	datab => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_DATA1~regout\,
	datac => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_DATA4~regout\,
	datad => \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector53~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector53~5_combout\);

-- Location: LC_X71_Y46_N5
\ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector53~6\ : stratix_lcell
-- Equation(s):
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector53~6_combout\ = (\ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector53~5_combout\ & (!\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_data_internal~regout\ & 
-- (!\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_PARITY~regout\ & !\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.PREPARE_SEND_DATA~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0002",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector53~5_combout\,
	datab => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_data_internal~regout\,
	datac => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_PARITY~regout\,
	datad => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.PREPARE_SEND_DATA~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector53~6_combout\);

-- Location: LC_X70_Y46_N9
\ps2_keyboard_controller_inst|ps2_transceiver_inst|parity_next~0\ : stratix_lcell
-- Equation(s):
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|parity_next~0_combout\ = \ps2_keyboard_controller_inst|ps2_transceiver_inst|parity~regout\ $ (((\ps2_keyboard_controller_inst|keyboard_state.ENABLE~regout\) # 
-- ((\ps2_keyboard_controller_inst|keyboard_state.SET_INDICATORS_CMD~regout\) # (!\ps2_keyboard_controller_inst|keyboard_state.INIT~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "5655",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ps2_keyboard_controller_inst|ps2_transceiver_inst|parity~regout\,
	datab => \ps2_keyboard_controller_inst|keyboard_state.ENABLE~regout\,
	datac => \ps2_keyboard_controller_inst|keyboard_state.SET_INDICATORS_CMD~regout\,
	datad => \ps2_keyboard_controller_inst|keyboard_state.INIT~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \ps2_keyboard_controller_inst|ps2_transceiver_inst|parity_next~0_combout\);

-- Location: LC_X71_Y46_N8
\ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector55~2\ : stratix_lcell
-- Equation(s):
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector55~2_combout\ = (\ps2_keyboard_controller_inst|ps2_transceiver_inst|parity_next~0_combout\) # ((!\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_DATA5~regout\ & 
-- (!\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_DATA6~regout\ & !\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_DATA7~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "f0f1",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_DATA5~regout\,
	datab => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_DATA6~regout\,
	datac => \ps2_keyboard_controller_inst|ps2_transceiver_inst|parity_next~0_combout\,
	datad => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_DATA7~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector55~2_combout\);

-- Location: LC_X70_Y46_N8
\ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector55~3\ : stratix_lcell
-- Equation(s):
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector55~3_combout\ = (\ps2_keyboard_controller_inst|ps2_transceiver_inst|parity~regout\ $ (((\ps2_keyboard_controller_inst|keyboard_state.SET_INDICATORS_CMD~regout\) # 
-- (!\ps2_keyboard_controller_inst|keyboard_state.INIT~regout\)))) # (!\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_DATA0~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "5df7",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_DATA0~regout\,
	datab => \ps2_keyboard_controller_inst|keyboard_state.INIT~regout\,
	datac => \ps2_keyboard_controller_inst|keyboard_state.SET_INDICATORS_CMD~regout\,
	datad => \ps2_keyboard_controller_inst|ps2_transceiver_inst|parity~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector55~3_combout\);

-- Location: LC_X70_Y46_N6
\ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector55~5\ : stratix_lcell
-- Equation(s):
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector55~5_combout\ = (\ps2_keyboard_controller_inst|ps2_transceiver_inst|parity~regout\ $ (((\ps2_keyboard_controller_inst|keyboard_state.SET_INDICATORS_VALUE~regout\) # 
-- (!\ps2_keyboard_controller_inst|keyboard_state.INIT~regout\)))) # (!\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_DATA1~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "6f5f",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ps2_keyboard_controller_inst|ps2_transceiver_inst|parity~regout\,
	datab => \ps2_keyboard_controller_inst|keyboard_state.SET_INDICATORS_VALUE~regout\,
	datac => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_DATA1~regout\,
	datad => \ps2_keyboard_controller_inst|keyboard_state.INIT~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector55~5_combout\);

-- Location: LC_X71_Y46_N6
\ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector55~4\ : stratix_lcell
-- Equation(s):
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector55~4_combout\ = (\ps2_keyboard_controller_inst|ps2_transceiver_inst|parity~regout\ $ (((\ps2_keyboard_controller_inst|keyboard_state.SET_INDICATORS_CMD~regout\) # 
-- (!\ps2_keyboard_controller_inst|keyboard_state.INIT~regout\)))) # (!\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_DATA3~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "4bff",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ps2_keyboard_controller_inst|keyboard_state.SET_INDICATORS_CMD~regout\,
	datab => \ps2_keyboard_controller_inst|keyboard_state.INIT~regout\,
	datac => \ps2_keyboard_controller_inst|ps2_transceiver_inst|parity~regout\,
	datad => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_DATA3~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector55~4_combout\);

-- Location: LC_X71_Y46_N7
\ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector55~6\ : stratix_lcell
-- Equation(s):
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector55~6_combout\ = (\ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector55~5_combout\ & (\ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector55~4_combout\ & 
-- ((\ps2_keyboard_controller_inst|ps2_transceiver_inst|parity_next~0_combout\) # (!\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_DATA2~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "c400",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_DATA2~regout\,
	datab => \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector55~5_combout\,
	datac => \ps2_keyboard_controller_inst|ps2_transceiver_inst|parity_next~0_combout\,
	datad => \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector55~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector55~6_combout\);

-- Location: LC_X70_Y46_N3
\ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector55~0\ : stratix_lcell
-- Equation(s):
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector55~0_combout\ = (\ps2_keyboard_controller_inst|ps2_transceiver_inst|parity~regout\ $ (((\ps2_keyboard_controller_inst|keyboard_state.ENABLE~regout\) # 
-- (!\ps2_keyboard_controller_inst|keyboard_state.INIT~regout\)))) # (!\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_DATA4~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "6f5f",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ps2_keyboard_controller_inst|ps2_transceiver_inst|parity~regout\,
	datab => \ps2_keyboard_controller_inst|keyboard_state.ENABLE~regout\,
	datac => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_DATA4~regout\,
	datad => \ps2_keyboard_controller_inst|keyboard_state.INIT~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector55~0_combout\);

-- Location: LC_X71_Y46_N0
\ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector55~1\ : stratix_lcell
-- Equation(s):
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector55~1_combout\ = (\ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector55~0_combout\ & (((\ps2_keyboard_controller_inst|ps2_transceiver_inst|parity~regout\) # 
-- (\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.PREPARE_SEND_ASSIGN_CLK~regout\)) # (!\ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector53~5_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "ccc4",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector53~5_combout\,
	datab => \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector55~0_combout\,
	datac => \ps2_keyboard_controller_inst|ps2_transceiver_inst|parity~regout\,
	datad => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.PREPARE_SEND_ASSIGN_CLK~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector55~1_combout\);

-- Location: LC_X71_Y46_N3
\ps2_keyboard_controller_inst|ps2_transceiver_inst|parity\ : stratix_lcell
-- Equation(s):
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|parity~regout\ = DFFEAS((\ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector55~2_combout\ & (\ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector55~3_combout\ & 
-- (\ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector55~6_combout\ & \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector55~1_combout\))), GLOBAL(\sys_clk~combout\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "8000",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~combout\,
	dataa => \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector55~2_combout\,
	datab => \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector55~3_combout\,
	datac => \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector55~6_combout\,
	datad => \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector55~1_combout\,
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \ps2_keyboard_controller_inst|ps2_transceiver_inst|parity~regout\);

-- Location: LC_X71_Y46_N4
\ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector53~3\ : stratix_lcell
-- Equation(s):
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector53~3_combout\ = (\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_STOP~regout\) # (((\ps2_keyboard_controller_inst|ps2_transceiver_inst|parity~regout\ & 
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_PARITY~regout\)) # (!\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.IDLE~regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "efcf",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ps2_keyboard_controller_inst|ps2_transceiver_inst|parity~regout\,
	datab => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_STOP~regout\,
	datac => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.IDLE~regout\,
	datad => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_PARITY~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector53~3_combout\);

-- Location: LC_X71_Y46_N1
\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_data_internal\ : stratix_lcell
-- Equation(s):
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_data_internal~regout\ = DFFEAS((\ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector53~8_combout\ & (!\ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector53~2_combout\ & 
-- (!\ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector53~6_combout\ & !\ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector53~3_combout\))), GLOBAL(\sys_clk~combout\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0002",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~combout\,
	dataa => \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector53~8_combout\,
	datab => \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector53~2_combout\,
	datac => \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector53~6_combout\,
	datad => \ps2_keyboard_controller_inst|ps2_transceiver_inst|Selector53~3_combout\,
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_data_internal~regout\);

-- Location: LC_X71_Y46_N2
\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_data_hz\ : stratix_lcell
-- Equation(s):
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_data_hz~regout\ = DFFEAS((!\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_STOP~regout\ & 
-- (\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.IDLE~regout\ & ((\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_data_hz~regout\) # 
-- (\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.PREPARE_SEND_DATA~regout\)))), GLOBAL(\sys_clk~combout\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "3020",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~combout\,
	dataa => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_data_hz~regout\,
	datab => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.SEND_STOP~regout\,
	datac => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.IDLE~regout\,
	datad => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.PREPARE_SEND_DATA~regout\,
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_data_hz~regout\);

-- Location: LC_X72_Y44_N5
\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_internal\ : stratix_lcell
-- Equation(s):
-- \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_internal~regout\ = DFFEAS((!\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.PREPARE_SEND_RELEASE_CLK~regout\ & 
-- (\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.IDLE~regout\ & ((\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_internal~regout\) # 
-- (\ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.PREPARE_SEND_ASSIGN_CLK~regout\)))), GLOBAL(\sys_clk~combout\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "5040",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~combout\,
	dataa => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.PREPARE_SEND_RELEASE_CLK~regout\,
	datab => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_internal~regout\,
	datac => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.IDLE~regout\,
	datad => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_transceiver_state.PREPARE_SEND_ASSIGN_CLK~regout\,
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \ps2_keyboard_controller_inst|ps2_transceiver_inst|ps2_clk_internal~regout\);

-- Location: LC_X76_Y45_N1
\btn_a_debounce_inst|fsm_inst|Selector2~5\ : stratix_lcell
-- Equation(s):
-- \btn_a_debounce_inst|fsm_inst|Selector2~5_combout\ = (((\btn_a_debounce_inst|fsm_inst|debounce_fsm_state.IDLE0~regout\) # (!\btn_a_debounce_inst|fsm_inst|debounce_fsm_state.IDLE1~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "ff0f",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datac => \btn_a_debounce_inst|fsm_inst|debounce_fsm_state.IDLE1~regout\,
	datad => \btn_a_debounce_inst|fsm_inst|debounce_fsm_state.IDLE0~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \btn_a_debounce_inst|fsm_inst|Selector2~5_combout\);

-- Location: LC_X77_Y46_N2
\btn_a_debounce_inst|counter_inst|cnt_int[0]\ : stratix_lcell
-- Equation(s):
-- \btn_a_debounce_inst|counter_inst|cnt_int\(0) = DFFEAS(\btn_a_debounce_inst|counter_inst|cnt_int\(0) $ ((\btn_a_debounce_inst|counter_inst|LessThan0~3_combout\)), GLOBAL(\sys_clk~combout\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , , , 
-- \btn_a_debounce_inst|fsm_inst|Selector2~5_combout\, )
-- \btn_a_debounce_inst|counter_inst|cnt_int[0]~29\ = CARRY((\btn_a_debounce_inst|counter_inst|cnt_int\(0) & (\btn_a_debounce_inst|counter_inst|LessThan0~3_combout\)))
-- \btn_a_debounce_inst|counter_inst|cnt_int[0]~29COUT1_46\ = CARRY((\btn_a_debounce_inst|counter_inst|cnt_int\(0) & (\btn_a_debounce_inst|counter_inst|LessThan0~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "6688",
	operation_mode => "arithmetic",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~combout\,
	dataa => \btn_a_debounce_inst|counter_inst|cnt_int\(0),
	datab => \btn_a_debounce_inst|counter_inst|LessThan0~3_combout\,
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	sclr => \btn_a_debounce_inst|fsm_inst|Selector2~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \btn_a_debounce_inst|counter_inst|cnt_int\(0),
	cout0 => \btn_a_debounce_inst|counter_inst|cnt_int[0]~29\,
	cout1 => \btn_a_debounce_inst|counter_inst|cnt_int[0]~29COUT1_46\);

-- Location: LC_X77_Y46_N3
\btn_a_debounce_inst|counter_inst|cnt_int[1]\ : stratix_lcell
-- Equation(s):
-- \btn_a_debounce_inst|counter_inst|cnt_int\(1) = DFFEAS(\btn_a_debounce_inst|counter_inst|cnt_int\(1) $ ((((\btn_a_debounce_inst|counter_inst|cnt_int[0]~29\)))), GLOBAL(\sys_clk~combout\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , , , 
-- \btn_a_debounce_inst|fsm_inst|Selector2~5_combout\, )
-- \btn_a_debounce_inst|counter_inst|cnt_int[1]~31\ = CARRY(((!\btn_a_debounce_inst|counter_inst|cnt_int[0]~29\)) # (!\btn_a_debounce_inst|counter_inst|cnt_int\(1)))
-- \btn_a_debounce_inst|counter_inst|cnt_int[1]~31COUT1_48\ = CARRY(((!\btn_a_debounce_inst|counter_inst|cnt_int[0]~29COUT1_46\)) # (!\btn_a_debounce_inst|counter_inst|cnt_int\(1)))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	lut_mask => "5a5f",
	operation_mode => "arithmetic",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~combout\,
	dataa => \btn_a_debounce_inst|counter_inst|cnt_int\(1),
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	sclr => \btn_a_debounce_inst|fsm_inst|Selector2~5_combout\,
	cin0 => \btn_a_debounce_inst|counter_inst|cnt_int[0]~29\,
	cin1 => \btn_a_debounce_inst|counter_inst|cnt_int[0]~29COUT1_46\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \btn_a_debounce_inst|counter_inst|cnt_int\(1),
	cout0 => \btn_a_debounce_inst|counter_inst|cnt_int[1]~31\,
	cout1 => \btn_a_debounce_inst|counter_inst|cnt_int[1]~31COUT1_48\);

-- Location: LC_X77_Y46_N4
\btn_a_debounce_inst|counter_inst|cnt_int[2]\ : stratix_lcell
-- Equation(s):
-- \btn_a_debounce_inst|counter_inst|cnt_int\(2) = DFFEAS(\btn_a_debounce_inst|counter_inst|cnt_int\(2) $ ((((!\btn_a_debounce_inst|counter_inst|cnt_int[1]~31\)))), GLOBAL(\sys_clk~combout\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , , , 
-- \btn_a_debounce_inst|fsm_inst|Selector2~5_combout\, )
-- \btn_a_debounce_inst|counter_inst|cnt_int[2]~1\ = CARRY((\btn_a_debounce_inst|counter_inst|cnt_int\(2) & ((!\btn_a_debounce_inst|counter_inst|cnt_int[1]~31COUT1_48\))))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	lut_mask => "a50a",
	operation_mode => "arithmetic",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~combout\,
	dataa => \btn_a_debounce_inst|counter_inst|cnt_int\(2),
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	sclr => \btn_a_debounce_inst|fsm_inst|Selector2~5_combout\,
	cin0 => \btn_a_debounce_inst|counter_inst|cnt_int[1]~31\,
	cin1 => \btn_a_debounce_inst|counter_inst|cnt_int[1]~31COUT1_48\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \btn_a_debounce_inst|counter_inst|cnt_int\(2),
	cout => \btn_a_debounce_inst|counter_inst|cnt_int[2]~1\);

-- Location: LC_X77_Y46_N5
\btn_a_debounce_inst|counter_inst|cnt_int[3]\ : stratix_lcell
-- Equation(s):
-- \btn_a_debounce_inst|counter_inst|cnt_int\(3) = DFFEAS((\btn_a_debounce_inst|counter_inst|cnt_int\(3) $ ((\btn_a_debounce_inst|counter_inst|cnt_int[2]~1\))), GLOBAL(\sys_clk~combout\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , , , 
-- \btn_a_debounce_inst|fsm_inst|Selector2~5_combout\, )
-- \btn_a_debounce_inst|counter_inst|cnt_int[3]~7\ = CARRY(((!\btn_a_debounce_inst|counter_inst|cnt_int[2]~1\) # (!\btn_a_debounce_inst|counter_inst|cnt_int\(3))))
-- \btn_a_debounce_inst|counter_inst|cnt_int[3]~7COUT1_50\ = CARRY(((!\btn_a_debounce_inst|counter_inst|cnt_int[2]~1\) # (!\btn_a_debounce_inst|counter_inst|cnt_int\(3))))

-- pragma translate_off
GENERIC MAP (
	cin_used => "true",
	lut_mask => "3c3f",
	operation_mode => "arithmetic",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~combout\,
	datab => \btn_a_debounce_inst|counter_inst|cnt_int\(3),
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	sclr => \btn_a_debounce_inst|fsm_inst|Selector2~5_combout\,
	cin => \btn_a_debounce_inst|counter_inst|cnt_int[2]~1\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \btn_a_debounce_inst|counter_inst|cnt_int\(3),
	cout0 => \btn_a_debounce_inst|counter_inst|cnt_int[3]~7\,
	cout1 => \btn_a_debounce_inst|counter_inst|cnt_int[3]~7COUT1_50\);

-- Location: LC_X77_Y46_N6
\btn_a_debounce_inst|counter_inst|cnt_int[4]\ : stratix_lcell
-- Equation(s):
-- \btn_a_debounce_inst|counter_inst|cnt_int\(4) = DFFEAS((\btn_a_debounce_inst|counter_inst|cnt_int\(4) $ ((!(!\btn_a_debounce_inst|counter_inst|cnt_int[2]~1\ & \btn_a_debounce_inst|counter_inst|cnt_int[3]~7\) # 
-- (\btn_a_debounce_inst|counter_inst|cnt_int[2]~1\ & \btn_a_debounce_inst|counter_inst|cnt_int[3]~7COUT1_50\)))), GLOBAL(\sys_clk~combout\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , , , \btn_a_debounce_inst|fsm_inst|Selector2~5_combout\, 
-- )
-- \btn_a_debounce_inst|counter_inst|cnt_int[4]~25\ = CARRY(((\btn_a_debounce_inst|counter_inst|cnt_int\(4) & !\btn_a_debounce_inst|counter_inst|cnt_int[3]~7\)))
-- \btn_a_debounce_inst|counter_inst|cnt_int[4]~25COUT1_52\ = CARRY(((\btn_a_debounce_inst|counter_inst|cnt_int\(4) & !\btn_a_debounce_inst|counter_inst|cnt_int[3]~7COUT1_50\)))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	cin_used => "true",
	lut_mask => "c30c",
	operation_mode => "arithmetic",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~combout\,
	datab => \btn_a_debounce_inst|counter_inst|cnt_int\(4),
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	sclr => \btn_a_debounce_inst|fsm_inst|Selector2~5_combout\,
	cin => \btn_a_debounce_inst|counter_inst|cnt_int[2]~1\,
	cin0 => \btn_a_debounce_inst|counter_inst|cnt_int[3]~7\,
	cin1 => \btn_a_debounce_inst|counter_inst|cnt_int[3]~7COUT1_50\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \btn_a_debounce_inst|counter_inst|cnt_int\(4),
	cout0 => \btn_a_debounce_inst|counter_inst|cnt_int[4]~25\,
	cout1 => \btn_a_debounce_inst|counter_inst|cnt_int[4]~25COUT1_52\);

-- Location: LC_X77_Y46_N7
\btn_a_debounce_inst|counter_inst|cnt_int[5]\ : stratix_lcell
-- Equation(s):
-- \btn_a_debounce_inst|counter_inst|cnt_int\(5) = DFFEAS(\btn_a_debounce_inst|counter_inst|cnt_int\(5) $ (((((!\btn_a_debounce_inst|counter_inst|cnt_int[2]~1\ & \btn_a_debounce_inst|counter_inst|cnt_int[4]~25\) # 
-- (\btn_a_debounce_inst|counter_inst|cnt_int[2]~1\ & \btn_a_debounce_inst|counter_inst|cnt_int[4]~25COUT1_52\))))), GLOBAL(\sys_clk~combout\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , , , 
-- \btn_a_debounce_inst|fsm_inst|Selector2~5_combout\, )
-- \btn_a_debounce_inst|counter_inst|cnt_int[5]~27\ = CARRY(((!\btn_a_debounce_inst|counter_inst|cnt_int[4]~25\)) # (!\btn_a_debounce_inst|counter_inst|cnt_int\(5)))
-- \btn_a_debounce_inst|counter_inst|cnt_int[5]~27COUT1_54\ = CARRY(((!\btn_a_debounce_inst|counter_inst|cnt_int[4]~25COUT1_52\)) # (!\btn_a_debounce_inst|counter_inst|cnt_int\(5)))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	cin_used => "true",
	lut_mask => "5a5f",
	operation_mode => "arithmetic",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~combout\,
	dataa => \btn_a_debounce_inst|counter_inst|cnt_int\(5),
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	sclr => \btn_a_debounce_inst|fsm_inst|Selector2~5_combout\,
	cin => \btn_a_debounce_inst|counter_inst|cnt_int[2]~1\,
	cin0 => \btn_a_debounce_inst|counter_inst|cnt_int[4]~25\,
	cin1 => \btn_a_debounce_inst|counter_inst|cnt_int[4]~25COUT1_52\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \btn_a_debounce_inst|counter_inst|cnt_int\(5),
	cout0 => \btn_a_debounce_inst|counter_inst|cnt_int[5]~27\,
	cout1 => \btn_a_debounce_inst|counter_inst|cnt_int[5]~27COUT1_54\);

-- Location: LC_X77_Y46_N8
\btn_a_debounce_inst|counter_inst|cnt_int[6]\ : stratix_lcell
-- Equation(s):
-- \btn_a_debounce_inst|counter_inst|cnt_int\(6) = DFFEAS(\btn_a_debounce_inst|counter_inst|cnt_int\(6) $ ((((!(!\btn_a_debounce_inst|counter_inst|cnt_int[2]~1\ & \btn_a_debounce_inst|counter_inst|cnt_int[5]~27\) # 
-- (\btn_a_debounce_inst|counter_inst|cnt_int[2]~1\ & \btn_a_debounce_inst|counter_inst|cnt_int[5]~27COUT1_54\))))), GLOBAL(\sys_clk~combout\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , , , 
-- \btn_a_debounce_inst|fsm_inst|Selector2~5_combout\, )
-- \btn_a_debounce_inst|counter_inst|cnt_int[6]~19\ = CARRY((\btn_a_debounce_inst|counter_inst|cnt_int\(6) & ((!\btn_a_debounce_inst|counter_inst|cnt_int[5]~27\))))
-- \btn_a_debounce_inst|counter_inst|cnt_int[6]~19COUT1_56\ = CARRY((\btn_a_debounce_inst|counter_inst|cnt_int\(6) & ((!\btn_a_debounce_inst|counter_inst|cnt_int[5]~27COUT1_54\))))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	cin_used => "true",
	lut_mask => "a50a",
	operation_mode => "arithmetic",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~combout\,
	dataa => \btn_a_debounce_inst|counter_inst|cnt_int\(6),
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	sclr => \btn_a_debounce_inst|fsm_inst|Selector2~5_combout\,
	cin => \btn_a_debounce_inst|counter_inst|cnt_int[2]~1\,
	cin0 => \btn_a_debounce_inst|counter_inst|cnt_int[5]~27\,
	cin1 => \btn_a_debounce_inst|counter_inst|cnt_int[5]~27COUT1_54\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \btn_a_debounce_inst|counter_inst|cnt_int\(6),
	cout0 => \btn_a_debounce_inst|counter_inst|cnt_int[6]~19\,
	cout1 => \btn_a_debounce_inst|counter_inst|cnt_int[6]~19COUT1_56\);

-- Location: LC_X77_Y46_N9
\btn_a_debounce_inst|counter_inst|cnt_int[7]\ : stratix_lcell
-- Equation(s):
-- \btn_a_debounce_inst|counter_inst|cnt_int\(7) = DFFEAS((\btn_a_debounce_inst|counter_inst|cnt_int\(7) $ (((!\btn_a_debounce_inst|counter_inst|cnt_int[2]~1\ & \btn_a_debounce_inst|counter_inst|cnt_int[6]~19\) # 
-- (\btn_a_debounce_inst|counter_inst|cnt_int[2]~1\ & \btn_a_debounce_inst|counter_inst|cnt_int[6]~19COUT1_56\)))), GLOBAL(\sys_clk~combout\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , , , 
-- \btn_a_debounce_inst|fsm_inst|Selector2~5_combout\, )
-- \btn_a_debounce_inst|counter_inst|cnt_int[7]~21\ = CARRY(((!\btn_a_debounce_inst|counter_inst|cnt_int[6]~19COUT1_56\) # (!\btn_a_debounce_inst|counter_inst|cnt_int\(7))))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	cin_used => "true",
	lut_mask => "3c3f",
	operation_mode => "arithmetic",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~combout\,
	datab => \btn_a_debounce_inst|counter_inst|cnt_int\(7),
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	sclr => \btn_a_debounce_inst|fsm_inst|Selector2~5_combout\,
	cin => \btn_a_debounce_inst|counter_inst|cnt_int[2]~1\,
	cin0 => \btn_a_debounce_inst|counter_inst|cnt_int[6]~19\,
	cin1 => \btn_a_debounce_inst|counter_inst|cnt_int[6]~19COUT1_56\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \btn_a_debounce_inst|counter_inst|cnt_int\(7),
	cout => \btn_a_debounce_inst|counter_inst|cnt_int[7]~21\);

-- Location: LC_X77_Y45_N0
\btn_a_debounce_inst|counter_inst|cnt_int[8]\ : stratix_lcell
-- Equation(s):
-- \btn_a_debounce_inst|counter_inst|cnt_int\(8) = DFFEAS((\btn_a_debounce_inst|counter_inst|cnt_int\(8) $ ((!\btn_a_debounce_inst|counter_inst|cnt_int[7]~21\))), GLOBAL(\sys_clk~combout\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , , , 
-- \btn_a_debounce_inst|fsm_inst|Selector2~5_combout\, )
-- \btn_a_debounce_inst|counter_inst|cnt_int[8]~23\ = CARRY(((\btn_a_debounce_inst|counter_inst|cnt_int\(8) & !\btn_a_debounce_inst|counter_inst|cnt_int[7]~21\)))
-- \btn_a_debounce_inst|counter_inst|cnt_int[8]~23COUT1_58\ = CARRY(((\btn_a_debounce_inst|counter_inst|cnt_int\(8) & !\btn_a_debounce_inst|counter_inst|cnt_int[7]~21\)))

-- pragma translate_off
GENERIC MAP (
	cin_used => "true",
	lut_mask => "c30c",
	operation_mode => "arithmetic",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~combout\,
	datab => \btn_a_debounce_inst|counter_inst|cnt_int\(8),
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	sclr => \btn_a_debounce_inst|fsm_inst|Selector2~5_combout\,
	cin => \btn_a_debounce_inst|counter_inst|cnt_int[7]~21\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \btn_a_debounce_inst|counter_inst|cnt_int\(8),
	cout0 => \btn_a_debounce_inst|counter_inst|cnt_int[8]~23\,
	cout1 => \btn_a_debounce_inst|counter_inst|cnt_int[8]~23COUT1_58\);

-- Location: LC_X77_Y45_N1
\btn_a_debounce_inst|counter_inst|cnt_int[9]\ : stratix_lcell
-- Equation(s):
-- \btn_a_debounce_inst|counter_inst|cnt_int\(9) = DFFEAS((\btn_a_debounce_inst|counter_inst|cnt_int\(9) $ (((!\btn_a_debounce_inst|counter_inst|cnt_int[7]~21\ & \btn_a_debounce_inst|counter_inst|cnt_int[8]~23\) # 
-- (\btn_a_debounce_inst|counter_inst|cnt_int[7]~21\ & \btn_a_debounce_inst|counter_inst|cnt_int[8]~23COUT1_58\)))), GLOBAL(\sys_clk~combout\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , , , 
-- \btn_a_debounce_inst|fsm_inst|Selector2~5_combout\, )
-- \btn_a_debounce_inst|counter_inst|cnt_int[9]~3\ = CARRY(((!\btn_a_debounce_inst|counter_inst|cnt_int[8]~23\) # (!\btn_a_debounce_inst|counter_inst|cnt_int\(9))))
-- \btn_a_debounce_inst|counter_inst|cnt_int[9]~3COUT1_60\ = CARRY(((!\btn_a_debounce_inst|counter_inst|cnt_int[8]~23COUT1_58\) # (!\btn_a_debounce_inst|counter_inst|cnt_int\(9))))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	cin_used => "true",
	lut_mask => "3c3f",
	operation_mode => "arithmetic",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~combout\,
	datab => \btn_a_debounce_inst|counter_inst|cnt_int\(9),
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	sclr => \btn_a_debounce_inst|fsm_inst|Selector2~5_combout\,
	cin => \btn_a_debounce_inst|counter_inst|cnt_int[7]~21\,
	cin0 => \btn_a_debounce_inst|counter_inst|cnt_int[8]~23\,
	cin1 => \btn_a_debounce_inst|counter_inst|cnt_int[8]~23COUT1_58\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \btn_a_debounce_inst|counter_inst|cnt_int\(9),
	cout0 => \btn_a_debounce_inst|counter_inst|cnt_int[9]~3\,
	cout1 => \btn_a_debounce_inst|counter_inst|cnt_int[9]~3COUT1_60\);

-- Location: LC_X77_Y45_N2
\btn_a_debounce_inst|counter_inst|cnt_int[10]\ : stratix_lcell
-- Equation(s):
-- \btn_a_debounce_inst|counter_inst|cnt_int\(10) = DFFEAS(\btn_a_debounce_inst|counter_inst|cnt_int\(10) $ ((((!(!\btn_a_debounce_inst|counter_inst|cnt_int[7]~21\ & \btn_a_debounce_inst|counter_inst|cnt_int[9]~3\) # 
-- (\btn_a_debounce_inst|counter_inst|cnt_int[7]~21\ & \btn_a_debounce_inst|counter_inst|cnt_int[9]~3COUT1_60\))))), GLOBAL(\sys_clk~combout\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , , , 
-- \btn_a_debounce_inst|fsm_inst|Selector2~5_combout\, )
-- \btn_a_debounce_inst|counter_inst|cnt_int[10]~9\ = CARRY((\btn_a_debounce_inst|counter_inst|cnt_int\(10) & ((!\btn_a_debounce_inst|counter_inst|cnt_int[9]~3\))))
-- \btn_a_debounce_inst|counter_inst|cnt_int[10]~9COUT1_62\ = CARRY((\btn_a_debounce_inst|counter_inst|cnt_int\(10) & ((!\btn_a_debounce_inst|counter_inst|cnt_int[9]~3COUT1_60\))))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	cin_used => "true",
	lut_mask => "a50a",
	operation_mode => "arithmetic",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~combout\,
	dataa => \btn_a_debounce_inst|counter_inst|cnt_int\(10),
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	sclr => \btn_a_debounce_inst|fsm_inst|Selector2~5_combout\,
	cin => \btn_a_debounce_inst|counter_inst|cnt_int[7]~21\,
	cin0 => \btn_a_debounce_inst|counter_inst|cnt_int[9]~3\,
	cin1 => \btn_a_debounce_inst|counter_inst|cnt_int[9]~3COUT1_60\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \btn_a_debounce_inst|counter_inst|cnt_int\(10),
	cout0 => \btn_a_debounce_inst|counter_inst|cnt_int[10]~9\,
	cout1 => \btn_a_debounce_inst|counter_inst|cnt_int[10]~9COUT1_62\);

-- Location: LC_X77_Y45_N3
\btn_a_debounce_inst|counter_inst|cnt_int[11]\ : stratix_lcell
-- Equation(s):
-- \btn_a_debounce_inst|counter_inst|cnt_int\(11) = DFFEAS(\btn_a_debounce_inst|counter_inst|cnt_int\(11) $ (((((!\btn_a_debounce_inst|counter_inst|cnt_int[7]~21\ & \btn_a_debounce_inst|counter_inst|cnt_int[10]~9\) # 
-- (\btn_a_debounce_inst|counter_inst|cnt_int[7]~21\ & \btn_a_debounce_inst|counter_inst|cnt_int[10]~9COUT1_62\))))), GLOBAL(\sys_clk~combout\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , , , 
-- \btn_a_debounce_inst|fsm_inst|Selector2~5_combout\, )
-- \btn_a_debounce_inst|counter_inst|cnt_int[11]~11\ = CARRY(((!\btn_a_debounce_inst|counter_inst|cnt_int[10]~9\)) # (!\btn_a_debounce_inst|counter_inst|cnt_int\(11)))
-- \btn_a_debounce_inst|counter_inst|cnt_int[11]~11COUT1_64\ = CARRY(((!\btn_a_debounce_inst|counter_inst|cnt_int[10]~9COUT1_62\)) # (!\btn_a_debounce_inst|counter_inst|cnt_int\(11)))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	cin_used => "true",
	lut_mask => "5a5f",
	operation_mode => "arithmetic",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~combout\,
	dataa => \btn_a_debounce_inst|counter_inst|cnt_int\(11),
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	sclr => \btn_a_debounce_inst|fsm_inst|Selector2~5_combout\,
	cin => \btn_a_debounce_inst|counter_inst|cnt_int[7]~21\,
	cin0 => \btn_a_debounce_inst|counter_inst|cnt_int[10]~9\,
	cin1 => \btn_a_debounce_inst|counter_inst|cnt_int[10]~9COUT1_62\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \btn_a_debounce_inst|counter_inst|cnt_int\(11),
	cout0 => \btn_a_debounce_inst|counter_inst|cnt_int[11]~11\,
	cout1 => \btn_a_debounce_inst|counter_inst|cnt_int[11]~11COUT1_64\);

-- Location: LC_X77_Y45_N4
\btn_a_debounce_inst|counter_inst|cnt_int[12]\ : stratix_lcell
-- Equation(s):
-- \btn_a_debounce_inst|counter_inst|cnt_int\(12) = DFFEAS(\btn_a_debounce_inst|counter_inst|cnt_int\(12) $ ((((!(!\btn_a_debounce_inst|counter_inst|cnt_int[7]~21\ & \btn_a_debounce_inst|counter_inst|cnt_int[11]~11\) # 
-- (\btn_a_debounce_inst|counter_inst|cnt_int[7]~21\ & \btn_a_debounce_inst|counter_inst|cnt_int[11]~11COUT1_64\))))), GLOBAL(\sys_clk~combout\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , , , 
-- \btn_a_debounce_inst|fsm_inst|Selector2~5_combout\, )
-- \btn_a_debounce_inst|counter_inst|cnt_int[12]~15\ = CARRY((\btn_a_debounce_inst|counter_inst|cnt_int\(12) & ((!\btn_a_debounce_inst|counter_inst|cnt_int[11]~11COUT1_64\))))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	cin_used => "true",
	lut_mask => "a50a",
	operation_mode => "arithmetic",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~combout\,
	dataa => \btn_a_debounce_inst|counter_inst|cnt_int\(12),
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	sclr => \btn_a_debounce_inst|fsm_inst|Selector2~5_combout\,
	cin => \btn_a_debounce_inst|counter_inst|cnt_int[7]~21\,
	cin0 => \btn_a_debounce_inst|counter_inst|cnt_int[11]~11\,
	cin1 => \btn_a_debounce_inst|counter_inst|cnt_int[11]~11COUT1_64\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \btn_a_debounce_inst|counter_inst|cnt_int\(12),
	cout => \btn_a_debounce_inst|counter_inst|cnt_int[12]~15\);

-- Location: LC_X77_Y45_N5
\btn_a_debounce_inst|counter_inst|cnt_int[13]\ : stratix_lcell
-- Equation(s):
-- \btn_a_debounce_inst|counter_inst|cnt_int\(13) = DFFEAS((\btn_a_debounce_inst|counter_inst|cnt_int\(13) $ ((\btn_a_debounce_inst|counter_inst|cnt_int[12]~15\))), GLOBAL(\sys_clk~combout\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , , , 
-- \btn_a_debounce_inst|fsm_inst|Selector2~5_combout\, )
-- \btn_a_debounce_inst|counter_inst|cnt_int[13]~17\ = CARRY(((!\btn_a_debounce_inst|counter_inst|cnt_int[12]~15\) # (!\btn_a_debounce_inst|counter_inst|cnt_int\(13))))
-- \btn_a_debounce_inst|counter_inst|cnt_int[13]~17COUT1_66\ = CARRY(((!\btn_a_debounce_inst|counter_inst|cnt_int[12]~15\) # (!\btn_a_debounce_inst|counter_inst|cnt_int\(13))))

-- pragma translate_off
GENERIC MAP (
	cin_used => "true",
	lut_mask => "3c3f",
	operation_mode => "arithmetic",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~combout\,
	datab => \btn_a_debounce_inst|counter_inst|cnt_int\(13),
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	sclr => \btn_a_debounce_inst|fsm_inst|Selector2~5_combout\,
	cin => \btn_a_debounce_inst|counter_inst|cnt_int[12]~15\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \btn_a_debounce_inst|counter_inst|cnt_int\(13),
	cout0 => \btn_a_debounce_inst|counter_inst|cnt_int[13]~17\,
	cout1 => \btn_a_debounce_inst|counter_inst|cnt_int[13]~17COUT1_66\);

-- Location: LC_X77_Y45_N6
\btn_a_debounce_inst|counter_inst|cnt_int[14]\ : stratix_lcell
-- Equation(s):
-- \btn_a_debounce_inst|counter_inst|cnt_int\(14) = DFFEAS((\btn_a_debounce_inst|counter_inst|cnt_int\(14) $ ((!(!\btn_a_debounce_inst|counter_inst|cnt_int[12]~15\ & \btn_a_debounce_inst|counter_inst|cnt_int[13]~17\) # 
-- (\btn_a_debounce_inst|counter_inst|cnt_int[12]~15\ & \btn_a_debounce_inst|counter_inst|cnt_int[13]~17COUT1_66\)))), GLOBAL(\sys_clk~combout\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , , , 
-- \btn_a_debounce_inst|fsm_inst|Selector2~5_combout\, )
-- \btn_a_debounce_inst|counter_inst|cnt_int[14]~13\ = CARRY(((\btn_a_debounce_inst|counter_inst|cnt_int\(14) & !\btn_a_debounce_inst|counter_inst|cnt_int[13]~17\)))
-- \btn_a_debounce_inst|counter_inst|cnt_int[14]~13COUT1_68\ = CARRY(((\btn_a_debounce_inst|counter_inst|cnt_int\(14) & !\btn_a_debounce_inst|counter_inst|cnt_int[13]~17COUT1_66\)))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	cin_used => "true",
	lut_mask => "c30c",
	operation_mode => "arithmetic",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~combout\,
	datab => \btn_a_debounce_inst|counter_inst|cnt_int\(14),
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	sclr => \btn_a_debounce_inst|fsm_inst|Selector2~5_combout\,
	cin => \btn_a_debounce_inst|counter_inst|cnt_int[12]~15\,
	cin0 => \btn_a_debounce_inst|counter_inst|cnt_int[13]~17\,
	cin1 => \btn_a_debounce_inst|counter_inst|cnt_int[13]~17COUT1_66\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \btn_a_debounce_inst|counter_inst|cnt_int\(14),
	cout0 => \btn_a_debounce_inst|counter_inst|cnt_int[14]~13\,
	cout1 => \btn_a_debounce_inst|counter_inst|cnt_int[14]~13COUT1_68\);

-- Location: LC_X77_Y45_N7
\btn_a_debounce_inst|counter_inst|cnt_int[15]\ : stratix_lcell
-- Equation(s):
-- \btn_a_debounce_inst|counter_inst|cnt_int\(15) = DFFEAS(\btn_a_debounce_inst|counter_inst|cnt_int\(15) $ (((((!\btn_a_debounce_inst|counter_inst|cnt_int[12]~15\ & \btn_a_debounce_inst|counter_inst|cnt_int[14]~13\) # 
-- (\btn_a_debounce_inst|counter_inst|cnt_int[12]~15\ & \btn_a_debounce_inst|counter_inst|cnt_int[14]~13COUT1_68\))))), GLOBAL(\sys_clk~combout\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , , , 
-- \btn_a_debounce_inst|fsm_inst|Selector2~5_combout\, )

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	cin_used => "true",
	lut_mask => "5a5a",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~combout\,
	dataa => \btn_a_debounce_inst|counter_inst|cnt_int\(15),
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	sclr => \btn_a_debounce_inst|fsm_inst|Selector2~5_combout\,
	cin => \btn_a_debounce_inst|counter_inst|cnt_int[12]~15\,
	cin0 => \btn_a_debounce_inst|counter_inst|cnt_int[14]~13\,
	cin1 => \btn_a_debounce_inst|counter_inst|cnt_int[14]~13COUT1_68\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \btn_a_debounce_inst|counter_inst|cnt_int\(15));

-- Location: LC_X77_Y46_N0
\btn_a_debounce_inst|counter_inst|LessThan0~0\ : stratix_lcell
-- Equation(s):
-- \btn_a_debounce_inst|counter_inst|LessThan0~0_combout\ = (!\btn_a_debounce_inst|counter_inst|cnt_int\(3) & (((!\btn_a_debounce_inst|counter_inst|cnt_int\(0) & !\btn_a_debounce_inst|counter_inst|cnt_int\(1))) # 
-- (!\btn_a_debounce_inst|counter_inst|cnt_int\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0133",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \btn_a_debounce_inst|counter_inst|cnt_int\(0),
	datab => \btn_a_debounce_inst|counter_inst|cnt_int\(3),
	datac => \btn_a_debounce_inst|counter_inst|cnt_int\(1),
	datad => \btn_a_debounce_inst|counter_inst|cnt_int\(2),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \btn_a_debounce_inst|counter_inst|LessThan0~0_combout\);

-- Location: LC_X76_Y46_N9
\btn_a_debounce_inst|counter_inst|LessThan0~1\ : stratix_lcell
-- Equation(s):
-- \btn_a_debounce_inst|counter_inst|LessThan0~1_combout\ = ((\btn_a_debounce_inst|counter_inst|cnt_int\(8)) # ((\btn_a_debounce_inst|counter_inst|cnt_int\(6)) # (\btn_a_debounce_inst|counter_inst|cnt_int\(7))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "fffc",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \btn_a_debounce_inst|counter_inst|cnt_int\(8),
	datac => \btn_a_debounce_inst|counter_inst|cnt_int\(6),
	datad => \btn_a_debounce_inst|counter_inst|cnt_int\(7),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \btn_a_debounce_inst|counter_inst|LessThan0~1_combout\);

-- Location: LC_X76_Y46_N5
\btn_a_debounce_inst|counter_inst|LessThan0~2\ : stratix_lcell
-- Equation(s):
-- \btn_a_debounce_inst|counter_inst|LessThan0~2_combout\ = (\btn_a_debounce_inst|counter_inst|LessThan0~1_combout\) # ((\btn_a_debounce_inst|counter_inst|cnt_int\(5) & (\btn_a_debounce_inst|counter_inst|cnt_int\(4) & 
-- !\btn_a_debounce_inst|counter_inst|LessThan0~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "ff08",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \btn_a_debounce_inst|counter_inst|cnt_int\(5),
	datab => \btn_a_debounce_inst|counter_inst|cnt_int\(4),
	datac => \btn_a_debounce_inst|counter_inst|LessThan0~0_combout\,
	datad => \btn_a_debounce_inst|counter_inst|LessThan0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \btn_a_debounce_inst|counter_inst|LessThan0~2_combout\);

-- Location: LC_X77_Y45_N9
\btn_a_debounce_inst|fsm_inst|Equal0~1\ : stratix_lcell
-- Equation(s):
-- \btn_a_debounce_inst|fsm_inst|Equal0~1_combout\ = (((!\btn_a_debounce_inst|counter_inst|cnt_int\(11) & !\btn_a_debounce_inst|counter_inst|cnt_int\(10))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "000f",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datac => \btn_a_debounce_inst|counter_inst|cnt_int\(11),
	datad => \btn_a_debounce_inst|counter_inst|cnt_int\(10),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \btn_a_debounce_inst|fsm_inst|Equal0~1_combout\);

-- Location: LC_X77_Y45_N8
\btn_a_debounce_inst|fsm_inst|Equal0~2\ : stratix_lcell
-- Equation(s):
-- \btn_a_debounce_inst|fsm_inst|Equal0~2_combout\ = (!\btn_a_debounce_inst|counter_inst|cnt_int\(12) & (!\btn_a_debounce_inst|counter_inst|cnt_int\(14) & (!\btn_a_debounce_inst|counter_inst|cnt_int\(13) & \btn_a_debounce_inst|fsm_inst|Equal0~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \btn_a_debounce_inst|counter_inst|cnt_int\(12),
	datab => \btn_a_debounce_inst|counter_inst|cnt_int\(14),
	datac => \btn_a_debounce_inst|counter_inst|cnt_int\(13),
	datad => \btn_a_debounce_inst|fsm_inst|Equal0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \btn_a_debounce_inst|fsm_inst|Equal0~2_combout\);

-- Location: LC_X76_Y46_N6
\btn_a_debounce_inst|counter_inst|LessThan0~3\ : stratix_lcell
-- Equation(s):
-- \btn_a_debounce_inst|counter_inst|LessThan0~3_combout\ = ((\btn_a_debounce_inst|fsm_inst|Equal0~2_combout\ & ((!\btn_a_debounce_inst|counter_inst|LessThan0~2_combout\) # (!\btn_a_debounce_inst|counter_inst|cnt_int\(9))))) # 
-- (!\btn_a_debounce_inst|counter_inst|cnt_int\(15))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "7f33",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \btn_a_debounce_inst|counter_inst|cnt_int\(9),
	datab => \btn_a_debounce_inst|counter_inst|cnt_int\(15),
	datac => \btn_a_debounce_inst|counter_inst|LessThan0~2_combout\,
	datad => \btn_a_debounce_inst|fsm_inst|Equal0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \btn_a_debounce_inst|counter_inst|LessThan0~3_combout\);

-- Location: LC_X77_Y46_N1
\btn_a_debounce_inst|fsm_inst|Equal0~4\ : stratix_lcell
-- Equation(s):
-- \btn_a_debounce_inst|fsm_inst|Equal0~4_combout\ = (!\btn_a_debounce_inst|counter_inst|cnt_int\(1) & (\btn_a_debounce_inst|counter_inst|cnt_int\(4) & (\btn_a_debounce_inst|counter_inst|cnt_int\(5) & \btn_a_debounce_inst|counter_inst|cnt_int\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "4000",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \btn_a_debounce_inst|counter_inst|cnt_int\(1),
	datab => \btn_a_debounce_inst|counter_inst|cnt_int\(4),
	datac => \btn_a_debounce_inst|counter_inst|cnt_int\(5),
	datad => \btn_a_debounce_inst|counter_inst|cnt_int\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \btn_a_debounce_inst|fsm_inst|Equal0~4_combout\);

-- Location: LC_X76_Y46_N1
\btn_a_debounce_inst|fsm_inst|Equal0~0\ : stratix_lcell
-- Equation(s):
-- \btn_a_debounce_inst|fsm_inst|Equal0~0_combout\ = (\btn_a_debounce_inst|counter_inst|cnt_int\(9) & (\btn_a_debounce_inst|counter_inst|cnt_int\(15) & (\btn_a_debounce_inst|counter_inst|cnt_int\(2) & !\btn_a_debounce_inst|counter_inst|cnt_int\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0080",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \btn_a_debounce_inst|counter_inst|cnt_int\(9),
	datab => \btn_a_debounce_inst|counter_inst|cnt_int\(15),
	datac => \btn_a_debounce_inst|counter_inst|cnt_int\(2),
	datad => \btn_a_debounce_inst|counter_inst|cnt_int\(3),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \btn_a_debounce_inst|fsm_inst|Equal0~0_combout\);

-- Location: LC_X76_Y46_N8
\btn_a_debounce_inst|fsm_inst|Equal0~3\ : stratix_lcell
-- Equation(s):
-- \btn_a_debounce_inst|fsm_inst|Equal0~3_combout\ = ((!\btn_a_debounce_inst|counter_inst|cnt_int\(8) & (!\btn_a_debounce_inst|counter_inst|cnt_int\(6) & !\btn_a_debounce_inst|counter_inst|cnt_int\(7))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0003",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \btn_a_debounce_inst|counter_inst|cnt_int\(8),
	datac => \btn_a_debounce_inst|counter_inst|cnt_int\(6),
	datad => \btn_a_debounce_inst|counter_inst|cnt_int\(7),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \btn_a_debounce_inst|fsm_inst|Equal0~3_combout\);

-- Location: LC_X76_Y46_N2
\btn_a_debounce_inst|fsm_inst|Equal0~5\ : stratix_lcell
-- Equation(s):
-- \btn_a_debounce_inst|fsm_inst|Equal0~5_combout\ = (\btn_a_debounce_inst|fsm_inst|Equal0~4_combout\ & (\btn_a_debounce_inst|fsm_inst|Equal0~2_combout\ & (\btn_a_debounce_inst|fsm_inst|Equal0~0_combout\ & \btn_a_debounce_inst|fsm_inst|Equal0~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "8000",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \btn_a_debounce_inst|fsm_inst|Equal0~4_combout\,
	datab => \btn_a_debounce_inst|fsm_inst|Equal0~2_combout\,
	datac => \btn_a_debounce_inst|fsm_inst|Equal0~0_combout\,
	datad => \btn_a_debounce_inst|fsm_inst|Equal0~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \btn_a_debounce_inst|fsm_inst|Equal0~5_combout\);

-- Location: PIN_A3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\btn_a~I\ : stratix_io
-- pragma translate_off
GENERIC MAP (
	ddio_mode => "none",
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_btn_a,
	combout => \btn_a~combout\);

-- Location: LC_X76_Y46_N7
\btn_a_debounce_inst|sync_inst|sync[1]\ : stratix_lcell
-- Equation(s):
-- \btn_a_debounce_inst|sync_inst|sync\(1) = DFFEAS((((!\btn_a~combout\))), GLOBAL(\sys_clk~combout\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "00ff",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~combout\,
	datad => \btn_a~combout\,
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \btn_a_debounce_inst|sync_inst|sync\(1));

-- Location: LC_X76_Y46_N4
\btn_a_debounce_inst|sync_inst|sync[2]\ : stratix_lcell
-- Equation(s):
-- \btn_a_debounce_inst|fsm_inst|Selector3~0\ = (\btn_a_debounce_inst|fsm_inst|debounce_fsm_state.TIMEOUT1~regout\ & (((\btn_a_debounce_inst|fsm_inst|Equal0~5_combout\) # (!L2_sync[2])))) # (!\btn_a_debounce_inst|fsm_inst|debounce_fsm_state.TIMEOUT1~regout\ 
-- & (\btn_a_debounce_inst|fsm_inst|debounce_fsm_state.TIMEOUT0~regout\ & ((L2_sync[2]) # (\btn_a_debounce_inst|fsm_inst|Equal0~5_combout\))))
-- \btn_a_debounce_inst|sync_inst|sync\(2) = DFFEAS(\btn_a_debounce_inst|fsm_inst|Selector3~0\, GLOBAL(\sys_clk~combout\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , \btn_a_debounce_inst|sync_inst|sync\(1), , , VCC)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "ee4a",
	operation_mode => "normal",
	output_mode => "reg_and_comb",
	register_cascade_mode => "off",
	sum_lutc_input => "qfbk",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~combout\,
	dataa => \btn_a_debounce_inst|fsm_inst|debounce_fsm_state.TIMEOUT1~regout\,
	datab => \btn_a_debounce_inst|fsm_inst|debounce_fsm_state.TIMEOUT0~regout\,
	datac => \btn_a_debounce_inst|sync_inst|sync\(1),
	datad => \btn_a_debounce_inst|fsm_inst|Equal0~5_combout\,
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \btn_a_debounce_inst|fsm_inst|Selector3~0\,
	regout => \btn_a_debounce_inst|sync_inst|sync\(2));

-- Location: LC_X76_Y45_N5
\btn_a_debounce_inst|fsm_inst|Selector3~1\ : stratix_lcell
-- Equation(s):
-- \btn_a_debounce_inst|fsm_inst|Selector3~1_combout\ = (!\btn_a_debounce_inst|fsm_inst|Selector3~0\ & ((\btn_a_debounce_inst|sync_inst|sync\(2) & ((\btn_a_debounce_inst|fsm_inst|debounce_fsm_state.IDLE1~regout\))) # (!\btn_a_debounce_inst|sync_inst|sync\(2) 
-- & (!\btn_a_debounce_inst|fsm_inst|debounce_fsm_state.IDLE0~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "5011",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \btn_a_debounce_inst|fsm_inst|Selector3~0\,
	datab => \btn_a_debounce_inst|fsm_inst|debounce_fsm_state.IDLE0~regout\,
	datac => \btn_a_debounce_inst|fsm_inst|debounce_fsm_state.IDLE1~regout\,
	datad => \btn_a_debounce_inst|sync_inst|sync\(2),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \btn_a_debounce_inst|fsm_inst|Selector3~1_combout\);

-- Location: LC_X76_Y45_N6
\btn_a_debounce_inst|fsm_inst|debounce_fsm_state.TIMEOUT1\ : stratix_lcell
-- Equation(s):
-- \btn_a_debounce_inst|fsm_inst|debounce_fsm_state.TIMEOUT1~regout\ = DFFEAS((\btn_a_debounce_inst|sync_inst|sync\(2) & (((\btn_a_debounce_inst|fsm_inst|Selector3~1_combout\ & \btn_a_debounce_inst|fsm_inst|debounce_fsm_state.TIMEOUT1~regout\)) # 
-- (!\btn_a_debounce_inst|fsm_inst|debounce_fsm_state.IDLE1~regout\))) # (!\btn_a_debounce_inst|sync_inst|sync\(2) & (\btn_a_debounce_inst|fsm_inst|Selector3~1_combout\ & ((\btn_a_debounce_inst|fsm_inst|debounce_fsm_state.TIMEOUT1~regout\)))), 
-- GLOBAL(\sys_clk~combout\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "ce0a",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~combout\,
	dataa => \btn_a_debounce_inst|sync_inst|sync\(2),
	datab => \btn_a_debounce_inst|fsm_inst|Selector3~1_combout\,
	datac => \btn_a_debounce_inst|fsm_inst|debounce_fsm_state.IDLE1~regout\,
	datad => \btn_a_debounce_inst|fsm_inst|debounce_fsm_state.TIMEOUT1~regout\,
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \btn_a_debounce_inst|fsm_inst|debounce_fsm_state.TIMEOUT1~regout\);

-- Location: LC_X76_Y45_N0
\btn_a_debounce_inst|fsm_inst|Selector2~3\ : stratix_lcell
-- Equation(s):
-- \btn_a_debounce_inst|fsm_inst|Selector2~3_combout\ = (\btn_a_debounce_inst|fsm_inst|Equal0~5_combout\ & (!\btn_a_debounce_inst|fsm_inst|debounce_fsm_state.TIMEOUT1~regout\ & (!\btn_a_debounce_inst|fsm_inst|debounce_fsm_state.TIMEOUT0~regout\))) # 
-- (!\btn_a_debounce_inst|fsm_inst|Equal0~5_combout\ & ((\btn_a_debounce_inst|sync_inst|sync\(2) & ((!\btn_a_debounce_inst|fsm_inst|debounce_fsm_state.TIMEOUT0~regout\))) # (!\btn_a_debounce_inst|sync_inst|sync\(2) & 
-- (!\btn_a_debounce_inst|fsm_inst|debounce_fsm_state.TIMEOUT1~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0713",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \btn_a_debounce_inst|fsm_inst|Equal0~5_combout\,
	datab => \btn_a_debounce_inst|fsm_inst|debounce_fsm_state.TIMEOUT1~regout\,
	datac => \btn_a_debounce_inst|fsm_inst|debounce_fsm_state.TIMEOUT0~regout\,
	datad => \btn_a_debounce_inst|sync_inst|sync\(2),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \btn_a_debounce_inst|fsm_inst|Selector2~3_combout\);

-- Location: LC_X76_Y45_N7
\btn_a_debounce_inst|fsm_inst|debounce_fsm_state.IDLE1\ : stratix_lcell
-- Equation(s):
-- \btn_a_debounce_inst|fsm_inst|debounce_fsm_state.IDLE1~regout\ = DFFEAS((\btn_a_debounce_inst|fsm_inst|Selector2~3_combout\ & (((\btn_a_debounce_inst|fsm_inst|debounce_fsm_state.IDLE1~regout\)) # (!\btn_a_debounce_inst|fsm_inst|Selector2~2_combout\))) # 
-- (!\btn_a_debounce_inst|fsm_inst|Selector2~3_combout\ & (((\btn_a_debounce_inst|sync_inst|sync\(2))))), GLOBAL(\sys_clk~combout\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "f7c4",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~combout\,
	dataa => \btn_a_debounce_inst|fsm_inst|Selector2~2_combout\,
	datab => \btn_a_debounce_inst|fsm_inst|Selector2~3_combout\,
	datac => \btn_a_debounce_inst|fsm_inst|debounce_fsm_state.IDLE1~regout\,
	datad => \btn_a_debounce_inst|sync_inst|sync\(2),
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \btn_a_debounce_inst|fsm_inst|debounce_fsm_state.IDLE1~regout\);

-- Location: LC_X76_Y45_N2
\btn_a_debounce_inst|fsm_inst|Selector2~0\ : stratix_lcell
-- Equation(s):
-- \btn_a_debounce_inst|fsm_inst|Selector2~0_combout\ = (\btn_a_debounce_inst|fsm_inst|debounce_fsm_state.TIMEOUT0~regout\ & (((\btn_a_debounce_inst|sync_inst|sync\(2)) # (!\btn_a_debounce_inst|fsm_inst|debounce_fsm_state.IDLE1~regout\)) # 
-- (!\btn_a_debounce_inst|fsm_inst|debounce_fsm_state.IDLE0~regout\))) # (!\btn_a_debounce_inst|fsm_inst|debounce_fsm_state.TIMEOUT0~regout\ & (((!\btn_a_debounce_inst|fsm_inst|debounce_fsm_state.IDLE1~regout\ & \btn_a_debounce_inst|sync_inst|sync\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "af2a",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \btn_a_debounce_inst|fsm_inst|debounce_fsm_state.TIMEOUT0~regout\,
	datab => \btn_a_debounce_inst|fsm_inst|debounce_fsm_state.IDLE0~regout\,
	datac => \btn_a_debounce_inst|fsm_inst|debounce_fsm_state.IDLE1~regout\,
	datad => \btn_a_debounce_inst|sync_inst|sync\(2),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \btn_a_debounce_inst|fsm_inst|Selector2~0_combout\);

-- Location: LC_X76_Y45_N8
\btn_a_debounce_inst|fsm_inst|Selector2~1\ : stratix_lcell
-- Equation(s):
-- \btn_a_debounce_inst|fsm_inst|Selector2~1_combout\ = (!\btn_a_debounce_inst|sync_inst|sync\(2) & ((\btn_a_debounce_inst|fsm_inst|debounce_fsm_state.TIMEOUT0~regout\) # ((\btn_a_debounce_inst|fsm_inst|debounce_fsm_state.IDLE0~regout\ & 
-- \btn_a_debounce_inst|fsm_inst|debounce_fsm_state.IDLE1~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "00ea",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \btn_a_debounce_inst|fsm_inst|debounce_fsm_state.TIMEOUT0~regout\,
	datab => \btn_a_debounce_inst|fsm_inst|debounce_fsm_state.IDLE0~regout\,
	datac => \btn_a_debounce_inst|fsm_inst|debounce_fsm_state.IDLE1~regout\,
	datad => \btn_a_debounce_inst|sync_inst|sync\(2),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \btn_a_debounce_inst|fsm_inst|Selector2~1_combout\);

-- Location: LC_X76_Y45_N4
\btn_a_debounce_inst|fsm_inst|Selector2~2\ : stratix_lcell
-- Equation(s):
-- \btn_a_debounce_inst|fsm_inst|Selector2~2_combout\ = (\btn_a_debounce_inst|fsm_inst|Selector2~0_combout\ & ((\btn_a_debounce_inst|fsm_inst|Equal0~5_combout\ & (\btn_a_debounce_inst|fsm_inst|debounce_fsm_state.TIMEOUT1~regout\)) # 
-- (!\btn_a_debounce_inst|fsm_inst|Equal0~5_combout\ & ((\btn_a_debounce_inst|fsm_inst|Selector2~1_combout\))))) # (!\btn_a_debounce_inst|fsm_inst|Selector2~0_combout\ & ((\btn_a_debounce_inst|fsm_inst|debounce_fsm_state.TIMEOUT1~regout\) # 
-- ((!\btn_a_debounce_inst|fsm_inst|Selector2~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "ced5",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \btn_a_debounce_inst|fsm_inst|Selector2~0_combout\,
	datab => \btn_a_debounce_inst|fsm_inst|debounce_fsm_state.TIMEOUT1~regout\,
	datac => \btn_a_debounce_inst|fsm_inst|Equal0~5_combout\,
	datad => \btn_a_debounce_inst|fsm_inst|Selector2~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \btn_a_debounce_inst|fsm_inst|Selector2~2_combout\);

-- Location: LC_X76_Y46_N3
\btn_a_debounce_inst|fsm_inst|Selector0~0\ : stratix_lcell
-- Equation(s):
-- \btn_a_debounce_inst|fsm_inst|Selector0~0_combout\ = (\btn_a_debounce_inst|fsm_inst|debounce_fsm_state.TIMEOUT1~regout\ & (\btn_a_debounce_inst|sync_inst|sync\(2) & ((\btn_a_debounce_inst|fsm_inst|debounce_fsm_state.IDLE0~regout\) # 
-- (\btn_a_debounce_inst|fsm_inst|Equal0~5_combout\)))) # (!\btn_a_debounce_inst|fsm_inst|debounce_fsm_state.TIMEOUT1~regout\ & (\btn_a_debounce_inst|fsm_inst|debounce_fsm_state.IDLE0~regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "e4c4",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \btn_a_debounce_inst|fsm_inst|debounce_fsm_state.TIMEOUT1~regout\,
	datab => \btn_a_debounce_inst|fsm_inst|debounce_fsm_state.IDLE0~regout\,
	datac => \btn_a_debounce_inst|sync_inst|sync\(2),
	datad => \btn_a_debounce_inst|fsm_inst|Equal0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \btn_a_debounce_inst|fsm_inst|Selector0~0_combout\);

-- Location: LC_X76_Y45_N9
\btn_a_debounce_inst|fsm_inst|debounce_fsm_state.IDLE0\ : stratix_lcell
-- Equation(s):
-- \btn_a_debounce_inst|fsm_inst|debounce_fsm_state.IDLE0~regout\ = DFFEAS((\btn_a_debounce_inst|fsm_inst|Selector2~2_combout\ & (\btn_a_debounce_inst|fsm_inst|Selector0~0_combout\)) # (!\btn_a_debounce_inst|fsm_inst|Selector2~2_combout\ & 
-- (((\btn_a_debounce_inst|fsm_inst|debounce_fsm_state.TIMEOUT0~regout\ & \btn_a_debounce_inst|sync_inst|sync\(2))))), GLOBAL(\sys_clk~combout\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "d888",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~combout\,
	dataa => \btn_a_debounce_inst|fsm_inst|Selector2~2_combout\,
	datab => \btn_a_debounce_inst|fsm_inst|Selector0~0_combout\,
	datac => \btn_a_debounce_inst|fsm_inst|debounce_fsm_state.TIMEOUT0~regout\,
	datad => \btn_a_debounce_inst|sync_inst|sync\(2),
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \btn_a_debounce_inst|fsm_inst|debounce_fsm_state.IDLE0~regout\);

-- Location: LC_X76_Y45_N3
\btn_a_debounce_inst|fsm_inst|debounce_fsm_state.TIMEOUT0\ : stratix_lcell
-- Equation(s):
-- \btn_a_debounce_inst|fsm_inst|debounce_fsm_state.TIMEOUT0~regout\ = DFFEAS((\btn_a_debounce_inst|fsm_inst|debounce_fsm_state.TIMEOUT0~regout\ & ((\btn_a_debounce_inst|fsm_inst|Selector3~1_combout\) # 
-- ((\btn_a_debounce_inst|fsm_inst|debounce_fsm_state.IDLE0~regout\ & !\btn_a_debounce_inst|sync_inst|sync\(2))))) # (!\btn_a_debounce_inst|fsm_inst|debounce_fsm_state.TIMEOUT0~regout\ & (\btn_a_debounce_inst|fsm_inst|debounce_fsm_state.IDLE0~regout\ & 
-- ((!\btn_a_debounce_inst|sync_inst|sync\(2))))), GLOBAL(\sys_clk~combout\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "a0ec",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~combout\,
	dataa => \btn_a_debounce_inst|fsm_inst|debounce_fsm_state.TIMEOUT0~regout\,
	datab => \btn_a_debounce_inst|fsm_inst|debounce_fsm_state.IDLE0~regout\,
	datac => \btn_a_debounce_inst|fsm_inst|Selector3~1_combout\,
	datad => \btn_a_debounce_inst|sync_inst|sync\(2),
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \btn_a_debounce_inst|fsm_inst|debounce_fsm_state.TIMEOUT0~regout\);

-- Location: LC_X76_Y46_N0
\btn_a_debounce_inst|fsm_inst|o~0\ : stratix_lcell
-- Equation(s):
-- \btn_a_debounce_inst|fsm_inst|o~0_combout\ = (((\btn_a_debounce_inst|fsm_inst|debounce_fsm_state.TIMEOUT0~regout\) # (\btn_a_debounce_inst|fsm_inst|debounce_fsm_state.IDLE0~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "fff0",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datac => \btn_a_debounce_inst|fsm_inst|debounce_fsm_state.TIMEOUT0~regout\,
	datad => \btn_a_debounce_inst|fsm_inst|debounce_fsm_state.IDLE0~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \btn_a_debounce_inst|fsm_inst|o~0_combout\);

-- Location: LC_X17_Y31_N4
\~GND\ : stratix_lcell
-- Equation(s):
-- \~GND~combout\ = GND

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \~GND~combout\);

-- Location: LC_X36_Y29_N8
\textmode_vga_inst|textmode_vga_h_sm_inst|WideOr11~0\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|textmode_vga_h_sm_inst|WideOr11~0_combout\ = (((!\textmode_vga_inst|textmode_vga_h_sm_inst|WideOr13~1_combout\) # (!\textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.HSYNC_FIRST~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0fff",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datac => \textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.HSYNC_FIRST~regout\,
	datad => \textmode_vga_inst|textmode_vga_h_sm_inst|WideOr13~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \textmode_vga_inst|textmode_vga_h_sm_inst|WideOr11~0_combout\);

-- Location: LC_X36_Y29_N1
\textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int[0]\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int\(0) = DFFEAS(((!\textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int\(0))), GLOBAL(\pll_vga_clk|altpll_component|_clk0\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , 
-- \textmode_vga_inst|textmode_vga_h_sm_inst|WideOr11~0_combout\, , , !\textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.HSYNC_FIRST~regout\, )
-- \textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int[0]~1\ = CARRY(((\textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int\(0))))
-- \textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int[0]~1COUT1_21\ = CARRY(((\textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "33cc",
	operation_mode => "arithmetic",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \pll_vga_clk|altpll_component|_clk0\,
	datab => \textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int\(0),
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	sclr => \textmode_vga_inst|textmode_vga_h_sm_inst|ALT_INV_textmode_vga_h_sm_state.HSYNC_FIRST~regout\,
	ena => \textmode_vga_inst|textmode_vga_h_sm_inst|WideOr11~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int\(0),
	cout0 => \textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int[0]~1\,
	cout1 => \textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int[0]~1COUT1_21\);

-- Location: LC_X36_Y29_N2
\textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int[1]\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int\(1) = DFFEAS(\textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int\(1) $ ((((\textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int[0]~1\)))), GLOBAL(\pll_vga_clk|altpll_component|_clk0\), 
-- !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , \textmode_vga_inst|textmode_vga_h_sm_inst|WideOr11~0_combout\, , , !\textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.HSYNC_FIRST~regout\, )
-- \textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int[1]~3\ = CARRY(((!\textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int[0]~1\)) # (!\textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int\(1)))
-- \textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int[1]~3COUT1_23\ = CARRY(((!\textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int[0]~1COUT1_21\)) # (!\textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int\(1)))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	lut_mask => "5a5f",
	operation_mode => "arithmetic",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \pll_vga_clk|altpll_component|_clk0\,
	dataa => \textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int\(1),
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	sclr => \textmode_vga_inst|textmode_vga_h_sm_inst|ALT_INV_textmode_vga_h_sm_state.HSYNC_FIRST~regout\,
	ena => \textmode_vga_inst|textmode_vga_h_sm_inst|WideOr11~0_combout\,
	cin0 => \textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int[0]~1\,
	cin1 => \textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int[0]~1COUT1_21\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int\(1),
	cout0 => \textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int[1]~3\,
	cout1 => \textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int[1]~3COUT1_23\);

-- Location: LC_X36_Y29_N3
\textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int[2]\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int\(2) = DFFEAS(\textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int\(2) $ ((((!\textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int[1]~3\)))), GLOBAL(\pll_vga_clk|altpll_component|_clk0\), 
-- !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , \textmode_vga_inst|textmode_vga_h_sm_inst|WideOr11~0_combout\, , , !\textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.HSYNC_FIRST~regout\, )
-- \textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int[2]~5\ = CARRY((\textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int\(2) & ((!\textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int[1]~3\))))
-- \textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int[2]~5COUT1_25\ = CARRY((\textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int\(2) & ((!\textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int[1]~3COUT1_23\))))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	lut_mask => "a50a",
	operation_mode => "arithmetic",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \pll_vga_clk|altpll_component|_clk0\,
	dataa => \textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int\(2),
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	sclr => \textmode_vga_inst|textmode_vga_h_sm_inst|ALT_INV_textmode_vga_h_sm_state.HSYNC_FIRST~regout\,
	ena => \textmode_vga_inst|textmode_vga_h_sm_inst|WideOr11~0_combout\,
	cin0 => \textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int[1]~3\,
	cin1 => \textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int[1]~3COUT1_23\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int\(2),
	cout0 => \textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int[2]~5\,
	cout1 => \textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int[2]~5COUT1_25\);

-- Location: LC_X36_Y29_N4
\textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int[3]\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int\(3) = DFFEAS(\textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int\(3) $ ((((\textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int[2]~5\)))), GLOBAL(\pll_vga_clk|altpll_component|_clk0\), 
-- !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , \textmode_vga_inst|textmode_vga_h_sm_inst|WideOr11~0_combout\, , , !\textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.HSYNC_FIRST~regout\, )
-- \textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int[3]~7\ = CARRY(((!\textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int[2]~5COUT1_25\)) # (!\textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int\(3)))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	lut_mask => "5a5f",
	operation_mode => "arithmetic",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \pll_vga_clk|altpll_component|_clk0\,
	dataa => \textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int\(3),
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	sclr => \textmode_vga_inst|textmode_vga_h_sm_inst|ALT_INV_textmode_vga_h_sm_state.HSYNC_FIRST~regout\,
	ena => \textmode_vga_inst|textmode_vga_h_sm_inst|WideOr11~0_combout\,
	cin0 => \textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int[2]~5\,
	cin1 => \textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int[2]~5COUT1_25\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int\(3),
	cout => \textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int[3]~7\);

-- Location: LC_X36_Y29_N5
\textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int[4]\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int\(4) = DFFEAS(\textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int\(4) $ ((((!\textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int[3]~7\)))), GLOBAL(\pll_vga_clk|altpll_component|_clk0\), 
-- !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , \textmode_vga_inst|textmode_vga_h_sm_inst|WideOr11~0_combout\, , , !\textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.HSYNC_FIRST~regout\, )
-- \textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int[4]~9\ = CARRY((\textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int\(4) & ((!\textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int[3]~7\))))
-- \textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int[4]~9COUT1_27\ = CARRY((\textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int\(4) & ((!\textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int[3]~7\))))

-- pragma translate_off
GENERIC MAP (
	cin_used => "true",
	lut_mask => "a50a",
	operation_mode => "arithmetic",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \pll_vga_clk|altpll_component|_clk0\,
	dataa => \textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int\(4),
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	sclr => \textmode_vga_inst|textmode_vga_h_sm_inst|ALT_INV_textmode_vga_h_sm_state.HSYNC_FIRST~regout\,
	ena => \textmode_vga_inst|textmode_vga_h_sm_inst|WideOr11~0_combout\,
	cin => \textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int[3]~7\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int\(4),
	cout0 => \textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int[4]~9\,
	cout1 => \textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int[4]~9COUT1_27\);

-- Location: LC_X36_Y29_N9
\textmode_vga_inst|textmode_vga_h_sm_inst|Equal5~0\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|textmode_vga_h_sm_inst|Equal5~0_combout\ = (!\textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int\(3) & (!\textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int\(0) & (!\textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int\(2) & 
-- !\textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int\(3),
	datab => \textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int\(0),
	datac => \textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int\(2),
	datad => \textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \textmode_vga_inst|textmode_vga_h_sm_inst|Equal5~0_combout\);

-- Location: LC_X36_Y29_N6
\textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int[5]\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int\(5) = DFFEAS((\textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int\(5) $ (((!\textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int[3]~7\ & 
-- \textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int[4]~9\) # (\textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int[3]~7\ & \textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int[4]~9COUT1_27\)))), GLOBAL(\pll_vga_clk|altpll_component|_clk0\), 
-- !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , \textmode_vga_inst|textmode_vga_h_sm_inst|WideOr11~0_combout\, , , !\textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.HSYNC_FIRST~regout\, )
-- \textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int[5]~11\ = CARRY(((!\textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int[4]~9\) # (!\textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int\(5))))
-- \textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int[5]~11COUT1_29\ = CARRY(((!\textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int[4]~9COUT1_27\) # (!\textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int\(5))))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	cin_used => "true",
	lut_mask => "3c3f",
	operation_mode => "arithmetic",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \pll_vga_clk|altpll_component|_clk0\,
	datab => \textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int\(5),
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	sclr => \textmode_vga_inst|textmode_vga_h_sm_inst|ALT_INV_textmode_vga_h_sm_state.HSYNC_FIRST~regout\,
	ena => \textmode_vga_inst|textmode_vga_h_sm_inst|WideOr11~0_combout\,
	cin => \textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int[3]~7\,
	cin0 => \textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int[4]~9\,
	cin1 => \textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int[4]~9COUT1_27\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int\(5),
	cout0 => \textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int[5]~11\,
	cout1 => \textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int[5]~11COUT1_29\);

-- Location: LC_X36_Y29_N7
\textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int[6]\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int\(6) = DFFEAS(\textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int\(6) $ ((((!(!\textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int[3]~7\ & 
-- \textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int[5]~11\) # (\textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int[3]~7\ & \textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int[5]~11COUT1_29\))))), GLOBAL(\pll_vga_clk|altpll_component|_clk0\), 
-- !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , \textmode_vga_inst|textmode_vga_h_sm_inst|WideOr11~0_combout\, , , !\textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.HSYNC_FIRST~regout\, )

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	cin_used => "true",
	lut_mask => "a5a5",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \pll_vga_clk|altpll_component|_clk0\,
	dataa => \textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int\(6),
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	sclr => \textmode_vga_inst|textmode_vga_h_sm_inst|ALT_INV_textmode_vga_h_sm_state.HSYNC_FIRST~regout\,
	ena => \textmode_vga_inst|textmode_vga_h_sm_inst|WideOr11~0_combout\,
	cin => \textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int[3]~7\,
	cin0 => \textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int[5]~11\,
	cin1 => \textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int[5]~11COUT1_29\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int\(6));

-- Location: LC_X36_Y29_N0
\textmode_vga_inst|textmode_vga_h_sm_inst|Equal5~1\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|textmode_vga_h_sm_inst|Equal5~1_combout\ = (\textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int\(4) & (\textmode_vga_inst|textmode_vga_h_sm_inst|Equal5~0_combout\ & (\textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int\(6) & 
-- !\textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int\(5))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0080",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int\(4),
	datab => \textmode_vga_inst|textmode_vga_h_sm_inst|Equal5~0_combout\,
	datac => \textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int\(6),
	datad => \textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int\(5),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \textmode_vga_inst|textmode_vga_h_sm_inst|Equal5~1_combout\);

-- Location: LC_X37_Y30_N2
\textmode_vga_inst|textmode_vga_h_sm_inst|Selector4~0\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|textmode_vga_h_sm_inst|Selector4~0_combout\ = (\textmode_vga_inst|textmode_vga_h_sm_inst|Equal4~0_combout\ & (((!\textmode_vga_inst|textmode_vga_h_sm_inst|Equal5~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0a0a",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \textmode_vga_inst|textmode_vga_h_sm_inst|Equal4~0_combout\,
	datac => \textmode_vga_inst|textmode_vga_h_sm_inst|Equal5~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \textmode_vga_inst|textmode_vga_h_sm_inst|Selector4~0_combout\);

-- Location: LC_X35_Y30_N3
\textmode_vga_inst|textmode_vga_v_sm_inst|Selector23~0\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|textmode_vga_v_sm_inst|Selector23~0_combout\ = (((\textmode_vga_inst|textmode_vga_v_sm_inst|char_line_cnt_int\(4) & !\textmode_vga_inst|textmode_vga_v_sm_inst|textmode_vga_v_sm_state.VDATA_FIRST~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "00f0",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datac => \textmode_vga_inst|textmode_vga_v_sm_inst|char_line_cnt_int\(4),
	datad => \textmode_vga_inst|textmode_vga_v_sm_inst|textmode_vga_v_sm_state.VDATA_FIRST~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \textmode_vga_inst|textmode_vga_v_sm_inst|Selector23~0_combout\);

-- Location: LC_X35_Y29_N7
\textmode_vga_inst|textmode_vga_v_sm_inst|Selector24~0\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|textmode_vga_v_sm_inst|Selector24~0_combout\ = (((\textmode_vga_inst|textmode_vga_v_sm_inst|char_line_cnt_int\(3) & !\textmode_vga_inst|textmode_vga_v_sm_inst|textmode_vga_v_sm_state.VDATA_FIRST~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "00f0",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datac => \textmode_vga_inst|textmode_vga_v_sm_inst|char_line_cnt_int\(3),
	datad => \textmode_vga_inst|textmode_vga_v_sm_inst|textmode_vga_v_sm_state.VDATA_FIRST~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \textmode_vga_inst|textmode_vga_v_sm_inst|Selector24~0_combout\);

-- Location: LC_X35_Y29_N9
\textmode_vga_inst|textmode_vga_v_sm_inst|Selector26~0\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|textmode_vga_v_sm_inst|Selector26~0_combout\ = (((\textmode_vga_inst|textmode_vga_v_sm_inst|char_line_cnt_int\(1) & !\textmode_vga_inst|textmode_vga_v_sm_inst|textmode_vga_v_sm_state.VDATA_FIRST~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "00f0",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datac => \textmode_vga_inst|textmode_vga_v_sm_inst|char_line_cnt_int\(1),
	datad => \textmode_vga_inst|textmode_vga_v_sm_inst|textmode_vga_v_sm_state.VDATA_FIRST~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \textmode_vga_inst|textmode_vga_v_sm_inst|Selector26~0_combout\);

-- Location: LC_X35_Y29_N5
\textmode_vga_inst|textmode_vga_v_sm_inst|Selector27~0\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|textmode_vga_v_sm_inst|Selector27~0_combout\ = ((\textmode_vga_inst|textmode_vga_v_sm_inst|char_line_cnt_int\(0) & ((!\textmode_vga_inst|textmode_vga_v_sm_inst|textmode_vga_v_sm_state.VDATA_FIRST~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "00cc",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \textmode_vga_inst|textmode_vga_v_sm_inst|char_line_cnt_int\(0),
	datad => \textmode_vga_inst|textmode_vga_v_sm_inst|textmode_vga_v_sm_state.VDATA_FIRST~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \textmode_vga_inst|textmode_vga_v_sm_inst|Selector27~0_combout\);

-- Location: LC_X35_Y29_N0
\textmode_vga_inst|textmode_vga_v_sm_inst|char_line_cnt_int[0]\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|textmode_vga_v_sm_inst|char_line_cnt_int\(0) = DFFEAS(((!\textmode_vga_inst|textmode_vga_v_sm_inst|char_line_cnt_int\(0))), GLOBAL(\pll_vga_clk|altpll_component|_clk0\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , 
-- \textmode_vga_inst|textmode_vga_v_sm_inst|Selector27~0_combout\, , , !\textmode_vga_inst|textmode_vga_v_sm_inst|textmode_vga_v_sm_state.VDATA_NEXTCHAR~regout\)
-- \textmode_vga_inst|textmode_vga_v_sm_inst|char_line_cnt_int[0]~3\ = CARRY(((\textmode_vga_inst|textmode_vga_v_sm_inst|char_line_cnt_int\(0))))
-- \textmode_vga_inst|textmode_vga_v_sm_inst|char_line_cnt_int[0]~3COUT1_16\ = CARRY(((\textmode_vga_inst|textmode_vga_v_sm_inst|char_line_cnt_int\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "33cc",
	operation_mode => "arithmetic",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \pll_vga_clk|altpll_component|_clk0\,
	datab => \textmode_vga_inst|textmode_vga_v_sm_inst|char_line_cnt_int\(0),
	datac => \textmode_vga_inst|textmode_vga_v_sm_inst|Selector27~0_combout\,
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	sload => \textmode_vga_inst|textmode_vga_v_sm_inst|ALT_INV_textmode_vga_v_sm_state.VDATA_NEXTCHAR~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \textmode_vga_inst|textmode_vga_v_sm_inst|char_line_cnt_int\(0),
	cout0 => \textmode_vga_inst|textmode_vga_v_sm_inst|char_line_cnt_int[0]~3\,
	cout1 => \textmode_vga_inst|textmode_vga_v_sm_inst|char_line_cnt_int[0]~3COUT1_16\);

-- Location: LC_X35_Y29_N1
\textmode_vga_inst|textmode_vga_v_sm_inst|char_line_cnt_int[1]\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|textmode_vga_v_sm_inst|char_line_cnt_int\(1) = DFFEAS((\textmode_vga_inst|textmode_vga_v_sm_inst|char_line_cnt_int\(1) $ ((\textmode_vga_inst|textmode_vga_v_sm_inst|char_line_cnt_int[0]~3\))), 
-- GLOBAL(\pll_vga_clk|altpll_component|_clk0\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , \textmode_vga_inst|textmode_vga_v_sm_inst|Selector26~0_combout\, , , 
-- !\textmode_vga_inst|textmode_vga_v_sm_inst|textmode_vga_v_sm_state.VDATA_NEXTCHAR~regout\)
-- \textmode_vga_inst|textmode_vga_v_sm_inst|char_line_cnt_int[1]~1\ = CARRY(((!\textmode_vga_inst|textmode_vga_v_sm_inst|char_line_cnt_int[0]~3\) # (!\textmode_vga_inst|textmode_vga_v_sm_inst|char_line_cnt_int\(1))))
-- \textmode_vga_inst|textmode_vga_v_sm_inst|char_line_cnt_int[1]~1COUT1_18\ = CARRY(((!\textmode_vga_inst|textmode_vga_v_sm_inst|char_line_cnt_int[0]~3COUT1_16\) # (!\textmode_vga_inst|textmode_vga_v_sm_inst|char_line_cnt_int\(1))))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	lut_mask => "3c3f",
	operation_mode => "arithmetic",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \pll_vga_clk|altpll_component|_clk0\,
	datab => \textmode_vga_inst|textmode_vga_v_sm_inst|char_line_cnt_int\(1),
	datac => \textmode_vga_inst|textmode_vga_v_sm_inst|Selector26~0_combout\,
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	sload => \textmode_vga_inst|textmode_vga_v_sm_inst|ALT_INV_textmode_vga_v_sm_state.VDATA_NEXTCHAR~regout\,
	cin0 => \textmode_vga_inst|textmode_vga_v_sm_inst|char_line_cnt_int[0]~3\,
	cin1 => \textmode_vga_inst|textmode_vga_v_sm_inst|char_line_cnt_int[0]~3COUT1_16\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \textmode_vga_inst|textmode_vga_v_sm_inst|char_line_cnt_int\(1),
	cout0 => \textmode_vga_inst|textmode_vga_v_sm_inst|char_line_cnt_int[1]~1\,
	cout1 => \textmode_vga_inst|textmode_vga_v_sm_inst|char_line_cnt_int[1]~1COUT1_18\);

-- Location: LC_X35_Y29_N2
\textmode_vga_inst|textmode_vga_v_sm_inst|char_line_cnt_int[2]\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|textmode_vga_v_sm_inst|char_line_cnt_int\(2) = DFFEAS(\textmode_vga_inst|textmode_vga_v_sm_inst|char_line_cnt_int\(2) $ ((((!\textmode_vga_inst|textmode_vga_v_sm_inst|char_line_cnt_int[1]~1\)))), 
-- GLOBAL(\pll_vga_clk|altpll_component|_clk0\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , \textmode_vga_inst|textmode_vga_v_sm_inst|Selector25~0_combout\, , , 
-- !\textmode_vga_inst|textmode_vga_v_sm_inst|textmode_vga_v_sm_state.VDATA_NEXTCHAR~regout\)
-- \textmode_vga_inst|textmode_vga_v_sm_inst|char_line_cnt_int[2]~7\ = CARRY((\textmode_vga_inst|textmode_vga_v_sm_inst|char_line_cnt_int\(2) & ((!\textmode_vga_inst|textmode_vga_v_sm_inst|char_line_cnt_int[1]~1\))))
-- \textmode_vga_inst|textmode_vga_v_sm_inst|char_line_cnt_int[2]~7COUT1_20\ = CARRY((\textmode_vga_inst|textmode_vga_v_sm_inst|char_line_cnt_int\(2) & ((!\textmode_vga_inst|textmode_vga_v_sm_inst|char_line_cnt_int[1]~1COUT1_18\))))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	lut_mask => "a50a",
	operation_mode => "arithmetic",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \pll_vga_clk|altpll_component|_clk0\,
	dataa => \textmode_vga_inst|textmode_vga_v_sm_inst|char_line_cnt_int\(2),
	datac => \textmode_vga_inst|textmode_vga_v_sm_inst|Selector25~0_combout\,
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	sload => \textmode_vga_inst|textmode_vga_v_sm_inst|ALT_INV_textmode_vga_v_sm_state.VDATA_NEXTCHAR~regout\,
	cin0 => \textmode_vga_inst|textmode_vga_v_sm_inst|char_line_cnt_int[1]~1\,
	cin1 => \textmode_vga_inst|textmode_vga_v_sm_inst|char_line_cnt_int[1]~1COUT1_18\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \textmode_vga_inst|textmode_vga_v_sm_inst|char_line_cnt_int\(2),
	cout0 => \textmode_vga_inst|textmode_vga_v_sm_inst|char_line_cnt_int[2]~7\,
	cout1 => \textmode_vga_inst|textmode_vga_v_sm_inst|char_line_cnt_int[2]~7COUT1_20\);

-- Location: LC_X35_Y29_N3
\textmode_vga_inst|textmode_vga_v_sm_inst|char_line_cnt_int[3]\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|textmode_vga_v_sm_inst|char_line_cnt_int\(3) = DFFEAS(\textmode_vga_inst|textmode_vga_v_sm_inst|char_line_cnt_int\(3) $ ((((\textmode_vga_inst|textmode_vga_v_sm_inst|char_line_cnt_int[2]~7\)))), 
-- GLOBAL(\pll_vga_clk|altpll_component|_clk0\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , \textmode_vga_inst|textmode_vga_v_sm_inst|Selector24~0_combout\, , , 
-- !\textmode_vga_inst|textmode_vga_v_sm_inst|textmode_vga_v_sm_state.VDATA_NEXTCHAR~regout\)
-- \textmode_vga_inst|textmode_vga_v_sm_inst|char_line_cnt_int[3]~5\ = CARRY(((!\textmode_vga_inst|textmode_vga_v_sm_inst|char_line_cnt_int[2]~7\)) # (!\textmode_vga_inst|textmode_vga_v_sm_inst|char_line_cnt_int\(3)))
-- \textmode_vga_inst|textmode_vga_v_sm_inst|char_line_cnt_int[3]~5COUT1_22\ = CARRY(((!\textmode_vga_inst|textmode_vga_v_sm_inst|char_line_cnt_int[2]~7COUT1_20\)) # (!\textmode_vga_inst|textmode_vga_v_sm_inst|char_line_cnt_int\(3)))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	lut_mask => "5a5f",
	operation_mode => "arithmetic",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \pll_vga_clk|altpll_component|_clk0\,
	dataa => \textmode_vga_inst|textmode_vga_v_sm_inst|char_line_cnt_int\(3),
	datac => \textmode_vga_inst|textmode_vga_v_sm_inst|Selector24~0_combout\,
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	sload => \textmode_vga_inst|textmode_vga_v_sm_inst|ALT_INV_textmode_vga_v_sm_state.VDATA_NEXTCHAR~regout\,
	cin0 => \textmode_vga_inst|textmode_vga_v_sm_inst|char_line_cnt_int[2]~7\,
	cin1 => \textmode_vga_inst|textmode_vga_v_sm_inst|char_line_cnt_int[2]~7COUT1_20\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \textmode_vga_inst|textmode_vga_v_sm_inst|char_line_cnt_int\(3),
	cout0 => \textmode_vga_inst|textmode_vga_v_sm_inst|char_line_cnt_int[3]~5\,
	cout1 => \textmode_vga_inst|textmode_vga_v_sm_inst|char_line_cnt_int[3]~5COUT1_22\);

-- Location: LC_X35_Y29_N4
\textmode_vga_inst|textmode_vga_v_sm_inst|char_line_cnt_int[4]\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|textmode_vga_v_sm_inst|char_line_cnt_int\(4) = DFFEAS(((\textmode_vga_inst|textmode_vga_v_sm_inst|char_line_cnt_int[3]~5\ $ (!\textmode_vga_inst|textmode_vga_v_sm_inst|char_line_cnt_int\(4)))), 
-- GLOBAL(\pll_vga_clk|altpll_component|_clk0\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , \textmode_vga_inst|textmode_vga_v_sm_inst|Selector23~0_combout\, , , 
-- !\textmode_vga_inst|textmode_vga_v_sm_inst|textmode_vga_v_sm_state.VDATA_NEXTCHAR~regout\)

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	lut_mask => "f00f",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \pll_vga_clk|altpll_component|_clk0\,
	datac => \textmode_vga_inst|textmode_vga_v_sm_inst|Selector23~0_combout\,
	datad => \textmode_vga_inst|textmode_vga_v_sm_inst|char_line_cnt_int\(4),
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	sload => \textmode_vga_inst|textmode_vga_v_sm_inst|ALT_INV_textmode_vga_v_sm_state.VDATA_NEXTCHAR~regout\,
	cin0 => \textmode_vga_inst|textmode_vga_v_sm_inst|char_line_cnt_int[3]~5\,
	cin1 => \textmode_vga_inst|textmode_vga_v_sm_inst|char_line_cnt_int[3]~5COUT1_22\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \textmode_vga_inst|textmode_vga_v_sm_inst|char_line_cnt_int\(4));

-- Location: LC_X35_Y30_N0
\textmode_vga_inst|textmode_vga_v_sm_inst|textmode_vga_v_sm_state.VDATA\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|textmode_vga_v_sm_inst|textmode_vga_v_sm_state.VDATA~regout\ = DFFEAS((((!\textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.HFRONT_LAST~regout\ & 
-- \textmode_vga_inst|textmode_vga_v_sm_inst|textmode_vga_v_sm_state.VDATA~regout\)) # (!\textmode_vga_inst|textmode_vga_v_sm_inst|WideOr9~0_combout\)), GLOBAL(\pll_vga_clk|altpll_component|_clk0\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , 
-- , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "5f0f",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \pll_vga_clk|altpll_component|_clk0\,
	dataa => \textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.HFRONT_LAST~regout\,
	datac => \textmode_vga_inst|textmode_vga_v_sm_inst|WideOr9~0_combout\,
	datad => \textmode_vga_inst|textmode_vga_v_sm_inst|textmode_vga_v_sm_state.VDATA~regout\,
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \textmode_vga_inst|textmode_vga_v_sm_inst|textmode_vga_v_sm_state.VDATA~regout\);

-- Location: LC_X35_Y32_N5
\textmode_vga_inst|textmode_vga_v_sm_inst|Add1~0\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|textmode_vga_v_sm_inst|Add1~0_combout\ = ((!\textmode_vga_inst|textmode_vga_v_sm_inst|char_height_pixel_int\(0)))
-- \textmode_vga_inst|textmode_vga_v_sm_inst|Add1~2\ = CARRY(((\textmode_vga_inst|textmode_vga_v_sm_inst|char_height_pixel_int\(0))))
-- \textmode_vga_inst|textmode_vga_v_sm_inst|Add1~2COUT1_31\ = CARRY(((\textmode_vga_inst|textmode_vga_v_sm_inst|char_height_pixel_int\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "33cc",
	operation_mode => "arithmetic",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \textmode_vga_inst|textmode_vga_v_sm_inst|char_height_pixel_int\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \textmode_vga_inst|textmode_vga_v_sm_inst|Add1~0_combout\,
	cout0 => \textmode_vga_inst|textmode_vga_v_sm_inst|Add1~2\,
	cout1 => \textmode_vga_inst|textmode_vga_v_sm_inst|Add1~2COUT1_31\);

-- Location: LC_X35_Y32_N6
\textmode_vga_inst|textmode_vga_v_sm_inst|Add1~5\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|textmode_vga_v_sm_inst|Add1~5_combout\ = (\textmode_vga_inst|textmode_vga_v_sm_inst|char_height_pixel_int\(1) $ ((\textmode_vga_inst|textmode_vga_v_sm_inst|Add1~2\)))
-- \textmode_vga_inst|textmode_vga_v_sm_inst|Add1~7\ = CARRY(((!\textmode_vga_inst|textmode_vga_v_sm_inst|Add1~2\) # (!\textmode_vga_inst|textmode_vga_v_sm_inst|char_height_pixel_int\(1))))
-- \textmode_vga_inst|textmode_vga_v_sm_inst|Add1~7COUT1_33\ = CARRY(((!\textmode_vga_inst|textmode_vga_v_sm_inst|Add1~2COUT1_31\) # (!\textmode_vga_inst|textmode_vga_v_sm_inst|char_height_pixel_int\(1))))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	lut_mask => "3c3f",
	operation_mode => "arithmetic",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \textmode_vga_inst|textmode_vga_v_sm_inst|char_height_pixel_int\(1),
	cin0 => \textmode_vga_inst|textmode_vga_v_sm_inst|Add1~2\,
	cin1 => \textmode_vga_inst|textmode_vga_v_sm_inst|Add1~2COUT1_31\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \textmode_vga_inst|textmode_vga_v_sm_inst|Add1~5_combout\,
	cout0 => \textmode_vga_inst|textmode_vga_v_sm_inst|Add1~7\,
	cout1 => \textmode_vga_inst|textmode_vga_v_sm_inst|Add1~7COUT1_33\);

-- Location: LC_X35_Y32_N0
\textmode_vga_inst|textmode_vga_v_sm_inst|char_height_pixel_int[1]\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|textmode_vga_v_sm_inst|char_height_pixel_int\(1) = DFFEAS((\textmode_vga_inst|textmode_vga_v_sm_inst|textmode_vga_v_sm_state.VDATA_NEXTLINE~regout\ & ((\textmode_vga_inst|textmode_vga_v_sm_inst|Add1~5_combout\) # 
-- ((\textmode_vga_inst|textmode_vga_v_sm_inst|WideOr9~0_combout\ & \textmode_vga_inst|textmode_vga_v_sm_inst|char_height_pixel_int\(1))))) # (!\textmode_vga_inst|textmode_vga_v_sm_inst|textmode_vga_v_sm_state.VDATA_NEXTLINE~regout\ & 
-- (((\textmode_vga_inst|textmode_vga_v_sm_inst|WideOr9~0_combout\ & \textmode_vga_inst|textmode_vga_v_sm_inst|char_height_pixel_int\(1))))), GLOBAL(\pll_vga_clk|altpll_component|_clk0\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "f888",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \pll_vga_clk|altpll_component|_clk0\,
	dataa => \textmode_vga_inst|textmode_vga_v_sm_inst|textmode_vga_v_sm_state.VDATA_NEXTLINE~regout\,
	datab => \textmode_vga_inst|textmode_vga_v_sm_inst|Add1~5_combout\,
	datac => \textmode_vga_inst|textmode_vga_v_sm_inst|WideOr9~0_combout\,
	datad => \textmode_vga_inst|textmode_vga_v_sm_inst|char_height_pixel_int\(1),
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \textmode_vga_inst|textmode_vga_v_sm_inst|char_height_pixel_int\(1));

-- Location: LC_X35_Y32_N7
\textmode_vga_inst|textmode_vga_v_sm_inst|Add1~10\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|textmode_vga_v_sm_inst|Add1~10_combout\ = \textmode_vga_inst|textmode_vga_v_sm_inst|char_height_pixel_int\(2) $ ((((!\textmode_vga_inst|textmode_vga_v_sm_inst|Add1~7\))))
-- \textmode_vga_inst|textmode_vga_v_sm_inst|Add1~12\ = CARRY((\textmode_vga_inst|textmode_vga_v_sm_inst|char_height_pixel_int\(2) & ((!\textmode_vga_inst|textmode_vga_v_sm_inst|Add1~7\))))
-- \textmode_vga_inst|textmode_vga_v_sm_inst|Add1~12COUT1_35\ = CARRY((\textmode_vga_inst|textmode_vga_v_sm_inst|char_height_pixel_int\(2) & ((!\textmode_vga_inst|textmode_vga_v_sm_inst|Add1~7COUT1_33\))))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	lut_mask => "a50a",
	operation_mode => "arithmetic",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \textmode_vga_inst|textmode_vga_v_sm_inst|char_height_pixel_int\(2),
	cin0 => \textmode_vga_inst|textmode_vga_v_sm_inst|Add1~7\,
	cin1 => \textmode_vga_inst|textmode_vga_v_sm_inst|Add1~7COUT1_33\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \textmode_vga_inst|textmode_vga_v_sm_inst|Add1~10_combout\,
	cout0 => \textmode_vga_inst|textmode_vga_v_sm_inst|Add1~12\,
	cout1 => \textmode_vga_inst|textmode_vga_v_sm_inst|Add1~12COUT1_35\);

-- Location: LC_X35_Y32_N3
\textmode_vga_inst|textmode_vga_v_sm_inst|char_height_pixel_int[2]\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|textmode_vga_v_sm_inst|char_height_pixel_int\(2) = DFFEAS((\textmode_vga_inst|textmode_vga_v_sm_inst|Add1~10_combout\ & ((\textmode_vga_inst|textmode_vga_v_sm_inst|textmode_vga_v_sm_state.VDATA_NEXTLINE~regout\) # 
-- ((\textmode_vga_inst|textmode_vga_v_sm_inst|WideOr9~0_combout\ & \textmode_vga_inst|textmode_vga_v_sm_inst|char_height_pixel_int\(2))))) # (!\textmode_vga_inst|textmode_vga_v_sm_inst|Add1~10_combout\ & 
-- (\textmode_vga_inst|textmode_vga_v_sm_inst|WideOr9~0_combout\ & (\textmode_vga_inst|textmode_vga_v_sm_inst|char_height_pixel_int\(2)))), GLOBAL(\pll_vga_clk|altpll_component|_clk0\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "eac0",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \pll_vga_clk|altpll_component|_clk0\,
	dataa => \textmode_vga_inst|textmode_vga_v_sm_inst|Add1~10_combout\,
	datab => \textmode_vga_inst|textmode_vga_v_sm_inst|WideOr9~0_combout\,
	datac => \textmode_vga_inst|textmode_vga_v_sm_inst|char_height_pixel_int\(2),
	datad => \textmode_vga_inst|textmode_vga_v_sm_inst|textmode_vga_v_sm_state.VDATA_NEXTLINE~regout\,
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \textmode_vga_inst|textmode_vga_v_sm_inst|char_height_pixel_int\(2));

-- Location: LC_X35_Y32_N8
\textmode_vga_inst|textmode_vga_v_sm_inst|Add1~15\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|textmode_vga_v_sm_inst|Add1~15_combout\ = (\textmode_vga_inst|textmode_vga_v_sm_inst|char_height_pixel_int\(3) $ ((\textmode_vga_inst|textmode_vga_v_sm_inst|Add1~12\)))
-- \textmode_vga_inst|textmode_vga_v_sm_inst|Add1~17\ = CARRY(((!\textmode_vga_inst|textmode_vga_v_sm_inst|Add1~12\) # (!\textmode_vga_inst|textmode_vga_v_sm_inst|char_height_pixel_int\(3))))
-- \textmode_vga_inst|textmode_vga_v_sm_inst|Add1~17COUT1_37\ = CARRY(((!\textmode_vga_inst|textmode_vga_v_sm_inst|Add1~12COUT1_35\) # (!\textmode_vga_inst|textmode_vga_v_sm_inst|char_height_pixel_int\(3))))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	lut_mask => "3c3f",
	operation_mode => "arithmetic",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \textmode_vga_inst|textmode_vga_v_sm_inst|char_height_pixel_int\(3),
	cin0 => \textmode_vga_inst|textmode_vga_v_sm_inst|Add1~12\,
	cin1 => \textmode_vga_inst|textmode_vga_v_sm_inst|Add1~12COUT1_35\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \textmode_vga_inst|textmode_vga_v_sm_inst|Add1~15_combout\,
	cout0 => \textmode_vga_inst|textmode_vga_v_sm_inst|Add1~17\,
	cout1 => \textmode_vga_inst|textmode_vga_v_sm_inst|Add1~17COUT1_37\);

-- Location: LC_X35_Y32_N1
\textmode_vga_inst|textmode_vga_v_sm_inst|char_height_pixel_int[3]\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|textmode_vga_v_sm_inst|char_height_pixel_int\(3) = DFFEAS((\textmode_vga_inst|textmode_vga_v_sm_inst|Add1~15_combout\ & ((\textmode_vga_inst|textmode_vga_v_sm_inst|textmode_vga_v_sm_state.VDATA_NEXTLINE~regout\) # 
-- ((\textmode_vga_inst|textmode_vga_v_sm_inst|WideOr9~0_combout\ & \textmode_vga_inst|textmode_vga_v_sm_inst|char_height_pixel_int\(3))))) # (!\textmode_vga_inst|textmode_vga_v_sm_inst|Add1~15_combout\ & 
-- (\textmode_vga_inst|textmode_vga_v_sm_inst|WideOr9~0_combout\ & (\textmode_vga_inst|textmode_vga_v_sm_inst|char_height_pixel_int\(3)))), GLOBAL(\pll_vga_clk|altpll_component|_clk0\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "eac0",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \pll_vga_clk|altpll_component|_clk0\,
	dataa => \textmode_vga_inst|textmode_vga_v_sm_inst|Add1~15_combout\,
	datab => \textmode_vga_inst|textmode_vga_v_sm_inst|WideOr9~0_combout\,
	datac => \textmode_vga_inst|textmode_vga_v_sm_inst|char_height_pixel_int\(3),
	datad => \textmode_vga_inst|textmode_vga_v_sm_inst|textmode_vga_v_sm_state.VDATA_NEXTLINE~regout\,
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \textmode_vga_inst|textmode_vga_v_sm_inst|char_height_pixel_int\(3));

-- Location: LC_X35_Y32_N9
\textmode_vga_inst|textmode_vga_v_sm_inst|Add1~20\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|textmode_vga_v_sm_inst|Add1~20_combout\ = ((\textmode_vga_inst|textmode_vga_v_sm_inst|Add1~17\ $ (!\textmode_vga_inst|textmode_vga_v_sm_inst|char_height_pixel_int\(4))))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	lut_mask => "f00f",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datad => \textmode_vga_inst|textmode_vga_v_sm_inst|char_height_pixel_int\(4),
	cin0 => \textmode_vga_inst|textmode_vga_v_sm_inst|Add1~17\,
	cin1 => \textmode_vga_inst|textmode_vga_v_sm_inst|Add1~17COUT1_37\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \textmode_vga_inst|textmode_vga_v_sm_inst|Add1~20_combout\);

-- Location: LC_X35_Y32_N2
\textmode_vga_inst|textmode_vga_v_sm_inst|char_height_pixel_int[4]\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|textmode_vga_v_sm_inst|char_height_pixel_int\(4) = DFFEAS((\textmode_vga_inst|textmode_vga_v_sm_inst|textmode_vga_v_sm_state.VDATA_NEXTLINE~regout\ & ((\textmode_vga_inst|textmode_vga_v_sm_inst|Add1~20_combout\) # 
-- ((\textmode_vga_inst|textmode_vga_v_sm_inst|WideOr9~0_combout\ & \textmode_vga_inst|textmode_vga_v_sm_inst|char_height_pixel_int\(4))))) # (!\textmode_vga_inst|textmode_vga_v_sm_inst|textmode_vga_v_sm_state.VDATA_NEXTLINE~regout\ & 
-- (((\textmode_vga_inst|textmode_vga_v_sm_inst|WideOr9~0_combout\ & \textmode_vga_inst|textmode_vga_v_sm_inst|char_height_pixel_int\(4))))), GLOBAL(\pll_vga_clk|altpll_component|_clk0\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "f888",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \pll_vga_clk|altpll_component|_clk0\,
	dataa => \textmode_vga_inst|textmode_vga_v_sm_inst|textmode_vga_v_sm_state.VDATA_NEXTLINE~regout\,
	datab => \textmode_vga_inst|textmode_vga_v_sm_inst|Add1~20_combout\,
	datac => \textmode_vga_inst|textmode_vga_v_sm_inst|WideOr9~0_combout\,
	datad => \textmode_vga_inst|textmode_vga_v_sm_inst|char_height_pixel_int\(4),
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \textmode_vga_inst|textmode_vga_v_sm_inst|char_height_pixel_int\(4));

-- Location: LC_X35_Y32_N4
\textmode_vga_inst|textmode_vga_v_sm_inst|Equal2~0\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|textmode_vga_v_sm_inst|Equal2~0_combout\ = (\textmode_vga_inst|textmode_vga_v_sm_inst|char_height_pixel_int\(4)) # (((!\textmode_vga_inst|textmode_vga_v_sm_inst|char_height_pixel_int\(1)) # 
-- (!\textmode_vga_inst|textmode_vga_v_sm_inst|char_height_pixel_int\(2))) # (!\textmode_vga_inst|textmode_vga_v_sm_inst|char_height_pixel_int\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "bfff",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \textmode_vga_inst|textmode_vga_v_sm_inst|char_height_pixel_int\(4),
	datab => \textmode_vga_inst|textmode_vga_v_sm_inst|char_height_pixel_int\(3),
	datac => \textmode_vga_inst|textmode_vga_v_sm_inst|char_height_pixel_int\(2),
	datad => \textmode_vga_inst|textmode_vga_v_sm_inst|char_height_pixel_int\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \textmode_vga_inst|textmode_vga_v_sm_inst|Equal2~0_combout\);

-- Location: LC_X35_Y30_N8
\textmode_vga_inst|textmode_vga_v_sm_inst|Selector10~0\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|textmode_vga_v_sm_inst|Selector10~0_combout\ = (\textmode_vga_inst|textmode_vga_v_sm_inst|char_height_pixel_int\(0) & (\textmode_vga_inst|textmode_vga_v_sm_inst|textmode_vga_v_sm_state.VDATA~regout\ & 
-- (!\textmode_vga_inst|textmode_vga_v_sm_inst|Equal2~0_combout\ & \textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.HFRONT_LAST~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0800",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \textmode_vga_inst|textmode_vga_v_sm_inst|char_height_pixel_int\(0),
	datab => \textmode_vga_inst|textmode_vga_v_sm_inst|textmode_vga_v_sm_state.VDATA~regout\,
	datac => \textmode_vga_inst|textmode_vga_v_sm_inst|Equal2~0_combout\,
	datad => \textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.HFRONT_LAST~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \textmode_vga_inst|textmode_vga_v_sm_inst|Selector10~0_combout\);

-- Location: LC_X35_Y30_N2
\textmode_vga_inst|textmode_vga_v_sm_inst|textmode_vga_v_sm_state.VFRONT_FIRST\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|textmode_vga_v_sm_inst|textmode_vga_v_sm_state.VFRONT_FIRST~regout\ = DFFEAS(((\textmode_vga_inst|textmode_vga_v_sm_inst|Equal3~0_combout\ & (\textmode_vga_inst|textmode_vga_v_sm_inst|char_line_cnt_int\(4) & 
-- \textmode_vga_inst|textmode_vga_v_sm_inst|Selector10~0_combout\))), GLOBAL(\pll_vga_clk|altpll_component|_clk0\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "c000",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \pll_vga_clk|altpll_component|_clk0\,
	datab => \textmode_vga_inst|textmode_vga_v_sm_inst|Equal3~0_combout\,
	datac => \textmode_vga_inst|textmode_vga_v_sm_inst|char_line_cnt_int\(4),
	datad => \textmode_vga_inst|textmode_vga_v_sm_inst|Selector10~0_combout\,
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \textmode_vga_inst|textmode_vga_v_sm_inst|textmode_vga_v_sm_state.VFRONT_FIRST~regout\);

-- Location: LC_X35_Y31_N8
\textmode_vga_inst|textmode_vga_v_sm_inst|textmode_vga_v_sm_state.VSYNC\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|textmode_vga_v_sm_inst|textmode_vga_v_sm_state.VSYNC~regout\ = DFFEAS(((\textmode_vga_inst|textmode_vga_v_sm_inst|textmode_vga_v_sm_state.VSYNC_NEXT~regout\) # 
-- ((\textmode_vga_inst|textmode_vga_v_sm_inst|textmode_vga_v_sm_state.VSYNC~regout\ & !\textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.HFRONT_LAST~regout\))) # 
-- (!\textmode_vga_inst|textmode_vga_v_sm_inst|textmode_vga_v_sm_state.VSYNC_FIRST~regout\), GLOBAL(\pll_vga_clk|altpll_component|_clk0\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "ff3b",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \pll_vga_clk|altpll_component|_clk0\,
	dataa => \textmode_vga_inst|textmode_vga_v_sm_inst|textmode_vga_v_sm_state.VSYNC~regout\,
	datab => \textmode_vga_inst|textmode_vga_v_sm_inst|textmode_vga_v_sm_state.VSYNC_FIRST~regout\,
	datac => \textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.HFRONT_LAST~regout\,
	datad => \textmode_vga_inst|textmode_vga_v_sm_inst|textmode_vga_v_sm_state.VSYNC_NEXT~regout\,
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \textmode_vga_inst|textmode_vga_v_sm_inst|textmode_vga_v_sm_state.VSYNC~regout\);

-- Location: LC_X36_Y31_N5
\textmode_vga_inst|textmode_vga_v_sm_inst|vcnt[0]\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|textmode_vga_v_sm_inst|vcnt\(0) = DFFEAS(((!\textmode_vga_inst|textmode_vga_v_sm_inst|vcnt\(0))), GLOBAL(\pll_vga_clk|altpll_component|_clk0\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , 
-- \textmode_vga_inst|textmode_vga_v_sm_inst|WideOr3~1_combout\, , , \textmode_vga_inst|textmode_vga_v_sm_inst|WideOr7~0_combout\, )
-- \textmode_vga_inst|textmode_vga_v_sm_inst|vcnt[0]~5\ = CARRY(((\textmode_vga_inst|textmode_vga_v_sm_inst|vcnt\(0))))
-- \textmode_vga_inst|textmode_vga_v_sm_inst|vcnt[0]~5COUT1_16\ = CARRY(((\textmode_vga_inst|textmode_vga_v_sm_inst|vcnt\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "33cc",
	operation_mode => "arithmetic",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \pll_vga_clk|altpll_component|_clk0\,
	datab => \textmode_vga_inst|textmode_vga_v_sm_inst|vcnt\(0),
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	sclr => \textmode_vga_inst|textmode_vga_v_sm_inst|WideOr7~0_combout\,
	ena => \textmode_vga_inst|textmode_vga_v_sm_inst|WideOr3~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \textmode_vga_inst|textmode_vga_v_sm_inst|vcnt\(0),
	cout0 => \textmode_vga_inst|textmode_vga_v_sm_inst|vcnt[0]~5\,
	cout1 => \textmode_vga_inst|textmode_vga_v_sm_inst|vcnt[0]~5COUT1_16\);

-- Location: LC_X36_Y31_N6
\textmode_vga_inst|textmode_vga_v_sm_inst|vcnt[1]\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|textmode_vga_v_sm_inst|vcnt\(1) = DFFEAS((\textmode_vga_inst|textmode_vga_v_sm_inst|vcnt\(1) $ ((\textmode_vga_inst|textmode_vga_v_sm_inst|vcnt[0]~5\))), GLOBAL(\pll_vga_clk|altpll_component|_clk0\), 
-- !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , \textmode_vga_inst|textmode_vga_v_sm_inst|WideOr3~1_combout\, , , \textmode_vga_inst|textmode_vga_v_sm_inst|WideOr7~0_combout\, )
-- \textmode_vga_inst|textmode_vga_v_sm_inst|vcnt[1]~7\ = CARRY(((!\textmode_vga_inst|textmode_vga_v_sm_inst|vcnt[0]~5\) # (!\textmode_vga_inst|textmode_vga_v_sm_inst|vcnt\(1))))
-- \textmode_vga_inst|textmode_vga_v_sm_inst|vcnt[1]~7COUT1_18\ = CARRY(((!\textmode_vga_inst|textmode_vga_v_sm_inst|vcnt[0]~5COUT1_16\) # (!\textmode_vga_inst|textmode_vga_v_sm_inst|vcnt\(1))))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	lut_mask => "3c3f",
	operation_mode => "arithmetic",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \pll_vga_clk|altpll_component|_clk0\,
	datab => \textmode_vga_inst|textmode_vga_v_sm_inst|vcnt\(1),
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	sclr => \textmode_vga_inst|textmode_vga_v_sm_inst|WideOr7~0_combout\,
	ena => \textmode_vga_inst|textmode_vga_v_sm_inst|WideOr3~1_combout\,
	cin0 => \textmode_vga_inst|textmode_vga_v_sm_inst|vcnt[0]~5\,
	cin1 => \textmode_vga_inst|textmode_vga_v_sm_inst|vcnt[0]~5COUT1_16\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \textmode_vga_inst|textmode_vga_v_sm_inst|vcnt\(1),
	cout0 => \textmode_vga_inst|textmode_vga_v_sm_inst|vcnt[1]~7\,
	cout1 => \textmode_vga_inst|textmode_vga_v_sm_inst|vcnt[1]~7COUT1_18\);

-- Location: LC_X36_Y31_N7
\textmode_vga_inst|textmode_vga_v_sm_inst|vcnt[2]\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|textmode_vga_v_sm_inst|vcnt\(2) = DFFEAS(\textmode_vga_inst|textmode_vga_v_sm_inst|vcnt\(2) $ ((((!\textmode_vga_inst|textmode_vga_v_sm_inst|vcnt[1]~7\)))), GLOBAL(\pll_vga_clk|altpll_component|_clk0\), 
-- !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , \textmode_vga_inst|textmode_vga_v_sm_inst|WideOr3~1_combout\, , , \textmode_vga_inst|textmode_vga_v_sm_inst|WideOr7~0_combout\, )
-- \textmode_vga_inst|textmode_vga_v_sm_inst|vcnt[2]~1\ = CARRY((\textmode_vga_inst|textmode_vga_v_sm_inst|vcnt\(2) & ((!\textmode_vga_inst|textmode_vga_v_sm_inst|vcnt[1]~7\))))
-- \textmode_vga_inst|textmode_vga_v_sm_inst|vcnt[2]~1COUT1_20\ = CARRY((\textmode_vga_inst|textmode_vga_v_sm_inst|vcnt\(2) & ((!\textmode_vga_inst|textmode_vga_v_sm_inst|vcnt[1]~7COUT1_18\))))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	lut_mask => "a50a",
	operation_mode => "arithmetic",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \pll_vga_clk|altpll_component|_clk0\,
	dataa => \textmode_vga_inst|textmode_vga_v_sm_inst|vcnt\(2),
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	sclr => \textmode_vga_inst|textmode_vga_v_sm_inst|WideOr7~0_combout\,
	ena => \textmode_vga_inst|textmode_vga_v_sm_inst|WideOr3~1_combout\,
	cin0 => \textmode_vga_inst|textmode_vga_v_sm_inst|vcnt[1]~7\,
	cin1 => \textmode_vga_inst|textmode_vga_v_sm_inst|vcnt[1]~7COUT1_18\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \textmode_vga_inst|textmode_vga_v_sm_inst|vcnt\(2),
	cout0 => \textmode_vga_inst|textmode_vga_v_sm_inst|vcnt[2]~1\,
	cout1 => \textmode_vga_inst|textmode_vga_v_sm_inst|vcnt[2]~1COUT1_20\);

-- Location: LC_X36_Y31_N8
\textmode_vga_inst|textmode_vga_v_sm_inst|vcnt[3]\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|textmode_vga_v_sm_inst|vcnt\(3) = DFFEAS(\textmode_vga_inst|textmode_vga_v_sm_inst|vcnt\(3) $ ((((\textmode_vga_inst|textmode_vga_v_sm_inst|vcnt[2]~1\)))), GLOBAL(\pll_vga_clk|altpll_component|_clk0\), 
-- !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , \textmode_vga_inst|textmode_vga_v_sm_inst|WideOr3~1_combout\, , , \textmode_vga_inst|textmode_vga_v_sm_inst|WideOr7~0_combout\, )
-- \textmode_vga_inst|textmode_vga_v_sm_inst|vcnt[3]~9\ = CARRY(((!\textmode_vga_inst|textmode_vga_v_sm_inst|vcnt[2]~1\)) # (!\textmode_vga_inst|textmode_vga_v_sm_inst|vcnt\(3)))
-- \textmode_vga_inst|textmode_vga_v_sm_inst|vcnt[3]~9COUT1_22\ = CARRY(((!\textmode_vga_inst|textmode_vga_v_sm_inst|vcnt[2]~1COUT1_20\)) # (!\textmode_vga_inst|textmode_vga_v_sm_inst|vcnt\(3)))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	lut_mask => "5a5f",
	operation_mode => "arithmetic",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \pll_vga_clk|altpll_component|_clk0\,
	dataa => \textmode_vga_inst|textmode_vga_v_sm_inst|vcnt\(3),
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	sclr => \textmode_vga_inst|textmode_vga_v_sm_inst|WideOr7~0_combout\,
	ena => \textmode_vga_inst|textmode_vga_v_sm_inst|WideOr3~1_combout\,
	cin0 => \textmode_vga_inst|textmode_vga_v_sm_inst|vcnt[2]~1\,
	cin1 => \textmode_vga_inst|textmode_vga_v_sm_inst|vcnt[2]~1COUT1_20\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \textmode_vga_inst|textmode_vga_v_sm_inst|vcnt\(3),
	cout0 => \textmode_vga_inst|textmode_vga_v_sm_inst|vcnt[3]~9\,
	cout1 => \textmode_vga_inst|textmode_vga_v_sm_inst|vcnt[3]~9COUT1_22\);

-- Location: LC_X36_Y31_N1
\textmode_vga_inst|textmode_vga_v_sm_inst|Equal4~0\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|textmode_vga_v_sm_inst|Equal4~0_combout\ = (((!\textmode_vga_inst|textmode_vga_v_sm_inst|vcnt\(2) & !\textmode_vga_inst|textmode_vga_v_sm_inst|vcnt\(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "000f",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datac => \textmode_vga_inst|textmode_vga_v_sm_inst|vcnt\(2),
	datad => \textmode_vga_inst|textmode_vga_v_sm_inst|vcnt\(4),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \textmode_vga_inst|textmode_vga_v_sm_inst|Equal4~0_combout\);

-- Location: LC_X36_Y31_N2
\textmode_vga_inst|textmode_vga_v_sm_inst|Equal0~0\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|textmode_vga_v_sm_inst|Equal0~0_combout\ = (!\textmode_vga_inst|textmode_vga_v_sm_inst|vcnt\(3) & (!\textmode_vga_inst|textmode_vga_v_sm_inst|vcnt\(1) & (\textmode_vga_inst|textmode_vga_v_sm_inst|vcnt\(0) & 
-- \textmode_vga_inst|textmode_vga_v_sm_inst|Equal4~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \textmode_vga_inst|textmode_vga_v_sm_inst|vcnt\(3),
	datab => \textmode_vga_inst|textmode_vga_v_sm_inst|vcnt\(1),
	datac => \textmode_vga_inst|textmode_vga_v_sm_inst|vcnt\(0),
	datad => \textmode_vga_inst|textmode_vga_v_sm_inst|Equal4~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \textmode_vga_inst|textmode_vga_v_sm_inst|Equal0~0_combout\);

-- Location: LC_X35_Y31_N4
\textmode_vga_inst|textmode_vga_v_sm_inst|textmode_vga_v_sm_state.VSYNC_NEXT\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|textmode_vga_v_sm_inst|textmode_vga_v_sm_state.VSYNC_NEXT~regout\ = DFFEAS((\textmode_vga_inst|textmode_vga_v_sm_inst|textmode_vga_v_sm_state.VSYNC~regout\ & (!\textmode_vga_inst|textmode_vga_v_sm_inst|Equal0~0_combout\ & 
-- (\textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.HFRONT_LAST~regout\))), GLOBAL(\pll_vga_clk|altpll_component|_clk0\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "2020",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \pll_vga_clk|altpll_component|_clk0\,
	dataa => \textmode_vga_inst|textmode_vga_v_sm_inst|textmode_vga_v_sm_state.VSYNC~regout\,
	datab => \textmode_vga_inst|textmode_vga_v_sm_inst|Equal0~0_combout\,
	datac => \textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.HFRONT_LAST~regout\,
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \textmode_vga_inst|textmode_vga_v_sm_inst|textmode_vga_v_sm_state.VSYNC_NEXT~regout\);

-- Location: LC_X35_Y31_N0
\textmode_vga_inst|textmode_vga_v_sm_inst|textmode_vga_v_sm_state.VBACK_FIRST\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|textmode_vga_v_sm_inst|textmode_vga_v_sm_state.VBACK_FIRST~regout\ = DFFEAS((\textmode_vga_inst|textmode_vga_v_sm_inst|textmode_vga_v_sm_state.VSYNC~regout\ & (\textmode_vga_inst|textmode_vga_v_sm_inst|Equal0~0_combout\ & 
-- (\textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.HFRONT_LAST~regout\))), GLOBAL(\pll_vga_clk|altpll_component|_clk0\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "8080",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \pll_vga_clk|altpll_component|_clk0\,
	dataa => \textmode_vga_inst|textmode_vga_v_sm_inst|textmode_vga_v_sm_state.VSYNC~regout\,
	datab => \textmode_vga_inst|textmode_vga_v_sm_inst|Equal0~0_combout\,
	datac => \textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.HFRONT_LAST~regout\,
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \textmode_vga_inst|textmode_vga_v_sm_inst|textmode_vga_v_sm_state.VBACK_FIRST~regout\);

-- Location: LC_X37_Y31_N9
\textmode_vga_inst|textmode_vga_v_sm_inst|textmode_vga_v_sm_state.VBACK\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|textmode_vga_v_sm_inst|textmode_vga_v_sm_state.VBACK~regout\ = DFFEAS((\textmode_vga_inst|textmode_vga_v_sm_inst|textmode_vga_v_sm_state.VBACK_NEXT~regout\) # 
-- ((\textmode_vga_inst|textmode_vga_v_sm_inst|textmode_vga_v_sm_state.VBACK_FIRST~regout\) # ((\textmode_vga_inst|textmode_vga_v_sm_inst|textmode_vga_v_sm_state.VBACK~regout\ & 
-- !\textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.HFRONT_LAST~regout\))), GLOBAL(\pll_vga_clk|altpll_component|_clk0\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "fafe",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \pll_vga_clk|altpll_component|_clk0\,
	dataa => \textmode_vga_inst|textmode_vga_v_sm_inst|textmode_vga_v_sm_state.VBACK_NEXT~regout\,
	datab => \textmode_vga_inst|textmode_vga_v_sm_inst|textmode_vga_v_sm_state.VBACK~regout\,
	datac => \textmode_vga_inst|textmode_vga_v_sm_inst|textmode_vga_v_sm_state.VBACK_FIRST~regout\,
	datad => \textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.HFRONT_LAST~regout\,
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \textmode_vga_inst|textmode_vga_v_sm_inst|textmode_vga_v_sm_state.VBACK~regout\);

-- Location: LC_X37_Y31_N7
\textmode_vga_inst|textmode_vga_v_sm_inst|textmode_vga_v_sm_state.VBACK_NEXT\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|textmode_vga_v_sm_inst|textmode_vga_v_sm_state.VBACK_NEXT~regout\ = DFFEAS((\textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.HFRONT_LAST~regout\ & (!\textmode_vga_inst|textmode_vga_v_sm_inst|Equal1~0_combout\ & 
-- ((\textmode_vga_inst|textmode_vga_v_sm_inst|textmode_vga_v_sm_state.VBACK~regout\)))), GLOBAL(\pll_vga_clk|altpll_component|_clk0\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "2200",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \pll_vga_clk|altpll_component|_clk0\,
	dataa => \textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.HFRONT_LAST~regout\,
	datab => \textmode_vga_inst|textmode_vga_v_sm_inst|Equal1~0_combout\,
	datad => \textmode_vga_inst|textmode_vga_v_sm_inst|textmode_vga_v_sm_state.VBACK~regout\,
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \textmode_vga_inst|textmode_vga_v_sm_inst|textmode_vga_v_sm_state.VBACK_NEXT~regout\);

-- Location: LC_X35_Y31_N2
\textmode_vga_inst|textmode_vga_v_sm_inst|WideOr3~0\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|textmode_vga_v_sm_inst|WideOr3~0_combout\ = (\textmode_vga_inst|textmode_vga_v_sm_inst|textmode_vga_v_sm_state.VSYNC_NEXT~regout\) # (((\textmode_vga_inst|textmode_vga_v_sm_inst|textmode_vga_v_sm_state.VFRONT_FIRST~regout\) # 
-- (\textmode_vga_inst|textmode_vga_v_sm_inst|textmode_vga_v_sm_state.VBACK_NEXT~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "fffa",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \textmode_vga_inst|textmode_vga_v_sm_inst|textmode_vga_v_sm_state.VSYNC_NEXT~regout\,
	datac => \textmode_vga_inst|textmode_vga_v_sm_inst|textmode_vga_v_sm_state.VFRONT_FIRST~regout\,
	datad => \textmode_vga_inst|textmode_vga_v_sm_inst|textmode_vga_v_sm_state.VBACK_NEXT~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \textmode_vga_inst|textmode_vga_v_sm_inst|WideOr3~0_combout\);

-- Location: LC_X35_Y31_N3
\textmode_vga_inst|textmode_vga_v_sm_inst|WideOr3~1\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|textmode_vga_v_sm_inst|WideOr3~1_combout\ = (\textmode_vga_inst|textmode_vga_v_sm_inst|WideOr3~0_combout\) # (((\textmode_vga_inst|textmode_vga_v_sm_inst|textmode_vga_v_sm_state.VFRONT_NEXT~regout\) # 
-- (\textmode_vga_inst|textmode_vga_v_sm_inst|textmode_vga_v_sm_state.VBACK_FIRST~regout\)) # (!\textmode_vga_inst|textmode_vga_v_sm_inst|textmode_vga_v_sm_state.VSYNC_FIRST~regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "fffb",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \textmode_vga_inst|textmode_vga_v_sm_inst|WideOr3~0_combout\,
	datab => \textmode_vga_inst|textmode_vga_v_sm_inst|textmode_vga_v_sm_state.VSYNC_FIRST~regout\,
	datac => \textmode_vga_inst|textmode_vga_v_sm_inst|textmode_vga_v_sm_state.VFRONT_NEXT~regout\,
	datad => \textmode_vga_inst|textmode_vga_v_sm_inst|textmode_vga_v_sm_state.VBACK_FIRST~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \textmode_vga_inst|textmode_vga_v_sm_inst|WideOr3~1_combout\);

-- Location: LC_X36_Y31_N0
\textmode_vga_inst|textmode_vga_v_sm_inst|Equal4~1\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|textmode_vga_v_sm_inst|Equal4~1_combout\ = ((\textmode_vga_inst|textmode_vga_v_sm_inst|vcnt\(1) & (!\textmode_vga_inst|textmode_vga_v_sm_inst|vcnt\(0) & \textmode_vga_inst|textmode_vga_v_sm_inst|vcnt\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0c00",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \textmode_vga_inst|textmode_vga_v_sm_inst|vcnt\(1),
	datac => \textmode_vga_inst|textmode_vga_v_sm_inst|vcnt\(0),
	datad => \textmode_vga_inst|textmode_vga_v_sm_inst|vcnt\(3),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \textmode_vga_inst|textmode_vga_v_sm_inst|Equal4~1_combout\);

-- Location: LC_X35_Y31_N5
\textmode_vga_inst|textmode_vga_v_sm_inst|textmode_vga_v_sm_state.VFRONT_NEXT\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|textmode_vga_v_sm_inst|textmode_vga_v_sm_state.VFRONT_NEXT~regout\ = DFFEAS((\textmode_vga_inst|textmode_vga_v_sm_inst|textmode_vga_v_sm_state.VFRONT~regout\ & 
-- (\textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.HFRONT_LAST~regout\ & ((!\textmode_vga_inst|textmode_vga_v_sm_inst|Equal4~0_combout\) # (!\textmode_vga_inst|textmode_vga_v_sm_inst|Equal4~1_combout\)))), 
-- GLOBAL(\pll_vga_clk|altpll_component|_clk0\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "20a0",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \pll_vga_clk|altpll_component|_clk0\,
	dataa => \textmode_vga_inst|textmode_vga_v_sm_inst|textmode_vga_v_sm_state.VFRONT~regout\,
	datab => \textmode_vga_inst|textmode_vga_v_sm_inst|Equal4~1_combout\,
	datac => \textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.HFRONT_LAST~regout\,
	datad => \textmode_vga_inst|textmode_vga_v_sm_inst|Equal4~0_combout\,
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \textmode_vga_inst|textmode_vga_v_sm_inst|textmode_vga_v_sm_state.VFRONT_NEXT~regout\);

-- Location: LC_X35_Y31_N7
\textmode_vga_inst|textmode_vga_v_sm_inst|textmode_vga_v_sm_state.VFRONT\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|textmode_vga_v_sm_inst|textmode_vga_v_sm_state.VFRONT~regout\ = DFFEAS((\textmode_vga_inst|textmode_vga_v_sm_inst|textmode_vga_v_sm_state.VFRONT_FIRST~regout\) # 
-- ((\textmode_vga_inst|textmode_vga_v_sm_inst|textmode_vga_v_sm_state.VFRONT_NEXT~regout\) # ((\textmode_vga_inst|textmode_vga_v_sm_inst|textmode_vga_v_sm_state.VFRONT~regout\ & 
-- !\textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.HFRONT_LAST~regout\))), GLOBAL(\pll_vga_clk|altpll_component|_clk0\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "ffce",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \pll_vga_clk|altpll_component|_clk0\,
	dataa => \textmode_vga_inst|textmode_vga_v_sm_inst|textmode_vga_v_sm_state.VFRONT~regout\,
	datab => \textmode_vga_inst|textmode_vga_v_sm_inst|textmode_vga_v_sm_state.VFRONT_FIRST~regout\,
	datac => \textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.HFRONT_LAST~regout\,
	datad => \textmode_vga_inst|textmode_vga_v_sm_inst|textmode_vga_v_sm_state.VFRONT_NEXT~regout\,
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \textmode_vga_inst|textmode_vga_v_sm_inst|textmode_vga_v_sm_state.VFRONT~regout\);

-- Location: LC_X35_Y31_N9
\textmode_vga_inst|textmode_vga_v_sm_inst|textmode_vga_v_sm_state.VSYNC_FIRST\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|textmode_vga_v_sm_inst|textmode_vga_v_sm_state.VSYNC_FIRST~regout\ = DFFEAS((((!\textmode_vga_inst|textmode_vga_v_sm_inst|Equal4~0_combout\) # (!\textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.HFRONT_LAST~regout\)) # 
-- (!\textmode_vga_inst|textmode_vga_v_sm_inst|Equal4~1_combout\)) # (!\textmode_vga_inst|textmode_vga_v_sm_inst|textmode_vga_v_sm_state.VFRONT~regout\), GLOBAL(\pll_vga_clk|altpll_component|_clk0\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , 
-- , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "7fff",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \pll_vga_clk|altpll_component|_clk0\,
	dataa => \textmode_vga_inst|textmode_vga_v_sm_inst|textmode_vga_v_sm_state.VFRONT~regout\,
	datab => \textmode_vga_inst|textmode_vga_v_sm_inst|Equal4~1_combout\,
	datac => \textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.HFRONT_LAST~regout\,
	datad => \textmode_vga_inst|textmode_vga_v_sm_inst|Equal4~0_combout\,
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \textmode_vga_inst|textmode_vga_v_sm_inst|textmode_vga_v_sm_state.VSYNC_FIRST~regout\);

-- Location: LC_X35_Y31_N6
\textmode_vga_inst|textmode_vga_v_sm_inst|WideOr7~0\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|textmode_vga_v_sm_inst|WideOr7~0_combout\ = (((\textmode_vga_inst|textmode_vga_v_sm_inst|textmode_vga_v_sm_state.VFRONT_FIRST~regout\) # (\textmode_vga_inst|textmode_vga_v_sm_inst|textmode_vga_v_sm_state.VBACK_FIRST~regout\)) # 
-- (!\textmode_vga_inst|textmode_vga_v_sm_inst|textmode_vga_v_sm_state.VSYNC_FIRST~regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "fff3",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \textmode_vga_inst|textmode_vga_v_sm_inst|textmode_vga_v_sm_state.VSYNC_FIRST~regout\,
	datac => \textmode_vga_inst|textmode_vga_v_sm_inst|textmode_vga_v_sm_state.VFRONT_FIRST~regout\,
	datad => \textmode_vga_inst|textmode_vga_v_sm_inst|textmode_vga_v_sm_state.VBACK_FIRST~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \textmode_vga_inst|textmode_vga_v_sm_inst|WideOr7~0_combout\);

-- Location: LC_X36_Y31_N9
\textmode_vga_inst|textmode_vga_v_sm_inst|vcnt[4]\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|textmode_vga_v_sm_inst|vcnt\(4) = DFFEAS(((\textmode_vga_inst|textmode_vga_v_sm_inst|vcnt[3]~9\ $ (!\textmode_vga_inst|textmode_vga_v_sm_inst|vcnt\(4)))), GLOBAL(\pll_vga_clk|altpll_component|_clk0\), 
-- !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , \textmode_vga_inst|textmode_vga_v_sm_inst|WideOr3~1_combout\, , , \textmode_vga_inst|textmode_vga_v_sm_inst|WideOr7~0_combout\, )

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	lut_mask => "f00f",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \pll_vga_clk|altpll_component|_clk0\,
	datad => \textmode_vga_inst|textmode_vga_v_sm_inst|vcnt\(4),
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	sclr => \textmode_vga_inst|textmode_vga_v_sm_inst|WideOr7~0_combout\,
	ena => \textmode_vga_inst|textmode_vga_v_sm_inst|WideOr3~1_combout\,
	cin0 => \textmode_vga_inst|textmode_vga_v_sm_inst|vcnt[3]~9\,
	cin1 => \textmode_vga_inst|textmode_vga_v_sm_inst|vcnt[3]~9COUT1_22\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \textmode_vga_inst|textmode_vga_v_sm_inst|vcnt\(4));

-- Location: LC_X36_Y31_N4
\textmode_vga_inst|textmode_vga_v_sm_inst|Equal1~0\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|textmode_vga_v_sm_inst|Equal1~0_combout\ = ((\textmode_vga_inst|textmode_vga_v_sm_inst|vcnt\(4) & (\textmode_vga_inst|textmode_vga_v_sm_inst|vcnt\(2) & \textmode_vga_inst|textmode_vga_v_sm_inst|Equal4~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "c000",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \textmode_vga_inst|textmode_vga_v_sm_inst|vcnt\(4),
	datac => \textmode_vga_inst|textmode_vga_v_sm_inst|vcnt\(2),
	datad => \textmode_vga_inst|textmode_vga_v_sm_inst|Equal4~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \textmode_vga_inst|textmode_vga_v_sm_inst|Equal1~0_combout\);

-- Location: LC_X37_Y31_N6
\textmode_vga_inst|textmode_vga_v_sm_inst|textmode_vga_v_sm_state.VDATA_FIRST\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|textmode_vga_v_sm_inst|textmode_vga_v_sm_state.VDATA_FIRST~regout\ = DFFEAS((\textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.HFRONT_LAST~regout\ & (\textmode_vga_inst|textmode_vga_v_sm_inst|Equal1~0_combout\ & 
-- ((\textmode_vga_inst|textmode_vga_v_sm_inst|textmode_vga_v_sm_state.VBACK~regout\)))), GLOBAL(\pll_vga_clk|altpll_component|_clk0\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "8800",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \pll_vga_clk|altpll_component|_clk0\,
	dataa => \textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.HFRONT_LAST~regout\,
	datab => \textmode_vga_inst|textmode_vga_v_sm_inst|Equal1~0_combout\,
	datad => \textmode_vga_inst|textmode_vga_v_sm_inst|textmode_vga_v_sm_state.VBACK~regout\,
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \textmode_vga_inst|textmode_vga_v_sm_inst|textmode_vga_v_sm_state.VDATA_FIRST~regout\);

-- Location: LC_X35_Y29_N6
\textmode_vga_inst|textmode_vga_v_sm_inst|Selector25~0\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|textmode_vga_v_sm_inst|Selector25~0_combout\ = (\textmode_vga_inst|textmode_vga_v_sm_inst|char_line_cnt_int\(2) & (((!\textmode_vga_inst|textmode_vga_v_sm_inst|textmode_vga_v_sm_state.VDATA_FIRST~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "00aa",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \textmode_vga_inst|textmode_vga_v_sm_inst|char_line_cnt_int\(2),
	datad => \textmode_vga_inst|textmode_vga_v_sm_inst|textmode_vga_v_sm_state.VDATA_FIRST~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \textmode_vga_inst|textmode_vga_v_sm_inst|Selector25~0_combout\);

-- Location: LC_X35_Y29_N8
\textmode_vga_inst|textmode_vga_v_sm_inst|Equal3~0\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|textmode_vga_v_sm_inst|Equal3~0_combout\ = (\textmode_vga_inst|textmode_vga_v_sm_inst|char_line_cnt_int\(2) & (!\textmode_vga_inst|textmode_vga_v_sm_inst|char_line_cnt_int\(1) & 
-- (\textmode_vga_inst|textmode_vga_v_sm_inst|char_line_cnt_int\(3) & \textmode_vga_inst|textmode_vga_v_sm_inst|char_line_cnt_int\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "2000",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \textmode_vga_inst|textmode_vga_v_sm_inst|char_line_cnt_int\(2),
	datab => \textmode_vga_inst|textmode_vga_v_sm_inst|char_line_cnt_int\(1),
	datac => \textmode_vga_inst|textmode_vga_v_sm_inst|char_line_cnt_int\(3),
	datad => \textmode_vga_inst|textmode_vga_v_sm_inst|char_line_cnt_int\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \textmode_vga_inst|textmode_vga_v_sm_inst|Equal3~0_combout\);

-- Location: LC_X35_Y30_N9
\textmode_vga_inst|textmode_vga_v_sm_inst|textmode_vga_v_sm_state.VDATA_NEXTCHAR\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|textmode_vga_v_sm_inst|textmode_vga_v_sm_state.VDATA_NEXTCHAR~regout\ = DFFEAS(((\textmode_vga_inst|textmode_vga_v_sm_inst|Selector10~0_combout\ & ((!\textmode_vga_inst|textmode_vga_v_sm_inst|char_line_cnt_int\(4)) # 
-- (!\textmode_vga_inst|textmode_vga_v_sm_inst|Equal3~0_combout\)))), GLOBAL(\pll_vga_clk|altpll_component|_clk0\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "3f00",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \pll_vga_clk|altpll_component|_clk0\,
	datab => \textmode_vga_inst|textmode_vga_v_sm_inst|Equal3~0_combout\,
	datac => \textmode_vga_inst|textmode_vga_v_sm_inst|char_line_cnt_int\(4),
	datad => \textmode_vga_inst|textmode_vga_v_sm_inst|Selector10~0_combout\,
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \textmode_vga_inst|textmode_vga_v_sm_inst|textmode_vga_v_sm_state.VDATA_NEXTCHAR~regout\);

-- Location: LC_X35_Y30_N1
\textmode_vga_inst|textmode_vga_v_sm_inst|WideOr9~0\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|textmode_vga_v_sm_inst|WideOr9~0_combout\ = (!\textmode_vga_inst|textmode_vga_v_sm_inst|textmode_vga_v_sm_state.VDATA_NEXTLINE~regout\ & (!\textmode_vga_inst|textmode_vga_v_sm_inst|textmode_vga_v_sm_state.VDATA_NEXTCHAR~regout\ & 
-- ((!\textmode_vga_inst|textmode_vga_v_sm_inst|textmode_vga_v_sm_state.VDATA_FIRST~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \textmode_vga_inst|textmode_vga_v_sm_inst|textmode_vga_v_sm_state.VDATA_NEXTLINE~regout\,
	datab => \textmode_vga_inst|textmode_vga_v_sm_inst|textmode_vga_v_sm_state.VDATA_NEXTCHAR~regout\,
	datad => \textmode_vga_inst|textmode_vga_v_sm_inst|textmode_vga_v_sm_state.VDATA_FIRST~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \textmode_vga_inst|textmode_vga_v_sm_inst|WideOr9~0_combout\);

-- Location: LC_X35_Y30_N7
\textmode_vga_inst|textmode_vga_v_sm_inst|char_height_pixel_int[0]\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|textmode_vga_v_sm_inst|char_height_pixel_int\(0) = DFFEAS((\textmode_vga_inst|textmode_vga_v_sm_inst|char_height_pixel_int\(0) & ((\textmode_vga_inst|textmode_vga_v_sm_inst|WideOr9~0_combout\) # 
-- ((\textmode_vga_inst|textmode_vga_v_sm_inst|Add1~0_combout\ & \textmode_vga_inst|textmode_vga_v_sm_inst|textmode_vga_v_sm_state.VDATA_NEXTLINE~regout\)))) # (!\textmode_vga_inst|textmode_vga_v_sm_inst|char_height_pixel_int\(0) & 
-- (((\textmode_vga_inst|textmode_vga_v_sm_inst|Add1~0_combout\ & \textmode_vga_inst|textmode_vga_v_sm_inst|textmode_vga_v_sm_state.VDATA_NEXTLINE~regout\)))), GLOBAL(\pll_vga_clk|altpll_component|_clk0\), 
-- !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "f888",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \pll_vga_clk|altpll_component|_clk0\,
	dataa => \textmode_vga_inst|textmode_vga_v_sm_inst|char_height_pixel_int\(0),
	datab => \textmode_vga_inst|textmode_vga_v_sm_inst|WideOr9~0_combout\,
	datac => \textmode_vga_inst|textmode_vga_v_sm_inst|Add1~0_combout\,
	datad => \textmode_vga_inst|textmode_vga_v_sm_inst|textmode_vga_v_sm_state.VDATA_NEXTLINE~regout\,
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \textmode_vga_inst|textmode_vga_v_sm_inst|char_height_pixel_int\(0));

-- Location: LC_X35_Y30_N4
\textmode_vga_inst|textmode_vga_v_sm_inst|textmode_vga_v_sm_state.VDATA_NEXTLINE\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|textmode_vga_v_sm_inst|textmode_vga_v_sm_state.VDATA_NEXTLINE~regout\ = DFFEAS((\textmode_vga_inst|textmode_vga_v_sm_inst|textmode_vga_v_sm_state.VDATA~regout\ & 
-- (\textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.HFRONT_LAST~regout\ & ((\textmode_vga_inst|textmode_vga_v_sm_inst|Equal2~0_combout\) # (!\textmode_vga_inst|textmode_vga_v_sm_inst|char_height_pixel_int\(0))))), 
-- GLOBAL(\pll_vga_clk|altpll_component|_clk0\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "c400",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \pll_vga_clk|altpll_component|_clk0\,
	dataa => \textmode_vga_inst|textmode_vga_v_sm_inst|char_height_pixel_int\(0),
	datab => \textmode_vga_inst|textmode_vga_v_sm_inst|textmode_vga_v_sm_state.VDATA~regout\,
	datac => \textmode_vga_inst|textmode_vga_v_sm_inst|Equal2~0_combout\,
	datad => \textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.HFRONT_LAST~regout\,
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \textmode_vga_inst|textmode_vga_v_sm_inst|textmode_vga_v_sm_state.VDATA_NEXTLINE~regout\);

-- Location: LC_X35_Y30_N5
\textmode_vga_inst|textmode_vga_v_sm_inst|WideOr9\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|textmode_vga_v_sm_inst|WideOr9~combout\ = (!\textmode_vga_inst|textmode_vga_v_sm_inst|textmode_vga_v_sm_state.VDATA_NEXTLINE~regout\ & (!\textmode_vga_inst|textmode_vga_v_sm_inst|textmode_vga_v_sm_state.VDATA~regout\ & 
-- (!\textmode_vga_inst|textmode_vga_v_sm_inst|textmode_vga_v_sm_state.VDATA_NEXTCHAR~regout\ & !\textmode_vga_inst|textmode_vga_v_sm_inst|textmode_vga_v_sm_state.VDATA_FIRST~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \textmode_vga_inst|textmode_vga_v_sm_inst|textmode_vga_v_sm_state.VDATA_NEXTLINE~regout\,
	datab => \textmode_vga_inst|textmode_vga_v_sm_inst|textmode_vga_v_sm_state.VDATA~regout\,
	datac => \textmode_vga_inst|textmode_vga_v_sm_inst|textmode_vga_v_sm_state.VDATA_NEXTCHAR~regout\,
	datad => \textmode_vga_inst|textmode_vga_v_sm_inst|textmode_vga_v_sm_state.VDATA_FIRST~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \textmode_vga_inst|textmode_vga_v_sm_inst|WideOr9~combout\);

-- Location: LC_X37_Y30_N4
\textmode_vga_inst|textmode_vga_h_sm_inst|WideOr12~1\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|textmode_vga_h_sm_inst|WideOr12~1_combout\ = (\textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.HBACK_FIRST~regout\) # ((\textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.HFRONT_FIRST~regout\) # 
-- ((!\textmode_vga_inst|textmode_vga_h_sm_inst|WideOr12~0_combout\) # (!\textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.HSYNC_FIRST~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "efff",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.HBACK_FIRST~regout\,
	datab => \textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.HFRONT_FIRST~regout\,
	datac => \textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.HSYNC_FIRST~regout\,
	datad => \textmode_vga_inst|textmode_vga_h_sm_inst|WideOr12~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \textmode_vga_inst|textmode_vga_h_sm_inst|WideOr12~1_combout\);

-- Location: LC_X38_Y31_N1
\textmode_vga_inst|textmode_vga_h_sm_inst|hcnt[0]\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|textmode_vga_h_sm_inst|hcnt\(0) = DFFEAS(((!\textmode_vga_inst|textmode_vga_h_sm_inst|hcnt\(0))), GLOBAL(\pll_vga_clk|altpll_component|_clk0\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , 
-- \textmode_vga_inst|textmode_vga_h_sm_inst|WideOr12~1_combout\, , , \textmode_vga_inst|textmode_vga_h_sm_inst|WideOr9~0_combout\, )
-- \textmode_vga_inst|textmode_vga_h_sm_inst|hcnt[0]~1\ = CARRY(((\textmode_vga_inst|textmode_vga_h_sm_inst|hcnt\(0))))
-- \textmode_vga_inst|textmode_vga_h_sm_inst|hcnt[0]~1COUT1_21\ = CARRY(((\textmode_vga_inst|textmode_vga_h_sm_inst|hcnt\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "33cc",
	operation_mode => "arithmetic",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \pll_vga_clk|altpll_component|_clk0\,
	datab => \textmode_vga_inst|textmode_vga_h_sm_inst|hcnt\(0),
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	sclr => \textmode_vga_inst|textmode_vga_h_sm_inst|WideOr9~0_combout\,
	ena => \textmode_vga_inst|textmode_vga_h_sm_inst|WideOr12~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \textmode_vga_inst|textmode_vga_h_sm_inst|hcnt\(0),
	cout0 => \textmode_vga_inst|textmode_vga_h_sm_inst|hcnt[0]~1\,
	cout1 => \textmode_vga_inst|textmode_vga_h_sm_inst|hcnt[0]~1COUT1_21\);

-- Location: LC_X38_Y31_N2
\textmode_vga_inst|textmode_vga_h_sm_inst|hcnt[1]\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|textmode_vga_h_sm_inst|hcnt\(1) = DFFEAS(\textmode_vga_inst|textmode_vga_h_sm_inst|hcnt\(1) $ ((((\textmode_vga_inst|textmode_vga_h_sm_inst|hcnt[0]~1\)))), GLOBAL(\pll_vga_clk|altpll_component|_clk0\), 
-- !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , \textmode_vga_inst|textmode_vga_h_sm_inst|WideOr12~1_combout\, , , \textmode_vga_inst|textmode_vga_h_sm_inst|WideOr9~0_combout\, )
-- \textmode_vga_inst|textmode_vga_h_sm_inst|hcnt[1]~3\ = CARRY(((!\textmode_vga_inst|textmode_vga_h_sm_inst|hcnt[0]~1\)) # (!\textmode_vga_inst|textmode_vga_h_sm_inst|hcnt\(1)))
-- \textmode_vga_inst|textmode_vga_h_sm_inst|hcnt[1]~3COUT1_23\ = CARRY(((!\textmode_vga_inst|textmode_vga_h_sm_inst|hcnt[0]~1COUT1_21\)) # (!\textmode_vga_inst|textmode_vga_h_sm_inst|hcnt\(1)))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	lut_mask => "5a5f",
	operation_mode => "arithmetic",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \pll_vga_clk|altpll_component|_clk0\,
	dataa => \textmode_vga_inst|textmode_vga_h_sm_inst|hcnt\(1),
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	sclr => \textmode_vga_inst|textmode_vga_h_sm_inst|WideOr9~0_combout\,
	ena => \textmode_vga_inst|textmode_vga_h_sm_inst|WideOr12~1_combout\,
	cin0 => \textmode_vga_inst|textmode_vga_h_sm_inst|hcnt[0]~1\,
	cin1 => \textmode_vga_inst|textmode_vga_h_sm_inst|hcnt[0]~1COUT1_21\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \textmode_vga_inst|textmode_vga_h_sm_inst|hcnt\(1),
	cout0 => \textmode_vga_inst|textmode_vga_h_sm_inst|hcnt[1]~3\,
	cout1 => \textmode_vga_inst|textmode_vga_h_sm_inst|hcnt[1]~3COUT1_23\);

-- Location: LC_X38_Y31_N3
\textmode_vga_inst|textmode_vga_h_sm_inst|hcnt[2]\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|textmode_vga_h_sm_inst|hcnt\(2) = DFFEAS(\textmode_vga_inst|textmode_vga_h_sm_inst|hcnt\(2) $ ((((!\textmode_vga_inst|textmode_vga_h_sm_inst|hcnt[1]~3\)))), GLOBAL(\pll_vga_clk|altpll_component|_clk0\), 
-- !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , \textmode_vga_inst|textmode_vga_h_sm_inst|WideOr12~1_combout\, , , \textmode_vga_inst|textmode_vga_h_sm_inst|WideOr9~0_combout\, )
-- \textmode_vga_inst|textmode_vga_h_sm_inst|hcnt[2]~5\ = CARRY((\textmode_vga_inst|textmode_vga_h_sm_inst|hcnt\(2) & ((!\textmode_vga_inst|textmode_vga_h_sm_inst|hcnt[1]~3\))))
-- \textmode_vga_inst|textmode_vga_h_sm_inst|hcnt[2]~5COUT1_25\ = CARRY((\textmode_vga_inst|textmode_vga_h_sm_inst|hcnt\(2) & ((!\textmode_vga_inst|textmode_vga_h_sm_inst|hcnt[1]~3COUT1_23\))))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	lut_mask => "a50a",
	operation_mode => "arithmetic",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \pll_vga_clk|altpll_component|_clk0\,
	dataa => \textmode_vga_inst|textmode_vga_h_sm_inst|hcnt\(2),
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	sclr => \textmode_vga_inst|textmode_vga_h_sm_inst|WideOr9~0_combout\,
	ena => \textmode_vga_inst|textmode_vga_h_sm_inst|WideOr12~1_combout\,
	cin0 => \textmode_vga_inst|textmode_vga_h_sm_inst|hcnt[1]~3\,
	cin1 => \textmode_vga_inst|textmode_vga_h_sm_inst|hcnt[1]~3COUT1_23\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \textmode_vga_inst|textmode_vga_h_sm_inst|hcnt\(2),
	cout0 => \textmode_vga_inst|textmode_vga_h_sm_inst|hcnt[2]~5\,
	cout1 => \textmode_vga_inst|textmode_vga_h_sm_inst|hcnt[2]~5COUT1_25\);

-- Location: LC_X38_Y31_N4
\textmode_vga_inst|textmode_vga_h_sm_inst|hcnt[3]\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|textmode_vga_h_sm_inst|hcnt\(3) = DFFEAS(\textmode_vga_inst|textmode_vga_h_sm_inst|hcnt\(3) $ ((((\textmode_vga_inst|textmode_vga_h_sm_inst|hcnt[2]~5\)))), GLOBAL(\pll_vga_clk|altpll_component|_clk0\), 
-- !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , \textmode_vga_inst|textmode_vga_h_sm_inst|WideOr12~1_combout\, , , \textmode_vga_inst|textmode_vga_h_sm_inst|WideOr9~0_combout\, )
-- \textmode_vga_inst|textmode_vga_h_sm_inst|hcnt[3]~7\ = CARRY(((!\textmode_vga_inst|textmode_vga_h_sm_inst|hcnt[2]~5COUT1_25\)) # (!\textmode_vga_inst|textmode_vga_h_sm_inst|hcnt\(3)))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	lut_mask => "5a5f",
	operation_mode => "arithmetic",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \pll_vga_clk|altpll_component|_clk0\,
	dataa => \textmode_vga_inst|textmode_vga_h_sm_inst|hcnt\(3),
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	sclr => \textmode_vga_inst|textmode_vga_h_sm_inst|WideOr9~0_combout\,
	ena => \textmode_vga_inst|textmode_vga_h_sm_inst|WideOr12~1_combout\,
	cin0 => \textmode_vga_inst|textmode_vga_h_sm_inst|hcnt[2]~5\,
	cin1 => \textmode_vga_inst|textmode_vga_h_sm_inst|hcnt[2]~5COUT1_25\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \textmode_vga_inst|textmode_vga_h_sm_inst|hcnt\(3),
	cout => \textmode_vga_inst|textmode_vga_h_sm_inst|hcnt[3]~7\);

-- Location: LC_X38_Y31_N5
\textmode_vga_inst|textmode_vga_h_sm_inst|hcnt[4]\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|textmode_vga_h_sm_inst|hcnt\(4) = DFFEAS((\textmode_vga_inst|textmode_vga_h_sm_inst|hcnt\(4) $ ((!\textmode_vga_inst|textmode_vga_h_sm_inst|hcnt[3]~7\))), GLOBAL(\pll_vga_clk|altpll_component|_clk0\), 
-- !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , \textmode_vga_inst|textmode_vga_h_sm_inst|WideOr12~1_combout\, , , \textmode_vga_inst|textmode_vga_h_sm_inst|WideOr9~0_combout\, )
-- \textmode_vga_inst|textmode_vga_h_sm_inst|hcnt[4]~9\ = CARRY(((\textmode_vga_inst|textmode_vga_h_sm_inst|hcnt\(4) & !\textmode_vga_inst|textmode_vga_h_sm_inst|hcnt[3]~7\)))
-- \textmode_vga_inst|textmode_vga_h_sm_inst|hcnt[4]~9COUT1_27\ = CARRY(((\textmode_vga_inst|textmode_vga_h_sm_inst|hcnt\(4) & !\textmode_vga_inst|textmode_vga_h_sm_inst|hcnt[3]~7\)))

-- pragma translate_off
GENERIC MAP (
	cin_used => "true",
	lut_mask => "c30c",
	operation_mode => "arithmetic",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \pll_vga_clk|altpll_component|_clk0\,
	datab => \textmode_vga_inst|textmode_vga_h_sm_inst|hcnt\(4),
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	sclr => \textmode_vga_inst|textmode_vga_h_sm_inst|WideOr9~0_combout\,
	ena => \textmode_vga_inst|textmode_vga_h_sm_inst|WideOr12~1_combout\,
	cin => \textmode_vga_inst|textmode_vga_h_sm_inst|hcnt[3]~7\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \textmode_vga_inst|textmode_vga_h_sm_inst|hcnt\(4),
	cout0 => \textmode_vga_inst|textmode_vga_h_sm_inst|hcnt[4]~9\,
	cout1 => \textmode_vga_inst|textmode_vga_h_sm_inst|hcnt[4]~9COUT1_27\);

-- Location: LC_X38_Y31_N6
\textmode_vga_inst|textmode_vga_h_sm_inst|hcnt[5]\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|textmode_vga_h_sm_inst|hcnt\(5) = DFFEAS((\textmode_vga_inst|textmode_vga_h_sm_inst|hcnt\(5) $ (((!\textmode_vga_inst|textmode_vga_h_sm_inst|hcnt[3]~7\ & \textmode_vga_inst|textmode_vga_h_sm_inst|hcnt[4]~9\) # 
-- (\textmode_vga_inst|textmode_vga_h_sm_inst|hcnt[3]~7\ & \textmode_vga_inst|textmode_vga_h_sm_inst|hcnt[4]~9COUT1_27\)))), GLOBAL(\pll_vga_clk|altpll_component|_clk0\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , 
-- \textmode_vga_inst|textmode_vga_h_sm_inst|WideOr12~1_combout\, , , \textmode_vga_inst|textmode_vga_h_sm_inst|WideOr9~0_combout\, )
-- \textmode_vga_inst|textmode_vga_h_sm_inst|hcnt[5]~13\ = CARRY(((!\textmode_vga_inst|textmode_vga_h_sm_inst|hcnt[4]~9\) # (!\textmode_vga_inst|textmode_vga_h_sm_inst|hcnt\(5))))
-- \textmode_vga_inst|textmode_vga_h_sm_inst|hcnt[5]~13COUT1_29\ = CARRY(((!\textmode_vga_inst|textmode_vga_h_sm_inst|hcnt[4]~9COUT1_27\) # (!\textmode_vga_inst|textmode_vga_h_sm_inst|hcnt\(5))))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	cin_used => "true",
	lut_mask => "3c3f",
	operation_mode => "arithmetic",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \pll_vga_clk|altpll_component|_clk0\,
	datab => \textmode_vga_inst|textmode_vga_h_sm_inst|hcnt\(5),
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	sclr => \textmode_vga_inst|textmode_vga_h_sm_inst|WideOr9~0_combout\,
	ena => \textmode_vga_inst|textmode_vga_h_sm_inst|WideOr12~1_combout\,
	cin => \textmode_vga_inst|textmode_vga_h_sm_inst|hcnt[3]~7\,
	cin0 => \textmode_vga_inst|textmode_vga_h_sm_inst|hcnt[4]~9\,
	cin1 => \textmode_vga_inst|textmode_vga_h_sm_inst|hcnt[4]~9COUT1_27\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \textmode_vga_inst|textmode_vga_h_sm_inst|hcnt\(5),
	cout0 => \textmode_vga_inst|textmode_vga_h_sm_inst|hcnt[5]~13\,
	cout1 => \textmode_vga_inst|textmode_vga_h_sm_inst|hcnt[5]~13COUT1_29\);

-- Location: LC_X38_Y31_N7
\textmode_vga_inst|textmode_vga_h_sm_inst|hcnt[6]\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|textmode_vga_h_sm_inst|hcnt\(6) = DFFEAS(\textmode_vga_inst|textmode_vga_h_sm_inst|hcnt\(6) $ ((((!(!\textmode_vga_inst|textmode_vga_h_sm_inst|hcnt[3]~7\ & \textmode_vga_inst|textmode_vga_h_sm_inst|hcnt[5]~13\) # 
-- (\textmode_vga_inst|textmode_vga_h_sm_inst|hcnt[3]~7\ & \textmode_vga_inst|textmode_vga_h_sm_inst|hcnt[5]~13COUT1_29\))))), GLOBAL(\pll_vga_clk|altpll_component|_clk0\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , 
-- \textmode_vga_inst|textmode_vga_h_sm_inst|WideOr12~1_combout\, , , \textmode_vga_inst|textmode_vga_h_sm_inst|WideOr9~0_combout\, )

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	cin_used => "true",
	lut_mask => "a5a5",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \pll_vga_clk|altpll_component|_clk0\,
	dataa => \textmode_vga_inst|textmode_vga_h_sm_inst|hcnt\(6),
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	sclr => \textmode_vga_inst|textmode_vga_h_sm_inst|WideOr9~0_combout\,
	ena => \textmode_vga_inst|textmode_vga_h_sm_inst|WideOr12~1_combout\,
	cin => \textmode_vga_inst|textmode_vga_h_sm_inst|hcnt[3]~7\,
	cin0 => \textmode_vga_inst|textmode_vga_h_sm_inst|hcnt[5]~13\,
	cin1 => \textmode_vga_inst|textmode_vga_h_sm_inst|hcnt[5]~13COUT1_29\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \textmode_vga_inst|textmode_vga_h_sm_inst|hcnt\(6));

-- Location: LC_X38_Y31_N9
\textmode_vga_inst|textmode_vga_h_sm_inst|Equal1~0\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|textmode_vga_h_sm_inst|Equal1~0_combout\ = (\textmode_vga_inst|textmode_vga_h_sm_inst|hcnt\(3) & (!\textmode_vga_inst|textmode_vga_h_sm_inst|hcnt\(4) & (\textmode_vga_inst|textmode_vga_h_sm_inst|hcnt\(2) & 
-- \textmode_vga_inst|textmode_vga_h_sm_inst|hcnt\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "2000",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \textmode_vga_inst|textmode_vga_h_sm_inst|hcnt\(3),
	datab => \textmode_vga_inst|textmode_vga_h_sm_inst|hcnt\(4),
	datac => \textmode_vga_inst|textmode_vga_h_sm_inst|hcnt\(2),
	datad => \textmode_vga_inst|textmode_vga_h_sm_inst|hcnt\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \textmode_vga_inst|textmode_vga_h_sm_inst|Equal1~0_combout\);

-- Location: LC_X38_Y30_N6
\textmode_vga_inst|textmode_vga_h_sm_inst|Equal1~1\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|textmode_vga_h_sm_inst|Equal1~1_combout\ = (\textmode_vga_inst|textmode_vga_h_sm_inst|hcnt\(0) & (!\textmode_vga_inst|textmode_vga_h_sm_inst|hcnt\(6) & (\textmode_vga_inst|textmode_vga_h_sm_inst|hcnt\(5) & 
-- \textmode_vga_inst|textmode_vga_h_sm_inst|Equal1~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "2000",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \textmode_vga_inst|textmode_vga_h_sm_inst|hcnt\(0),
	datab => \textmode_vga_inst|textmode_vga_h_sm_inst|hcnt\(6),
	datac => \textmode_vga_inst|textmode_vga_h_sm_inst|hcnt\(5),
	datad => \textmode_vga_inst|textmode_vga_h_sm_inst|Equal1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \textmode_vga_inst|textmode_vga_h_sm_inst|Equal1~1_combout\);

-- Location: LC_X38_Y30_N2
\textmode_vga_inst|textmode_vga_h_sm_inst|Selector4~1\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|textmode_vga_h_sm_inst|Selector4~1_combout\ = (\textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.HBACK~regout\ & (((\textmode_vga_inst|textmode_vga_h_sm_inst|Equal1~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "aa00",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.HBACK~regout\,
	datad => \textmode_vga_inst|textmode_vga_h_sm_inst|Equal1~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \textmode_vga_inst|textmode_vga_h_sm_inst|Selector4~1_combout\);

-- Location: LC_X37_Y30_N0
\textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.BLACK_CHAR_NEW\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.BLACK_CHAR_NEW~regout\ = DFFEAS((\textmode_vga_inst|textmode_vga_h_sm_inst|Selector4~0_combout\ & ((\textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.BLACK_PIXEL~regout\) # 
-- ((\textmode_vga_inst|textmode_vga_v_sm_inst|WideOr9~combout\ & \textmode_vga_inst|textmode_vga_h_sm_inst|Selector4~1_combout\)))) # (!\textmode_vga_inst|textmode_vga_h_sm_inst|Selector4~0_combout\ & 
-- (((\textmode_vga_inst|textmode_vga_v_sm_inst|WideOr9~combout\ & \textmode_vga_inst|textmode_vga_h_sm_inst|Selector4~1_combout\)))), GLOBAL(\pll_vga_clk|altpll_component|_clk0\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "f888",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \pll_vga_clk|altpll_component|_clk0\,
	dataa => \textmode_vga_inst|textmode_vga_h_sm_inst|Selector4~0_combout\,
	datab => \textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.BLACK_PIXEL~regout\,
	datac => \textmode_vga_inst|textmode_vga_v_sm_inst|WideOr9~combout\,
	datad => \textmode_vga_inst|textmode_vga_h_sm_inst|Selector4~1_combout\,
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.BLACK_CHAR_NEW~regout\);

-- Location: LC_X37_Y30_N5
\textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.BLACK_PIXEL\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.BLACK_PIXEL~regout\ = DFFEAS(((\textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.BLACK_CHAR_NEW~regout\) # 
-- ((\textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.BLACK_PIXEL~regout\ & !\textmode_vga_inst|textmode_vga_h_sm_inst|Equal4~0_combout\))), GLOBAL(\pll_vga_clk|altpll_component|_clk0\), 
-- !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "ff0c",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \pll_vga_clk|altpll_component|_clk0\,
	datab => \textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.BLACK_PIXEL~regout\,
	datac => \textmode_vga_inst|textmode_vga_h_sm_inst|Equal4~0_combout\,
	datad => \textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.BLACK_CHAR_NEW~regout\,
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.BLACK_PIXEL~regout\);

-- Location: LC_X37_Y30_N6
\textmode_vga_inst|textmode_vga_h_sm_inst|WideOr2~0\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|textmode_vga_h_sm_inst|WideOr2~0_combout\ = ((!\textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.PIXEL_CURSOR~regout\ & (!\textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.BLACK_PIXEL~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0303",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.PIXEL_CURSOR~regout\,
	datac => \textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.BLACK_PIXEL~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \textmode_vga_inst|textmode_vga_h_sm_inst|WideOr2~0_combout\);

-- Location: LC_X37_Y30_N1
\textmode_vga_inst|textmode_vga_h_sm_inst|Selector2~1\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|textmode_vga_h_sm_inst|Selector2~1_combout\ = (\textmode_vga_inst|textmode_vga_h_sm_inst|WideOr2~0_combout\ & (!\textmode_vga_inst|textmode_vga_h_sm_inst|WideOr12~0_combout\)) # 
-- (!\textmode_vga_inst|textmode_vga_h_sm_inst|WideOr2~0_combout\ & (((\textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.HBACK~regout\) # (!\textmode_vga_inst|textmode_vga_h_sm_inst|Equal4~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "7747",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \textmode_vga_inst|textmode_vga_h_sm_inst|WideOr12~0_combout\,
	datab => \textmode_vga_inst|textmode_vga_h_sm_inst|WideOr2~0_combout\,
	datac => \textmode_vga_inst|textmode_vga_h_sm_inst|Equal4~0_combout\,
	datad => \textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.HBACK~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \textmode_vga_inst|textmode_vga_h_sm_inst|Selector2~1_combout\);

-- Location: LC_X38_Y30_N0
\textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.HFRONT\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.HFRONT~regout\ = DFFEAS(((\textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.HFRONT_FIRST~regout\) # 
-- ((\textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.HFRONT~regout\ & !\textmode_vga_inst|textmode_vga_h_sm_inst|Equal6~0_combout\))), GLOBAL(\pll_vga_clk|altpll_component|_clk0\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , 
-- , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "f0fc",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \pll_vga_clk|altpll_component|_clk0\,
	datab => \textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.HFRONT~regout\,
	datac => \textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.HFRONT_FIRST~regout\,
	datad => \textmode_vga_inst|textmode_vga_h_sm_inst|Equal6~0_combout\,
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.HFRONT~regout\);

-- Location: LC_X38_Y30_N9
\textmode_vga_inst|textmode_vga_h_sm_inst|Selector2~0\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|textmode_vga_h_sm_inst|Selector2~0_combout\ = ((\textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.HFRONT~regout\ & ((\textmode_vga_inst|textmode_vga_h_sm_inst|Equal6~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "cc00",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.HFRONT~regout\,
	datad => \textmode_vga_inst|textmode_vga_h_sm_inst|Equal6~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \textmode_vga_inst|textmode_vga_h_sm_inst|Selector2~0_combout\);

-- Location: LC_X38_Y31_N8
\textmode_vga_inst|textmode_vga_h_sm_inst|Equal0~0\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|textmode_vga_h_sm_inst|Equal0~0_combout\ = (\textmode_vga_inst|textmode_vga_h_sm_inst|hcnt\(3) & (\textmode_vga_inst|textmode_vga_h_sm_inst|hcnt\(0) & (\textmode_vga_inst|textmode_vga_h_sm_inst|hcnt\(2) & 
-- \textmode_vga_inst|textmode_vga_h_sm_inst|hcnt\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "8000",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \textmode_vga_inst|textmode_vga_h_sm_inst|hcnt\(3),
	datab => \textmode_vga_inst|textmode_vga_h_sm_inst|hcnt\(0),
	datac => \textmode_vga_inst|textmode_vga_h_sm_inst|hcnt\(2),
	datad => \textmode_vga_inst|textmode_vga_h_sm_inst|hcnt\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \textmode_vga_inst|textmode_vga_h_sm_inst|Equal0~0_combout\);

-- Location: LC_X38_Y31_N0
\textmode_vga_inst|textmode_vga_h_sm_inst|Equal0~1\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|textmode_vga_h_sm_inst|Equal0~1_combout\ = (\textmode_vga_inst|textmode_vga_h_sm_inst|Equal0~0_combout\ & (\textmode_vga_inst|textmode_vga_h_sm_inst|hcnt\(4) & (\textmode_vga_inst|textmode_vga_h_sm_inst|hcnt\(6) & 
-- !\textmode_vga_inst|textmode_vga_h_sm_inst|hcnt\(5))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0080",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \textmode_vga_inst|textmode_vga_h_sm_inst|Equal0~0_combout\,
	datab => \textmode_vga_inst|textmode_vga_h_sm_inst|hcnt\(4),
	datac => \textmode_vga_inst|textmode_vga_h_sm_inst|hcnt\(6),
	datad => \textmode_vga_inst|textmode_vga_h_sm_inst|hcnt\(5),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \textmode_vga_inst|textmode_vga_h_sm_inst|Equal0~1_combout\);

-- Location: LC_X38_Y29_N6
\textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.HSYNC\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.HSYNC~regout\ = DFFEAS((((\textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.HSYNC~regout\ & !\textmode_vga_inst|textmode_vga_h_sm_inst|Equal0~1_combout\)) # 
-- (!\textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.HSYNC_FIRST~regout\)), GLOBAL(\pll_vga_clk|altpll_component|_clk0\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0fcf",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \pll_vga_clk|altpll_component|_clk0\,
	datab => \textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.HSYNC~regout\,
	datac => \textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.HSYNC_FIRST~regout\,
	datad => \textmode_vga_inst|textmode_vga_h_sm_inst|Equal0~1_combout\,
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.HSYNC~regout\);

-- Location: LC_X38_Y29_N4
\textmode_vga_inst|textmode_vga_h_sm_inst|Selector2~2\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|textmode_vga_h_sm_inst|Selector2~2_combout\ = ((\textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.HSYNC~regout\ & ((\textmode_vga_inst|textmode_vga_h_sm_inst|Equal0~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "cc00",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.HSYNC~regout\,
	datad => \textmode_vga_inst|textmode_vga_h_sm_inst|Equal0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \textmode_vga_inst|textmode_vga_h_sm_inst|Selector2~2_combout\);

-- Location: LC_X38_Y30_N4
\textmode_vga_inst|textmode_vga_h_sm_inst|Selector2~3\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|textmode_vga_h_sm_inst|Selector2~3_combout\ = (\textmode_vga_inst|textmode_vga_h_sm_inst|Selector2~1_combout\ & (!\textmode_vga_inst|textmode_vga_h_sm_inst|Selector2~0_combout\ & 
-- (!\textmode_vga_inst|textmode_vga_h_sm_inst|Selector2~2_combout\ & !\textmode_vga_inst|textmode_vga_h_sm_inst|Selector4~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0002",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \textmode_vga_inst|textmode_vga_h_sm_inst|Selector2~1_combout\,
	datab => \textmode_vga_inst|textmode_vga_h_sm_inst|Selector2~0_combout\,
	datac => \textmode_vga_inst|textmode_vga_h_sm_inst|Selector2~2_combout\,
	datad => \textmode_vga_inst|textmode_vga_h_sm_inst|Selector4~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \textmode_vga_inst|textmode_vga_h_sm_inst|Selector2~3_combout\);

-- Location: LC_X38_Y30_N3
\textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.HBACK_FIRST\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.HBACK_FIRST~regout\ = DFFEAS((\textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.HBACK_FIRST~regout\ & ((\textmode_vga_inst|textmode_vga_h_sm_inst|Selector2~3_combout\) # 
-- ((\textmode_vga_inst|textmode_vga_h_sm_inst|Selector2~2_combout\ & !\textmode_vga_inst|textmode_vga_h_sm_inst|Selector2~0_combout\)))) # (!\textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.HBACK_FIRST~regout\ & 
-- (((\textmode_vga_inst|textmode_vga_h_sm_inst|Selector2~2_combout\ & !\textmode_vga_inst|textmode_vga_h_sm_inst|Selector2~0_combout\)))), GLOBAL(\pll_vga_clk|altpll_component|_clk0\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "88f8",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \pll_vga_clk|altpll_component|_clk0\,
	dataa => \textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.HBACK_FIRST~regout\,
	datab => \textmode_vga_inst|textmode_vga_h_sm_inst|Selector2~3_combout\,
	datac => \textmode_vga_inst|textmode_vga_h_sm_inst|Selector2~2_combout\,
	datad => \textmode_vga_inst|textmode_vga_h_sm_inst|Selector2~0_combout\,
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.HBACK_FIRST~regout\);

-- Location: LC_X38_Y30_N7
\textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.HBACK\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.HBACK~regout\ = DFFEAS((\textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.HBACK_FIRST~regout\) # 
-- (((\textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.HBACK~regout\ & !\textmode_vga_inst|textmode_vga_h_sm_inst|Equal1~1_combout\))), GLOBAL(\pll_vga_clk|altpll_component|_clk0\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , 
-- , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "aafa",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \pll_vga_clk|altpll_component|_clk0\,
	dataa => \textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.HBACK_FIRST~regout\,
	datac => \textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.HBACK~regout\,
	datad => \textmode_vga_inst|textmode_vga_h_sm_inst|Equal1~1_combout\,
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.HBACK~regout\);

-- Location: LC_X38_Y30_N5
\textmode_vga_inst|textmode_vga_h_sm_inst|WideOr12~0\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|textmode_vga_h_sm_inst|WideOr12~0_combout\ = (!\textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.HBACK~regout\ & (!\textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.HSYNC~regout\ & 
-- ((!\textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.HFRONT~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.HBACK~regout\,
	datab => \textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.HSYNC~regout\,
	datad => \textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.HFRONT~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \textmode_vga_inst|textmode_vga_h_sm_inst|WideOr12~0_combout\);

-- Location: LC_X37_Y31_N4
\textmode_vga_inst|textmode_vga_h_sm_inst|WideOr12\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|textmode_vga_h_sm_inst|WideOr12~combout\ = (!\textmode_vga_inst|textmode_vga_h_sm_inst|WideOr9~0_combout\ & (\textmode_vga_inst|textmode_vga_h_sm_inst|WideOr12~0_combout\ & 
-- ((!\textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.HFRONT_LAST~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0044",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \textmode_vga_inst|textmode_vga_h_sm_inst|WideOr9~0_combout\,
	datab => \textmode_vga_inst|textmode_vga_h_sm_inst|WideOr12~0_combout\,
	datad => \textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.HFRONT_LAST~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \textmode_vga_inst|textmode_vga_h_sm_inst|WideOr12~combout\);

-- Location: LC_X37_Y31_N5
\textmode_vga_inst|textmode_vga_h_sm_inst|char_width_pixel[1]\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|textmode_vga_h_sm_inst|char_width_pixel\(1) = DFFEAS(((\textmode_vga_inst|textmode_vga_h_sm_inst|WideOr13~1_combout\ & (\textmode_vga_inst|textmode_vga_h_sm_inst|char_width_pixel\(1) $ 
-- (\textmode_vga_inst|textmode_vga_h_sm_inst|char_width_pixel\(0))))), GLOBAL(\pll_vga_clk|altpll_component|_clk0\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , \textmode_vga_inst|textmode_vga_h_sm_inst|WideOr12~combout\, , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "30c0",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \pll_vga_clk|altpll_component|_clk0\,
	datab => \textmode_vga_inst|textmode_vga_h_sm_inst|char_width_pixel\(1),
	datac => \textmode_vga_inst|textmode_vga_h_sm_inst|WideOr13~1_combout\,
	datad => \textmode_vga_inst|textmode_vga_h_sm_inst|char_width_pixel\(0),
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	ena => \textmode_vga_inst|textmode_vga_h_sm_inst|WideOr12~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \textmode_vga_inst|textmode_vga_h_sm_inst|char_width_pixel\(1));

-- Location: LC_X37_Y32_N8
\textmode_vga_inst|textmode_vga_h_sm_inst|Add0~0\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|textmode_vga_h_sm_inst|Add0~0_combout\ = ((\textmode_vga_inst|textmode_vga_h_sm_inst|char_width_pixel\(1) $ (\textmode_vga_inst|textmode_vga_h_sm_inst|char_width_pixel\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0ff0",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datac => \textmode_vga_inst|textmode_vga_h_sm_inst|char_width_pixel\(1),
	datad => \textmode_vga_inst|textmode_vga_h_sm_inst|char_width_pixel\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \textmode_vga_inst|textmode_vga_h_sm_inst|Add0~0_combout\);

-- Location: PLL_1
\pll_vga_clk|altpll_component|pll\ : stratix_pll
-- pragma translate_off
GENERIC MAP (
	clk0_counter => "g0",
	clk0_divide_by => 4,
	clk0_duty_cycle => 50,
	clk0_multiply_by => 3,
	clk0_phase_shift => "-780",
	clk1_divide_by => 1,
	clk1_duty_cycle => 50,
	clk1_multiply_by => 1,
	clk1_phase_shift => "0",
	clk2_divide_by => 1,
	clk2_duty_cycle => 50,
	clk2_multiply_by => 1,
	clk2_phase_shift => "0",
	compensate_clock => "clk0",
	enable_switch_over_counter => "off",
	g0_high => 16,
	g0_initial => 1,
	g0_low => 16,
	g0_mode => "even",
	g0_ph => 3,
	gate_lock_counter => 0,
	gate_lock_signal => "no",
	inclk0_input_frequency => 30003,
	inclk1_input_frequency => 30003,
	invalid_lock_multiplier => 5,
	l0_mode => "bypass",
	l0_ph => 0,
	l1_mode => "bypass",
	l1_ph => 0,
	m => 24,
	m_initial => 2,
	m_ph => 0,
	n => 1,
	operation_mode => "normal",
	pfd_max => 100000,
	pfd_min => 2000,
	pll_compensation_delay => 1713,
	pll_type => "fast",
	primary_clock => "inclk0",
	qualify_conf_done => "off",
	simulation_type => "timing",
	skip_vco => "off",
	switch_over_counter => 1,
	switch_over_on_gated_lock => "off",
	switch_over_on_lossclk => "off",
	valid_lock_multiplier => 1,
	vco_center => 1250,
	vco_max => 3334,
	vco_min => 1000)
-- pragma translate_on
PORT MAP (
	inclk => \pll_vga_clk|altpll_component|pll_INCLK_bus\,
	clk => \pll_vga_clk|altpll_component|pll_CLK_bus\);

-- Location: LC_X34_Y26_N3
\textmode_vga_inst|console_sm_inst|column_save[5]\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|console_sm_inst|column_save\(5) = DFFEAS(GND, GLOBAL(\pll_vga_clk|altpll_component|_clk0\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , \textmode_vga_inst|console_sm_inst|state.STATE_SCROLL_CLEAR_LINE~regout\, 
-- \textmode_vga_inst|console_sm_inst|column_int\(5), , , VCC)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \pll_vga_clk|altpll_component|_clk0\,
	datac => \textmode_vga_inst|console_sm_inst|column_int\(5),
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	sload => VCC,
	ena => \textmode_vga_inst|console_sm_inst|state.STATE_SCROLL_CLEAR_LINE~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \textmode_vga_inst|console_sm_inst|column_save\(5));

-- Location: LC_X34_Y27_N0
\textmode_vga_inst|console_sm_inst|state.STATE_SCROLL_CLEAR_LINE_LOOP\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|console_sm_inst|state.STATE_SCROLL_CLEAR_LINE_LOOP~regout\ = DFFEAS(((\textmode_vga_inst|console_sm_inst|state.STATE_SCROLL_CLEAR_LINE~regout\) # ((!\textmode_vga_inst|console_sm_inst|Equal8~2_combout\ & 
-- \textmode_vga_inst|console_sm_inst|state.STATE_SCROLL_CLEAR_LINE_LOOP~regout\))), GLOBAL(\pll_vga_clk|altpll_component|_clk0\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "cfcc",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \pll_vga_clk|altpll_component|_clk0\,
	datab => \textmode_vga_inst|console_sm_inst|state.STATE_SCROLL_CLEAR_LINE~regout\,
	datac => \textmode_vga_inst|console_sm_inst|Equal8~2_combout\,
	datad => \textmode_vga_inst|console_sm_inst|state.STATE_SCROLL_CLEAR_LINE_LOOP~regout\,
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \textmode_vga_inst|console_sm_inst|state.STATE_SCROLL_CLEAR_LINE_LOOP~regout\);

-- Location: LC_X35_Y27_N8
\textmode_vga_inst|console_sm_inst|Selector7~2\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|console_sm_inst|Selector7~2_combout\ = (((!\textmode_vga_inst|console_sm_inst|state.STATE_WAIT_REQ_RELEASE~regout\ & !\textmode_vga_inst|console_sm_inst|state.STATE_SCROLL_CLEAR_LINE_LOOP~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "000f",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datac => \textmode_vga_inst|console_sm_inst|state.STATE_WAIT_REQ_RELEASE~regout\,
	datad => \textmode_vga_inst|console_sm_inst|state.STATE_SCROLL_CLEAR_LINE_LOOP~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \textmode_vga_inst|console_sm_inst|Selector7~2_combout\);

-- Location: LC_X34_Y27_N6
\textmode_vga_inst|console_sm_inst|Selector16~0\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|console_sm_inst|Selector16~0_combout\ = (\textmode_vga_inst|console_sm_inst|state.STATE_WAIT_REQ_RELEASE~regout\ & (((!\textmode_vga_inst|console_sm_sync_inst|command_req_sync\(1))))) # 
-- (!\textmode_vga_inst|console_sm_inst|state.STATE_WAIT_REQ_RELEASE~regout\ & (\textmode_vga_inst|console_sm_inst|Equal8~2_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "22ee",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \textmode_vga_inst|console_sm_inst|Equal8~2_combout\,
	datab => \textmode_vga_inst|console_sm_inst|state.STATE_WAIT_REQ_RELEASE~regout\,
	datad => \textmode_vga_inst|console_sm_sync_inst|command_req_sync\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \textmode_vga_inst|console_sm_inst|Selector16~0_combout\);

-- Location: LC_X34_Y27_N8
\textmode_vga_inst|console_sm_inst|Selector7~1\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|console_sm_inst|Selector7~1_combout\ = (\textmode_vga_inst|console_sm_inst|state.STATE_IDLE~regout\ & (((\textmode_vga_inst|console_sm_inst|state.STATE_WAIT_REQ_RELEASE~regout\) # 
-- (\textmode_vga_inst|console_sm_inst|state.STATE_SCROLL_CLEAR_LINE_LOOP~regout\)))) # (!\textmode_vga_inst|console_sm_inst|state.STATE_IDLE~regout\ & (!\textmode_vga_inst|console_sm_sync_inst|command_req_sync\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "f5c5",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \textmode_vga_inst|console_sm_sync_inst|command_req_sync\(1),
	datab => \textmode_vga_inst|console_sm_inst|state.STATE_WAIT_REQ_RELEASE~regout\,
	datac => \textmode_vga_inst|console_sm_inst|state.STATE_IDLE~regout\,
	datad => \textmode_vga_inst|console_sm_inst|state.STATE_SCROLL_CLEAR_LINE_LOOP~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \textmode_vga_inst|console_sm_inst|Selector7~1_combout\);

-- Location: LC_X34_Y26_N0
\textmode_vga_inst|console_sm_inst|column_save[6]\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|console_sm_inst|column_save\(6) = DFFEAS(GND, GLOBAL(\pll_vga_clk|altpll_component|_clk0\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , \textmode_vga_inst|console_sm_inst|state.STATE_SCROLL_CLEAR_LINE~regout\, 
-- \textmode_vga_inst|console_sm_inst|column_int\(6), , , VCC)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \pll_vga_clk|altpll_component|_clk0\,
	datac => \textmode_vga_inst|console_sm_inst|column_int\(6),
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	sload => VCC,
	ena => \textmode_vga_inst|console_sm_inst|state.STATE_SCROLL_CLEAR_LINE~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \textmode_vga_inst|console_sm_inst|column_save\(6));

-- Location: LC_X34_Y27_N5
\textmode_vga_inst|console_sm_inst|Selector18~1\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|console_sm_inst|Selector18~1_combout\ = (\textmode_vga_inst|console_sm_sync_inst|command_req_sync\(1)) # (((!\textmode_vga_inst|console_sm_inst|state.STATE_WAIT_REQ_RELEASE~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "aaff",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \textmode_vga_inst|console_sm_sync_inst|command_req_sync\(1),
	datad => \textmode_vga_inst|console_sm_inst|state.STATE_WAIT_REQ_RELEASE~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \textmode_vga_inst|console_sm_inst|Selector18~1_combout\);

-- Location: LC_X34_Y27_N3
\textmode_vga_inst|console_sm_inst|state.STATE_SCROLL_CLEAR_LINE_FINISH\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|console_sm_inst|state.STATE_SCROLL_CLEAR_LINE_FINISH~regout\ = DFFEAS((\textmode_vga_inst|console_sm_inst|Selector18~1_combout\ & ((\textmode_vga_inst|console_sm_inst|Selector14~0_combout\) # 
-- ((\textmode_vga_inst|console_sm_inst|state.STATE_SCROLL_CLEAR_LINE_FINISH~regout\ & \textmode_vga_inst|console_sm_inst|Selector7~1_combout\)))), GLOBAL(\pll_vga_clk|altpll_component|_clk0\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , , , 
-- , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "e0c0",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \pll_vga_clk|altpll_component|_clk0\,
	dataa => \textmode_vga_inst|console_sm_inst|state.STATE_SCROLL_CLEAR_LINE_FINISH~regout\,
	datab => \textmode_vga_inst|console_sm_inst|Selector14~0_combout\,
	datac => \textmode_vga_inst|console_sm_inst|Selector18~1_combout\,
	datad => \textmode_vga_inst|console_sm_inst|Selector7~1_combout\,
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \textmode_vga_inst|console_sm_inst|state.STATE_SCROLL_CLEAR_LINE_FINISH~regout\);

-- Location: LC_X33_Y26_N4
\textmode_vga_inst|console_sm_sync_inst|Selector3~0\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|console_sm_sync_inst|Selector3~0_combout\ = (((\textmode_vga_inst|console_sm_sync_inst|sync_state.STATE_WAIT_ACK_RELEASE~regout\) # (!\textmode_vga_inst|console_sm_sync_inst|sync_state.STATE_IDLE~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "ff0f",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datac => \textmode_vga_inst|console_sm_sync_inst|sync_state.STATE_IDLE~regout\,
	datad => \textmode_vga_inst|console_sm_sync_inst|sync_state.STATE_WAIT_ACK_RELEASE~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \textmode_vga_inst|console_sm_sync_inst|Selector3~0_combout\);

-- Location: LC_X33_Y26_N0
\textmode_vga_inst|console_sm_sync_inst|command_req_sys\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|console_sm_sync_inst|command_req_sys~regout\ = DFFEAS(GND, GLOBAL(\sys_clk~combout\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , \textmode_vga_inst|console_sm_sync_inst|sync_state.STATE_WAIT_ACK~regout\, , , VCC)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~combout\,
	datac => \textmode_vga_inst|console_sm_sync_inst|sync_state.STATE_WAIT_ACK~regout\,
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \textmode_vga_inst|console_sm_sync_inst|command_req_sys~regout\);

-- Location: LC_X33_Y26_N3
\textmode_vga_inst|console_sm_sync_inst|command_req_sync[0]\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|console_sm_sync_inst|command_req_sync\(0) = DFFEAS((((\textmode_vga_inst|console_sm_sync_inst|command_req_sys~regout\))), GLOBAL(\pll_vga_clk|altpll_component|_clk0\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "ff00",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \pll_vga_clk|altpll_component|_clk0\,
	datad => \textmode_vga_inst|console_sm_sync_inst|command_req_sys~regout\,
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \textmode_vga_inst|console_sm_sync_inst|command_req_sync\(0));

-- Location: LC_X33_Y27_N5
\textmode_vga_inst|console_sm_sync_inst|command_req_sync[1]\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|console_sm_inst|Selector18~0\ = (!\textmode_vga_inst|console_sm_inst|state.STATE_IDLE~regout\ & (((R1_command_req_sync[1]))))
-- \textmode_vga_inst|console_sm_sync_inst|command_req_sync\(1) = DFFEAS(\textmode_vga_inst|console_sm_inst|Selector18~0\, GLOBAL(\pll_vga_clk|altpll_component|_clk0\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , 
-- \textmode_vga_inst|console_sm_sync_inst|command_req_sync\(0), , , VCC)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "5050",
	operation_mode => "normal",
	output_mode => "reg_and_comb",
	register_cascade_mode => "off",
	sum_lutc_input => "qfbk",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \pll_vga_clk|altpll_component|_clk0\,
	dataa => \textmode_vga_inst|console_sm_inst|state.STATE_IDLE~regout\,
	datac => \textmode_vga_inst|console_sm_sync_inst|command_req_sync\(0),
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \textmode_vga_inst|console_sm_inst|Selector18~0\,
	regout => \textmode_vga_inst|console_sm_sync_inst|command_req_sync\(1));

-- Location: LC_X34_Y27_N9
\textmode_vga_inst|console_sm_inst|Selector3~3\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|console_sm_inst|Selector3~3_combout\ = (\textmode_vga_inst|console_sm_inst|Selector7~1_combout\ & (((!\textmode_vga_inst|console_sm_inst|state.STATE_SCROLL_CLEAR_LINE_LOOP~regout\ & 
-- !\textmode_vga_inst|console_sm_inst|state.STATE_WAIT_REQ_RELEASE~regout\)) # (!\textmode_vga_inst|console_sm_inst|Selector16~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "02aa",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \textmode_vga_inst|console_sm_inst|Selector7~1_combout\,
	datab => \textmode_vga_inst|console_sm_inst|state.STATE_SCROLL_CLEAR_LINE_LOOP~regout\,
	datac => \textmode_vga_inst|console_sm_inst|state.STATE_WAIT_REQ_RELEASE~regout\,
	datad => \textmode_vga_inst|console_sm_inst|Selector16~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \textmode_vga_inst|console_sm_inst|Selector3~3_combout\);

-- Location: LC_X33_Y27_N3
\textmode_vga_inst|console_sm_inst|state.STATE_NEW_LINE_SIMPLE\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|console_sm_inst|state.STATE_NEW_LINE_SIMPLE~regout\ = DFFEAS((\textmode_vga_inst|console_sm_inst|Selector3~3_combout\ & ((\textmode_vga_inst|console_sm_inst|Selector18~0\ & (!\textmode_vga_inst|console_sm_inst|LessThan0~1_combout\)) # 
-- (!\textmode_vga_inst|console_sm_inst|Selector18~0\ & ((\textmode_vga_inst|console_sm_inst|state.STATE_NEW_LINE_SIMPLE~regout\))))), GLOBAL(\pll_vga_clk|altpll_component|_clk0\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "7400",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \pll_vga_clk|altpll_component|_clk0\,
	dataa => \textmode_vga_inst|console_sm_inst|LessThan0~1_combout\,
	datab => \textmode_vga_inst|console_sm_inst|Selector18~0\,
	datac => \textmode_vga_inst|console_sm_inst|state.STATE_NEW_LINE_SIMPLE~regout\,
	datad => \textmode_vga_inst|console_sm_inst|Selector3~3_combout\,
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \textmode_vga_inst|console_sm_inst|state.STATE_NEW_LINE_SIMPLE~regout\);

-- Location: LC_X35_Y27_N9
\textmode_vga_inst|console_sm_inst|state.STATE_SET_CHAR_NEW_LINE_AND_CARRIAGE_RETURN_SIMPLE\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|console_sm_inst|state.STATE_SET_CHAR_NEW_LINE_AND_CARRIAGE_RETURN_SIMPLE~regout\ = DFFEAS((\textmode_vga_inst|console_sm_inst|Selector7~3_combout\ & ((\textmode_vga_inst|console_sm_inst|Selector18~0\ & 
-- (!\textmode_vga_inst|console_sm_inst|LessThan0~1_combout\)) # (!\textmode_vga_inst|console_sm_inst|Selector18~0\ & ((\textmode_vga_inst|console_sm_inst|state.STATE_SET_CHAR_NEW_LINE_AND_CARRIAGE_RETURN_SIMPLE~regout\))))), 
-- GLOBAL(\pll_vga_clk|altpll_component|_clk0\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "2a08",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \pll_vga_clk|altpll_component|_clk0\,
	dataa => \textmode_vga_inst|console_sm_inst|Selector7~3_combout\,
	datab => \textmode_vga_inst|console_sm_inst|Selector18~0\,
	datac => \textmode_vga_inst|console_sm_inst|LessThan0~1_combout\,
	datad => \textmode_vga_inst|console_sm_inst|state.STATE_SET_CHAR_NEW_LINE_AND_CARRIAGE_RETURN_SIMPLE~regout\,
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \textmode_vga_inst|console_sm_inst|state.STATE_SET_CHAR_NEW_LINE_AND_CARRIAGE_RETURN_SIMPLE~regout\);

-- Location: LC_X33_Y27_N9
\textmode_vga_inst|console_sm_inst|WideOr8~0\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|console_sm_inst|WideOr8~0_combout\ = (((\textmode_vga_inst|console_sm_inst|state.STATE_NEW_LINE_SIMPLE~regout\) # (\textmode_vga_inst|console_sm_inst|state.STATE_SET_CHAR_NEW_LINE_AND_CARRIAGE_RETURN_SIMPLE~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "fff0",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datac => \textmode_vga_inst|console_sm_inst|state.STATE_NEW_LINE_SIMPLE~regout\,
	datad => \textmode_vga_inst|console_sm_inst|state.STATE_SET_CHAR_NEW_LINE_AND_CARRIAGE_RETURN_SIMPLE~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \textmode_vga_inst|console_sm_inst|WideOr8~0_combout\);

-- Location: LC_X34_Y29_N5
\textmode_vga_inst|console_sm_inst|line_int[0]\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|console_sm_inst|line_int\(0) = DFFEAS(((!\textmode_vga_inst|console_sm_inst|line_int\(0))), GLOBAL(\pll_vga_clk|altpll_component|_clk0\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , 
-- \textmode_vga_inst|console_sm_inst|WideOr8~0_combout\, , , , )
-- \textmode_vga_inst|console_sm_inst|line_int[0]~1\ = CARRY(((\textmode_vga_inst|console_sm_inst|line_int\(0))))
-- \textmode_vga_inst|console_sm_inst|line_int[0]~1COUT1_16\ = CARRY(((\textmode_vga_inst|console_sm_inst|line_int\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "33cc",
	operation_mode => "arithmetic",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \pll_vga_clk|altpll_component|_clk0\,
	datab => \textmode_vga_inst|console_sm_inst|line_int\(0),
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	ena => \textmode_vga_inst|console_sm_inst|WideOr8~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \textmode_vga_inst|console_sm_inst|line_int\(0),
	cout0 => \textmode_vga_inst|console_sm_inst|line_int[0]~1\,
	cout1 => \textmode_vga_inst|console_sm_inst|line_int[0]~1COUT1_16\);

-- Location: LC_X34_Y29_N6
\textmode_vga_inst|console_sm_inst|line_int[1]\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|console_sm_inst|line_int\(1) = DFFEAS((\textmode_vga_inst|console_sm_inst|line_int\(1) $ ((\textmode_vga_inst|console_sm_inst|line_int[0]~1\))), GLOBAL(\pll_vga_clk|altpll_component|_clk0\), 
-- !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , \textmode_vga_inst|console_sm_inst|WideOr8~0_combout\, , , , )
-- \textmode_vga_inst|console_sm_inst|line_int[1]~3\ = CARRY(((!\textmode_vga_inst|console_sm_inst|line_int[0]~1\) # (!\textmode_vga_inst|console_sm_inst|line_int\(1))))
-- \textmode_vga_inst|console_sm_inst|line_int[1]~3COUT1_18\ = CARRY(((!\textmode_vga_inst|console_sm_inst|line_int[0]~1COUT1_16\) # (!\textmode_vga_inst|console_sm_inst|line_int\(1))))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	lut_mask => "3c3f",
	operation_mode => "arithmetic",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \pll_vga_clk|altpll_component|_clk0\,
	datab => \textmode_vga_inst|console_sm_inst|line_int\(1),
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	ena => \textmode_vga_inst|console_sm_inst|WideOr8~0_combout\,
	cin0 => \textmode_vga_inst|console_sm_inst|line_int[0]~1\,
	cin1 => \textmode_vga_inst|console_sm_inst|line_int[0]~1COUT1_16\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \textmode_vga_inst|console_sm_inst|line_int\(1),
	cout0 => \textmode_vga_inst|console_sm_inst|line_int[1]~3\,
	cout1 => \textmode_vga_inst|console_sm_inst|line_int[1]~3COUT1_18\);

-- Location: LC_X34_Y29_N7
\textmode_vga_inst|console_sm_inst|line_int[2]\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|console_sm_inst|line_int\(2) = DFFEAS(\textmode_vga_inst|console_sm_inst|line_int\(2) $ ((((!\textmode_vga_inst|console_sm_inst|line_int[1]~3\)))), GLOBAL(\pll_vga_clk|altpll_component|_clk0\), 
-- !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , \textmode_vga_inst|console_sm_inst|WideOr8~0_combout\, , , , )
-- \textmode_vga_inst|console_sm_inst|line_int[2]~5\ = CARRY((\textmode_vga_inst|console_sm_inst|line_int\(2) & ((!\textmode_vga_inst|console_sm_inst|line_int[1]~3\))))
-- \textmode_vga_inst|console_sm_inst|line_int[2]~5COUT1_20\ = CARRY((\textmode_vga_inst|console_sm_inst|line_int\(2) & ((!\textmode_vga_inst|console_sm_inst|line_int[1]~3COUT1_18\))))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	lut_mask => "a50a",
	operation_mode => "arithmetic",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \pll_vga_clk|altpll_component|_clk0\,
	dataa => \textmode_vga_inst|console_sm_inst|line_int\(2),
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	ena => \textmode_vga_inst|console_sm_inst|WideOr8~0_combout\,
	cin0 => \textmode_vga_inst|console_sm_inst|line_int[1]~3\,
	cin1 => \textmode_vga_inst|console_sm_inst|line_int[1]~3COUT1_18\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \textmode_vga_inst|console_sm_inst|line_int\(2),
	cout0 => \textmode_vga_inst|console_sm_inst|line_int[2]~5\,
	cout1 => \textmode_vga_inst|console_sm_inst|line_int[2]~5COUT1_20\);

-- Location: LC_X34_Y29_N8
\textmode_vga_inst|console_sm_inst|line_int[3]\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|console_sm_inst|line_int\(3) = DFFEAS(\textmode_vga_inst|console_sm_inst|line_int\(3) $ ((((\textmode_vga_inst|console_sm_inst|line_int[2]~5\)))), GLOBAL(\pll_vga_clk|altpll_component|_clk0\), 
-- !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , \textmode_vga_inst|console_sm_inst|WideOr8~0_combout\, , , , )
-- \textmode_vga_inst|console_sm_inst|line_int[3]~7\ = CARRY(((!\textmode_vga_inst|console_sm_inst|line_int[2]~5\)) # (!\textmode_vga_inst|console_sm_inst|line_int\(3)))
-- \textmode_vga_inst|console_sm_inst|line_int[3]~7COUT1_22\ = CARRY(((!\textmode_vga_inst|console_sm_inst|line_int[2]~5COUT1_20\)) # (!\textmode_vga_inst|console_sm_inst|line_int\(3)))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	lut_mask => "5a5f",
	operation_mode => "arithmetic",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \pll_vga_clk|altpll_component|_clk0\,
	dataa => \textmode_vga_inst|console_sm_inst|line_int\(3),
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	ena => \textmode_vga_inst|console_sm_inst|WideOr8~0_combout\,
	cin0 => \textmode_vga_inst|console_sm_inst|line_int[2]~5\,
	cin1 => \textmode_vga_inst|console_sm_inst|line_int[2]~5COUT1_20\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \textmode_vga_inst|console_sm_inst|line_int\(3),
	cout0 => \textmode_vga_inst|console_sm_inst|line_int[3]~7\,
	cout1 => \textmode_vga_inst|console_sm_inst|line_int[3]~7COUT1_22\);

-- Location: LC_X34_Y29_N0
\textmode_vga_inst|console_sm_inst|LessThan0~0\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|console_sm_inst|LessThan0~0_combout\ = (((\textmode_vga_inst|console_sm_inst|line_int\(0)) # (\textmode_vga_inst|console_sm_inst|line_int\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "fff0",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datac => \textmode_vga_inst|console_sm_inst|line_int\(0),
	datad => \textmode_vga_inst|console_sm_inst|line_int\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \textmode_vga_inst|console_sm_inst|LessThan0~0_combout\);

-- Location: LC_X34_Y29_N9
\textmode_vga_inst|console_sm_inst|line_int[4]\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|console_sm_inst|line_int\(4) = DFFEAS(((\textmode_vga_inst|console_sm_inst|line_int[3]~7\ $ (!\textmode_vga_inst|console_sm_inst|line_int\(4)))), GLOBAL(\pll_vga_clk|altpll_component|_clk0\), 
-- !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , \textmode_vga_inst|console_sm_inst|WideOr8~0_combout\, , , , )

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	lut_mask => "f00f",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \pll_vga_clk|altpll_component|_clk0\,
	datad => \textmode_vga_inst|console_sm_inst|line_int\(4),
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	ena => \textmode_vga_inst|console_sm_inst|WideOr8~0_combout\,
	cin0 => \textmode_vga_inst|console_sm_inst|line_int[3]~7\,
	cin1 => \textmode_vga_inst|console_sm_inst|line_int[3]~7COUT1_22\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \textmode_vga_inst|console_sm_inst|line_int\(4));

-- Location: LC_X34_Y29_N1
\textmode_vga_inst|console_sm_inst|LessThan0~1\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|console_sm_inst|LessThan0~1_combout\ = (\textmode_vga_inst|console_sm_inst|line_int\(3) & (\textmode_vga_inst|console_sm_inst|LessThan0~0_combout\ & (\textmode_vga_inst|console_sm_inst|line_int\(2) & 
-- \textmode_vga_inst|console_sm_inst|line_int\(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "8000",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \textmode_vga_inst|console_sm_inst|line_int\(3),
	datab => \textmode_vga_inst|console_sm_inst|LessThan0~0_combout\,
	datac => \textmode_vga_inst|console_sm_inst|line_int\(2),
	datad => \textmode_vga_inst|console_sm_inst|line_int\(4),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \textmode_vga_inst|console_sm_inst|LessThan0~1_combout\);

-- Location: LC_X33_Y27_N0
\textmode_vga_inst|console_sm_inst|state.STATE_NEW_LINE_SCROLL\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|console_sm_inst|state.STATE_NEW_LINE_SCROLL~regout\ = DFFEAS((\textmode_vga_inst|console_sm_inst|Selector3~3_combout\ & ((\textmode_vga_inst|console_sm_inst|Selector18~0\ & (\textmode_vga_inst|console_sm_inst|LessThan0~1_combout\)) # 
-- (!\textmode_vga_inst|console_sm_inst|Selector18~0\ & ((\textmode_vga_inst|console_sm_inst|state.STATE_NEW_LINE_SCROLL~regout\))))), GLOBAL(\pll_vga_clk|altpll_component|_clk0\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "8c80",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \pll_vga_clk|altpll_component|_clk0\,
	dataa => \textmode_vga_inst|console_sm_inst|LessThan0~1_combout\,
	datab => \textmode_vga_inst|console_sm_inst|Selector3~3_combout\,
	datac => \textmode_vga_inst|console_sm_inst|Selector18~0\,
	datad => \textmode_vga_inst|console_sm_inst|state.STATE_NEW_LINE_SCROLL~regout\,
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \textmode_vga_inst|console_sm_inst|state.STATE_NEW_LINE_SCROLL~regout\);

-- Location: LC_X33_Y27_N7
\textmode_vga_inst|console_sm_inst|WideOr3~0\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|console_sm_inst|WideOr3~0_combout\ = (\textmode_vga_inst|console_sm_inst|state.STATE_IDLE~regout\ & (!\textmode_vga_inst|console_sm_inst|state.STATE_SCROLL_CLEAR_LINE_LOOP~regout\ & 
-- (!\textmode_vga_inst|console_sm_inst|state.STATE_SET_CHAR_NEW_LINE_AND_CARRIAGE_RETURN_SCROLL~regout\ & !\textmode_vga_inst|console_sm_inst|state.STATE_NEW_LINE_SCROLL~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0002",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \textmode_vga_inst|console_sm_inst|state.STATE_IDLE~regout\,
	datab => \textmode_vga_inst|console_sm_inst|state.STATE_SCROLL_CLEAR_LINE_LOOP~regout\,
	datac => \textmode_vga_inst|console_sm_inst|state.STATE_SET_CHAR_NEW_LINE_AND_CARRIAGE_RETURN_SCROLL~regout\,
	datad => \textmode_vga_inst|console_sm_inst|state.STATE_NEW_LINE_SCROLL~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \textmode_vga_inst|console_sm_inst|WideOr3~0_combout\);

-- Location: LC_X33_Y27_N1
\textmode_vga_inst|console_sm_inst|ack\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|console_sm_inst|WideOr1~0\ = (!\textmode_vga_inst|console_sm_inst|state.STATE_SCROLL_CLEAR_LINE~regout\ & (\textmode_vga_inst|console_sm_inst|WideOr3~0_combout\ & (!\textmode_vga_inst|console_sm_inst|state.STATE_SCROLL_NEXT~regout\ & 
-- !\textmode_vga_inst|console_sm_inst|state.STATE_SCROLL_TOP~regout\)))
-- \textmode_vga_inst|console_sm_inst|ack~regout\ = DFFEAS(\textmode_vga_inst|console_sm_inst|WideOr1~0\, GLOBAL(\pll_vga_clk|altpll_component|_clk0\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0004",
	operation_mode => "normal",
	output_mode => "reg_and_comb",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \pll_vga_clk|altpll_component|_clk0\,
	dataa => \textmode_vga_inst|console_sm_inst|state.STATE_SCROLL_CLEAR_LINE~regout\,
	datab => \textmode_vga_inst|console_sm_inst|WideOr3~0_combout\,
	datac => \textmode_vga_inst|console_sm_inst|state.STATE_SCROLL_NEXT~regout\,
	datad => \textmode_vga_inst|console_sm_inst|state.STATE_SCROLL_TOP~regout\,
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \textmode_vga_inst|console_sm_inst|WideOr1~0\,
	regout => \textmode_vga_inst|console_sm_inst|ack~regout\);

-- Location: LC_X33_Y27_N2
\textmode_vga_inst|console_sm_sync_inst|ack_sync[0]\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|console_sm_sync_inst|ack_sync\(0) = DFFEAS(GND, GLOBAL(\sys_clk~combout\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , \textmode_vga_inst|console_sm_inst|ack~regout\, , , VCC)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~combout\,
	datac => \textmode_vga_inst|console_sm_inst|ack~regout\,
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \textmode_vga_inst|console_sm_sync_inst|ack_sync\(0));

-- Location: LC_X33_Y26_N9
\textmode_vga_inst|console_sm_sync_inst|ack_sync[1]\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|console_sm_sync_inst|ack_sync\(1) = DFFEAS(GND, GLOBAL(\sys_clk~combout\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , \textmode_vga_inst|console_sm_sync_inst|ack_sync\(0), , , VCC)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~combout\,
	datac => \textmode_vga_inst|console_sm_sync_inst|ack_sync\(0),
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \textmode_vga_inst|console_sm_sync_inst|ack_sync\(1));

-- Location: LC_X33_Y26_N6
\textmode_vga_inst|console_sm_sync_inst|sync_state.STATE_WAIT_ACK_RELEASE\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|console_sm_sync_inst|sync_state.STATE_WAIT_ACK_RELEASE~regout\ = DFFEAS((\textmode_vga_inst|console_sm_sync_inst|Selector3~0_combout\ & (\textmode_vga_inst|console_sm_sync_inst|ack_sync\(1) & 
-- (!\textmode_vga_inst|console_sm_sync_inst|sync_state.STATE_WAIT_ACK~regout\ & !\textmode_vga_inst|console_sm_sync_inst|sync_state.STATE_FINISHED~regout\))), GLOBAL(\sys_clk~combout\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0008",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~combout\,
	dataa => \textmode_vga_inst|console_sm_sync_inst|Selector3~0_combout\,
	datab => \textmode_vga_inst|console_sm_sync_inst|ack_sync\(1),
	datac => \textmode_vga_inst|console_sm_sync_inst|sync_state.STATE_WAIT_ACK~regout\,
	datad => \textmode_vga_inst|console_sm_sync_inst|sync_state.STATE_FINISHED~regout\,
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \textmode_vga_inst|console_sm_sync_inst|sync_state.STATE_WAIT_ACK_RELEASE~regout\);

-- Location: LC_X33_Y26_N1
\textmode_vga_inst|console_sm_sync_inst|Selector1~0\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|console_sm_sync_inst|Selector1~0_combout\ = (\textmode_vga_inst|console_sm_sync_inst|sync_state.STATE_WAIT_ACK~regout\) # (((!\textmode_vga_inst|console_sm_sync_inst|sync_state.STATE_IDLE~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "afaf",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \textmode_vga_inst|console_sm_sync_inst|sync_state.STATE_WAIT_ACK~regout\,
	datac => \textmode_vga_inst|console_sm_sync_inst|sync_state.STATE_IDLE~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \textmode_vga_inst|console_sm_sync_inst|Selector1~0_combout\);

-- Location: LC_X33_Y26_N7
\textmode_vga_inst|console_sm_sync_inst|sync_state.STATE_WAIT_ACK\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|console_sm_sync_inst|sync_state.STATE_WAIT_ACK~regout\ = DFFEAS((!\textmode_vga_inst|console_sm_sync_inst|ack_sync\(1) & ((\textmode_vga_inst|console_sm_sync_inst|sync_state.STATE_WAIT_ACK_RELEASE~regout\) # 
-- ((!\textmode_vga_inst|console_sm_sync_inst|sync_state.STATE_FINISHED~regout\ & \textmode_vga_inst|console_sm_sync_inst|Selector1~0_combout\)))), GLOBAL(\sys_clk~combout\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "00dc",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~combout\,
	dataa => \textmode_vga_inst|console_sm_sync_inst|sync_state.STATE_FINISHED~regout\,
	datab => \textmode_vga_inst|console_sm_sync_inst|sync_state.STATE_WAIT_ACK_RELEASE~regout\,
	datac => \textmode_vga_inst|console_sm_sync_inst|Selector1~0_combout\,
	datad => \textmode_vga_inst|console_sm_sync_inst|ack_sync\(1),
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \textmode_vga_inst|console_sm_sync_inst|sync_state.STATE_WAIT_ACK~regout\);

-- Location: LC_X33_Y26_N8
\textmode_vga_inst|console_sm_sync_inst|sync_state.STATE_FINISHED\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|console_sm_sync_inst|sync_state.STATE_FINISHED~regout\ = DFFEAS((((\textmode_vga_inst|console_sm_sync_inst|sync_state.STATE_WAIT_ACK~regout\ & \textmode_vga_inst|console_sm_sync_inst|ack_sync\(1)))), GLOBAL(\sys_clk~combout\), 
-- !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "f000",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~combout\,
	datac => \textmode_vga_inst|console_sm_sync_inst|sync_state.STATE_WAIT_ACK~regout\,
	datad => \textmode_vga_inst|console_sm_sync_inst|ack_sync\(1),
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \textmode_vga_inst|console_sm_sync_inst|sync_state.STATE_FINISHED~regout\);

-- Location: LC_X33_Y26_N5
\textmode_vga_inst|console_sm_sync_inst|sync_state.STATE_IDLE\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|console_sm_sync_inst|sync_state.STATE_IDLE~regout\ = DFFEAS((((!\textmode_vga_inst|console_sm_sync_inst|sync_state.STATE_FINISHED~regout\))), GLOBAL(\sys_clk~combout\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , , , , 
-- )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "00ff",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~combout\,
	datad => \textmode_vga_inst|console_sm_sync_inst|sync_state.STATE_FINISHED~regout\,
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \textmode_vga_inst|console_sm_sync_inst|sync_state.STATE_IDLE~regout\);

-- Location: LC_X33_Y26_N2
\textmode_vga_inst|console_sm_sync_inst|command_data_latched[14]\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|console_sm_sync_inst|command_data_latched\(14) = DFFEAS((((\textmode_vga_inst|console_sm_sync_inst|command_data_latched\(14)) # (!\textmode_vga_inst|console_sm_sync_inst|sync_state.STATE_IDLE~regout\))), GLOBAL(\sys_clk~combout\), 
-- !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "ff0f",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~combout\,
	datac => \textmode_vga_inst|console_sm_sync_inst|sync_state.STATE_IDLE~regout\,
	datad => \textmode_vga_inst|console_sm_sync_inst|command_data_latched\(14),
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \textmode_vga_inst|console_sm_sync_inst|command_data_latched\(14));

-- Location: LC_X35_Y27_N5
\textmode_vga_inst|console_sm_inst|state.STATE_SET_CHAR\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|console_sm_inst|state.STATE_SET_CHAR~regout\ = DFFEAS((!\textmode_vga_inst|console_sm_inst|state.STATE_IDLE~regout\ & (\textmode_vga_inst|console_sm_sync_inst|command_req_sync\(1) & 
-- (\textmode_vga_inst|console_sm_sync_inst|command_data_latched\(14) & !\textmode_vga_inst|console_sm_inst|LessThan1~0_combout\))), GLOBAL(\pll_vga_clk|altpll_component|_clk0\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0040",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \pll_vga_clk|altpll_component|_clk0\,
	dataa => \textmode_vga_inst|console_sm_inst|state.STATE_IDLE~regout\,
	datab => \textmode_vga_inst|console_sm_sync_inst|command_req_sync\(1),
	datac => \textmode_vga_inst|console_sm_sync_inst|command_data_latched\(14),
	datad => \textmode_vga_inst|console_sm_inst|LessThan1~0_combout\,
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \textmode_vga_inst|console_sm_inst|state.STATE_SET_CHAR~regout\);

-- Location: LC_X35_Y27_N3
\textmode_vga_inst|console_sm_inst|WideOr10~0\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|console_sm_inst|WideOr10~0_combout\ = (!\textmode_vga_inst|console_sm_inst|state.STATE_SET_CHAR_NEW_LINE_AND_CARRIAGE_RETURN_SCROLL~regout\ & 
-- (((!\textmode_vga_inst|console_sm_inst|state.STATE_SET_CHAR_NEW_LINE_AND_CARRIAGE_RETURN_SIMPLE~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0055",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \textmode_vga_inst|console_sm_inst|state.STATE_SET_CHAR_NEW_LINE_AND_CARRIAGE_RETURN_SCROLL~regout\,
	datad => \textmode_vga_inst|console_sm_inst|state.STATE_SET_CHAR_NEW_LINE_AND_CARRIAGE_RETURN_SIMPLE~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \textmode_vga_inst|console_sm_inst|WideOr10~0_combout\);

-- Location: LC_X35_Y27_N4
\textmode_vga_inst|console_sm_inst|WideOr12~0\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|console_sm_inst|WideOr12~0_combout\ = (\textmode_vga_inst|console_sm_inst|state.STATE_SCROLL_CLEAR_LINE_FINISH~regout\) # ((\textmode_vga_inst|console_sm_inst|state.STATE_SCROLL_CLEAR_LINE_LOOP~regout\) # 
-- ((\textmode_vga_inst|console_sm_inst|state.STATE_SET_CHAR~regout\) # (!\textmode_vga_inst|console_sm_inst|WideOr10~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "feff",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \textmode_vga_inst|console_sm_inst|state.STATE_SCROLL_CLEAR_LINE_FINISH~regout\,
	datab => \textmode_vga_inst|console_sm_inst|state.STATE_SCROLL_CLEAR_LINE_LOOP~regout\,
	datac => \textmode_vga_inst|console_sm_inst|state.STATE_SET_CHAR~regout\,
	datad => \textmode_vga_inst|console_sm_inst|WideOr10~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \textmode_vga_inst|console_sm_inst|WideOr12~0_combout\);

-- Location: LC_X35_Y26_N8
\textmode_vga_inst|console_sm_inst|WideOr9~0\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|console_sm_inst|WideOr9~0_combout\ = (((\textmode_vga_inst|console_sm_inst|state.STATE_SCROLL_CLEAR_LINE~regout\) # (\textmode_vga_inst|console_sm_inst|WideOr12~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "fff0",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datac => \textmode_vga_inst|console_sm_inst|state.STATE_SCROLL_CLEAR_LINE~regout\,
	datad => \textmode_vga_inst|console_sm_inst|WideOr12~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \textmode_vga_inst|console_sm_inst|WideOr9~0_combout\);

-- Location: LC_X34_Y26_N5
\textmode_vga_inst|console_sm_inst|column_save[3]\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|console_sm_inst|column_save\(3) = DFFEAS(GND, GLOBAL(\pll_vga_clk|altpll_component|_clk0\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , \textmode_vga_inst|console_sm_inst|state.STATE_SCROLL_CLEAR_LINE~regout\, 
-- \textmode_vga_inst|console_sm_inst|column_int\(3), , , VCC)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \pll_vga_clk|altpll_component|_clk0\,
	datac => \textmode_vga_inst|console_sm_inst|column_int\(3),
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	sload => VCC,
	ena => \textmode_vga_inst|console_sm_inst|state.STATE_SCROLL_CLEAR_LINE~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \textmode_vga_inst|console_sm_inst|column_save\(3));

-- Location: LC_X34_Y26_N1
\textmode_vga_inst|console_sm_inst|column_save[2]\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|console_sm_inst|column_save\(2) = DFFEAS((((\textmode_vga_inst|console_sm_inst|column_int\(2)))), GLOBAL(\pll_vga_clk|altpll_component|_clk0\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , 
-- \textmode_vga_inst|console_sm_inst|state.STATE_SCROLL_CLEAR_LINE~regout\, , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "ff00",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \pll_vga_clk|altpll_component|_clk0\,
	datad => \textmode_vga_inst|console_sm_inst|column_int\(2),
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	ena => \textmode_vga_inst|console_sm_inst|state.STATE_SCROLL_CLEAR_LINE~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \textmode_vga_inst|console_sm_inst|column_save\(2));

-- Location: LC_X34_Y26_N7
\textmode_vga_inst|console_sm_inst|column_save[1]\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|console_sm_inst|column_save\(1) = DFFEAS(GND, GLOBAL(\pll_vga_clk|altpll_component|_clk0\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , \textmode_vga_inst|console_sm_inst|state.STATE_SCROLL_CLEAR_LINE~regout\, 
-- \textmode_vga_inst|console_sm_inst|column_int\(1), , , VCC)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \pll_vga_clk|altpll_component|_clk0\,
	datac => \textmode_vga_inst|console_sm_inst|column_int\(1),
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	sload => VCC,
	ena => \textmode_vga_inst|console_sm_inst|state.STATE_SCROLL_CLEAR_LINE~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \textmode_vga_inst|console_sm_inst|column_save\(1));

-- Location: LC_X35_Y26_N1
\textmode_vga_inst|console_sm_inst|column_int[0]\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|console_sm_inst|column_int\(0) = DFFEAS(((!\textmode_vga_inst|console_sm_inst|column_int\(0))), GLOBAL(\pll_vga_clk|altpll_component|_clk0\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , 
-- \textmode_vga_inst|console_sm_inst|WideOr9~0_combout\, \textmode_vga_inst|console_sm_inst|column_save\(0), , \textmode_vga_inst|console_sm_inst|WideOr10~1_combout\, \textmode_vga_inst|console_sm_inst|state.STATE_SCROLL_CLEAR_LINE_FINISH~regout\)
-- \textmode_vga_inst|console_sm_inst|column_int[0]~1\ = CARRY(((\textmode_vga_inst|console_sm_inst|column_int\(0))))
-- \textmode_vga_inst|console_sm_inst|column_int[0]~1COUT1_21\ = CARRY(((\textmode_vga_inst|console_sm_inst|column_int\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "33cc",
	operation_mode => "arithmetic",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \pll_vga_clk|altpll_component|_clk0\,
	datab => \textmode_vga_inst|console_sm_inst|column_int\(0),
	datac => \textmode_vga_inst|console_sm_inst|column_save\(0),
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	sclr => \textmode_vga_inst|console_sm_inst|WideOr10~1_combout\,
	sload => \textmode_vga_inst|console_sm_inst|state.STATE_SCROLL_CLEAR_LINE_FINISH~regout\,
	ena => \textmode_vga_inst|console_sm_inst|WideOr9~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \textmode_vga_inst|console_sm_inst|column_int\(0),
	cout0 => \textmode_vga_inst|console_sm_inst|column_int[0]~1\,
	cout1 => \textmode_vga_inst|console_sm_inst|column_int[0]~1COUT1_21\);

-- Location: LC_X35_Y26_N2
\textmode_vga_inst|console_sm_inst|column_int[1]\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|console_sm_inst|column_int\(1) = DFFEAS((\textmode_vga_inst|console_sm_inst|column_int\(1) $ ((\textmode_vga_inst|console_sm_inst|column_int[0]~1\))), GLOBAL(\pll_vga_clk|altpll_component|_clk0\), 
-- !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , \textmode_vga_inst|console_sm_inst|WideOr9~0_combout\, \textmode_vga_inst|console_sm_inst|column_save\(1), , \textmode_vga_inst|console_sm_inst|WideOr10~1_combout\, 
-- \textmode_vga_inst|console_sm_inst|state.STATE_SCROLL_CLEAR_LINE_FINISH~regout\)
-- \textmode_vga_inst|console_sm_inst|column_int[1]~3\ = CARRY(((!\textmode_vga_inst|console_sm_inst|column_int[0]~1\) # (!\textmode_vga_inst|console_sm_inst|column_int\(1))))
-- \textmode_vga_inst|console_sm_inst|column_int[1]~3COUT1_23\ = CARRY(((!\textmode_vga_inst|console_sm_inst|column_int[0]~1COUT1_21\) # (!\textmode_vga_inst|console_sm_inst|column_int\(1))))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	lut_mask => "3c3f",
	operation_mode => "arithmetic",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \pll_vga_clk|altpll_component|_clk0\,
	datab => \textmode_vga_inst|console_sm_inst|column_int\(1),
	datac => \textmode_vga_inst|console_sm_inst|column_save\(1),
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	sclr => \textmode_vga_inst|console_sm_inst|WideOr10~1_combout\,
	sload => \textmode_vga_inst|console_sm_inst|state.STATE_SCROLL_CLEAR_LINE_FINISH~regout\,
	ena => \textmode_vga_inst|console_sm_inst|WideOr9~0_combout\,
	cin0 => \textmode_vga_inst|console_sm_inst|column_int[0]~1\,
	cin1 => \textmode_vga_inst|console_sm_inst|column_int[0]~1COUT1_21\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \textmode_vga_inst|console_sm_inst|column_int\(1),
	cout0 => \textmode_vga_inst|console_sm_inst|column_int[1]~3\,
	cout1 => \textmode_vga_inst|console_sm_inst|column_int[1]~3COUT1_23\);

-- Location: LC_X35_Y26_N3
\textmode_vga_inst|console_sm_inst|column_int[2]\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|console_sm_inst|column_int\(2) = DFFEAS(\textmode_vga_inst|console_sm_inst|column_int\(2) $ ((((!\textmode_vga_inst|console_sm_inst|column_int[1]~3\)))), GLOBAL(\pll_vga_clk|altpll_component|_clk0\), 
-- !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , \textmode_vga_inst|console_sm_inst|WideOr9~0_combout\, \textmode_vga_inst|console_sm_inst|column_save\(2), , \textmode_vga_inst|console_sm_inst|WideOr10~1_combout\, 
-- \textmode_vga_inst|console_sm_inst|state.STATE_SCROLL_CLEAR_LINE_FINISH~regout\)
-- \textmode_vga_inst|console_sm_inst|column_int[2]~5\ = CARRY((\textmode_vga_inst|console_sm_inst|column_int\(2) & ((!\textmode_vga_inst|console_sm_inst|column_int[1]~3\))))
-- \textmode_vga_inst|console_sm_inst|column_int[2]~5COUT1_25\ = CARRY((\textmode_vga_inst|console_sm_inst|column_int\(2) & ((!\textmode_vga_inst|console_sm_inst|column_int[1]~3COUT1_23\))))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	lut_mask => "a50a",
	operation_mode => "arithmetic",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \pll_vga_clk|altpll_component|_clk0\,
	dataa => \textmode_vga_inst|console_sm_inst|column_int\(2),
	datac => \textmode_vga_inst|console_sm_inst|column_save\(2),
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	sclr => \textmode_vga_inst|console_sm_inst|WideOr10~1_combout\,
	sload => \textmode_vga_inst|console_sm_inst|state.STATE_SCROLL_CLEAR_LINE_FINISH~regout\,
	ena => \textmode_vga_inst|console_sm_inst|WideOr9~0_combout\,
	cin0 => \textmode_vga_inst|console_sm_inst|column_int[1]~3\,
	cin1 => \textmode_vga_inst|console_sm_inst|column_int[1]~3COUT1_23\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \textmode_vga_inst|console_sm_inst|column_int\(2),
	cout0 => \textmode_vga_inst|console_sm_inst|column_int[2]~5\,
	cout1 => \textmode_vga_inst|console_sm_inst|column_int[2]~5COUT1_25\);

-- Location: LC_X35_Y26_N4
\textmode_vga_inst|console_sm_inst|column_int[3]\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|console_sm_inst|column_int\(3) = DFFEAS(\textmode_vga_inst|console_sm_inst|column_int\(3) $ ((((\textmode_vga_inst|console_sm_inst|column_int[2]~5\)))), GLOBAL(\pll_vga_clk|altpll_component|_clk0\), 
-- !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , \textmode_vga_inst|console_sm_inst|WideOr9~0_combout\, \textmode_vga_inst|console_sm_inst|column_save\(3), , \textmode_vga_inst|console_sm_inst|WideOr10~1_combout\, 
-- \textmode_vga_inst|console_sm_inst|state.STATE_SCROLL_CLEAR_LINE_FINISH~regout\)
-- \textmode_vga_inst|console_sm_inst|column_int[3]~7\ = CARRY(((!\textmode_vga_inst|console_sm_inst|column_int[2]~5COUT1_25\)) # (!\textmode_vga_inst|console_sm_inst|column_int\(3)))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	lut_mask => "5a5f",
	operation_mode => "arithmetic",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \pll_vga_clk|altpll_component|_clk0\,
	dataa => \textmode_vga_inst|console_sm_inst|column_int\(3),
	datac => \textmode_vga_inst|console_sm_inst|column_save\(3),
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	sclr => \textmode_vga_inst|console_sm_inst|WideOr10~1_combout\,
	sload => \textmode_vga_inst|console_sm_inst|state.STATE_SCROLL_CLEAR_LINE_FINISH~regout\,
	ena => \textmode_vga_inst|console_sm_inst|WideOr9~0_combout\,
	cin0 => \textmode_vga_inst|console_sm_inst|column_int[2]~5\,
	cin1 => \textmode_vga_inst|console_sm_inst|column_int[2]~5COUT1_25\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \textmode_vga_inst|console_sm_inst|column_int\(3),
	cout => \textmode_vga_inst|console_sm_inst|column_int[3]~7\);

-- Location: LC_X34_Y26_N9
\textmode_vga_inst|console_sm_inst|column_save[4]\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|console_sm_inst|column_save\(4) = DFFEAS((((\textmode_vga_inst|console_sm_inst|column_int\(4)))), GLOBAL(\pll_vga_clk|altpll_component|_clk0\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , 
-- \textmode_vga_inst|console_sm_inst|state.STATE_SCROLL_CLEAR_LINE~regout\, , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "ff00",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \pll_vga_clk|altpll_component|_clk0\,
	datad => \textmode_vga_inst|console_sm_inst|column_int\(4),
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	ena => \textmode_vga_inst|console_sm_inst|state.STATE_SCROLL_CLEAR_LINE~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \textmode_vga_inst|console_sm_inst|column_save\(4));

-- Location: LC_X35_Y26_N5
\textmode_vga_inst|console_sm_inst|column_int[4]\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|console_sm_inst|column_int\(4) = DFFEAS((\textmode_vga_inst|console_sm_inst|column_int\(4) $ ((!\textmode_vga_inst|console_sm_inst|column_int[3]~7\))), GLOBAL(\pll_vga_clk|altpll_component|_clk0\), 
-- !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , \textmode_vga_inst|console_sm_inst|WideOr9~0_combout\, \textmode_vga_inst|console_sm_inst|column_save\(4), , \textmode_vga_inst|console_sm_inst|WideOr10~1_combout\, 
-- \textmode_vga_inst|console_sm_inst|state.STATE_SCROLL_CLEAR_LINE_FINISH~regout\)
-- \textmode_vga_inst|console_sm_inst|column_int[4]~9\ = CARRY(((\textmode_vga_inst|console_sm_inst|column_int\(4) & !\textmode_vga_inst|console_sm_inst|column_int[3]~7\)))
-- \textmode_vga_inst|console_sm_inst|column_int[4]~9COUT1_27\ = CARRY(((\textmode_vga_inst|console_sm_inst|column_int\(4) & !\textmode_vga_inst|console_sm_inst|column_int[3]~7\)))

-- pragma translate_off
GENERIC MAP (
	cin_used => "true",
	lut_mask => "c30c",
	operation_mode => "arithmetic",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \pll_vga_clk|altpll_component|_clk0\,
	datab => \textmode_vga_inst|console_sm_inst|column_int\(4),
	datac => \textmode_vga_inst|console_sm_inst|column_save\(4),
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	sclr => \textmode_vga_inst|console_sm_inst|WideOr10~1_combout\,
	sload => \textmode_vga_inst|console_sm_inst|state.STATE_SCROLL_CLEAR_LINE_FINISH~regout\,
	ena => \textmode_vga_inst|console_sm_inst|WideOr9~0_combout\,
	cin => \textmode_vga_inst|console_sm_inst|column_int[3]~7\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \textmode_vga_inst|console_sm_inst|column_int\(4),
	cout0 => \textmode_vga_inst|console_sm_inst|column_int[4]~9\,
	cout1 => \textmode_vga_inst|console_sm_inst|column_int[4]~9COUT1_27\);

-- Location: LC_X35_Y26_N6
\textmode_vga_inst|console_sm_inst|column_int[5]\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|console_sm_inst|column_int\(5) = DFFEAS((\textmode_vga_inst|console_sm_inst|column_int\(5) $ (((!\textmode_vga_inst|console_sm_inst|column_int[3]~7\ & \textmode_vga_inst|console_sm_inst|column_int[4]~9\) # 
-- (\textmode_vga_inst|console_sm_inst|column_int[3]~7\ & \textmode_vga_inst|console_sm_inst|column_int[4]~9COUT1_27\)))), GLOBAL(\pll_vga_clk|altpll_component|_clk0\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , 
-- \textmode_vga_inst|console_sm_inst|WideOr9~0_combout\, \textmode_vga_inst|console_sm_inst|column_save\(5), , \textmode_vga_inst|console_sm_inst|WideOr10~1_combout\, \textmode_vga_inst|console_sm_inst|state.STATE_SCROLL_CLEAR_LINE_FINISH~regout\)
-- \textmode_vga_inst|console_sm_inst|column_int[5]~11\ = CARRY(((!\textmode_vga_inst|console_sm_inst|column_int[4]~9\) # (!\textmode_vga_inst|console_sm_inst|column_int\(5))))
-- \textmode_vga_inst|console_sm_inst|column_int[5]~11COUT1_29\ = CARRY(((!\textmode_vga_inst|console_sm_inst|column_int[4]~9COUT1_27\) # (!\textmode_vga_inst|console_sm_inst|column_int\(5))))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	cin_used => "true",
	lut_mask => "3c3f",
	operation_mode => "arithmetic",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \pll_vga_clk|altpll_component|_clk0\,
	datab => \textmode_vga_inst|console_sm_inst|column_int\(5),
	datac => \textmode_vga_inst|console_sm_inst|column_save\(5),
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	sclr => \textmode_vga_inst|console_sm_inst|WideOr10~1_combout\,
	sload => \textmode_vga_inst|console_sm_inst|state.STATE_SCROLL_CLEAR_LINE_FINISH~regout\,
	ena => \textmode_vga_inst|console_sm_inst|WideOr9~0_combout\,
	cin => \textmode_vga_inst|console_sm_inst|column_int[3]~7\,
	cin0 => \textmode_vga_inst|console_sm_inst|column_int[4]~9\,
	cin1 => \textmode_vga_inst|console_sm_inst|column_int[4]~9COUT1_27\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \textmode_vga_inst|console_sm_inst|column_int\(5),
	cout0 => \textmode_vga_inst|console_sm_inst|column_int[5]~11\,
	cout1 => \textmode_vga_inst|console_sm_inst|column_int[5]~11COUT1_29\);

-- Location: LC_X35_Y26_N7
\textmode_vga_inst|console_sm_inst|column_int[6]\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|console_sm_inst|column_int\(6) = DFFEAS(\textmode_vga_inst|console_sm_inst|column_int\(6) $ ((((!(!\textmode_vga_inst|console_sm_inst|column_int[3]~7\ & \textmode_vga_inst|console_sm_inst|column_int[5]~11\) # 
-- (\textmode_vga_inst|console_sm_inst|column_int[3]~7\ & \textmode_vga_inst|console_sm_inst|column_int[5]~11COUT1_29\))))), GLOBAL(\pll_vga_clk|altpll_component|_clk0\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , 
-- \textmode_vga_inst|console_sm_inst|WideOr9~0_combout\, \textmode_vga_inst|console_sm_inst|column_save\(6), , \textmode_vga_inst|console_sm_inst|WideOr10~1_combout\, \textmode_vga_inst|console_sm_inst|state.STATE_SCROLL_CLEAR_LINE_FINISH~regout\)

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	cin_used => "true",
	lut_mask => "a5a5",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \pll_vga_clk|altpll_component|_clk0\,
	dataa => \textmode_vga_inst|console_sm_inst|column_int\(6),
	datac => \textmode_vga_inst|console_sm_inst|column_save\(6),
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	sclr => \textmode_vga_inst|console_sm_inst|WideOr10~1_combout\,
	sload => \textmode_vga_inst|console_sm_inst|state.STATE_SCROLL_CLEAR_LINE_FINISH~regout\,
	ena => \textmode_vga_inst|console_sm_inst|WideOr9~0_combout\,
	cin => \textmode_vga_inst|console_sm_inst|column_int[3]~7\,
	cin0 => \textmode_vga_inst|console_sm_inst|column_int[5]~11\,
	cin1 => \textmode_vga_inst|console_sm_inst|column_int[5]~11COUT1_29\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \textmode_vga_inst|console_sm_inst|column_int\(6));

-- Location: LC_X35_Y26_N9
\textmode_vga_inst|console_sm_inst|Equal8~0\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|console_sm_inst|Equal8~0_combout\ = (\textmode_vga_inst|console_sm_inst|column_int\(3) & (\textmode_vga_inst|console_sm_inst|column_int\(1) & (\textmode_vga_inst|console_sm_inst|column_int\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "8080",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \textmode_vga_inst|console_sm_inst|column_int\(3),
	datab => \textmode_vga_inst|console_sm_inst|column_int\(1),
	datac => \textmode_vga_inst|console_sm_inst|column_int\(2),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \textmode_vga_inst|console_sm_inst|Equal8~0_combout\);

-- Location: LC_X35_Y26_N0
\textmode_vga_inst|console_sm_inst|LessThan1~0\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|console_sm_inst|LessThan1~0_combout\ = (\textmode_vga_inst|console_sm_inst|column_int\(6) & (((\textmode_vga_inst|console_sm_inst|column_int\(0) & \textmode_vga_inst|console_sm_inst|Equal8~0_combout\)) # 
-- (!\textmode_vga_inst|console_sm_inst|Equal8~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "a222",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \textmode_vga_inst|console_sm_inst|column_int\(6),
	datab => \textmode_vga_inst|console_sm_inst|Equal8~1_combout\,
	datac => \textmode_vga_inst|console_sm_inst|column_int\(0),
	datad => \textmode_vga_inst|console_sm_inst|Equal8~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \textmode_vga_inst|console_sm_inst|LessThan1~0_combout\);

-- Location: LC_X34_Y27_N2
\textmode_vga_inst|console_sm_inst|WideOr0~0\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|console_sm_inst|WideOr0~0_combout\ = ((\textmode_vga_inst|console_sm_inst|state.STATE_WAIT_REQ_RELEASE~regout\) # ((\textmode_vga_inst|console_sm_inst|state.STATE_SCROLL_CLEAR_LINE_LOOP~regout\) # 
-- (!\textmode_vga_inst|console_sm_inst|state.STATE_IDLE~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "ffcf",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \textmode_vga_inst|console_sm_inst|state.STATE_WAIT_REQ_RELEASE~regout\,
	datac => \textmode_vga_inst|console_sm_inst|state.STATE_IDLE~regout\,
	datad => \textmode_vga_inst|console_sm_inst|state.STATE_SCROLL_CLEAR_LINE_LOOP~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \textmode_vga_inst|console_sm_inst|WideOr0~0_combout\);

-- Location: LC_X35_Y27_N6
\textmode_vga_inst|console_sm_inst|Selector7~0\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|console_sm_inst|Selector7~0_combout\ = (\textmode_vga_inst|console_sm_inst|LessThan1~0_combout\ & (\textmode_vga_inst|console_sm_inst|Selector18~0\ & (\textmode_vga_inst|console_sm_sync_inst|command_data_latched\(14) & 
-- \textmode_vga_inst|console_sm_inst|WideOr0~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "8000",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \textmode_vga_inst|console_sm_inst|LessThan1~0_combout\,
	datab => \textmode_vga_inst|console_sm_inst|Selector18~0\,
	datac => \textmode_vga_inst|console_sm_sync_inst|command_data_latched\(14),
	datad => \textmode_vga_inst|console_sm_inst|WideOr0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \textmode_vga_inst|console_sm_inst|Selector7~0_combout\);

-- Location: LC_X35_Y27_N7
\textmode_vga_inst|console_sm_inst|Selector7~3\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|console_sm_inst|Selector7~3_combout\ = (\textmode_vga_inst|console_sm_inst|Selector7~0_combout\) # ((\textmode_vga_inst|console_sm_inst|Selector7~1_combout\ & ((\textmode_vga_inst|console_sm_inst|Selector7~2_combout\) # 
-- (!\textmode_vga_inst|console_sm_inst|Selector16~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "ffb0",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \textmode_vga_inst|console_sm_inst|Selector7~2_combout\,
	datab => \textmode_vga_inst|console_sm_inst|Selector16~0_combout\,
	datac => \textmode_vga_inst|console_sm_inst|Selector7~1_combout\,
	datad => \textmode_vga_inst|console_sm_inst|Selector7~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \textmode_vga_inst|console_sm_inst|Selector7~3_combout\);

-- Location: LC_X35_Y27_N2
\textmode_vga_inst|console_sm_inst|state.STATE_SET_CHAR_NEW_LINE_AND_CARRIAGE_RETURN_SCROLL\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|console_sm_inst|state.STATE_SET_CHAR_NEW_LINE_AND_CARRIAGE_RETURN_SCROLL~regout\ = DFFEAS((\textmode_vga_inst|console_sm_inst|Selector7~3_combout\ & ((\textmode_vga_inst|console_sm_inst|Selector18~0\ & 
-- (\textmode_vga_inst|console_sm_inst|LessThan0~1_combout\)) # (!\textmode_vga_inst|console_sm_inst|Selector18~0\ & ((\textmode_vga_inst|console_sm_inst|state.STATE_SET_CHAR_NEW_LINE_AND_CARRIAGE_RETURN_SCROLL~regout\))))), 
-- GLOBAL(\pll_vga_clk|altpll_component|_clk0\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "a280",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \pll_vga_clk|altpll_component|_clk0\,
	dataa => \textmode_vga_inst|console_sm_inst|Selector7~3_combout\,
	datab => \textmode_vga_inst|console_sm_inst|Selector18~0\,
	datac => \textmode_vga_inst|console_sm_inst|LessThan0~1_combout\,
	datad => \textmode_vga_inst|console_sm_inst|state.STATE_SET_CHAR_NEW_LINE_AND_CARRIAGE_RETURN_SCROLL~regout\,
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \textmode_vga_inst|console_sm_inst|state.STATE_SET_CHAR_NEW_LINE_AND_CARRIAGE_RETURN_SCROLL~regout\);

-- Location: LC_X35_Y27_N1
\textmode_vga_inst|console_sm_inst|WideOr10~1\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|console_sm_inst|WideOr10~1_combout\ = (\textmode_vga_inst|console_sm_inst|state.STATE_SET_CHAR_NEW_LINE_AND_CARRIAGE_RETURN_SCROLL~regout\) # (((\textmode_vga_inst|console_sm_inst|state.STATE_SCROLL_CLEAR_LINE~regout\) # 
-- (\textmode_vga_inst|console_sm_inst|state.STATE_SET_CHAR_NEW_LINE_AND_CARRIAGE_RETURN_SIMPLE~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "fffa",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \textmode_vga_inst|console_sm_inst|state.STATE_SET_CHAR_NEW_LINE_AND_CARRIAGE_RETURN_SCROLL~regout\,
	datac => \textmode_vga_inst|console_sm_inst|state.STATE_SCROLL_CLEAR_LINE~regout\,
	datad => \textmode_vga_inst|console_sm_inst|state.STATE_SET_CHAR_NEW_LINE_AND_CARRIAGE_RETURN_SIMPLE~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \textmode_vga_inst|console_sm_inst|WideOr10~1_combout\);

-- Location: LC_X34_Y26_N6
\textmode_vga_inst|console_sm_inst|Equal8~1\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|console_sm_inst|Equal8~1_combout\ = (((!\textmode_vga_inst|console_sm_inst|column_int\(5) & !\textmode_vga_inst|console_sm_inst|column_int\(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "000f",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datac => \textmode_vga_inst|console_sm_inst|column_int\(5),
	datad => \textmode_vga_inst|console_sm_inst|column_int\(4),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \textmode_vga_inst|console_sm_inst|Equal8~1_combout\);

-- Location: LC_X34_Y26_N4
\textmode_vga_inst|console_sm_inst|Equal8~2\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|console_sm_inst|Equal8~2_combout\ = (!\textmode_vga_inst|console_sm_inst|column_int\(0) & (\textmode_vga_inst|console_sm_inst|Equal8~1_combout\ & (\textmode_vga_inst|console_sm_inst|column_int\(6) & 
-- \textmode_vga_inst|console_sm_inst|Equal8~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "4000",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \textmode_vga_inst|console_sm_inst|column_int\(0),
	datab => \textmode_vga_inst|console_sm_inst|Equal8~1_combout\,
	datac => \textmode_vga_inst|console_sm_inst|column_int\(6),
	datad => \textmode_vga_inst|console_sm_inst|Equal8~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \textmode_vga_inst|console_sm_inst|Equal8~2_combout\);

-- Location: LC_X34_Y27_N1
\textmode_vga_inst|console_sm_inst|Selector14~0\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|console_sm_inst|Selector14~0_combout\ = (((\textmode_vga_inst|console_sm_inst|Equal8~2_combout\ & \textmode_vga_inst|console_sm_inst|state.STATE_SCROLL_CLEAR_LINE_LOOP~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "f000",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datac => \textmode_vga_inst|console_sm_inst|Equal8~2_combout\,
	datad => \textmode_vga_inst|console_sm_inst|state.STATE_SCROLL_CLEAR_LINE_LOOP~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \textmode_vga_inst|console_sm_inst|Selector14~0_combout\);

-- Location: LC_X34_Y27_N7
\textmode_vga_inst|console_sm_inst|state.STATE_IDLE\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|console_sm_inst|state.STATE_IDLE~regout\ = DFFEAS((\textmode_vga_inst|console_sm_inst|Selector18~1_combout\ & ((\textmode_vga_inst|console_sm_inst|state.STATE_IDLE~regout\) # ((\textmode_vga_inst|console_sm_inst|Selector14~0_combout\) # 
-- (!\textmode_vga_inst|console_sm_inst|Selector7~1_combout\)))), GLOBAL(\pll_vga_clk|altpll_component|_clk0\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "e0f0",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \pll_vga_clk|altpll_component|_clk0\,
	dataa => \textmode_vga_inst|console_sm_inst|state.STATE_IDLE~regout\,
	datab => \textmode_vga_inst|console_sm_inst|Selector14~0_combout\,
	datac => \textmode_vga_inst|console_sm_inst|Selector18~1_combout\,
	datad => \textmode_vga_inst|console_sm_inst|Selector7~1_combout\,
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \textmode_vga_inst|console_sm_inst|state.STATE_IDLE~regout\);

-- Location: LC_X33_Y27_N4
\textmode_vga_inst|console_sm_inst|state.STATE_WAIT_REQ_RELEASE\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|console_sm_inst|state.STATE_WAIT_REQ_RELEASE~regout\ = DFFEAS((\textmode_vga_inst|console_sm_inst|state.STATE_WAIT_REQ_RELEASE~regout\ & (\textmode_vga_inst|console_sm_sync_inst|command_req_sync\(1))) # 
-- (!\textmode_vga_inst|console_sm_inst|state.STATE_WAIT_REQ_RELEASE~regout\ & (((\textmode_vga_inst|console_sm_inst|WideOr1~0\)))), GLOBAL(\pll_vga_clk|altpll_component|_clk0\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "bb88",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \pll_vga_clk|altpll_component|_clk0\,
	dataa => \textmode_vga_inst|console_sm_sync_inst|command_req_sync\(1),
	datab => \textmode_vga_inst|console_sm_inst|state.STATE_WAIT_REQ_RELEASE~regout\,
	datad => \textmode_vga_inst|console_sm_inst|WideOr1~0\,
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \textmode_vga_inst|console_sm_inst|state.STATE_WAIT_REQ_RELEASE~regout\);

-- Location: LC_X33_Y27_N8
\textmode_vga_inst|console_sm_inst|WideOr3~1\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|console_sm_inst|WideOr3~1_combout\ = (((\textmode_vga_inst|console_sm_inst|state.STATE_WAIT_REQ_RELEASE~regout\) # (!\textmode_vga_inst|console_sm_inst|WideOr3~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "f0ff",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datac => \textmode_vga_inst|console_sm_inst|state.STATE_WAIT_REQ_RELEASE~regout\,
	datad => \textmode_vga_inst|console_sm_inst|WideOr3~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \textmode_vga_inst|console_sm_inst|WideOr3~1_combout\);

-- Location: LC_X33_Y28_N2
\textmode_vga_inst|console_sm_inst|Selector34~0\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|console_sm_inst|Selector34~0_combout\ = ((\textmode_vga_inst|console_sm_inst|scroll_int\(4) & ((!\textmode_vga_inst|console_sm_inst|state.STATE_SCROLL_TOP~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "00cc",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \textmode_vga_inst|console_sm_inst|scroll_int\(4),
	datad => \textmode_vga_inst|console_sm_inst|state.STATE_SCROLL_TOP~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \textmode_vga_inst|console_sm_inst|Selector34~0_combout\);

-- Location: LC_X33_Y28_N1
\textmode_vga_inst|console_sm_inst|Selector35~0\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|console_sm_inst|Selector35~0_combout\ = (\textmode_vga_inst|console_sm_inst|scroll_int\(3) & (((!\textmode_vga_inst|console_sm_inst|state.STATE_SCROLL_TOP~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "00aa",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \textmode_vga_inst|console_sm_inst|scroll_int\(3),
	datad => \textmode_vga_inst|console_sm_inst|state.STATE_SCROLL_TOP~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \textmode_vga_inst|console_sm_inst|Selector35~0_combout\);

-- Location: LC_X33_Y28_N0
\textmode_vga_inst|console_sm_inst|Selector36~0\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|console_sm_inst|Selector36~0_combout\ = (((\textmode_vga_inst|console_sm_inst|scroll_int\(2) & !\textmode_vga_inst|console_sm_inst|state.STATE_SCROLL_TOP~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "00f0",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datac => \textmode_vga_inst|console_sm_inst|scroll_int\(2),
	datad => \textmode_vga_inst|console_sm_inst|state.STATE_SCROLL_TOP~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \textmode_vga_inst|console_sm_inst|Selector36~0_combout\);

-- Location: LC_X33_Y28_N3
\textmode_vga_inst|console_sm_inst|Selector37~0\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|console_sm_inst|Selector37~0_combout\ = ((\textmode_vga_inst|console_sm_inst|scroll_int\(1) & ((!\textmode_vga_inst|console_sm_inst|state.STATE_SCROLL_TOP~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "00cc",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \textmode_vga_inst|console_sm_inst|scroll_int\(1),
	datad => \textmode_vga_inst|console_sm_inst|state.STATE_SCROLL_TOP~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \textmode_vga_inst|console_sm_inst|Selector37~0_combout\);

-- Location: LC_X33_Y28_N5
\textmode_vga_inst|console_sm_inst|scroll_int[0]\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|console_sm_inst|scroll_int\(0) = DFFEAS(((!\textmode_vga_inst|console_sm_inst|scroll_int\(0))), GLOBAL(\pll_vga_clk|altpll_component|_clk0\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , 
-- \textmode_vga_inst|console_sm_inst|Selector38~0_combout\, , , !\textmode_vga_inst|console_sm_inst|state.STATE_SCROLL_NEXT~regout\)
-- \textmode_vga_inst|console_sm_inst|scroll_int[0]~1\ = CARRY(((\textmode_vga_inst|console_sm_inst|scroll_int\(0))))
-- \textmode_vga_inst|console_sm_inst|scroll_int[0]~1COUT1_16\ = CARRY(((\textmode_vga_inst|console_sm_inst|scroll_int\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "33cc",
	operation_mode => "arithmetic",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \pll_vga_clk|altpll_component|_clk0\,
	datab => \textmode_vga_inst|console_sm_inst|scroll_int\(0),
	datac => \textmode_vga_inst|console_sm_inst|Selector38~0_combout\,
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	sload => \textmode_vga_inst|console_sm_inst|ALT_INV_state.STATE_SCROLL_NEXT~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \textmode_vga_inst|console_sm_inst|scroll_int\(0),
	cout0 => \textmode_vga_inst|console_sm_inst|scroll_int[0]~1\,
	cout1 => \textmode_vga_inst|console_sm_inst|scroll_int[0]~1COUT1_16\);

-- Location: LC_X33_Y28_N6
\textmode_vga_inst|console_sm_inst|scroll_int[1]\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|console_sm_inst|scroll_int\(1) = DFFEAS((\textmode_vga_inst|console_sm_inst|scroll_int\(1) $ ((\textmode_vga_inst|console_sm_inst|scroll_int[0]~1\))), GLOBAL(\pll_vga_clk|altpll_component|_clk0\), 
-- !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , \textmode_vga_inst|console_sm_inst|Selector37~0_combout\, , , !\textmode_vga_inst|console_sm_inst|state.STATE_SCROLL_NEXT~regout\)
-- \textmode_vga_inst|console_sm_inst|scroll_int[1]~3\ = CARRY(((!\textmode_vga_inst|console_sm_inst|scroll_int[0]~1\) # (!\textmode_vga_inst|console_sm_inst|scroll_int\(1))))
-- \textmode_vga_inst|console_sm_inst|scroll_int[1]~3COUT1_18\ = CARRY(((!\textmode_vga_inst|console_sm_inst|scroll_int[0]~1COUT1_16\) # (!\textmode_vga_inst|console_sm_inst|scroll_int\(1))))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	lut_mask => "3c3f",
	operation_mode => "arithmetic",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \pll_vga_clk|altpll_component|_clk0\,
	datab => \textmode_vga_inst|console_sm_inst|scroll_int\(1),
	datac => \textmode_vga_inst|console_sm_inst|Selector37~0_combout\,
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	sload => \textmode_vga_inst|console_sm_inst|ALT_INV_state.STATE_SCROLL_NEXT~regout\,
	cin0 => \textmode_vga_inst|console_sm_inst|scroll_int[0]~1\,
	cin1 => \textmode_vga_inst|console_sm_inst|scroll_int[0]~1COUT1_16\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \textmode_vga_inst|console_sm_inst|scroll_int\(1),
	cout0 => \textmode_vga_inst|console_sm_inst|scroll_int[1]~3\,
	cout1 => \textmode_vga_inst|console_sm_inst|scroll_int[1]~3COUT1_18\);

-- Location: LC_X33_Y28_N7
\textmode_vga_inst|console_sm_inst|scroll_int[2]\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|console_sm_inst|scroll_int\(2) = DFFEAS(\textmode_vga_inst|console_sm_inst|scroll_int\(2) $ ((((!\textmode_vga_inst|console_sm_inst|scroll_int[1]~3\)))), GLOBAL(\pll_vga_clk|altpll_component|_clk0\), 
-- !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , \textmode_vga_inst|console_sm_inst|Selector36~0_combout\, , , !\textmode_vga_inst|console_sm_inst|state.STATE_SCROLL_NEXT~regout\)
-- \textmode_vga_inst|console_sm_inst|scroll_int[2]~5\ = CARRY((\textmode_vga_inst|console_sm_inst|scroll_int\(2) & ((!\textmode_vga_inst|console_sm_inst|scroll_int[1]~3\))))
-- \textmode_vga_inst|console_sm_inst|scroll_int[2]~5COUT1_20\ = CARRY((\textmode_vga_inst|console_sm_inst|scroll_int\(2) & ((!\textmode_vga_inst|console_sm_inst|scroll_int[1]~3COUT1_18\))))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	lut_mask => "a50a",
	operation_mode => "arithmetic",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \pll_vga_clk|altpll_component|_clk0\,
	dataa => \textmode_vga_inst|console_sm_inst|scroll_int\(2),
	datac => \textmode_vga_inst|console_sm_inst|Selector36~0_combout\,
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	sload => \textmode_vga_inst|console_sm_inst|ALT_INV_state.STATE_SCROLL_NEXT~regout\,
	cin0 => \textmode_vga_inst|console_sm_inst|scroll_int[1]~3\,
	cin1 => \textmode_vga_inst|console_sm_inst|scroll_int[1]~3COUT1_18\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \textmode_vga_inst|console_sm_inst|scroll_int\(2),
	cout0 => \textmode_vga_inst|console_sm_inst|scroll_int[2]~5\,
	cout1 => \textmode_vga_inst|console_sm_inst|scroll_int[2]~5COUT1_20\);

-- Location: LC_X33_Y28_N8
\textmode_vga_inst|console_sm_inst|scroll_int[3]\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|console_sm_inst|scroll_int\(3) = DFFEAS(\textmode_vga_inst|console_sm_inst|scroll_int\(3) $ ((((\textmode_vga_inst|console_sm_inst|scroll_int[2]~5\)))), GLOBAL(\pll_vga_clk|altpll_component|_clk0\), 
-- !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , \textmode_vga_inst|console_sm_inst|Selector35~0_combout\, , , !\textmode_vga_inst|console_sm_inst|state.STATE_SCROLL_NEXT~regout\)
-- \textmode_vga_inst|console_sm_inst|scroll_int[3]~7\ = CARRY(((!\textmode_vga_inst|console_sm_inst|scroll_int[2]~5\)) # (!\textmode_vga_inst|console_sm_inst|scroll_int\(3)))
-- \textmode_vga_inst|console_sm_inst|scroll_int[3]~7COUT1_22\ = CARRY(((!\textmode_vga_inst|console_sm_inst|scroll_int[2]~5COUT1_20\)) # (!\textmode_vga_inst|console_sm_inst|scroll_int\(3)))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	lut_mask => "5a5f",
	operation_mode => "arithmetic",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \pll_vga_clk|altpll_component|_clk0\,
	dataa => \textmode_vga_inst|console_sm_inst|scroll_int\(3),
	datac => \textmode_vga_inst|console_sm_inst|Selector35~0_combout\,
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	sload => \textmode_vga_inst|console_sm_inst|ALT_INV_state.STATE_SCROLL_NEXT~regout\,
	cin0 => \textmode_vga_inst|console_sm_inst|scroll_int[2]~5\,
	cin1 => \textmode_vga_inst|console_sm_inst|scroll_int[2]~5COUT1_20\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \textmode_vga_inst|console_sm_inst|scroll_int\(3),
	cout0 => \textmode_vga_inst|console_sm_inst|scroll_int[3]~7\,
	cout1 => \textmode_vga_inst|console_sm_inst|scroll_int[3]~7COUT1_22\);

-- Location: LC_X33_Y28_N9
\textmode_vga_inst|console_sm_inst|scroll_int[4]\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|console_sm_inst|scroll_int\(4) = DFFEAS(((\textmode_vga_inst|console_sm_inst|scroll_int[3]~7\ $ (!\textmode_vga_inst|console_sm_inst|scroll_int\(4)))), GLOBAL(\pll_vga_clk|altpll_component|_clk0\), 
-- !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , \textmode_vga_inst|console_sm_inst|Selector34~0_combout\, , , !\textmode_vga_inst|console_sm_inst|state.STATE_SCROLL_NEXT~regout\)

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	lut_mask => "f00f",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \pll_vga_clk|altpll_component|_clk0\,
	datac => \textmode_vga_inst|console_sm_inst|Selector34~0_combout\,
	datad => \textmode_vga_inst|console_sm_inst|scroll_int\(4),
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	sload => \textmode_vga_inst|console_sm_inst|ALT_INV_state.STATE_SCROLL_NEXT~regout\,
	cin0 => \textmode_vga_inst|console_sm_inst|scroll_int[3]~7\,
	cin1 => \textmode_vga_inst|console_sm_inst|scroll_int[3]~7COUT1_22\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \textmode_vga_inst|console_sm_inst|scroll_int\(4));

-- Location: LC_X34_Y27_N4
\textmode_vga_inst|console_sm_inst|Selector10~1\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|console_sm_inst|Selector10~1_combout\ = (((\textmode_vga_inst|console_sm_inst|state.STATE_IDLE~regout\ & \textmode_vga_inst|console_sm_inst|Selector16~0_combout\)) # (!\textmode_vga_inst|console_sm_inst|WideOr3~1_combout\)) # 
-- (!\textmode_vga_inst|console_sm_inst|Selector7~1_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "f777",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \textmode_vga_inst|console_sm_inst|Selector7~1_combout\,
	datab => \textmode_vga_inst|console_sm_inst|WideOr3~1_combout\,
	datac => \textmode_vga_inst|console_sm_inst|state.STATE_IDLE~regout\,
	datad => \textmode_vga_inst|console_sm_inst|Selector16~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \textmode_vga_inst|console_sm_inst|Selector10~1_combout\);

-- Location: LC_X34_Y28_N9
\textmode_vga_inst|console_sm_inst|state.STATE_SCROLL_TOP\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|console_sm_inst|state.STATE_SCROLL_TOP~regout\ = DFFEAS((\textmode_vga_inst|console_sm_inst|LessThan2~0_combout\ & (\textmode_vga_inst|console_sm_inst|WideOr3~1_combout\ & (\textmode_vga_inst|console_sm_inst|scroll_int\(4) & 
-- !\textmode_vga_inst|console_sm_inst|WideOr0~0_combout\))), GLOBAL(\pll_vga_clk|altpll_component|_clk0\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , \textmode_vga_inst|console_sm_inst|Selector10~1_combout\, , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0080",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \pll_vga_clk|altpll_component|_clk0\,
	dataa => \textmode_vga_inst|console_sm_inst|LessThan2~0_combout\,
	datab => \textmode_vga_inst|console_sm_inst|WideOr3~1_combout\,
	datac => \textmode_vga_inst|console_sm_inst|scroll_int\(4),
	datad => \textmode_vga_inst|console_sm_inst|WideOr0~0_combout\,
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	ena => \textmode_vga_inst|console_sm_inst|Selector10~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \textmode_vga_inst|console_sm_inst|state.STATE_SCROLL_TOP~regout\);

-- Location: LC_X33_Y28_N4
\textmode_vga_inst|console_sm_inst|Selector38~0\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|console_sm_inst|Selector38~0_combout\ = (((\textmode_vga_inst|console_sm_inst|scroll_int\(0) & !\textmode_vga_inst|console_sm_inst|state.STATE_SCROLL_TOP~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "00f0",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datac => \textmode_vga_inst|console_sm_inst|scroll_int\(0),
	datad => \textmode_vga_inst|console_sm_inst|state.STATE_SCROLL_TOP~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \textmode_vga_inst|console_sm_inst|Selector38~0_combout\);

-- Location: LC_X34_Y28_N8
\textmode_vga_inst|console_sm_inst|LessThan2~0\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|console_sm_inst|LessThan2~0_combout\ = (\textmode_vga_inst|console_sm_inst|scroll_int\(2) & (\textmode_vga_inst|console_sm_inst|scroll_int\(3) & ((\textmode_vga_inst|console_sm_inst|scroll_int\(0)) # 
-- (\textmode_vga_inst|console_sm_inst|scroll_int\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "c080",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \textmode_vga_inst|console_sm_inst|scroll_int\(0),
	datab => \textmode_vga_inst|console_sm_inst|scroll_int\(2),
	datac => \textmode_vga_inst|console_sm_inst|scroll_int\(3),
	datad => \textmode_vga_inst|console_sm_inst|scroll_int\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \textmode_vga_inst|console_sm_inst|LessThan2~0_combout\);

-- Location: LC_X34_Y28_N7
\textmode_vga_inst|console_sm_inst|state.STATE_SCROLL_NEXT\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|console_sm_inst|state.STATE_SCROLL_NEXT~regout\ = DFFEAS((\textmode_vga_inst|console_sm_inst|WideOr3~1_combout\ & (!\textmode_vga_inst|console_sm_inst|WideOr0~0_combout\ & ((!\textmode_vga_inst|console_sm_inst|scroll_int\(4)) # 
-- (!\textmode_vga_inst|console_sm_inst|LessThan2~0_combout\)))), GLOBAL(\pll_vga_clk|altpll_component|_clk0\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , \textmode_vga_inst|console_sm_inst|Selector10~1_combout\, , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "004c",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \pll_vga_clk|altpll_component|_clk0\,
	dataa => \textmode_vga_inst|console_sm_inst|LessThan2~0_combout\,
	datab => \textmode_vga_inst|console_sm_inst|WideOr3~1_combout\,
	datac => \textmode_vga_inst|console_sm_inst|scroll_int\(4),
	datad => \textmode_vga_inst|console_sm_inst|WideOr0~0_combout\,
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	ena => \textmode_vga_inst|console_sm_inst|Selector10~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \textmode_vga_inst|console_sm_inst|state.STATE_SCROLL_NEXT~regout\);

-- Location: LC_X33_Y27_N6
\textmode_vga_inst|console_sm_inst|state.STATE_SCROLL_CLEAR_LINE\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|console_sm_inst|state.STATE_SCROLL_CLEAR_LINE~regout\ = DFFEAS((((\textmode_vga_inst|console_sm_inst|state.STATE_SCROLL_NEXT~regout\) # (\textmode_vga_inst|console_sm_inst|state.STATE_SCROLL_TOP~regout\))), 
-- GLOBAL(\pll_vga_clk|altpll_component|_clk0\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "fff0",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \pll_vga_clk|altpll_component|_clk0\,
	datac => \textmode_vga_inst|console_sm_inst|state.STATE_SCROLL_NEXT~regout\,
	datad => \textmode_vga_inst|console_sm_inst|state.STATE_SCROLL_TOP~regout\,
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \textmode_vga_inst|console_sm_inst|state.STATE_SCROLL_CLEAR_LINE~regout\);

-- Location: LC_X34_Y26_N8
\textmode_vga_inst|console_sm_inst|column_save[0]\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|console_sm_inst|column_save\(0) = DFFEAS((((\textmode_vga_inst|console_sm_inst|column_int\(0)))), GLOBAL(\pll_vga_clk|altpll_component|_clk0\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , 
-- \textmode_vga_inst|console_sm_inst|state.STATE_SCROLL_CLEAR_LINE~regout\, , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "ff00",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \pll_vga_clk|altpll_component|_clk0\,
	datad => \textmode_vga_inst|console_sm_inst|column_int\(0),
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	ena => \textmode_vga_inst|console_sm_inst|state.STATE_SCROLL_CLEAR_LINE~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \textmode_vga_inst|console_sm_inst|column_save\(0));

-- Location: LC_X34_Y28_N1
\textmode_vga_inst|video_memory_inst|Add2~0\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|video_memory_inst|Add2~0_combout\ = \textmode_vga_inst|console_sm_inst|scroll_int\(0) $ ((\textmode_vga_inst|console_sm_inst|line_int\(0)))
-- \textmode_vga_inst|video_memory_inst|Add2~2\ = CARRY((\textmode_vga_inst|console_sm_inst|scroll_int\(0) & (\textmode_vga_inst|console_sm_inst|line_int\(0))))
-- \textmode_vga_inst|video_memory_inst|Add2~2COUT1_36\ = CARRY((\textmode_vga_inst|console_sm_inst|scroll_int\(0) & (\textmode_vga_inst|console_sm_inst|line_int\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "6688",
	operation_mode => "arithmetic",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \textmode_vga_inst|console_sm_inst|scroll_int\(0),
	datab => \textmode_vga_inst|console_sm_inst|line_int\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \textmode_vga_inst|video_memory_inst|Add2~0_combout\,
	cout0 => \textmode_vga_inst|video_memory_inst|Add2~2\,
	cout1 => \textmode_vga_inst|video_memory_inst|Add2~2COUT1_36\);

-- Location: LC_X34_Y28_N2
\textmode_vga_inst|video_memory_inst|Add2~10\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|video_memory_inst|Add2~10_combout\ = \textmode_vga_inst|console_sm_inst|scroll_int\(1) $ (\textmode_vga_inst|console_sm_inst|line_int\(1) $ ((\textmode_vga_inst|video_memory_inst|Add2~2\)))
-- \textmode_vga_inst|video_memory_inst|Add2~12\ = CARRY((\textmode_vga_inst|console_sm_inst|scroll_int\(1) & (!\textmode_vga_inst|console_sm_inst|line_int\(1) & !\textmode_vga_inst|video_memory_inst|Add2~2\)) # 
-- (!\textmode_vga_inst|console_sm_inst|scroll_int\(1) & ((!\textmode_vga_inst|video_memory_inst|Add2~2\) # (!\textmode_vga_inst|console_sm_inst|line_int\(1)))))
-- \textmode_vga_inst|video_memory_inst|Add2~12COUT1_38\ = CARRY((\textmode_vga_inst|console_sm_inst|scroll_int\(1) & (!\textmode_vga_inst|console_sm_inst|line_int\(1) & !\textmode_vga_inst|video_memory_inst|Add2~2COUT1_36\)) # 
-- (!\textmode_vga_inst|console_sm_inst|scroll_int\(1) & ((!\textmode_vga_inst|video_memory_inst|Add2~2COUT1_36\) # (!\textmode_vga_inst|console_sm_inst|line_int\(1)))))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	lut_mask => "9617",
	operation_mode => "arithmetic",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \textmode_vga_inst|console_sm_inst|scroll_int\(1),
	datab => \textmode_vga_inst|console_sm_inst|line_int\(1),
	cin0 => \textmode_vga_inst|video_memory_inst|Add2~2\,
	cin1 => \textmode_vga_inst|video_memory_inst|Add2~2COUT1_36\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \textmode_vga_inst|video_memory_inst|Add2~10_combout\,
	cout0 => \textmode_vga_inst|video_memory_inst|Add2~12\,
	cout1 => \textmode_vga_inst|video_memory_inst|Add2~12COUT1_38\);

-- Location: LC_X34_Y28_N3
\textmode_vga_inst|video_memory_inst|Add2~15\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|video_memory_inst|Add2~15_combout\ = \textmode_vga_inst|console_sm_inst|scroll_int\(2) $ (\textmode_vga_inst|console_sm_inst|line_int\(2) $ ((!\textmode_vga_inst|video_memory_inst|Add2~12\)))
-- \textmode_vga_inst|video_memory_inst|Add2~17\ = CARRY((\textmode_vga_inst|console_sm_inst|scroll_int\(2) & ((\textmode_vga_inst|console_sm_inst|line_int\(2)) # (!\textmode_vga_inst|video_memory_inst|Add2~12\))) # 
-- (!\textmode_vga_inst|console_sm_inst|scroll_int\(2) & (\textmode_vga_inst|console_sm_inst|line_int\(2) & !\textmode_vga_inst|video_memory_inst|Add2~12\)))
-- \textmode_vga_inst|video_memory_inst|Add2~17COUT1_40\ = CARRY((\textmode_vga_inst|console_sm_inst|scroll_int\(2) & ((\textmode_vga_inst|console_sm_inst|line_int\(2)) # (!\textmode_vga_inst|video_memory_inst|Add2~12COUT1_38\))) # 
-- (!\textmode_vga_inst|console_sm_inst|scroll_int\(2) & (\textmode_vga_inst|console_sm_inst|line_int\(2) & !\textmode_vga_inst|video_memory_inst|Add2~12COUT1_38\)))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	lut_mask => "698e",
	operation_mode => "arithmetic",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \textmode_vga_inst|console_sm_inst|scroll_int\(2),
	datab => \textmode_vga_inst|console_sm_inst|line_int\(2),
	cin0 => \textmode_vga_inst|video_memory_inst|Add2~12\,
	cin1 => \textmode_vga_inst|video_memory_inst|Add2~12COUT1_38\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \textmode_vga_inst|video_memory_inst|Add2~15_combout\,
	cout0 => \textmode_vga_inst|video_memory_inst|Add2~17\,
	cout1 => \textmode_vga_inst|video_memory_inst|Add2~17COUT1_40\);

-- Location: LC_X34_Y28_N4
\textmode_vga_inst|video_memory_inst|Add2~20\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|video_memory_inst|Add2~20_combout\ = \textmode_vga_inst|console_sm_inst|line_int\(3) $ (\textmode_vga_inst|console_sm_inst|scroll_int\(3) $ ((\textmode_vga_inst|video_memory_inst|Add2~17\)))
-- \textmode_vga_inst|video_memory_inst|Add2~22\ = CARRY((\textmode_vga_inst|console_sm_inst|line_int\(3) & (!\textmode_vga_inst|console_sm_inst|scroll_int\(3) & !\textmode_vga_inst|video_memory_inst|Add2~17COUT1_40\)) # 
-- (!\textmode_vga_inst|console_sm_inst|line_int\(3) & ((!\textmode_vga_inst|video_memory_inst|Add2~17COUT1_40\) # (!\textmode_vga_inst|console_sm_inst|scroll_int\(3)))))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	lut_mask => "9617",
	operation_mode => "arithmetic",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \textmode_vga_inst|console_sm_inst|line_int\(3),
	datab => \textmode_vga_inst|console_sm_inst|scroll_int\(3),
	cin0 => \textmode_vga_inst|video_memory_inst|Add2~17\,
	cin1 => \textmode_vga_inst|video_memory_inst|Add2~17COUT1_40\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \textmode_vga_inst|video_memory_inst|Add2~20_combout\,
	cout => \textmode_vga_inst|video_memory_inst|Add2~22\);

-- Location: LC_X34_Y28_N5
\textmode_vga_inst|video_memory_inst|Add2~25\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|video_memory_inst|Add2~25_combout\ = \textmode_vga_inst|console_sm_inst|scroll_int\(4) $ (\textmode_vga_inst|console_sm_inst|line_int\(4) $ ((!\textmode_vga_inst|video_memory_inst|Add2~22\)))
-- \textmode_vga_inst|video_memory_inst|Add2~27\ = CARRY((\textmode_vga_inst|console_sm_inst|scroll_int\(4) & ((\textmode_vga_inst|console_sm_inst|line_int\(4)) # (!\textmode_vga_inst|video_memory_inst|Add2~22\))) # 
-- (!\textmode_vga_inst|console_sm_inst|scroll_int\(4) & (\textmode_vga_inst|console_sm_inst|line_int\(4) & !\textmode_vga_inst|video_memory_inst|Add2~22\)))
-- \textmode_vga_inst|video_memory_inst|Add2~27COUT1_42\ = CARRY((\textmode_vga_inst|console_sm_inst|scroll_int\(4) & ((\textmode_vga_inst|console_sm_inst|line_int\(4)) # (!\textmode_vga_inst|video_memory_inst|Add2~22\))) # 
-- (!\textmode_vga_inst|console_sm_inst|scroll_int\(4) & (\textmode_vga_inst|console_sm_inst|line_int\(4) & !\textmode_vga_inst|video_memory_inst|Add2~22\)))

-- pragma translate_off
GENERIC MAP (
	cin_used => "true",
	lut_mask => "698e",
	operation_mode => "arithmetic",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \textmode_vga_inst|console_sm_inst|scroll_int\(4),
	datab => \textmode_vga_inst|console_sm_inst|line_int\(4),
	cin => \textmode_vga_inst|video_memory_inst|Add2~22\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \textmode_vga_inst|video_memory_inst|Add2~25_combout\,
	cout0 => \textmode_vga_inst|video_memory_inst|Add2~27\,
	cout1 => \textmode_vga_inst|video_memory_inst|Add2~27COUT1_42\);

-- Location: LC_X34_Y28_N6
\textmode_vga_inst|video_memory_inst|Add2~5\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|video_memory_inst|Add2~5_combout\ = ((((!\textmode_vga_inst|video_memory_inst|Add2~22\ & \textmode_vga_inst|video_memory_inst|Add2~27\) # (\textmode_vga_inst|video_memory_inst|Add2~22\ & 
-- \textmode_vga_inst|video_memory_inst|Add2~27COUT1_42\))))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	cin_used => "true",
	lut_mask => "f0f0",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	cin => \textmode_vga_inst|video_memory_inst|Add2~22\,
	cin0 => \textmode_vga_inst|video_memory_inst|Add2~27\,
	cin1 => \textmode_vga_inst|video_memory_inst|Add2~27COUT1_42\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \textmode_vga_inst|video_memory_inst|Add2~5_combout\);

-- Location: LC_X32_Y28_N5
\textmode_vga_inst|video_memory_inst|LessThan1~0\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|video_memory_inst|LessThan1~0_combout\ = (((\textmode_vga_inst|video_memory_inst|Add2~15_combout\ & \textmode_vga_inst|video_memory_inst|Add2~10_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "f000",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datac => \textmode_vga_inst|video_memory_inst|Add2~15_combout\,
	datad => \textmode_vga_inst|video_memory_inst|Add2~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \textmode_vga_inst|video_memory_inst|LessThan1~0_combout\);

-- Location: LC_X32_Y28_N8
\textmode_vga_inst|video_memory_inst|LessThan1~1\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|video_memory_inst|LessThan1~1_combout\ = (\textmode_vga_inst|video_memory_inst|Add2~5_combout\) # ((\textmode_vga_inst|video_memory_inst|Add2~20_combout\ & (\textmode_vga_inst|video_memory_inst|LessThan1~0_combout\ & 
-- \textmode_vga_inst|video_memory_inst|Add2~25_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "eaaa",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \textmode_vga_inst|video_memory_inst|Add2~5_combout\,
	datab => \textmode_vga_inst|video_memory_inst|Add2~20_combout\,
	datac => \textmode_vga_inst|video_memory_inst|LessThan1~0_combout\,
	datad => \textmode_vga_inst|video_memory_inst|Add2~25_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \textmode_vga_inst|video_memory_inst|LessThan1~1_combout\);

-- Location: LC_X32_Y28_N0
\textmode_vga_inst|video_memory_inst|Add3~0\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|video_memory_inst|Add3~0_combout\ = \textmode_vga_inst|video_memory_inst|LessThan1~1_combout\ $ ((\textmode_vga_inst|video_memory_inst|Add2~10_combout\))
-- \textmode_vga_inst|video_memory_inst|Add3~2\ = CARRY((\textmode_vga_inst|video_memory_inst|LessThan1~1_combout\ & (\textmode_vga_inst|video_memory_inst|Add2~10_combout\)))
-- \textmode_vga_inst|video_memory_inst|Add3~2COUT1_25\ = CARRY((\textmode_vga_inst|video_memory_inst|LessThan1~1_combout\ & (\textmode_vga_inst|video_memory_inst|Add2~10_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "6688",
	operation_mode => "arithmetic",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \textmode_vga_inst|video_memory_inst|LessThan1~1_combout\,
	datab => \textmode_vga_inst|video_memory_inst|Add2~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \textmode_vga_inst|video_memory_inst|Add3~0_combout\,
	cout0 => \textmode_vga_inst|video_memory_inst|Add3~2\,
	cout1 => \textmode_vga_inst|video_memory_inst|Add3~2COUT1_25\);

-- Location: LC_X32_Y28_N1
\textmode_vga_inst|video_memory_inst|Add3~5\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|video_memory_inst|Add3~5_combout\ = (\textmode_vga_inst|video_memory_inst|Add2~15_combout\ $ ((\textmode_vga_inst|video_memory_inst|Add3~2\)))
-- \textmode_vga_inst|video_memory_inst|Add3~7\ = CARRY(((!\textmode_vga_inst|video_memory_inst|Add3~2\) # (!\textmode_vga_inst|video_memory_inst|Add2~15_combout\)))
-- \textmode_vga_inst|video_memory_inst|Add3~7COUT1_27\ = CARRY(((!\textmode_vga_inst|video_memory_inst|Add3~2COUT1_25\) # (!\textmode_vga_inst|video_memory_inst|Add2~15_combout\)))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	lut_mask => "3c3f",
	operation_mode => "arithmetic",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \textmode_vga_inst|video_memory_inst|Add2~15_combout\,
	cin0 => \textmode_vga_inst|video_memory_inst|Add3~2\,
	cin1 => \textmode_vga_inst|video_memory_inst|Add3~2COUT1_25\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \textmode_vga_inst|video_memory_inst|Add3~5_combout\,
	cout0 => \textmode_vga_inst|video_memory_inst|Add3~7\,
	cout1 => \textmode_vga_inst|video_memory_inst|Add3~7COUT1_27\);

-- Location: LC_X32_Y28_N2
\textmode_vga_inst|video_memory_inst|Add3~10\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|video_memory_inst|Add3~10_combout\ = (\textmode_vga_inst|video_memory_inst|Add2~20_combout\ $ ((!\textmode_vga_inst|video_memory_inst|Add3~7\)))
-- \textmode_vga_inst|video_memory_inst|Add3~12\ = CARRY(((\textmode_vga_inst|video_memory_inst|Add2~20_combout\ & !\textmode_vga_inst|video_memory_inst|Add3~7\)))
-- \textmode_vga_inst|video_memory_inst|Add3~12COUT1_29\ = CARRY(((\textmode_vga_inst|video_memory_inst|Add2~20_combout\ & !\textmode_vga_inst|video_memory_inst|Add3~7COUT1_27\)))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	lut_mask => "c30c",
	operation_mode => "arithmetic",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \textmode_vga_inst|video_memory_inst|Add2~20_combout\,
	cin0 => \textmode_vga_inst|video_memory_inst|Add3~7\,
	cin1 => \textmode_vga_inst|video_memory_inst|Add3~7COUT1_27\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \textmode_vga_inst|video_memory_inst|Add3~10_combout\,
	cout0 => \textmode_vga_inst|video_memory_inst|Add3~12\,
	cout1 => \textmode_vga_inst|video_memory_inst|Add3~12COUT1_29\);

-- Location: LC_X32_Y28_N3
\textmode_vga_inst|video_memory_inst|Add3~15\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|video_memory_inst|Add3~15_combout\ = ((\textmode_vga_inst|video_memory_inst|Add3~12\ $ (\textmode_vga_inst|video_memory_inst|Add2~25_combout\)))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	lut_mask => "0ff0",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datad => \textmode_vga_inst|video_memory_inst|Add2~25_combout\,
	cin0 => \textmode_vga_inst|video_memory_inst|Add3~12\,
	cin1 => \textmode_vga_inst|video_memory_inst|Add3~12COUT1_29\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \textmode_vga_inst|video_memory_inst|Add3~15_combout\);

-- Location: LC_X35_Y28_N1
\textmode_vga_inst|video_memory_inst|ram.raddr_a[7]~0\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|video_memory_inst|ram.raddr_a[7]~0_combout\ = \textmode_vga_inst|console_sm_inst|scroll_int\(0) $ ((\textmode_vga_inst|textmode_vga_v_sm_inst|char_line_cnt_int\(0)))
-- \textmode_vga_inst|video_memory_inst|ram.raddr_a[7]~2\ = CARRY((\textmode_vga_inst|console_sm_inst|scroll_int\(0) & (\textmode_vga_inst|textmode_vga_v_sm_inst|char_line_cnt_int\(0))))
-- \textmode_vga_inst|video_memory_inst|ram.raddr_a[7]~2COUT1_8\ = CARRY((\textmode_vga_inst|console_sm_inst|scroll_int\(0) & (\textmode_vga_inst|textmode_vga_v_sm_inst|char_line_cnt_int\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "6688",
	operation_mode => "arithmetic",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \textmode_vga_inst|console_sm_inst|scroll_int\(0),
	datab => \textmode_vga_inst|textmode_vga_v_sm_inst|char_line_cnt_int\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \textmode_vga_inst|video_memory_inst|ram.raddr_a[7]~0_combout\,
	cout0 => \textmode_vga_inst|video_memory_inst|ram.raddr_a[7]~2\,
	cout1 => \textmode_vga_inst|video_memory_inst|ram.raddr_a[7]~2COUT1_8\);

-- Location: LC_X35_Y28_N2
\textmode_vga_inst|video_memory_inst|Add0~5\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|video_memory_inst|Add0~5_combout\ = \textmode_vga_inst|console_sm_inst|scroll_int\(1) $ (\textmode_vga_inst|textmode_vga_v_sm_inst|char_line_cnt_int\(1) $ ((\textmode_vga_inst|video_memory_inst|ram.raddr_a[7]~2\)))
-- \textmode_vga_inst|video_memory_inst|Add0~7\ = CARRY((\textmode_vga_inst|console_sm_inst|scroll_int\(1) & (!\textmode_vga_inst|textmode_vga_v_sm_inst|char_line_cnt_int\(1) & !\textmode_vga_inst|video_memory_inst|ram.raddr_a[7]~2\)) # 
-- (!\textmode_vga_inst|console_sm_inst|scroll_int\(1) & ((!\textmode_vga_inst|video_memory_inst|ram.raddr_a[7]~2\) # (!\textmode_vga_inst|textmode_vga_v_sm_inst|char_line_cnt_int\(1)))))
-- \textmode_vga_inst|video_memory_inst|Add0~7COUT1_30\ = CARRY((\textmode_vga_inst|console_sm_inst|scroll_int\(1) & (!\textmode_vga_inst|textmode_vga_v_sm_inst|char_line_cnt_int\(1) & !\textmode_vga_inst|video_memory_inst|ram.raddr_a[7]~2COUT1_8\)) # 
-- (!\textmode_vga_inst|console_sm_inst|scroll_int\(1) & ((!\textmode_vga_inst|video_memory_inst|ram.raddr_a[7]~2COUT1_8\) # (!\textmode_vga_inst|textmode_vga_v_sm_inst|char_line_cnt_int\(1)))))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	lut_mask => "9617",
	operation_mode => "arithmetic",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \textmode_vga_inst|console_sm_inst|scroll_int\(1),
	datab => \textmode_vga_inst|textmode_vga_v_sm_inst|char_line_cnt_int\(1),
	cin0 => \textmode_vga_inst|video_memory_inst|ram.raddr_a[7]~2\,
	cin1 => \textmode_vga_inst|video_memory_inst|ram.raddr_a[7]~2COUT1_8\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \textmode_vga_inst|video_memory_inst|Add0~5_combout\,
	cout0 => \textmode_vga_inst|video_memory_inst|Add0~7\,
	cout1 => \textmode_vga_inst|video_memory_inst|Add0~7COUT1_30\);

-- Location: LC_X35_Y28_N3
\textmode_vga_inst|video_memory_inst|Add0~10\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|video_memory_inst|Add0~10_combout\ = \textmode_vga_inst|textmode_vga_v_sm_inst|char_line_cnt_int\(2) $ (\textmode_vga_inst|console_sm_inst|scroll_int\(2) $ ((!\textmode_vga_inst|video_memory_inst|Add0~7\)))
-- \textmode_vga_inst|video_memory_inst|Add0~12\ = CARRY((\textmode_vga_inst|textmode_vga_v_sm_inst|char_line_cnt_int\(2) & ((\textmode_vga_inst|console_sm_inst|scroll_int\(2)) # (!\textmode_vga_inst|video_memory_inst|Add0~7\))) # 
-- (!\textmode_vga_inst|textmode_vga_v_sm_inst|char_line_cnt_int\(2) & (\textmode_vga_inst|console_sm_inst|scroll_int\(2) & !\textmode_vga_inst|video_memory_inst|Add0~7\)))
-- \textmode_vga_inst|video_memory_inst|Add0~12COUT1_32\ = CARRY((\textmode_vga_inst|textmode_vga_v_sm_inst|char_line_cnt_int\(2) & ((\textmode_vga_inst|console_sm_inst|scroll_int\(2)) # (!\textmode_vga_inst|video_memory_inst|Add0~7COUT1_30\))) # 
-- (!\textmode_vga_inst|textmode_vga_v_sm_inst|char_line_cnt_int\(2) & (\textmode_vga_inst|console_sm_inst|scroll_int\(2) & !\textmode_vga_inst|video_memory_inst|Add0~7COUT1_30\)))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	lut_mask => "698e",
	operation_mode => "arithmetic",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \textmode_vga_inst|textmode_vga_v_sm_inst|char_line_cnt_int\(2),
	datab => \textmode_vga_inst|console_sm_inst|scroll_int\(2),
	cin0 => \textmode_vga_inst|video_memory_inst|Add0~7\,
	cin1 => \textmode_vga_inst|video_memory_inst|Add0~7COUT1_30\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \textmode_vga_inst|video_memory_inst|Add0~10_combout\,
	cout0 => \textmode_vga_inst|video_memory_inst|Add0~12\,
	cout1 => \textmode_vga_inst|video_memory_inst|Add0~12COUT1_32\);

-- Location: LC_X35_Y28_N4
\textmode_vga_inst|video_memory_inst|Add0~15\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|video_memory_inst|Add0~15_combout\ = \textmode_vga_inst|console_sm_inst|scroll_int\(3) $ (\textmode_vga_inst|textmode_vga_v_sm_inst|char_line_cnt_int\(3) $ ((\textmode_vga_inst|video_memory_inst|Add0~12\)))
-- \textmode_vga_inst|video_memory_inst|Add0~17\ = CARRY((\textmode_vga_inst|console_sm_inst|scroll_int\(3) & (!\textmode_vga_inst|textmode_vga_v_sm_inst|char_line_cnt_int\(3) & !\textmode_vga_inst|video_memory_inst|Add0~12COUT1_32\)) # 
-- (!\textmode_vga_inst|console_sm_inst|scroll_int\(3) & ((!\textmode_vga_inst|video_memory_inst|Add0~12COUT1_32\) # (!\textmode_vga_inst|textmode_vga_v_sm_inst|char_line_cnt_int\(3)))))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	lut_mask => "9617",
	operation_mode => "arithmetic",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \textmode_vga_inst|console_sm_inst|scroll_int\(3),
	datab => \textmode_vga_inst|textmode_vga_v_sm_inst|char_line_cnt_int\(3),
	cin0 => \textmode_vga_inst|video_memory_inst|Add0~12\,
	cin1 => \textmode_vga_inst|video_memory_inst|Add0~12COUT1_32\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \textmode_vga_inst|video_memory_inst|Add0~15_combout\,
	cout => \textmode_vga_inst|video_memory_inst|Add0~17\);

-- Location: LC_X35_Y28_N5
\textmode_vga_inst|video_memory_inst|Add0~20\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|video_memory_inst|Add0~20_combout\ = \textmode_vga_inst|console_sm_inst|scroll_int\(4) $ (\textmode_vga_inst|textmode_vga_v_sm_inst|char_line_cnt_int\(4) $ ((!\textmode_vga_inst|video_memory_inst|Add0~17\)))
-- \textmode_vga_inst|video_memory_inst|Add0~22\ = CARRY((\textmode_vga_inst|console_sm_inst|scroll_int\(4) & ((\textmode_vga_inst|textmode_vga_v_sm_inst|char_line_cnt_int\(4)) # (!\textmode_vga_inst|video_memory_inst|Add0~17\))) # 
-- (!\textmode_vga_inst|console_sm_inst|scroll_int\(4) & (\textmode_vga_inst|textmode_vga_v_sm_inst|char_line_cnt_int\(4) & !\textmode_vga_inst|video_memory_inst|Add0~17\)))
-- \textmode_vga_inst|video_memory_inst|Add0~22COUT1_34\ = CARRY((\textmode_vga_inst|console_sm_inst|scroll_int\(4) & ((\textmode_vga_inst|textmode_vga_v_sm_inst|char_line_cnt_int\(4)) # (!\textmode_vga_inst|video_memory_inst|Add0~17\))) # 
-- (!\textmode_vga_inst|console_sm_inst|scroll_int\(4) & (\textmode_vga_inst|textmode_vga_v_sm_inst|char_line_cnt_int\(4) & !\textmode_vga_inst|video_memory_inst|Add0~17\)))

-- pragma translate_off
GENERIC MAP (
	cin_used => "true",
	lut_mask => "698e",
	operation_mode => "arithmetic",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \textmode_vga_inst|console_sm_inst|scroll_int\(4),
	datab => \textmode_vga_inst|textmode_vga_v_sm_inst|char_line_cnt_int\(4),
	cin => \textmode_vga_inst|video_memory_inst|Add0~17\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \textmode_vga_inst|video_memory_inst|Add0~20_combout\,
	cout0 => \textmode_vga_inst|video_memory_inst|Add0~22\,
	cout1 => \textmode_vga_inst|video_memory_inst|Add0~22COUT1_34\);

-- Location: LC_X35_Y28_N6
\textmode_vga_inst|video_memory_inst|Add0~0\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|video_memory_inst|Add0~0_combout\ = ((((!\textmode_vga_inst|video_memory_inst|Add0~17\ & \textmode_vga_inst|video_memory_inst|Add0~22\) # (\textmode_vga_inst|video_memory_inst|Add0~17\ & 
-- \textmode_vga_inst|video_memory_inst|Add0~22COUT1_34\))))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	cin_used => "true",
	lut_mask => "f0f0",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	cin => \textmode_vga_inst|video_memory_inst|Add0~17\,
	cin0 => \textmode_vga_inst|video_memory_inst|Add0~22\,
	cin1 => \textmode_vga_inst|video_memory_inst|Add0~22COUT1_34\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \textmode_vga_inst|video_memory_inst|Add0~0_combout\);

-- Location: LC_X36_Y28_N3
\textmode_vga_inst|video_memory_inst|LessThan0~0\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|video_memory_inst|LessThan0~0_combout\ = (((\textmode_vga_inst|video_memory_inst|Add0~10_combout\ & \textmode_vga_inst|video_memory_inst|Add0~5_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "f000",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datac => \textmode_vga_inst|video_memory_inst|Add0~10_combout\,
	datad => \textmode_vga_inst|video_memory_inst|Add0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \textmode_vga_inst|video_memory_inst|LessThan0~0_combout\);

-- Location: LC_X36_Y28_N4
\textmode_vga_inst|video_memory_inst|LessThan0~1\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|video_memory_inst|LessThan0~1_combout\ = (\textmode_vga_inst|video_memory_inst|Add0~0_combout\) # ((\textmode_vga_inst|video_memory_inst|Add0~20_combout\ & (\textmode_vga_inst|video_memory_inst|LessThan0~0_combout\ & 
-- \textmode_vga_inst|video_memory_inst|Add0~15_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "eccc",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \textmode_vga_inst|video_memory_inst|Add0~20_combout\,
	datab => \textmode_vga_inst|video_memory_inst|Add0~0_combout\,
	datac => \textmode_vga_inst|video_memory_inst|LessThan0~0_combout\,
	datad => \textmode_vga_inst|video_memory_inst|Add0~15_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \textmode_vga_inst|video_memory_inst|LessThan0~1_combout\);

-- Location: LC_X36_Y28_N5
\textmode_vga_inst|video_memory_inst|Add1~0\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|video_memory_inst|Add1~0_combout\ = \textmode_vga_inst|video_memory_inst|LessThan0~1_combout\ $ ((\textmode_vga_inst|video_memory_inst|Add0~5_combout\))
-- \textmode_vga_inst|video_memory_inst|Add1~2\ = CARRY((\textmode_vga_inst|video_memory_inst|LessThan0~1_combout\ & (\textmode_vga_inst|video_memory_inst|Add0~5_combout\)))
-- \textmode_vga_inst|video_memory_inst|Add1~2COUT1_25\ = CARRY((\textmode_vga_inst|video_memory_inst|LessThan0~1_combout\ & (\textmode_vga_inst|video_memory_inst|Add0~5_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "6688",
	operation_mode => "arithmetic",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \textmode_vga_inst|video_memory_inst|LessThan0~1_combout\,
	datab => \textmode_vga_inst|video_memory_inst|Add0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \textmode_vga_inst|video_memory_inst|Add1~0_combout\,
	cout0 => \textmode_vga_inst|video_memory_inst|Add1~2\,
	cout1 => \textmode_vga_inst|video_memory_inst|Add1~2COUT1_25\);

-- Location: LC_X36_Y28_N6
\textmode_vga_inst|video_memory_inst|Add1~5\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|video_memory_inst|Add1~5_combout\ = (\textmode_vga_inst|video_memory_inst|Add0~10_combout\ $ ((\textmode_vga_inst|video_memory_inst|Add1~2\)))
-- \textmode_vga_inst|video_memory_inst|Add1~7\ = CARRY(((!\textmode_vga_inst|video_memory_inst|Add1~2\) # (!\textmode_vga_inst|video_memory_inst|Add0~10_combout\)))
-- \textmode_vga_inst|video_memory_inst|Add1~7COUT1_27\ = CARRY(((!\textmode_vga_inst|video_memory_inst|Add1~2COUT1_25\) # (!\textmode_vga_inst|video_memory_inst|Add0~10_combout\)))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	lut_mask => "3c3f",
	operation_mode => "arithmetic",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \textmode_vga_inst|video_memory_inst|Add0~10_combout\,
	cin0 => \textmode_vga_inst|video_memory_inst|Add1~2\,
	cin1 => \textmode_vga_inst|video_memory_inst|Add1~2COUT1_25\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \textmode_vga_inst|video_memory_inst|Add1~5_combout\,
	cout0 => \textmode_vga_inst|video_memory_inst|Add1~7\,
	cout1 => \textmode_vga_inst|video_memory_inst|Add1~7COUT1_27\);

-- Location: LC_X36_Y28_N7
\textmode_vga_inst|video_memory_inst|Add1~10\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|video_memory_inst|Add1~10_combout\ = (\textmode_vga_inst|video_memory_inst|Add0~15_combout\ $ ((!\textmode_vga_inst|video_memory_inst|Add1~7\)))
-- \textmode_vga_inst|video_memory_inst|Add1~12\ = CARRY(((\textmode_vga_inst|video_memory_inst|Add0~15_combout\ & !\textmode_vga_inst|video_memory_inst|Add1~7\)))
-- \textmode_vga_inst|video_memory_inst|Add1~12COUT1_29\ = CARRY(((\textmode_vga_inst|video_memory_inst|Add0~15_combout\ & !\textmode_vga_inst|video_memory_inst|Add1~7COUT1_27\)))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	lut_mask => "c30c",
	operation_mode => "arithmetic",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \textmode_vga_inst|video_memory_inst|Add0~15_combout\,
	cin0 => \textmode_vga_inst|video_memory_inst|Add1~7\,
	cin1 => \textmode_vga_inst|video_memory_inst|Add1~7COUT1_27\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \textmode_vga_inst|video_memory_inst|Add1~10_combout\,
	cout0 => \textmode_vga_inst|video_memory_inst|Add1~12\,
	cout1 => \textmode_vga_inst|video_memory_inst|Add1~12COUT1_29\);

-- Location: LC_X36_Y28_N8
\textmode_vga_inst|video_memory_inst|Add1~15\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|video_memory_inst|Add1~15_combout\ = ((\textmode_vga_inst|video_memory_inst|Add1~12\ $ (\textmode_vga_inst|video_memory_inst|Add0~20_combout\)))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	lut_mask => "0ff0",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datad => \textmode_vga_inst|video_memory_inst|Add0~20_combout\,
	cin0 => \textmode_vga_inst|video_memory_inst|Add1~12\,
	cin1 => \textmode_vga_inst|video_memory_inst|Add1~12COUT1_29\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \textmode_vga_inst|video_memory_inst|Add1~15_combout\);

-- Location: M4K_X15_Y26
\textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a0\ : stratix_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init1 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init0 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "db/mjl_stratix.ram0_video_memory_e8996fde.hdl.mif",
	init_file_layout => "port_a",
	logical_ram_name => "textmode_vga:textmode_vga_inst|video_memory:video_memory_inst|altsyncram:ram_rtl_0|altsyncram_cgm1:auto_generated|ALTSYNCRAM",
	mixed_port_feed_through_mode => "old",
	operation_mode => "dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 12,
	port_a_byte_enable_clear => "none",
	port_a_byte_enable_clock => "none",
	port_a_data_in_clear => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 0,
	port_a_last_address => 4095,
	port_a_logical_ram_depth => 4096,
	port_a_logical_ram_width => 16,
	port_a_write_enable_clear => "none",
	port_b_address_clear => "none",
	port_b_address_clock => "clock0",
	port_b_address_width => 12,
	port_b_byte_enable_clear => "none",
	port_b_data_in_clear => "none",
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "none",
	port_b_data_width => 1,
	port_b_first_address => 0,
	port_b_first_bit_number => 0,
	port_b_last_address => 4095,
	port_b_logical_ram_depth => 4096,
	port_b_logical_ram_width => 16,
	port_b_read_enable_write_enable_clear => "none",
	port_b_read_enable_write_enable_clock => "clock0",
	ram_block_type => "M4K")
-- pragma translate_on
PORT MAP (
	portawe => \textmode_vga_inst|console_sm_inst|WideOr12~0_combout\,
	portbrewe => VCC,
	clk0 => \pll_vga_clk|altpll_component|_clk0\,
	portadatain => \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a0_PORTADATAIN_bus\,
	portaaddr => \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a0_PORTAADDR_bus\,
	portbaddr => \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a0_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portbdataout => \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\);

-- Location: M4K_X15_Y28
\textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a1\ : stratix_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init1 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init0 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "db/mjl_stratix.ram0_video_memory_e8996fde.hdl.mif",
	init_file_layout => "port_a",
	logical_ram_name => "textmode_vga:textmode_vga_inst|video_memory:video_memory_inst|altsyncram:ram_rtl_0|altsyncram_cgm1:auto_generated|ALTSYNCRAM",
	mixed_port_feed_through_mode => "old",
	operation_mode => "dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 12,
	port_a_byte_enable_clear => "none",
	port_a_byte_enable_clock => "none",
	port_a_data_in_clear => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 1,
	port_a_last_address => 4095,
	port_a_logical_ram_depth => 4096,
	port_a_logical_ram_width => 16,
	port_a_write_enable_clear => "none",
	port_b_address_clear => "none",
	port_b_address_clock => "clock0",
	port_b_address_width => 12,
	port_b_byte_enable_clear => "none",
	port_b_data_in_clear => "none",
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "none",
	port_b_data_width => 1,
	port_b_first_address => 0,
	port_b_first_bit_number => 1,
	port_b_last_address => 4095,
	port_b_logical_ram_depth => 4096,
	port_b_logical_ram_width => 16,
	port_b_read_enable_write_enable_clear => "none",
	port_b_read_enable_write_enable_clock => "clock0",
	ram_block_type => "M4K")
-- pragma translate_on
PORT MAP (
	portawe => \textmode_vga_inst|console_sm_inst|WideOr12~0_combout\,
	portbrewe => VCC,
	clk0 => \pll_vga_clk|altpll_component|_clk0\,
	portadatain => \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a1_PORTADATAIN_bus\,
	portaaddr => \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a1_PORTAADDR_bus\,
	portbaddr => \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a1_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portbdataout => \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a1_PORTBDATAOUT_bus\);

-- Location: M4K_X15_Y24
\textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a2\ : stratix_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init1 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init0 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "db/mjl_stratix.ram0_video_memory_e8996fde.hdl.mif",
	init_file_layout => "port_a",
	logical_ram_name => "textmode_vga:textmode_vga_inst|video_memory:video_memory_inst|altsyncram:ram_rtl_0|altsyncram_cgm1:auto_generated|ALTSYNCRAM",
	mixed_port_feed_through_mode => "old",
	operation_mode => "dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 12,
	port_a_byte_enable_clear => "none",
	port_a_byte_enable_clock => "none",
	port_a_data_in_clear => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 2,
	port_a_last_address => 4095,
	port_a_logical_ram_depth => 4096,
	port_a_logical_ram_width => 16,
	port_a_write_enable_clear => "none",
	port_b_address_clear => "none",
	port_b_address_clock => "clock0",
	port_b_address_width => 12,
	port_b_byte_enable_clear => "none",
	port_b_data_in_clear => "none",
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "none",
	port_b_data_width => 1,
	port_b_first_address => 0,
	port_b_first_bit_number => 2,
	port_b_last_address => 4095,
	port_b_logical_ram_depth => 4096,
	port_b_logical_ram_width => 16,
	port_b_read_enable_write_enable_clear => "none",
	port_b_read_enable_write_enable_clock => "clock0",
	ram_block_type => "M4K")
-- pragma translate_on
PORT MAP (
	portawe => \textmode_vga_inst|console_sm_inst|WideOr12~0_combout\,
	portbrewe => VCC,
	clk0 => \pll_vga_clk|altpll_component|_clk0\,
	portadatain => \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a2_PORTADATAIN_bus\,
	portaaddr => \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a2_PORTAADDR_bus\,
	portbaddr => \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a2_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portbdataout => \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a2_PORTBDATAOUT_bus\);

-- Location: M4K_X15_Y27
\textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a3\ : stratix_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init1 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init0 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "db/mjl_stratix.ram0_video_memory_e8996fde.hdl.mif",
	init_file_layout => "port_a",
	logical_ram_name => "textmode_vga:textmode_vga_inst|video_memory:video_memory_inst|altsyncram:ram_rtl_0|altsyncram_cgm1:auto_generated|ALTSYNCRAM",
	mixed_port_feed_through_mode => "old",
	operation_mode => "dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 12,
	port_a_byte_enable_clear => "none",
	port_a_byte_enable_clock => "none",
	port_a_data_in_clear => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 3,
	port_a_last_address => 4095,
	port_a_logical_ram_depth => 4096,
	port_a_logical_ram_width => 16,
	port_a_write_enable_clear => "none",
	port_b_address_clear => "none",
	port_b_address_clock => "clock0",
	port_b_address_width => 12,
	port_b_byte_enable_clear => "none",
	port_b_data_in_clear => "none",
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "none",
	port_b_data_width => 1,
	port_b_first_address => 0,
	port_b_first_bit_number => 3,
	port_b_last_address => 4095,
	port_b_logical_ram_depth => 4096,
	port_b_logical_ram_width => 16,
	port_b_read_enable_write_enable_clear => "none",
	port_b_read_enable_write_enable_clock => "clock0",
	ram_block_type => "M4K")
-- pragma translate_on
PORT MAP (
	portawe => \textmode_vga_inst|console_sm_inst|WideOr12~0_combout\,
	portbrewe => VCC,
	clk0 => \pll_vga_clk|altpll_component|_clk0\,
	portadatain => \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a3_PORTADATAIN_bus\,
	portaaddr => \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a3_PORTAADDR_bus\,
	portbaddr => \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a3_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portbdataout => \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a3_PORTBDATAOUT_bus\);

-- Location: M4K_X15_Y31
\textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a4\ : stratix_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init1 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init0 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "db/mjl_stratix.ram0_video_memory_e8996fde.hdl.mif",
	init_file_layout => "port_a",
	logical_ram_name => "textmode_vga:textmode_vga_inst|video_memory:video_memory_inst|altsyncram:ram_rtl_0|altsyncram_cgm1:auto_generated|ALTSYNCRAM",
	mixed_port_feed_through_mode => "old",
	operation_mode => "dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 12,
	port_a_byte_enable_clear => "none",
	port_a_byte_enable_clock => "none",
	port_a_data_in_clear => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 4,
	port_a_last_address => 4095,
	port_a_logical_ram_depth => 4096,
	port_a_logical_ram_width => 16,
	port_a_write_enable_clear => "none",
	port_b_address_clear => "none",
	port_b_address_clock => "clock0",
	port_b_address_width => 12,
	port_b_byte_enable_clear => "none",
	port_b_data_in_clear => "none",
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "none",
	port_b_data_width => 1,
	port_b_first_address => 0,
	port_b_first_bit_number => 4,
	port_b_last_address => 4095,
	port_b_logical_ram_depth => 4096,
	port_b_logical_ram_width => 16,
	port_b_read_enable_write_enable_clear => "none",
	port_b_read_enable_write_enable_clock => "clock0",
	ram_block_type => "M4K")
-- pragma translate_on
PORT MAP (
	portawe => \textmode_vga_inst|console_sm_inst|WideOr12~0_combout\,
	portbrewe => VCC,
	clk0 => \pll_vga_clk|altpll_component|_clk0\,
	portadatain => \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a4_PORTADATAIN_bus\,
	portaaddr => \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a4_PORTAADDR_bus\,
	portbaddr => \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a4_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portbdataout => \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a4_PORTBDATAOUT_bus\);

-- Location: M4K_X15_Y29
\textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a5\ : stratix_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init1 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init0 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "db/mjl_stratix.ram0_video_memory_e8996fde.hdl.mif",
	init_file_layout => "port_a",
	logical_ram_name => "textmode_vga:textmode_vga_inst|video_memory:video_memory_inst|altsyncram:ram_rtl_0|altsyncram_cgm1:auto_generated|ALTSYNCRAM",
	mixed_port_feed_through_mode => "old",
	operation_mode => "dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 12,
	port_a_byte_enable_clear => "none",
	port_a_byte_enable_clock => "none",
	port_a_data_in_clear => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 5,
	port_a_last_address => 4095,
	port_a_logical_ram_depth => 4096,
	port_a_logical_ram_width => 16,
	port_a_write_enable_clear => "none",
	port_b_address_clear => "none",
	port_b_address_clock => "clock0",
	port_b_address_width => 12,
	port_b_byte_enable_clear => "none",
	port_b_data_in_clear => "none",
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "none",
	port_b_data_width => 1,
	port_b_first_address => 0,
	port_b_first_bit_number => 5,
	port_b_last_address => 4095,
	port_b_logical_ram_depth => 4096,
	port_b_logical_ram_width => 16,
	port_b_read_enable_write_enable_clear => "none",
	port_b_read_enable_write_enable_clock => "clock0",
	ram_block_type => "M4K")
-- pragma translate_on
PORT MAP (
	portawe => \textmode_vga_inst|console_sm_inst|WideOr12~0_combout\,
	portbrewe => VCC,
	clk0 => \pll_vga_clk|altpll_component|_clk0\,
	portadatain => \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a5_PORTADATAIN_bus\,
	portaaddr => \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a5_PORTAADDR_bus\,
	portbaddr => \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a5_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portbdataout => \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a5_PORTBDATAOUT_bus\);

-- Location: M4K_X15_Y30
\textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a6\ : stratix_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init1 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init0 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "db/mjl_stratix.ram0_video_memory_e8996fde.hdl.mif",
	init_file_layout => "port_a",
	logical_ram_name => "textmode_vga:textmode_vga_inst|video_memory:video_memory_inst|altsyncram:ram_rtl_0|altsyncram_cgm1:auto_generated|ALTSYNCRAM",
	mixed_port_feed_through_mode => "old",
	operation_mode => "dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 12,
	port_a_byte_enable_clear => "none",
	port_a_byte_enable_clock => "none",
	port_a_data_in_clear => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 6,
	port_a_last_address => 4095,
	port_a_logical_ram_depth => 4096,
	port_a_logical_ram_width => 16,
	port_a_write_enable_clear => "none",
	port_b_address_clear => "none",
	port_b_address_clock => "clock0",
	port_b_address_width => 12,
	port_b_byte_enable_clear => "none",
	port_b_data_in_clear => "none",
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "none",
	port_b_data_width => 1,
	port_b_first_address => 0,
	port_b_first_bit_number => 6,
	port_b_last_address => 4095,
	port_b_logical_ram_depth => 4096,
	port_b_logical_ram_width => 16,
	port_b_read_enable_write_enable_clear => "none",
	port_b_read_enable_write_enable_clock => "clock0",
	ram_block_type => "M4K")
-- pragma translate_on
PORT MAP (
	portawe => \textmode_vga_inst|console_sm_inst|WideOr12~0_combout\,
	portbrewe => VCC,
	clk0 => \pll_vga_clk|altpll_component|_clk0\,
	portadatain => \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a6_PORTADATAIN_bus\,
	portaaddr => \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a6_PORTAADDR_bus\,
	portbaddr => \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a6_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portbdataout => \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a6_PORTBDATAOUT_bus\);

-- Location: M4K_X15_Y25
\textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a7\ : stratix_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init1 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init0 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "db/mjl_stratix.ram0_video_memory_e8996fde.hdl.mif",
	init_file_layout => "port_a",
	logical_ram_name => "textmode_vga:textmode_vga_inst|video_memory:video_memory_inst|altsyncram:ram_rtl_0|altsyncram_cgm1:auto_generated|ALTSYNCRAM",
	mixed_port_feed_through_mode => "old",
	operation_mode => "dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 12,
	port_a_byte_enable_clear => "none",
	port_a_byte_enable_clock => "none",
	port_a_data_in_clear => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 7,
	port_a_last_address => 4095,
	port_a_logical_ram_depth => 4096,
	port_a_logical_ram_width => 16,
	port_a_write_enable_clear => "none",
	port_b_address_clear => "none",
	port_b_address_clock => "clock0",
	port_b_address_width => 12,
	port_b_byte_enable_clear => "none",
	port_b_data_in_clear => "none",
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "none",
	port_b_data_width => 1,
	port_b_first_address => 0,
	port_b_first_bit_number => 7,
	port_b_last_address => 4095,
	port_b_logical_ram_depth => 4096,
	port_b_logical_ram_width => 16,
	port_b_read_enable_write_enable_clear => "none",
	port_b_read_enable_write_enable_clock => "clock0",
	ram_block_type => "M4K")
-- pragma translate_on
PORT MAP (
	portawe => \textmode_vga_inst|console_sm_inst|WideOr12~0_combout\,
	portbrewe => VCC,
	clk0 => \pll_vga_clk|altpll_component|_clk0\,
	portadatain => \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a7_PORTADATAIN_bus\,
	portaaddr => \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a7_PORTAADDR_bus\,
	portbaddr => \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a7_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portbdataout => \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a7_PORTBDATAOUT_bus\);

-- Location: M4K_X39_Y33
\textmode_vga_inst|font_rom_inst|Mux0_rtl_1|auto_generated|ram_block1a1\ : stratix_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init1 => X"000007F000440042000000000002000C2000008019EE007C032A5000084000800000000200784FE00FF80FFA0FF80FFC7FFC7FE00FFB0FEC0FF80FFA0FFC0FF8007F00000000FF80FFFF0000008000020002000000000FF80FFA0FFA0FFC07800FF000A000A0000000A000A0000000000FF30FAC0080008000000080008000000080029803F000A000A0000000A004040FF00FF30FF300800000FFFF5555AAAA036001C00000033E033E004004040F80009800980FFB0FEC0FE80FE800000FA80C4006601FFC0FFC0FE00FFA0FFA4FE40FE20FEC0FE20FE40FE80FF80F200FF80FE20FE20002000800040FE20FE40FE82FE00FA40FA20FA40FA80FE00FE427F8",
	mem_init0 => X"07C000060804000000400E604FE00C600FE007E00FE000200CE00FE00FE07FE00FE00FE00FE000000FFC300000000FFC6FE008400FE00FC00FE00FFC0FA000002000000C0000007000000F0C003C0F3C0FFC03FC0FFC001C0E3C0FFC0FFC0FFC0FFC0FFC0FFC0FFC0FFC0F0000000FFC07F80FFC0FFC0FFC07F80FFC0FF00FF8001C08080120008000000000087C0FFC000C0FF80C7C00E00C0C0F0C081007F80600000000800000008002A00000000000100FD806300C7C0FF8000E0000000000F0078001C003C001C000800200001009100F0019EE007C0DFC0110004007FC02A01FFC0E0002780FC0FC3F03C0FFFF000001E001C001C003F00FFC08040000",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "mjl_stratix.calc_top0.rtl.mif",
	init_file_layout => "port_a",
	logical_ram_name => "textmode_vga:textmode_vga_inst|font_rom:font_rom_inst|altsyncram:Mux0_rtl_1|altsyncram_7sv:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 12,
	port_a_byte_enable_clear => "none",
	port_a_byte_enable_clock => "none",
	port_a_data_in_clear => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 0,
	port_a_last_address => 4095,
	port_a_logical_ram_depth => 4096,
	port_a_logical_ram_width => 8,
	port_a_write_enable_clear => "none",
	port_a_write_enable_clock => "none",
	port_b_address_width => 12,
	port_b_data_width => 1,
	ram_block_type => "M4K")
-- pragma translate_on
PORT MAP (
	clk0 => \pll_vga_clk|altpll_component|_clk0\,
	portaaddr => \textmode_vga_inst|font_rom_inst|Mux0_rtl_1|auto_generated|ram_block1a1_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \textmode_vga_inst|font_rom_inst|Mux0_rtl_1|auto_generated|ram_block1a1_PORTADATAOUT_bus\);

-- Location: M4K_X39_Y32
\textmode_vga_inst|font_rom_inst|Mux0_rtl_1|auto_generated|ram_block1a0\ : stratix_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init1 => X"000000000000000000000000000200000000000008C40038062250000000008000000002000047E007F807F807F808044004400007F207C807F007F00FF807F0007F00000000FF80FFFF0000008000000000000000000808080A0808084400000BD000A000A0000000A000A0000000000FE207080080008000000080008000000080000001E000A000A0000000A003F80FE00FE20FE2008000005555AAAA000002200080000006040604004003F80700000000000FFA002807E007C0000007000400042007F80C2007C007FA07F207E407E007E807C007C407C00FF0062008080FC00FC200000000000007C007C407C007C0070007000704070007C007E403F0",
	mem_init0 => X"078000040000000000000C6047E0082007E003E007E000200440082007C0402007C000200FE00000080400000000080427C0000007C0078007C0000407000000200000080000003800000E1C00000C0C07FC01FC07FC00000618080407F8080407F80FFC0FFC08040804070000000FFC03F008040804080403F008040FE007F0001800000000000000000000003807B8000C07F0047C00C004080E08000003F00C000000008000000000008000000000000007800C300638022000000000000000300600008003C0008000800000000000000F0008C400380000000000400FFE02A01C000C0000000780FFFF0000FFFF000000C001C0008001E007F807F80000",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "mjl_stratix.calc_top0.rtl.mif",
	init_file_layout => "port_a",
	logical_ram_name => "textmode_vga:textmode_vga_inst|font_rom:font_rom_inst|altsyncram:Mux0_rtl_1|altsyncram_7sv:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 12,
	port_a_byte_enable_clear => "none",
	port_a_byte_enable_clock => "none",
	port_a_data_in_clear => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 0,
	port_a_last_address => 4095,
	port_a_logical_ram_depth => 4096,
	port_a_logical_ram_width => 8,
	port_a_write_enable_clear => "none",
	port_a_write_enable_clock => "none",
	port_b_address_width => 12,
	port_b_data_width => 1,
	ram_block_type => "M4K")
-- pragma translate_on
PORT MAP (
	clk0 => \pll_vga_clk|altpll_component|_clk0\,
	portaaddr => \textmode_vga_inst|font_rom_inst|Mux0_rtl_1|auto_generated|ram_block1a0_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \textmode_vga_inst|font_rom_inst|Mux0_rtl_1|auto_generated|ram_block1a0_PORTADATAOUT_bus\);

-- Location: LC_X34_Y26_N2
\textmode_vga_inst|textmode_vga_h_sm_inst|h_sm_next_state~5\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|textmode_vga_h_sm_inst|h_sm_next_state~5_combout\ = (\textmode_vga_inst|console_sm_inst|column_int\(4) & (\textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int\(4) & (\textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int\(3) $ 
-- (!\textmode_vga_inst|console_sm_inst|column_int\(3))))) # (!\textmode_vga_inst|console_sm_inst|column_int\(4) & (!\textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int\(4) & (\textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int\(3) $ 
-- (!\textmode_vga_inst|console_sm_inst|column_int\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "8241",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \textmode_vga_inst|console_sm_inst|column_int\(4),
	datab => \textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int\(3),
	datac => \textmode_vga_inst|console_sm_inst|column_int\(3),
	datad => \textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int\(4),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \textmode_vga_inst|textmode_vga_h_sm_inst|h_sm_next_state~5_combout\);

-- Location: LC_X34_Y30_N6
\textmode_vga_inst|textmode_vga_h_sm_inst|h_sm_next_state~6\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|textmode_vga_h_sm_inst|h_sm_next_state~6_combout\ = (\textmode_vga_inst|console_sm_inst|column_int\(6) & (\textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int\(6) & (\textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int\(5) $ 
-- (!\textmode_vga_inst|console_sm_inst|column_int\(5))))) # (!\textmode_vga_inst|console_sm_inst|column_int\(6) & (!\textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int\(6) & (\textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int\(5) $ 
-- (!\textmode_vga_inst|console_sm_inst|column_int\(5)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "8241",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \textmode_vga_inst|console_sm_inst|column_int\(6),
	datab => \textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int\(5),
	datac => \textmode_vga_inst|console_sm_inst|column_int\(5),
	datad => \textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int\(6),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \textmode_vga_inst|textmode_vga_h_sm_inst|h_sm_next_state~6_combout\);

-- Location: LC_X34_Y29_N3
\textmode_vga_inst|textmode_vga_h_sm_inst|h_sm_next_state~0\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|textmode_vga_h_sm_inst|h_sm_next_state~0_combout\ = (\textmode_vga_inst|textmode_vga_v_sm_inst|char_line_cnt_int\(0) & (\textmode_vga_inst|console_sm_inst|line_int\(0) & (\textmode_vga_inst|console_sm_inst|line_int\(1) $ 
-- (!\textmode_vga_inst|textmode_vga_v_sm_inst|char_line_cnt_int\(1))))) # (!\textmode_vga_inst|textmode_vga_v_sm_inst|char_line_cnt_int\(0) & (!\textmode_vga_inst|console_sm_inst|line_int\(0) & (\textmode_vga_inst|console_sm_inst|line_int\(1) $ 
-- (!\textmode_vga_inst|textmode_vga_v_sm_inst|char_line_cnt_int\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "8421",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \textmode_vga_inst|textmode_vga_v_sm_inst|char_line_cnt_int\(0),
	datab => \textmode_vga_inst|console_sm_inst|line_int\(1),
	datac => \textmode_vga_inst|console_sm_inst|line_int\(0),
	datad => \textmode_vga_inst|textmode_vga_v_sm_inst|char_line_cnt_int\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \textmode_vga_inst|textmode_vga_h_sm_inst|h_sm_next_state~0_combout\);

-- Location: LC_X34_Y29_N2
\textmode_vga_inst|textmode_vga_h_sm_inst|h_sm_next_state~1\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|textmode_vga_h_sm_inst|h_sm_next_state~1_combout\ = (\textmode_vga_inst|console_sm_inst|line_int\(3) & (\textmode_vga_inst|textmode_vga_v_sm_inst|char_line_cnt_int\(3) & (\textmode_vga_inst|textmode_vga_v_sm_inst|char_line_cnt_int\(2) $ 
-- (!\textmode_vga_inst|console_sm_inst|line_int\(2))))) # (!\textmode_vga_inst|console_sm_inst|line_int\(3) & (!\textmode_vga_inst|textmode_vga_v_sm_inst|char_line_cnt_int\(3) & (\textmode_vga_inst|textmode_vga_v_sm_inst|char_line_cnt_int\(2) $ 
-- (!\textmode_vga_inst|console_sm_inst|line_int\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "8241",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \textmode_vga_inst|console_sm_inst|line_int\(3),
	datab => \textmode_vga_inst|textmode_vga_v_sm_inst|char_line_cnt_int\(2),
	datac => \textmode_vga_inst|console_sm_inst|line_int\(2),
	datad => \textmode_vga_inst|textmode_vga_v_sm_inst|char_line_cnt_int\(3),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \textmode_vga_inst|textmode_vga_h_sm_inst|h_sm_next_state~1_combout\);

-- Location: LC_X34_Y29_N4
\textmode_vga_inst|textmode_vga_h_sm_inst|h_sm_next_state~2\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|textmode_vga_h_sm_inst|h_sm_next_state~2_combout\ = (\textmode_vga_inst|console_sm_inst|column_int\(0) & (\textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int\(0) & (\textmode_vga_inst|console_sm_inst|line_int\(4) $ 
-- (!\textmode_vga_inst|textmode_vga_v_sm_inst|char_line_cnt_int\(4))))) # (!\textmode_vga_inst|console_sm_inst|column_int\(0) & (!\textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int\(0) & (\textmode_vga_inst|console_sm_inst|line_int\(4) $ 
-- (!\textmode_vga_inst|textmode_vga_v_sm_inst|char_line_cnt_int\(4)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "8241",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \textmode_vga_inst|console_sm_inst|column_int\(0),
	datab => \textmode_vga_inst|console_sm_inst|line_int\(4),
	datac => \textmode_vga_inst|textmode_vga_v_sm_inst|char_line_cnt_int\(4),
	datad => \textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \textmode_vga_inst|textmode_vga_h_sm_inst|h_sm_next_state~2_combout\);

-- Location: LC_X34_Y30_N2
\textmode_vga_inst|textmode_vga_h_sm_inst|h_sm_next_state~3\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|textmode_vga_h_sm_inst|h_sm_next_state~3_combout\ = (\textmode_vga_inst|console_sm_inst|column_int\(2) & (\textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int\(2) & (\textmode_vga_inst|console_sm_inst|column_int\(1) $ 
-- (!\textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int\(1))))) # (!\textmode_vga_inst|console_sm_inst|column_int\(2) & (!\textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int\(2) & (\textmode_vga_inst|console_sm_inst|column_int\(1) $ 
-- (!\textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "9009",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \textmode_vga_inst|console_sm_inst|column_int\(2),
	datab => \textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int\(2),
	datac => \textmode_vga_inst|console_sm_inst|column_int\(1),
	datad => \textmode_vga_inst|textmode_vga_h_sm_inst|char_cnt_int\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \textmode_vga_inst|textmode_vga_h_sm_inst|h_sm_next_state~3_combout\);

-- Location: LC_X34_Y30_N5
\textmode_vga_inst|textmode_vga_h_sm_inst|h_sm_next_state~4\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|textmode_vga_h_sm_inst|h_sm_next_state~4_combout\ = (\textmode_vga_inst|textmode_vga_h_sm_inst|h_sm_next_state~0_combout\ & (\textmode_vga_inst|textmode_vga_h_sm_inst|h_sm_next_state~1_combout\ & 
-- (\textmode_vga_inst|textmode_vga_h_sm_inst|h_sm_next_state~2_combout\ & \textmode_vga_inst|textmode_vga_h_sm_inst|h_sm_next_state~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "8000",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \textmode_vga_inst|textmode_vga_h_sm_inst|h_sm_next_state~0_combout\,
	datab => \textmode_vga_inst|textmode_vga_h_sm_inst|h_sm_next_state~1_combout\,
	datac => \textmode_vga_inst|textmode_vga_h_sm_inst|h_sm_next_state~2_combout\,
	datad => \textmode_vga_inst|textmode_vga_h_sm_inst|h_sm_next_state~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \textmode_vga_inst|textmode_vga_h_sm_inst|h_sm_next_state~4_combout\);

-- Location: LC_X76_Y40_N3
\textmode_vga_inst|blink_interval_inst|cnt[0]\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|blink_interval_inst|cnt\(0) = DFFEAS((!\textmode_vga_inst|blink_interval_inst|cnt\(0)), GLOBAL(\pll_vga_clk|altpll_component|_clk0\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , , , 
-- \textmode_vga_inst|blink_interval_inst|LessThan0~8_combout\, )
-- \textmode_vga_inst|blink_interval_inst|cnt[0]~21\ = CARRY((\textmode_vga_inst|blink_interval_inst|cnt\(0)))
-- \textmode_vga_inst|blink_interval_inst|cnt[0]~21COUT1_71\ = CARRY((\textmode_vga_inst|blink_interval_inst|cnt\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "55aa",
	operation_mode => "arithmetic",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \pll_vga_clk|altpll_component|_clk0\,
	dataa => \textmode_vga_inst|blink_interval_inst|cnt\(0),
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	sclr => \textmode_vga_inst|blink_interval_inst|LessThan0~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \textmode_vga_inst|blink_interval_inst|cnt\(0),
	cout0 => \textmode_vga_inst|blink_interval_inst|cnt[0]~21\,
	cout1 => \textmode_vga_inst|blink_interval_inst|cnt[0]~21COUT1_71\);

-- Location: LC_X76_Y40_N4
\textmode_vga_inst|blink_interval_inst|cnt[1]\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|blink_interval_inst|cnt\(1) = DFFEAS(\textmode_vga_inst|blink_interval_inst|cnt\(1) $ ((((\textmode_vga_inst|blink_interval_inst|cnt[0]~21\)))), GLOBAL(\pll_vga_clk|altpll_component|_clk0\), 
-- !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , , , \textmode_vga_inst|blink_interval_inst|LessThan0~8_combout\, )
-- \textmode_vga_inst|blink_interval_inst|cnt[1]~23\ = CARRY(((!\textmode_vga_inst|blink_interval_inst|cnt[0]~21COUT1_71\)) # (!\textmode_vga_inst|blink_interval_inst|cnt\(1)))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	lut_mask => "5a5f",
	operation_mode => "arithmetic",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \pll_vga_clk|altpll_component|_clk0\,
	dataa => \textmode_vga_inst|blink_interval_inst|cnt\(1),
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	sclr => \textmode_vga_inst|blink_interval_inst|LessThan0~8_combout\,
	cin0 => \textmode_vga_inst|blink_interval_inst|cnt[0]~21\,
	cin1 => \textmode_vga_inst|blink_interval_inst|cnt[0]~21COUT1_71\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \textmode_vga_inst|blink_interval_inst|cnt\(1),
	cout => \textmode_vga_inst|blink_interval_inst|cnt[1]~23\);

-- Location: LC_X76_Y40_N5
\textmode_vga_inst|blink_interval_inst|cnt[2]\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|blink_interval_inst|cnt\(2) = DFFEAS((\textmode_vga_inst|blink_interval_inst|cnt\(2) $ ((!\textmode_vga_inst|blink_interval_inst|cnt[1]~23\))), GLOBAL(\pll_vga_clk|altpll_component|_clk0\), 
-- !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , , , \textmode_vga_inst|blink_interval_inst|LessThan0~8_combout\, )
-- \textmode_vga_inst|blink_interval_inst|cnt[2]~25\ = CARRY(((\textmode_vga_inst|blink_interval_inst|cnt\(2) & !\textmode_vga_inst|blink_interval_inst|cnt[1]~23\)))
-- \textmode_vga_inst|blink_interval_inst|cnt[2]~25COUT1_73\ = CARRY(((\textmode_vga_inst|blink_interval_inst|cnt\(2) & !\textmode_vga_inst|blink_interval_inst|cnt[1]~23\)))

-- pragma translate_off
GENERIC MAP (
	cin_used => "true",
	lut_mask => "c30c",
	operation_mode => "arithmetic",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \pll_vga_clk|altpll_component|_clk0\,
	datab => \textmode_vga_inst|blink_interval_inst|cnt\(2),
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	sclr => \textmode_vga_inst|blink_interval_inst|LessThan0~8_combout\,
	cin => \textmode_vga_inst|blink_interval_inst|cnt[1]~23\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \textmode_vga_inst|blink_interval_inst|cnt\(2),
	cout0 => \textmode_vga_inst|blink_interval_inst|cnt[2]~25\,
	cout1 => \textmode_vga_inst|blink_interval_inst|cnt[2]~25COUT1_73\);

-- Location: LC_X76_Y40_N6
\textmode_vga_inst|blink_interval_inst|cnt[3]\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|blink_interval_inst|cnt\(3) = DFFEAS((\textmode_vga_inst|blink_interval_inst|cnt\(3) $ (((!\textmode_vga_inst|blink_interval_inst|cnt[1]~23\ & \textmode_vga_inst|blink_interval_inst|cnt[2]~25\) # 
-- (\textmode_vga_inst|blink_interval_inst|cnt[1]~23\ & \textmode_vga_inst|blink_interval_inst|cnt[2]~25COUT1_73\)))), GLOBAL(\pll_vga_clk|altpll_component|_clk0\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , , , 
-- \textmode_vga_inst|blink_interval_inst|LessThan0~8_combout\, )
-- \textmode_vga_inst|blink_interval_inst|cnt[3]~27\ = CARRY(((!\textmode_vga_inst|blink_interval_inst|cnt[2]~25\) # (!\textmode_vga_inst|blink_interval_inst|cnt\(3))))
-- \textmode_vga_inst|blink_interval_inst|cnt[3]~27COUT1_75\ = CARRY(((!\textmode_vga_inst|blink_interval_inst|cnt[2]~25COUT1_73\) # (!\textmode_vga_inst|blink_interval_inst|cnt\(3))))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	cin_used => "true",
	lut_mask => "3c3f",
	operation_mode => "arithmetic",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \pll_vga_clk|altpll_component|_clk0\,
	datab => \textmode_vga_inst|blink_interval_inst|cnt\(3),
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	sclr => \textmode_vga_inst|blink_interval_inst|LessThan0~8_combout\,
	cin => \textmode_vga_inst|blink_interval_inst|cnt[1]~23\,
	cin0 => \textmode_vga_inst|blink_interval_inst|cnt[2]~25\,
	cin1 => \textmode_vga_inst|blink_interval_inst|cnt[2]~25COUT1_73\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \textmode_vga_inst|blink_interval_inst|cnt\(3),
	cout0 => \textmode_vga_inst|blink_interval_inst|cnt[3]~27\,
	cout1 => \textmode_vga_inst|blink_interval_inst|cnt[3]~27COUT1_75\);

-- Location: LC_X76_Y40_N7
\textmode_vga_inst|blink_interval_inst|cnt[4]\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|blink_interval_inst|cnt\(4) = DFFEAS(\textmode_vga_inst|blink_interval_inst|cnt\(4) $ ((((!(!\textmode_vga_inst|blink_interval_inst|cnt[1]~23\ & \textmode_vga_inst|blink_interval_inst|cnt[3]~27\) # 
-- (\textmode_vga_inst|blink_interval_inst|cnt[1]~23\ & \textmode_vga_inst|blink_interval_inst|cnt[3]~27COUT1_75\))))), GLOBAL(\pll_vga_clk|altpll_component|_clk0\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , , , 
-- \textmode_vga_inst|blink_interval_inst|LessThan0~8_combout\, )
-- \textmode_vga_inst|blink_interval_inst|cnt[4]~29\ = CARRY((\textmode_vga_inst|blink_interval_inst|cnt\(4) & ((!\textmode_vga_inst|blink_interval_inst|cnt[3]~27\))))
-- \textmode_vga_inst|blink_interval_inst|cnt[4]~29COUT1_77\ = CARRY((\textmode_vga_inst|blink_interval_inst|cnt\(4) & ((!\textmode_vga_inst|blink_interval_inst|cnt[3]~27COUT1_75\))))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	cin_used => "true",
	lut_mask => "a50a",
	operation_mode => "arithmetic",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \pll_vga_clk|altpll_component|_clk0\,
	dataa => \textmode_vga_inst|blink_interval_inst|cnt\(4),
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	sclr => \textmode_vga_inst|blink_interval_inst|LessThan0~8_combout\,
	cin => \textmode_vga_inst|blink_interval_inst|cnt[1]~23\,
	cin0 => \textmode_vga_inst|blink_interval_inst|cnt[3]~27\,
	cin1 => \textmode_vga_inst|blink_interval_inst|cnt[3]~27COUT1_75\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \textmode_vga_inst|blink_interval_inst|cnt\(4),
	cout0 => \textmode_vga_inst|blink_interval_inst|cnt[4]~29\,
	cout1 => \textmode_vga_inst|blink_interval_inst|cnt[4]~29COUT1_77\);

-- Location: LC_X76_Y40_N8
\textmode_vga_inst|blink_interval_inst|cnt[5]\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|blink_interval_inst|cnt\(5) = DFFEAS(\textmode_vga_inst|blink_interval_inst|cnt\(5) $ (((((!\textmode_vga_inst|blink_interval_inst|cnt[1]~23\ & \textmode_vga_inst|blink_interval_inst|cnt[4]~29\) # 
-- (\textmode_vga_inst|blink_interval_inst|cnt[1]~23\ & \textmode_vga_inst|blink_interval_inst|cnt[4]~29COUT1_77\))))), GLOBAL(\pll_vga_clk|altpll_component|_clk0\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , , , 
-- \textmode_vga_inst|blink_interval_inst|LessThan0~8_combout\, )
-- \textmode_vga_inst|blink_interval_inst|cnt[5]~31\ = CARRY(((!\textmode_vga_inst|blink_interval_inst|cnt[4]~29\)) # (!\textmode_vga_inst|blink_interval_inst|cnt\(5)))
-- \textmode_vga_inst|blink_interval_inst|cnt[5]~31COUT1_79\ = CARRY(((!\textmode_vga_inst|blink_interval_inst|cnt[4]~29COUT1_77\)) # (!\textmode_vga_inst|blink_interval_inst|cnt\(5)))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	cin_used => "true",
	lut_mask => "5a5f",
	operation_mode => "arithmetic",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \pll_vga_clk|altpll_component|_clk0\,
	dataa => \textmode_vga_inst|blink_interval_inst|cnt\(5),
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	sclr => \textmode_vga_inst|blink_interval_inst|LessThan0~8_combout\,
	cin => \textmode_vga_inst|blink_interval_inst|cnt[1]~23\,
	cin0 => \textmode_vga_inst|blink_interval_inst|cnt[4]~29\,
	cin1 => \textmode_vga_inst|blink_interval_inst|cnt[4]~29COUT1_77\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \textmode_vga_inst|blink_interval_inst|cnt\(5),
	cout0 => \textmode_vga_inst|blink_interval_inst|cnt[5]~31\,
	cout1 => \textmode_vga_inst|blink_interval_inst|cnt[5]~31COUT1_79\);

-- Location: LC_X76_Y40_N9
\textmode_vga_inst|blink_interval_inst|cnt[6]\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|blink_interval_inst|cnt\(6) = DFFEAS((\textmode_vga_inst|blink_interval_inst|cnt\(6) $ ((!(!\textmode_vga_inst|blink_interval_inst|cnt[1]~23\ & \textmode_vga_inst|blink_interval_inst|cnt[5]~31\) # 
-- (\textmode_vga_inst|blink_interval_inst|cnt[1]~23\ & \textmode_vga_inst|blink_interval_inst|cnt[5]~31COUT1_79\)))), GLOBAL(\pll_vga_clk|altpll_component|_clk0\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , , , 
-- \textmode_vga_inst|blink_interval_inst|LessThan0~8_combout\, )
-- \textmode_vga_inst|blink_interval_inst|cnt[6]~41\ = CARRY(((\textmode_vga_inst|blink_interval_inst|cnt\(6) & !\textmode_vga_inst|blink_interval_inst|cnt[5]~31COUT1_79\)))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	cin_used => "true",
	lut_mask => "c30c",
	operation_mode => "arithmetic",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \pll_vga_clk|altpll_component|_clk0\,
	datab => \textmode_vga_inst|blink_interval_inst|cnt\(6),
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	sclr => \textmode_vga_inst|blink_interval_inst|LessThan0~8_combout\,
	cin => \textmode_vga_inst|blink_interval_inst|cnt[1]~23\,
	cin0 => \textmode_vga_inst|blink_interval_inst|cnt[5]~31\,
	cin1 => \textmode_vga_inst|blink_interval_inst|cnt[5]~31COUT1_79\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \textmode_vga_inst|blink_interval_inst|cnt\(6),
	cout => \textmode_vga_inst|blink_interval_inst|cnt[6]~41\);

-- Location: LC_X76_Y39_N0
\textmode_vga_inst|blink_interval_inst|cnt[7]\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|blink_interval_inst|cnt\(7) = DFFEAS((\textmode_vga_inst|blink_interval_inst|cnt\(7) $ ((\textmode_vga_inst|blink_interval_inst|cnt[6]~41\))), GLOBAL(\pll_vga_clk|altpll_component|_clk0\), 
-- !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , , , \textmode_vga_inst|blink_interval_inst|LessThan0~8_combout\, )
-- \textmode_vga_inst|blink_interval_inst|cnt[7]~33\ = CARRY(((!\textmode_vga_inst|blink_interval_inst|cnt[6]~41\) # (!\textmode_vga_inst|blink_interval_inst|cnt\(7))))
-- \textmode_vga_inst|blink_interval_inst|cnt[7]~33COUT1_81\ = CARRY(((!\textmode_vga_inst|blink_interval_inst|cnt[6]~41\) # (!\textmode_vga_inst|blink_interval_inst|cnt\(7))))

-- pragma translate_off
GENERIC MAP (
	cin_used => "true",
	lut_mask => "3c3f",
	operation_mode => "arithmetic",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \pll_vga_clk|altpll_component|_clk0\,
	datab => \textmode_vga_inst|blink_interval_inst|cnt\(7),
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	sclr => \textmode_vga_inst|blink_interval_inst|LessThan0~8_combout\,
	cin => \textmode_vga_inst|blink_interval_inst|cnt[6]~41\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \textmode_vga_inst|blink_interval_inst|cnt\(7),
	cout0 => \textmode_vga_inst|blink_interval_inst|cnt[7]~33\,
	cout1 => \textmode_vga_inst|blink_interval_inst|cnt[7]~33COUT1_81\);

-- Location: LC_X76_Y39_N1
\textmode_vga_inst|blink_interval_inst|cnt[8]\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|blink_interval_inst|cnt\(8) = DFFEAS((\textmode_vga_inst|blink_interval_inst|cnt\(8) $ ((!(!\textmode_vga_inst|blink_interval_inst|cnt[6]~41\ & \textmode_vga_inst|blink_interval_inst|cnt[7]~33\) # 
-- (\textmode_vga_inst|blink_interval_inst|cnt[6]~41\ & \textmode_vga_inst|blink_interval_inst|cnt[7]~33COUT1_81\)))), GLOBAL(\pll_vga_clk|altpll_component|_clk0\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , , , 
-- \textmode_vga_inst|blink_interval_inst|LessThan0~8_combout\, )
-- \textmode_vga_inst|blink_interval_inst|cnt[8]~35\ = CARRY(((\textmode_vga_inst|blink_interval_inst|cnt\(8) & !\textmode_vga_inst|blink_interval_inst|cnt[7]~33\)))
-- \textmode_vga_inst|blink_interval_inst|cnt[8]~35COUT1_83\ = CARRY(((\textmode_vga_inst|blink_interval_inst|cnt\(8) & !\textmode_vga_inst|blink_interval_inst|cnt[7]~33COUT1_81\)))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	cin_used => "true",
	lut_mask => "c30c",
	operation_mode => "arithmetic",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \pll_vga_clk|altpll_component|_clk0\,
	datab => \textmode_vga_inst|blink_interval_inst|cnt\(8),
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	sclr => \textmode_vga_inst|blink_interval_inst|LessThan0~8_combout\,
	cin => \textmode_vga_inst|blink_interval_inst|cnt[6]~41\,
	cin0 => \textmode_vga_inst|blink_interval_inst|cnt[7]~33\,
	cin1 => \textmode_vga_inst|blink_interval_inst|cnt[7]~33COUT1_81\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \textmode_vga_inst|blink_interval_inst|cnt\(8),
	cout0 => \textmode_vga_inst|blink_interval_inst|cnt[8]~35\,
	cout1 => \textmode_vga_inst|blink_interval_inst|cnt[8]~35COUT1_83\);

-- Location: LC_X76_Y39_N2
\textmode_vga_inst|blink_interval_inst|cnt[9]\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|blink_interval_inst|cnt\(9) = DFFEAS(\textmode_vga_inst|blink_interval_inst|cnt\(9) $ (((((!\textmode_vga_inst|blink_interval_inst|cnt[6]~41\ & \textmode_vga_inst|blink_interval_inst|cnt[8]~35\) # 
-- (\textmode_vga_inst|blink_interval_inst|cnt[6]~41\ & \textmode_vga_inst|blink_interval_inst|cnt[8]~35COUT1_83\))))), GLOBAL(\pll_vga_clk|altpll_component|_clk0\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , , , 
-- \textmode_vga_inst|blink_interval_inst|LessThan0~8_combout\, )
-- \textmode_vga_inst|blink_interval_inst|cnt[9]~37\ = CARRY(((!\textmode_vga_inst|blink_interval_inst|cnt[8]~35\)) # (!\textmode_vga_inst|blink_interval_inst|cnt\(9)))
-- \textmode_vga_inst|blink_interval_inst|cnt[9]~37COUT1_85\ = CARRY(((!\textmode_vga_inst|blink_interval_inst|cnt[8]~35COUT1_83\)) # (!\textmode_vga_inst|blink_interval_inst|cnt\(9)))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	cin_used => "true",
	lut_mask => "5a5f",
	operation_mode => "arithmetic",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \pll_vga_clk|altpll_component|_clk0\,
	dataa => \textmode_vga_inst|blink_interval_inst|cnt\(9),
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	sclr => \textmode_vga_inst|blink_interval_inst|LessThan0~8_combout\,
	cin => \textmode_vga_inst|blink_interval_inst|cnt[6]~41\,
	cin0 => \textmode_vga_inst|blink_interval_inst|cnt[8]~35\,
	cin1 => \textmode_vga_inst|blink_interval_inst|cnt[8]~35COUT1_83\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \textmode_vga_inst|blink_interval_inst|cnt\(9),
	cout0 => \textmode_vga_inst|blink_interval_inst|cnt[9]~37\,
	cout1 => \textmode_vga_inst|blink_interval_inst|cnt[9]~37COUT1_85\);

-- Location: LC_X76_Y39_N3
\textmode_vga_inst|blink_interval_inst|cnt[10]\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|blink_interval_inst|cnt\(10) = DFFEAS(\textmode_vga_inst|blink_interval_inst|cnt\(10) $ ((((!(!\textmode_vga_inst|blink_interval_inst|cnt[6]~41\ & \textmode_vga_inst|blink_interval_inst|cnt[9]~37\) # 
-- (\textmode_vga_inst|blink_interval_inst|cnt[6]~41\ & \textmode_vga_inst|blink_interval_inst|cnt[9]~37COUT1_85\))))), GLOBAL(\pll_vga_clk|altpll_component|_clk0\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , , , 
-- \textmode_vga_inst|blink_interval_inst|LessThan0~8_combout\, )
-- \textmode_vga_inst|blink_interval_inst|cnt[10]~39\ = CARRY((\textmode_vga_inst|blink_interval_inst|cnt\(10) & ((!\textmode_vga_inst|blink_interval_inst|cnt[9]~37\))))
-- \textmode_vga_inst|blink_interval_inst|cnt[10]~39COUT1_87\ = CARRY((\textmode_vga_inst|blink_interval_inst|cnt\(10) & ((!\textmode_vga_inst|blink_interval_inst|cnt[9]~37COUT1_85\))))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	cin_used => "true",
	lut_mask => "a50a",
	operation_mode => "arithmetic",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \pll_vga_clk|altpll_component|_clk0\,
	dataa => \textmode_vga_inst|blink_interval_inst|cnt\(10),
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	sclr => \textmode_vga_inst|blink_interval_inst|LessThan0~8_combout\,
	cin => \textmode_vga_inst|blink_interval_inst|cnt[6]~41\,
	cin0 => \textmode_vga_inst|blink_interval_inst|cnt[9]~37\,
	cin1 => \textmode_vga_inst|blink_interval_inst|cnt[9]~37COUT1_85\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \textmode_vga_inst|blink_interval_inst|cnt\(10),
	cout0 => \textmode_vga_inst|blink_interval_inst|cnt[10]~39\,
	cout1 => \textmode_vga_inst|blink_interval_inst|cnt[10]~39COUT1_87\);

-- Location: LC_X76_Y39_N4
\textmode_vga_inst|blink_interval_inst|cnt[11]\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|blink_interval_inst|cnt\(11) = DFFEAS(\textmode_vga_inst|blink_interval_inst|cnt\(11) $ (((((!\textmode_vga_inst|blink_interval_inst|cnt[6]~41\ & \textmode_vga_inst|blink_interval_inst|cnt[10]~39\) # 
-- (\textmode_vga_inst|blink_interval_inst|cnt[6]~41\ & \textmode_vga_inst|blink_interval_inst|cnt[10]~39COUT1_87\))))), GLOBAL(\pll_vga_clk|altpll_component|_clk0\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , , , 
-- \textmode_vga_inst|blink_interval_inst|LessThan0~8_combout\, )
-- \textmode_vga_inst|blink_interval_inst|cnt[11]~43\ = CARRY(((!\textmode_vga_inst|blink_interval_inst|cnt[10]~39COUT1_87\)) # (!\textmode_vga_inst|blink_interval_inst|cnt\(11)))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	cin_used => "true",
	lut_mask => "5a5f",
	operation_mode => "arithmetic",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \pll_vga_clk|altpll_component|_clk0\,
	dataa => \textmode_vga_inst|blink_interval_inst|cnt\(11),
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	sclr => \textmode_vga_inst|blink_interval_inst|LessThan0~8_combout\,
	cin => \textmode_vga_inst|blink_interval_inst|cnt[6]~41\,
	cin0 => \textmode_vga_inst|blink_interval_inst|cnt[10]~39\,
	cin1 => \textmode_vga_inst|blink_interval_inst|cnt[10]~39COUT1_87\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \textmode_vga_inst|blink_interval_inst|cnt\(11),
	cout => \textmode_vga_inst|blink_interval_inst|cnt[11]~43\);

-- Location: LC_X76_Y39_N5
\textmode_vga_inst|blink_interval_inst|cnt[12]\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|blink_interval_inst|cnt\(12) = DFFEAS((\textmode_vga_inst|blink_interval_inst|cnt\(12) $ ((!\textmode_vga_inst|blink_interval_inst|cnt[11]~43\))), GLOBAL(\pll_vga_clk|altpll_component|_clk0\), 
-- !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , , , \textmode_vga_inst|blink_interval_inst|LessThan0~8_combout\, )
-- \textmode_vga_inst|blink_interval_inst|cnt[12]~45\ = CARRY(((\textmode_vga_inst|blink_interval_inst|cnt\(12) & !\textmode_vga_inst|blink_interval_inst|cnt[11]~43\)))
-- \textmode_vga_inst|blink_interval_inst|cnt[12]~45COUT1_89\ = CARRY(((\textmode_vga_inst|blink_interval_inst|cnt\(12) & !\textmode_vga_inst|blink_interval_inst|cnt[11]~43\)))

-- pragma translate_off
GENERIC MAP (
	cin_used => "true",
	lut_mask => "c30c",
	operation_mode => "arithmetic",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \pll_vga_clk|altpll_component|_clk0\,
	datab => \textmode_vga_inst|blink_interval_inst|cnt\(12),
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	sclr => \textmode_vga_inst|blink_interval_inst|LessThan0~8_combout\,
	cin => \textmode_vga_inst|blink_interval_inst|cnt[11]~43\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \textmode_vga_inst|blink_interval_inst|cnt\(12),
	cout0 => \textmode_vga_inst|blink_interval_inst|cnt[12]~45\,
	cout1 => \textmode_vga_inst|blink_interval_inst|cnt[12]~45COUT1_89\);

-- Location: LC_X76_Y39_N6
\textmode_vga_inst|blink_interval_inst|cnt[13]\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|blink_interval_inst|cnt\(13) = DFFEAS((\textmode_vga_inst|blink_interval_inst|cnt\(13) $ (((!\textmode_vga_inst|blink_interval_inst|cnt[11]~43\ & \textmode_vga_inst|blink_interval_inst|cnt[12]~45\) # 
-- (\textmode_vga_inst|blink_interval_inst|cnt[11]~43\ & \textmode_vga_inst|blink_interval_inst|cnt[12]~45COUT1_89\)))), GLOBAL(\pll_vga_clk|altpll_component|_clk0\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , , , 
-- \textmode_vga_inst|blink_interval_inst|LessThan0~8_combout\, )
-- \textmode_vga_inst|blink_interval_inst|cnt[13]~47\ = CARRY(((!\textmode_vga_inst|blink_interval_inst|cnt[12]~45\) # (!\textmode_vga_inst|blink_interval_inst|cnt\(13))))
-- \textmode_vga_inst|blink_interval_inst|cnt[13]~47COUT1_91\ = CARRY(((!\textmode_vga_inst|blink_interval_inst|cnt[12]~45COUT1_89\) # (!\textmode_vga_inst|blink_interval_inst|cnt\(13))))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	cin_used => "true",
	lut_mask => "3c3f",
	operation_mode => "arithmetic",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \pll_vga_clk|altpll_component|_clk0\,
	datab => \textmode_vga_inst|blink_interval_inst|cnt\(13),
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	sclr => \textmode_vga_inst|blink_interval_inst|LessThan0~8_combout\,
	cin => \textmode_vga_inst|blink_interval_inst|cnt[11]~43\,
	cin0 => \textmode_vga_inst|blink_interval_inst|cnt[12]~45\,
	cin1 => \textmode_vga_inst|blink_interval_inst|cnt[12]~45COUT1_89\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \textmode_vga_inst|blink_interval_inst|cnt\(13),
	cout0 => \textmode_vga_inst|blink_interval_inst|cnt[13]~47\,
	cout1 => \textmode_vga_inst|blink_interval_inst|cnt[13]~47COUT1_91\);

-- Location: LC_X76_Y39_N7
\textmode_vga_inst|blink_interval_inst|cnt[14]\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|blink_interval_inst|cnt\(14) = DFFEAS(\textmode_vga_inst|blink_interval_inst|cnt\(14) $ ((((!(!\textmode_vga_inst|blink_interval_inst|cnt[11]~43\ & \textmode_vga_inst|blink_interval_inst|cnt[13]~47\) # 
-- (\textmode_vga_inst|blink_interval_inst|cnt[11]~43\ & \textmode_vga_inst|blink_interval_inst|cnt[13]~47COUT1_91\))))), GLOBAL(\pll_vga_clk|altpll_component|_clk0\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , , , 
-- \textmode_vga_inst|blink_interval_inst|LessThan0~8_combout\, )
-- \textmode_vga_inst|blink_interval_inst|cnt[14]~49\ = CARRY((\textmode_vga_inst|blink_interval_inst|cnt\(14) & ((!\textmode_vga_inst|blink_interval_inst|cnt[13]~47\))))
-- \textmode_vga_inst|blink_interval_inst|cnt[14]~49COUT1_93\ = CARRY((\textmode_vga_inst|blink_interval_inst|cnt\(14) & ((!\textmode_vga_inst|blink_interval_inst|cnt[13]~47COUT1_91\))))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	cin_used => "true",
	lut_mask => "a50a",
	operation_mode => "arithmetic",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \pll_vga_clk|altpll_component|_clk0\,
	dataa => \textmode_vga_inst|blink_interval_inst|cnt\(14),
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	sclr => \textmode_vga_inst|blink_interval_inst|LessThan0~8_combout\,
	cin => \textmode_vga_inst|blink_interval_inst|cnt[11]~43\,
	cin0 => \textmode_vga_inst|blink_interval_inst|cnt[13]~47\,
	cin1 => \textmode_vga_inst|blink_interval_inst|cnt[13]~47COUT1_91\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \textmode_vga_inst|blink_interval_inst|cnt\(14),
	cout0 => \textmode_vga_inst|blink_interval_inst|cnt[14]~49\,
	cout1 => \textmode_vga_inst|blink_interval_inst|cnt[14]~49COUT1_93\);

-- Location: LC_X76_Y39_N8
\textmode_vga_inst|blink_interval_inst|cnt[15]\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|blink_interval_inst|cnt\(15) = DFFEAS(\textmode_vga_inst|blink_interval_inst|cnt\(15) $ (((((!\textmode_vga_inst|blink_interval_inst|cnt[11]~43\ & \textmode_vga_inst|blink_interval_inst|cnt[14]~49\) # 
-- (\textmode_vga_inst|blink_interval_inst|cnt[11]~43\ & \textmode_vga_inst|blink_interval_inst|cnt[14]~49COUT1_93\))))), GLOBAL(\pll_vga_clk|altpll_component|_clk0\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , , , 
-- \textmode_vga_inst|blink_interval_inst|LessThan0~8_combout\, )
-- \textmode_vga_inst|blink_interval_inst|cnt[15]~11\ = CARRY(((!\textmode_vga_inst|blink_interval_inst|cnt[14]~49\)) # (!\textmode_vga_inst|blink_interval_inst|cnt\(15)))
-- \textmode_vga_inst|blink_interval_inst|cnt[15]~11COUT1_95\ = CARRY(((!\textmode_vga_inst|blink_interval_inst|cnt[14]~49COUT1_93\)) # (!\textmode_vga_inst|blink_interval_inst|cnt\(15)))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	cin_used => "true",
	lut_mask => "5a5f",
	operation_mode => "arithmetic",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \pll_vga_clk|altpll_component|_clk0\,
	dataa => \textmode_vga_inst|blink_interval_inst|cnt\(15),
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	sclr => \textmode_vga_inst|blink_interval_inst|LessThan0~8_combout\,
	cin => \textmode_vga_inst|blink_interval_inst|cnt[11]~43\,
	cin0 => \textmode_vga_inst|blink_interval_inst|cnt[14]~49\,
	cin1 => \textmode_vga_inst|blink_interval_inst|cnt[14]~49COUT1_93\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \textmode_vga_inst|blink_interval_inst|cnt\(15),
	cout0 => \textmode_vga_inst|blink_interval_inst|cnt[15]~11\,
	cout1 => \textmode_vga_inst|blink_interval_inst|cnt[15]~11COUT1_95\);

-- Location: LC_X76_Y39_N9
\textmode_vga_inst|blink_interval_inst|cnt[16]\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|blink_interval_inst|cnt\(16) = DFFEAS((\textmode_vga_inst|blink_interval_inst|cnt\(16) $ ((!(!\textmode_vga_inst|blink_interval_inst|cnt[11]~43\ & \textmode_vga_inst|blink_interval_inst|cnt[15]~11\) # 
-- (\textmode_vga_inst|blink_interval_inst|cnt[11]~43\ & \textmode_vga_inst|blink_interval_inst|cnt[15]~11COUT1_95\)))), GLOBAL(\pll_vga_clk|altpll_component|_clk0\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , , , 
-- \textmode_vga_inst|blink_interval_inst|LessThan0~8_combout\, )
-- \textmode_vga_inst|blink_interval_inst|cnt[16]~15\ = CARRY(((\textmode_vga_inst|blink_interval_inst|cnt\(16) & !\textmode_vga_inst|blink_interval_inst|cnt[15]~11COUT1_95\)))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	cin_used => "true",
	lut_mask => "c30c",
	operation_mode => "arithmetic",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \pll_vga_clk|altpll_component|_clk0\,
	datab => \textmode_vga_inst|blink_interval_inst|cnt\(16),
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	sclr => \textmode_vga_inst|blink_interval_inst|LessThan0~8_combout\,
	cin => \textmode_vga_inst|blink_interval_inst|cnt[11]~43\,
	cin0 => \textmode_vga_inst|blink_interval_inst|cnt[15]~11\,
	cin1 => \textmode_vga_inst|blink_interval_inst|cnt[15]~11COUT1_95\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \textmode_vga_inst|blink_interval_inst|cnt\(16),
	cout => \textmode_vga_inst|blink_interval_inst|cnt[16]~15\);

-- Location: LC_X76_Y38_N0
\textmode_vga_inst|blink_interval_inst|cnt[17]\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|blink_interval_inst|cnt\(17) = DFFEAS((\textmode_vga_inst|blink_interval_inst|cnt\(17) $ ((\textmode_vga_inst|blink_interval_inst|cnt[16]~15\))), GLOBAL(\pll_vga_clk|altpll_component|_clk0\), 
-- !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , , , \textmode_vga_inst|blink_interval_inst|LessThan0~8_combout\, )
-- \textmode_vga_inst|blink_interval_inst|cnt[17]~13\ = CARRY(((!\textmode_vga_inst|blink_interval_inst|cnt[16]~15\) # (!\textmode_vga_inst|blink_interval_inst|cnt\(17))))
-- \textmode_vga_inst|blink_interval_inst|cnt[17]~13COUT1_97\ = CARRY(((!\textmode_vga_inst|blink_interval_inst|cnt[16]~15\) # (!\textmode_vga_inst|blink_interval_inst|cnt\(17))))

-- pragma translate_off
GENERIC MAP (
	cin_used => "true",
	lut_mask => "3c3f",
	operation_mode => "arithmetic",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \pll_vga_clk|altpll_component|_clk0\,
	datab => \textmode_vga_inst|blink_interval_inst|cnt\(17),
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	sclr => \textmode_vga_inst|blink_interval_inst|LessThan0~8_combout\,
	cin => \textmode_vga_inst|blink_interval_inst|cnt[16]~15\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \textmode_vga_inst|blink_interval_inst|cnt\(17),
	cout0 => \textmode_vga_inst|blink_interval_inst|cnt[17]~13\,
	cout1 => \textmode_vga_inst|blink_interval_inst|cnt[17]~13COUT1_97\);

-- Location: LC_X76_Y38_N1
\textmode_vga_inst|blink_interval_inst|cnt[18]\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|blink_interval_inst|cnt\(18) = DFFEAS(\textmode_vga_inst|blink_interval_inst|cnt\(18) $ ((((!(!\textmode_vga_inst|blink_interval_inst|cnt[16]~15\ & \textmode_vga_inst|blink_interval_inst|cnt[17]~13\) # 
-- (\textmode_vga_inst|blink_interval_inst|cnt[16]~15\ & \textmode_vga_inst|blink_interval_inst|cnt[17]~13COUT1_97\))))), GLOBAL(\pll_vga_clk|altpll_component|_clk0\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , , , 
-- \textmode_vga_inst|blink_interval_inst|LessThan0~8_combout\, )
-- \textmode_vga_inst|blink_interval_inst|cnt[18]~17\ = CARRY((\textmode_vga_inst|blink_interval_inst|cnt\(18) & ((!\textmode_vga_inst|blink_interval_inst|cnt[17]~13\))))
-- \textmode_vga_inst|blink_interval_inst|cnt[18]~17COUT1_99\ = CARRY((\textmode_vga_inst|blink_interval_inst|cnt\(18) & ((!\textmode_vga_inst|blink_interval_inst|cnt[17]~13COUT1_97\))))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	cin_used => "true",
	lut_mask => "a50a",
	operation_mode => "arithmetic",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \pll_vga_clk|altpll_component|_clk0\,
	dataa => \textmode_vga_inst|blink_interval_inst|cnt\(18),
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	sclr => \textmode_vga_inst|blink_interval_inst|LessThan0~8_combout\,
	cin => \textmode_vga_inst|blink_interval_inst|cnt[16]~15\,
	cin0 => \textmode_vga_inst|blink_interval_inst|cnt[17]~13\,
	cin1 => \textmode_vga_inst|blink_interval_inst|cnt[17]~13COUT1_97\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \textmode_vga_inst|blink_interval_inst|cnt\(18),
	cout0 => \textmode_vga_inst|blink_interval_inst|cnt[18]~17\,
	cout1 => \textmode_vga_inst|blink_interval_inst|cnt[18]~17COUT1_99\);

-- Location: LC_X76_Y38_N2
\textmode_vga_inst|blink_interval_inst|cnt[19]\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|blink_interval_inst|cnt\(19) = DFFEAS(\textmode_vga_inst|blink_interval_inst|cnt\(19) $ (((((!\textmode_vga_inst|blink_interval_inst|cnt[16]~15\ & \textmode_vga_inst|blink_interval_inst|cnt[18]~17\) # 
-- (\textmode_vga_inst|blink_interval_inst|cnt[16]~15\ & \textmode_vga_inst|blink_interval_inst|cnt[18]~17COUT1_99\))))), GLOBAL(\pll_vga_clk|altpll_component|_clk0\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , , , 
-- \textmode_vga_inst|blink_interval_inst|LessThan0~8_combout\, )
-- \textmode_vga_inst|blink_interval_inst|cnt[19]~19\ = CARRY(((!\textmode_vga_inst|blink_interval_inst|cnt[18]~17\)) # (!\textmode_vga_inst|blink_interval_inst|cnt\(19)))
-- \textmode_vga_inst|blink_interval_inst|cnt[19]~19COUT1_101\ = CARRY(((!\textmode_vga_inst|blink_interval_inst|cnt[18]~17COUT1_99\)) # (!\textmode_vga_inst|blink_interval_inst|cnt\(19)))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	cin_used => "true",
	lut_mask => "5a5f",
	operation_mode => "arithmetic",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \pll_vga_clk|altpll_component|_clk0\,
	dataa => \textmode_vga_inst|blink_interval_inst|cnt\(19),
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	sclr => \textmode_vga_inst|blink_interval_inst|LessThan0~8_combout\,
	cin => \textmode_vga_inst|blink_interval_inst|cnt[16]~15\,
	cin0 => \textmode_vga_inst|blink_interval_inst|cnt[18]~17\,
	cin1 => \textmode_vga_inst|blink_interval_inst|cnt[18]~17COUT1_99\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \textmode_vga_inst|blink_interval_inst|cnt\(19),
	cout0 => \textmode_vga_inst|blink_interval_inst|cnt[19]~19\,
	cout1 => \textmode_vga_inst|blink_interval_inst|cnt[19]~19COUT1_101\);

-- Location: LC_X76_Y38_N3
\textmode_vga_inst|blink_interval_inst|cnt[20]\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|blink_interval_inst|cnt\(20) = DFFEAS(\textmode_vga_inst|blink_interval_inst|cnt\(20) $ ((((!(!\textmode_vga_inst|blink_interval_inst|cnt[16]~15\ & \textmode_vga_inst|blink_interval_inst|cnt[19]~19\) # 
-- (\textmode_vga_inst|blink_interval_inst|cnt[16]~15\ & \textmode_vga_inst|blink_interval_inst|cnt[19]~19COUT1_101\))))), GLOBAL(\pll_vga_clk|altpll_component|_clk0\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , , , 
-- \textmode_vga_inst|blink_interval_inst|LessThan0~8_combout\, )
-- \textmode_vga_inst|blink_interval_inst|cnt[20]~3\ = CARRY((\textmode_vga_inst|blink_interval_inst|cnt\(20) & ((!\textmode_vga_inst|blink_interval_inst|cnt[19]~19\))))
-- \textmode_vga_inst|blink_interval_inst|cnt[20]~3COUT1_103\ = CARRY((\textmode_vga_inst|blink_interval_inst|cnt\(20) & ((!\textmode_vga_inst|blink_interval_inst|cnt[19]~19COUT1_101\))))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	cin_used => "true",
	lut_mask => "a50a",
	operation_mode => "arithmetic",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \pll_vga_clk|altpll_component|_clk0\,
	dataa => \textmode_vga_inst|blink_interval_inst|cnt\(20),
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	sclr => \textmode_vga_inst|blink_interval_inst|LessThan0~8_combout\,
	cin => \textmode_vga_inst|blink_interval_inst|cnt[16]~15\,
	cin0 => \textmode_vga_inst|blink_interval_inst|cnt[19]~19\,
	cin1 => \textmode_vga_inst|blink_interval_inst|cnt[19]~19COUT1_101\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \textmode_vga_inst|blink_interval_inst|cnt\(20),
	cout0 => \textmode_vga_inst|blink_interval_inst|cnt[20]~3\,
	cout1 => \textmode_vga_inst|blink_interval_inst|cnt[20]~3COUT1_103\);

-- Location: LC_X76_Y38_N4
\textmode_vga_inst|blink_interval_inst|cnt[21]\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|blink_interval_inst|cnt\(21) = DFFEAS(\textmode_vga_inst|blink_interval_inst|cnt\(21) $ (((((!\textmode_vga_inst|blink_interval_inst|cnt[16]~15\ & \textmode_vga_inst|blink_interval_inst|cnt[20]~3\) # 
-- (\textmode_vga_inst|blink_interval_inst|cnt[16]~15\ & \textmode_vga_inst|blink_interval_inst|cnt[20]~3COUT1_103\))))), GLOBAL(\pll_vga_clk|altpll_component|_clk0\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , , , 
-- \textmode_vga_inst|blink_interval_inst|LessThan0~8_combout\, )
-- \textmode_vga_inst|blink_interval_inst|cnt[21]~5\ = CARRY(((!\textmode_vga_inst|blink_interval_inst|cnt[20]~3COUT1_103\)) # (!\textmode_vga_inst|blink_interval_inst|cnt\(21)))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	cin_used => "true",
	lut_mask => "5a5f",
	operation_mode => "arithmetic",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \pll_vga_clk|altpll_component|_clk0\,
	dataa => \textmode_vga_inst|blink_interval_inst|cnt\(21),
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	sclr => \textmode_vga_inst|blink_interval_inst|LessThan0~8_combout\,
	cin => \textmode_vga_inst|blink_interval_inst|cnt[16]~15\,
	cin0 => \textmode_vga_inst|blink_interval_inst|cnt[20]~3\,
	cin1 => \textmode_vga_inst|blink_interval_inst|cnt[20]~3COUT1_103\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \textmode_vga_inst|blink_interval_inst|cnt\(21),
	cout => \textmode_vga_inst|blink_interval_inst|cnt[21]~5\);

-- Location: LC_X76_Y38_N5
\textmode_vga_inst|blink_interval_inst|cnt[22]\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|blink_interval_inst|cnt\(22) = DFFEAS((\textmode_vga_inst|blink_interval_inst|cnt\(22) $ ((!\textmode_vga_inst|blink_interval_inst|cnt[21]~5\))), GLOBAL(\pll_vga_clk|altpll_component|_clk0\), 
-- !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , , , \textmode_vga_inst|blink_interval_inst|LessThan0~8_combout\, )
-- \textmode_vga_inst|blink_interval_inst|cnt[22]~7\ = CARRY(((\textmode_vga_inst|blink_interval_inst|cnt\(22) & !\textmode_vga_inst|blink_interval_inst|cnt[21]~5\)))
-- \textmode_vga_inst|blink_interval_inst|cnt[22]~7COUT1_105\ = CARRY(((\textmode_vga_inst|blink_interval_inst|cnt\(22) & !\textmode_vga_inst|blink_interval_inst|cnt[21]~5\)))

-- pragma translate_off
GENERIC MAP (
	cin_used => "true",
	lut_mask => "c30c",
	operation_mode => "arithmetic",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \pll_vga_clk|altpll_component|_clk0\,
	datab => \textmode_vga_inst|blink_interval_inst|cnt\(22),
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	sclr => \textmode_vga_inst|blink_interval_inst|LessThan0~8_combout\,
	cin => \textmode_vga_inst|blink_interval_inst|cnt[21]~5\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \textmode_vga_inst|blink_interval_inst|cnt\(22),
	cout0 => \textmode_vga_inst|blink_interval_inst|cnt[22]~7\,
	cout1 => \textmode_vga_inst|blink_interval_inst|cnt[22]~7COUT1_105\);

-- Location: LC_X76_Y38_N8
\textmode_vga_inst|blink_interval_inst|LessThan0~0\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|blink_interval_inst|LessThan0~0_combout\ = (((!\textmode_vga_inst|blink_interval_inst|cnt\(21)) # (!\textmode_vga_inst|blink_interval_inst|cnt\(20))) # (!\textmode_vga_inst|blink_interval_inst|cnt\(22)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "3fff",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \textmode_vga_inst|blink_interval_inst|cnt\(22),
	datac => \textmode_vga_inst|blink_interval_inst|cnt\(20),
	datad => \textmode_vga_inst|blink_interval_inst|cnt\(21),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \textmode_vga_inst|blink_interval_inst|LessThan0~0_combout\);

-- Location: LC_X76_Y38_N6
\textmode_vga_inst|blink_interval_inst|cnt[23]\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|blink_interval_inst|cnt\(23) = DFFEAS((\textmode_vga_inst|blink_interval_inst|cnt\(23) $ (((!\textmode_vga_inst|blink_interval_inst|cnt[21]~5\ & \textmode_vga_inst|blink_interval_inst|cnt[22]~7\) # 
-- (\textmode_vga_inst|blink_interval_inst|cnt[21]~5\ & \textmode_vga_inst|blink_interval_inst|cnt[22]~7COUT1_105\)))), GLOBAL(\pll_vga_clk|altpll_component|_clk0\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , , , 
-- \textmode_vga_inst|blink_interval_inst|LessThan0~8_combout\, )
-- \textmode_vga_inst|blink_interval_inst|cnt[23]~1\ = CARRY(((!\textmode_vga_inst|blink_interval_inst|cnt[22]~7\) # (!\textmode_vga_inst|blink_interval_inst|cnt\(23))))
-- \textmode_vga_inst|blink_interval_inst|cnt[23]~1COUT1_107\ = CARRY(((!\textmode_vga_inst|blink_interval_inst|cnt[22]~7COUT1_105\) # (!\textmode_vga_inst|blink_interval_inst|cnt\(23))))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	cin_used => "true",
	lut_mask => "3c3f",
	operation_mode => "arithmetic",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \pll_vga_clk|altpll_component|_clk0\,
	datab => \textmode_vga_inst|blink_interval_inst|cnt\(23),
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	sclr => \textmode_vga_inst|blink_interval_inst|LessThan0~8_combout\,
	cin => \textmode_vga_inst|blink_interval_inst|cnt[21]~5\,
	cin0 => \textmode_vga_inst|blink_interval_inst|cnt[22]~7\,
	cin1 => \textmode_vga_inst|blink_interval_inst|cnt[22]~7COUT1_105\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \textmode_vga_inst|blink_interval_inst|cnt\(23),
	cout0 => \textmode_vga_inst|blink_interval_inst|cnt[23]~1\,
	cout1 => \textmode_vga_inst|blink_interval_inst|cnt[23]~1COUT1_107\);

-- Location: LC_X76_Y38_N7
\textmode_vga_inst|blink_interval_inst|cnt[24]\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|blink_interval_inst|cnt\(24) = DFFEAS(\textmode_vga_inst|blink_interval_inst|cnt\(24) $ ((((!(!\textmode_vga_inst|blink_interval_inst|cnt[21]~5\ & \textmode_vga_inst|blink_interval_inst|cnt[23]~1\) # 
-- (\textmode_vga_inst|blink_interval_inst|cnt[21]~5\ & \textmode_vga_inst|blink_interval_inst|cnt[23]~1COUT1_107\))))), GLOBAL(\pll_vga_clk|altpll_component|_clk0\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , , , 
-- \textmode_vga_inst|blink_interval_inst|LessThan0~8_combout\, )

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	cin_used => "true",
	lut_mask => "a5a5",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \pll_vga_clk|altpll_component|_clk0\,
	dataa => \textmode_vga_inst|blink_interval_inst|cnt\(24),
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	sclr => \textmode_vga_inst|blink_interval_inst|LessThan0~8_combout\,
	cin => \textmode_vga_inst|blink_interval_inst|cnt[21]~5\,
	cin0 => \textmode_vga_inst|blink_interval_inst|cnt[23]~1\,
	cin1 => \textmode_vga_inst|blink_interval_inst|cnt[23]~1COUT1_107\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \textmode_vga_inst|blink_interval_inst|cnt\(24));

-- Location: LC_X77_Y39_N2
\textmode_vga_inst|blink_interval_inst|LessThan0~1\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|blink_interval_inst|LessThan0~1_combout\ = (((!\textmode_vga_inst|blink_interval_inst|cnt\(17) & !\textmode_vga_inst|blink_interval_inst|cnt\(16))) # (!\textmode_vga_inst|blink_interval_inst|cnt\(18))) # 
-- (!\textmode_vga_inst|blink_interval_inst|cnt\(19))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "57ff",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \textmode_vga_inst|blink_interval_inst|cnt\(19),
	datab => \textmode_vga_inst|blink_interval_inst|cnt\(17),
	datac => \textmode_vga_inst|blink_interval_inst|cnt\(16),
	datad => \textmode_vga_inst|blink_interval_inst|cnt\(18),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \textmode_vga_inst|blink_interval_inst|LessThan0~1_combout\);

-- Location: LC_X77_Y39_N6
\textmode_vga_inst|blink_interval_inst|LessThan0~5\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|blink_interval_inst|LessThan0~5_combout\ = (((!\textmode_vga_inst|blink_interval_inst|cnt\(12)) # (!\textmode_vga_inst|blink_interval_inst|cnt\(11))) # (!\textmode_vga_inst|blink_interval_inst|cnt\(13))) # 
-- (!\textmode_vga_inst|blink_interval_inst|cnt\(14))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "7fff",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \textmode_vga_inst|blink_interval_inst|cnt\(14),
	datab => \textmode_vga_inst|blink_interval_inst|cnt\(13),
	datac => \textmode_vga_inst|blink_interval_inst|cnt\(11),
	datad => \textmode_vga_inst|blink_interval_inst|cnt\(12),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \textmode_vga_inst|blink_interval_inst|LessThan0~5_combout\);

-- Location: LC_X76_Y40_N2
\textmode_vga_inst|blink_interval_inst|LessThan0~2\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|blink_interval_inst|LessThan0~2_combout\ = (((!\textmode_vga_inst|blink_interval_inst|cnt\(1)) # (!\textmode_vga_inst|blink_interval_inst|cnt\(2))) # (!\textmode_vga_inst|blink_interval_inst|cnt\(3))) # 
-- (!\textmode_vga_inst|blink_interval_inst|cnt\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "7fff",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \textmode_vga_inst|blink_interval_inst|cnt\(0),
	datab => \textmode_vga_inst|blink_interval_inst|cnt\(3),
	datac => \textmode_vga_inst|blink_interval_inst|cnt\(2),
	datad => \textmode_vga_inst|blink_interval_inst|cnt\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \textmode_vga_inst|blink_interval_inst|LessThan0~2_combout\);

-- Location: LC_X76_Y40_N1
\textmode_vga_inst|blink_interval_inst|LessThan0~3\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|blink_interval_inst|LessThan0~3_combout\ = (((\textmode_vga_inst|blink_interval_inst|LessThan0~2_combout\) # (!\textmode_vga_inst|blink_interval_inst|cnt\(4)))) # (!\textmode_vga_inst|blink_interval_inst|cnt\(5))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "ff5f",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \textmode_vga_inst|blink_interval_inst|cnt\(5),
	datac => \textmode_vga_inst|blink_interval_inst|cnt\(4),
	datad => \textmode_vga_inst|blink_interval_inst|LessThan0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \textmode_vga_inst|blink_interval_inst|LessThan0~3_combout\);

-- Location: LC_X77_Y39_N4
\textmode_vga_inst|blink_interval_inst|LessThan0~4\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|blink_interval_inst|LessThan0~4_combout\ = (!\textmode_vga_inst|blink_interval_inst|cnt\(8) & (!\textmode_vga_inst|blink_interval_inst|cnt\(9) & (!\textmode_vga_inst|blink_interval_inst|cnt\(10) & 
-- !\textmode_vga_inst|blink_interval_inst|cnt\(7))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \textmode_vga_inst|blink_interval_inst|cnt\(8),
	datab => \textmode_vga_inst|blink_interval_inst|cnt\(9),
	datac => \textmode_vga_inst|blink_interval_inst|cnt\(10),
	datad => \textmode_vga_inst|blink_interval_inst|cnt\(7),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \textmode_vga_inst|blink_interval_inst|LessThan0~4_combout\);

-- Location: LC_X77_Y39_N5
\textmode_vga_inst|blink_interval_inst|LessThan0~6\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|blink_interval_inst|LessThan0~6_combout\ = (\textmode_vga_inst|blink_interval_inst|LessThan0~5_combout\) # ((!\textmode_vga_inst|blink_interval_inst|cnt\(6) & (\textmode_vga_inst|blink_interval_inst|LessThan0~3_combout\ & 
-- \textmode_vga_inst|blink_interval_inst|LessThan0~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "dccc",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \textmode_vga_inst|blink_interval_inst|cnt\(6),
	datab => \textmode_vga_inst|blink_interval_inst|LessThan0~5_combout\,
	datac => \textmode_vga_inst|blink_interval_inst|LessThan0~3_combout\,
	datad => \textmode_vga_inst|blink_interval_inst|LessThan0~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \textmode_vga_inst|blink_interval_inst|LessThan0~6_combout\);

-- Location: LC_X77_Y39_N8
\textmode_vga_inst|blink_interval_inst|LessThan0~7\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|blink_interval_inst|LessThan0~7_combout\ = (\textmode_vga_inst|blink_interval_inst|LessThan0~1_combout\) # ((!\textmode_vga_inst|blink_interval_inst|cnt\(15) & (\textmode_vga_inst|blink_interval_inst|LessThan0~6_combout\ & 
-- !\textmode_vga_inst|blink_interval_inst|cnt\(17))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "aaba",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \textmode_vga_inst|blink_interval_inst|LessThan0~1_combout\,
	datab => \textmode_vga_inst|blink_interval_inst|cnt\(15),
	datac => \textmode_vga_inst|blink_interval_inst|LessThan0~6_combout\,
	datad => \textmode_vga_inst|blink_interval_inst|cnt\(17),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \textmode_vga_inst|blink_interval_inst|LessThan0~7_combout\);

-- Location: LC_X76_Y38_N9
\textmode_vga_inst|blink_interval_inst|LessThan0~8\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|blink_interval_inst|LessThan0~8_combout\ = (\textmode_vga_inst|blink_interval_inst|cnt\(24) & ((\textmode_vga_inst|blink_interval_inst|cnt\(23)) # ((!\textmode_vga_inst|blink_interval_inst|LessThan0~0_combout\ & 
-- !\textmode_vga_inst|blink_interval_inst|LessThan0~7_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "c0d0",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \textmode_vga_inst|blink_interval_inst|LessThan0~0_combout\,
	datab => \textmode_vga_inst|blink_interval_inst|cnt\(23),
	datac => \textmode_vga_inst|blink_interval_inst|cnt\(24),
	datad => \textmode_vga_inst|blink_interval_inst|LessThan0~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \textmode_vga_inst|blink_interval_inst|LessThan0~8_combout\);

-- Location: LC_X76_Y37_N2
\textmode_vga_inst|blink_interval_inst|active_int\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|blink_interval_inst|active_int~regout\ = DFFEAS(\textmode_vga_inst|blink_interval_inst|active_int~regout\ $ ((((\textmode_vga_inst|blink_interval_inst|LessThan0~8_combout\)))), GLOBAL(\pll_vga_clk|altpll_component|_clk0\), 
-- !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "55aa",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \pll_vga_clk|altpll_component|_clk0\,
	dataa => \textmode_vga_inst|blink_interval_inst|active_int~regout\,
	datad => \textmode_vga_inst|blink_interval_inst|LessThan0~8_combout\,
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \textmode_vga_inst|blink_interval_inst|active_int~regout\);

-- Location: LC_X34_Y30_N4
\textmode_vga_inst|textmode_vga_h_sm_inst|h_sm_next_state~7\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|textmode_vga_h_sm_inst|h_sm_next_state~7_combout\ = (\textmode_vga_inst|textmode_vga_h_sm_inst|h_sm_next_state~5_combout\ & (\textmode_vga_inst|textmode_vga_h_sm_inst|h_sm_next_state~6_combout\ & 
-- (\textmode_vga_inst|textmode_vga_h_sm_inst|h_sm_next_state~4_combout\ & !\textmode_vga_inst|blink_interval_inst|active_int~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0080",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \textmode_vga_inst|textmode_vga_h_sm_inst|h_sm_next_state~5_combout\,
	datab => \textmode_vga_inst|textmode_vga_h_sm_inst|h_sm_next_state~6_combout\,
	datac => \textmode_vga_inst|textmode_vga_h_sm_inst|h_sm_next_state~4_combout\,
	datad => \textmode_vga_inst|blink_interval_inst|active_int~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \textmode_vga_inst|textmode_vga_h_sm_inst|h_sm_next_state~7_combout\);

-- Location: LC_X37_Y29_N0
\textmode_vga_inst|textmode_vga_h_sm_inst|Selector9~3\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|textmode_vga_h_sm_inst|Selector9~3_combout\ = (!\textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.CHAR_NEW_BG~regout\ & (((!\textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.CHAR_NEW_FG~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0055",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.CHAR_NEW_BG~regout\,
	datad => \textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.CHAR_NEW_FG~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \textmode_vga_inst|textmode_vga_h_sm_inst|Selector9~3_combout\);

-- Location: LC_X37_Y29_N7
\textmode_vga_inst|textmode_vga_h_sm_inst|Selector9~5\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|textmode_vga_h_sm_inst|Selector9~5_combout\ = (!\textmode_vga_inst|textmode_vga_h_sm_inst|Equal4~0_combout\ & ((\textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.PIXEL_FG~regout\) # 
-- ((\textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.PIXEL_BG~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "5454",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \textmode_vga_inst|textmode_vga_h_sm_inst|Equal4~0_combout\,
	datab => \textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.PIXEL_FG~regout\,
	datac => \textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.PIXEL_BG~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \textmode_vga_inst|textmode_vga_h_sm_inst|Selector9~5_combout\);

-- Location: LC_X37_Y29_N9
\textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.PIXEL_FG\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.PIXEL_FG~regout\ = DFFEAS((\textmode_vga_inst|textmode_vga_h_sm_inst|Mux0~4_combout\ & (!\textmode_vga_inst|textmode_vga_h_sm_inst|Selector9~3_combout\ & 
-- ((\textmode_vga_inst|font_rom_inst|Mux0_rtl_1|auto_generated|ram_block1a1~portadataout\)))) # (!\textmode_vga_inst|textmode_vga_h_sm_inst|Mux0~4_combout\ & ((\textmode_vga_inst|textmode_vga_h_sm_inst|Selector9~5_combout\) # 
-- ((!\textmode_vga_inst|textmode_vga_h_sm_inst|Selector9~3_combout\ & \textmode_vga_inst|font_rom_inst|Mux0_rtl_1|auto_generated|ram_block1a1~portadataout\)))), GLOBAL(\pll_vga_clk|altpll_component|_clk0\), 
-- !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "7350",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \pll_vga_clk|altpll_component|_clk0\,
	dataa => \textmode_vga_inst|textmode_vga_h_sm_inst|Mux0~4_combout\,
	datab => \textmode_vga_inst|textmode_vga_h_sm_inst|Selector9~3_combout\,
	datac => \textmode_vga_inst|textmode_vga_h_sm_inst|Selector9~5_combout\,
	datad => \textmode_vga_inst|font_rom_inst|Mux0_rtl_1|auto_generated|ram_block1a1~portadataout\,
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.PIXEL_FG~regout\);

-- Location: LC_X37_Y30_N3
\textmode_vga_inst|textmode_vga_h_sm_inst|WideOr5~4\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|textmode_vga_h_sm_inst|WideOr5~4_combout\ = (\textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.PIXEL_BG~regout\) # (((\textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.PIXEL_FG~regout\) # 
-- (!\textmode_vga_inst|textmode_vga_h_sm_inst|WideOr12~0_combout\)) # (!\textmode_vga_inst|textmode_vga_h_sm_inst|WideOr2~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "fbff",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.PIXEL_BG~regout\,
	datab => \textmode_vga_inst|textmode_vga_h_sm_inst|WideOr2~0_combout\,
	datac => \textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.PIXEL_FG~regout\,
	datad => \textmode_vga_inst|textmode_vga_h_sm_inst|WideOr12~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \textmode_vga_inst|textmode_vga_h_sm_inst|WideOr5~4_combout\);

-- Location: LC_X36_Y30_N9
\textmode_vga_inst|textmode_vga_h_sm_inst|Selector6~0\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|textmode_vga_h_sm_inst|Selector6~0_combout\ = (\textmode_vga_inst|textmode_vga_h_sm_inst|WideOr5~4_combout\ & ((\textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.PIXEL_CURSOR~regout\ & 
-- (!\textmode_vga_inst|textmode_vga_h_sm_inst|Equal5~1_combout\)) # (!\textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.PIXEL_CURSOR~regout\ & ((!\textmode_vga_inst|textmode_vga_h_sm_inst|h_sm_next_state~7_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "2700",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.PIXEL_CURSOR~regout\,
	datab => \textmode_vga_inst|textmode_vga_h_sm_inst|Equal5~1_combout\,
	datac => \textmode_vga_inst|textmode_vga_h_sm_inst|h_sm_next_state~7_combout\,
	datad => \textmode_vga_inst|textmode_vga_h_sm_inst|WideOr5~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \textmode_vga_inst|textmode_vga_h_sm_inst|Selector6~0_combout\);

-- Location: LC_X36_Y30_N0
\textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.CHAR_NEW_BG\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.CHAR_NEW_BG~regout\ = DFFEAS((\textmode_vga_inst|textmode_vga_h_sm_inst|Selector8~2_combout\ & (\textmode_vga_inst|textmode_vga_h_sm_inst|Selector6~0_combout\ & 
-- ((!\textmode_vga_inst|font_rom_inst|Mux0_rtl_1|auto_generated|ram_block1a0~portadataout\)))), GLOBAL(\pll_vga_clk|altpll_component|_clk0\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0088",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \pll_vga_clk|altpll_component|_clk0\,
	dataa => \textmode_vga_inst|textmode_vga_h_sm_inst|Selector8~2_combout\,
	datab => \textmode_vga_inst|textmode_vga_h_sm_inst|Selector6~0_combout\,
	datad => \textmode_vga_inst|font_rom_inst|Mux0_rtl_1|auto_generated|ram_block1a0~portadataout\,
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.CHAR_NEW_BG~regout\);

-- Location: LC_X37_Y29_N3
\textmode_vga_inst|textmode_vga_h_sm_inst|WideOr13~0\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|textmode_vga_h_sm_inst|WideOr13~0_combout\ = (\textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.CHAR_NEW_BG~regout\) # ((\textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.CHAR_NEW_CURSOR~regout\) # 
-- ((\textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.CHAR_NEW_FG~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "ffee",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.CHAR_NEW_BG~regout\,
	datab => \textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.CHAR_NEW_CURSOR~regout\,
	datad => \textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.CHAR_NEW_FG~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \textmode_vga_inst|textmode_vga_h_sm_inst|WideOr13~0_combout\);

-- Location: LC_X37_Y32_N9
\textmode_vga_inst|textmode_vga_h_sm_inst|current_char[0]\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|textmode_vga_h_sm_inst|current_char\(0) = DFFEAS((((\textmode_vga_inst|font_rom_inst|Mux0_rtl_1|auto_generated|ram_block1a0~portadataout\))), GLOBAL(\pll_vga_clk|altpll_component|_clk0\), 
-- !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , \textmode_vga_inst|textmode_vga_h_sm_inst|WideOr13~0_combout\, , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "ff00",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \pll_vga_clk|altpll_component|_clk0\,
	datad => \textmode_vga_inst|font_rom_inst|Mux0_rtl_1|auto_generated|ram_block1a0~portadataout\,
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	ena => \textmode_vga_inst|textmode_vga_h_sm_inst|WideOr13~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \textmode_vga_inst|textmode_vga_h_sm_inst|current_char\(0));

-- Location: LC_X37_Y32_N1
\textmode_vga_inst|textmode_vga_h_sm_inst|current_char[1]\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|textmode_vga_h_sm_inst|Mux0~0\ = (\textmode_vga_inst|textmode_vga_h_sm_inst|char_width_pixel\(1) & (\textmode_vga_inst|textmode_vga_h_sm_inst|char_width_pixel\(0) & ((!\textmode_vga_inst|textmode_vga_h_sm_inst|current_char\(0))))) # 
-- (!\textmode_vga_inst|textmode_vga_h_sm_inst|char_width_pixel\(1) & ((\textmode_vga_inst|textmode_vga_h_sm_inst|char_width_pixel\(0)) # ((!T1_current_char[1]))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "45cd",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "qfbk",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \pll_vga_clk|altpll_component|_clk0\,
	dataa => \textmode_vga_inst|textmode_vga_h_sm_inst|char_width_pixel\(1),
	datab => \textmode_vga_inst|textmode_vga_h_sm_inst|char_width_pixel\(0),
	datac => \textmode_vga_inst|font_rom_inst|Mux0_rtl_1|auto_generated|ram_block1a1~portadataout\,
	datad => \textmode_vga_inst|textmode_vga_h_sm_inst|current_char\(0),
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	sload => VCC,
	ena => \textmode_vga_inst|textmode_vga_h_sm_inst|WideOr13~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \textmode_vga_inst|textmode_vga_h_sm_inst|Mux0~0\,
	regout => \textmode_vga_inst|textmode_vga_h_sm_inst|current_char\(1));

-- Location: M4K_X15_Y33
\textmode_vga_inst|font_rom_inst|Mux0_rtl_1|auto_generated|ram_block1a3\ : stratix_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init1 => X"000007F00072004A007E008000000012280002A012120FFC0CD4500009F00080000C00020F82480C0803080108030A1448200800080B082C080B08090044080B007F0FFB1F3EFF80FFFFFF8000FF0FF80FF90FFA0FE0088B088808890844084C0420FFBF00A0FFFFFFA000BFFFE000FF008B08ACFFFF0080FFFFFF8000FF00FFFF800FE00E1C00BFFFA0FFFFFFBF0514008C008D008CFFFFFFFFFFFF5555555502A002A00FEC0CC032C000400454086C00A400A400E3002C080608260FEC08A60FFC018009E4082209A0080008084800080C0806082C08200826004407C0088A011D01180FEC0FE60FE008AC08A008A6382008AA08AC08A008A608AC08003804",
	mem_init0 => X"043000060FBC0FFC07F809A0480003800780080008000FFC09200860482048200820002007C00FFC018040000FEC004048200FFC08A008240820082008A0000620000003080401C00FFC08C40FC001E003C00C0008000FFC084400440E040844080400700070080400C008040FFC0040088408440844080408040844008C0BC80DC40630012003600E300630084408440F84084408440898084408C40FFC08C401800C0000801E0003E001C00C0C07F8000E08E401803847022000000DFC000007F007F00080020002A002A00FFC0FFC0FFC0F0012120FFC000007FC01F001F00F78001407FC0F840874FBDF0420FC3F03C00FF80E3807F00FE00E7C09840000",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "mjl_stratix.calc_top0.rtl.mif",
	init_file_layout => "port_a",
	logical_ram_name => "textmode_vga:textmode_vga_inst|font_rom:font_rom_inst|altsyncram:Mux0_rtl_1|altsyncram_7sv:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 12,
	port_a_byte_enable_clear => "none",
	port_a_byte_enable_clock => "none",
	port_a_data_in_clear => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 0,
	port_a_last_address => 4095,
	port_a_logical_ram_depth => 4096,
	port_a_logical_ram_width => 8,
	port_a_write_enable_clear => "none",
	port_a_write_enable_clock => "none",
	port_b_address_width => 12,
	port_b_data_width => 1,
	ram_block_type => "M4K")
-- pragma translate_on
PORT MAP (
	clk0 => \pll_vga_clk|altpll_component|_clk0\,
	portaaddr => \textmode_vga_inst|font_rom_inst|Mux0_rtl_1|auto_generated|ram_block1a3_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \textmode_vga_inst|font_rom_inst|Mux0_rtl_1|auto_generated|ram_block1a3_PORTADATAOUT_bus\);

-- Location: M4K_X15_Y35
\textmode_vga_inst|font_rom_inst|Mux0_rtl_1|auto_generated|ram_block1a2\ : stratix_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init1 => X"000007F00066004A004400000000001E20000080133A004409BE5000084000800008000208F848080801080308020FFC7FFC3FE0080908240809080B0004080A007F08090000FF80FFFF00000080080A080B080808200FF90FF80FFB0FFC0FD40420FFBF00A0FFFFFFA000BFFFE000FF009908A4008000800000008000800000008002B8021000BFFFA0FFFFFFBF04E400980099009900800000AAAAAAAA000001C00360070009BE21BE004005F408EC00BC00BC00710FC4080C082C082808AC084003C00E040FFE0B200800080848000806080608260820082C004C09E00FF8013701300826082C082408A608A008AC282008AE08A608A008AC08A808002C0C",
	mem_init0 => X"046000020804000000400B20480007C00C000C00080007F809A00FC008207FC008200FC0006008040FFC700008200FFC48200FF808A0086008200FFC08A0000220000006080400E00FFC0984087C03F00E0006000800080C08640FFC08040FFC0804003800380FFC0FFC0800080400400C0C0FFC0FFC0FFC0C0C0FFC0098080800040C18012001C008000000084408440F04084C084400B00844098408180C0C0300000000801000008003E0080403F0001E087C030008440FF8001E0038000003F007E003E0020003E00080060000180B180F00133A00440DFC031800E003F801C00FFC0FFC02FC0860F99F0660FE7F018009F009F003E007F00F6C08940000",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "mjl_stratix.calc_top0.rtl.mif",
	init_file_layout => "port_a",
	logical_ram_name => "textmode_vga:textmode_vga_inst|font_rom:font_rom_inst|altsyncram:Mux0_rtl_1|altsyncram_7sv:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 12,
	port_a_byte_enable_clear => "none",
	port_a_byte_enable_clock => "none",
	port_a_data_in_clear => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 0,
	port_a_last_address => 4095,
	port_a_logical_ram_depth => 4096,
	port_a_logical_ram_width => 8,
	port_a_write_enable_clear => "none",
	port_a_write_enable_clock => "none",
	port_b_address_width => 12,
	port_b_data_width => 1,
	ram_block_type => "M4K")
-- pragma translate_on
PORT MAP (
	clk0 => \pll_vga_clk|altpll_component|_clk0\,
	portaaddr => \textmode_vga_inst|font_rom_inst|Mux0_rtl_1|auto_generated|ram_block1a2_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \textmode_vga_inst|font_rom_inst|Mux0_rtl_1|auto_generated|ram_block1a2_PORTADATAOUT_bus\);

-- Location: LC_X37_Y32_N2
\textmode_vga_inst|textmode_vga_h_sm_inst|current_char[2]\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|textmode_vga_h_sm_inst|current_char\(2) = DFFEAS(GND, GLOBAL(\pll_vga_clk|altpll_component|_clk0\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , \textmode_vga_inst|textmode_vga_h_sm_inst|WideOr13~0_combout\, 
-- \textmode_vga_inst|font_rom_inst|Mux0_rtl_1|auto_generated|ram_block1a2~portadataout\, , , VCC)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \pll_vga_clk|altpll_component|_clk0\,
	datac => \textmode_vga_inst|font_rom_inst|Mux0_rtl_1|auto_generated|ram_block1a2~portadataout\,
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	sload => VCC,
	ena => \textmode_vga_inst|textmode_vga_h_sm_inst|WideOr13~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \textmode_vga_inst|textmode_vga_h_sm_inst|current_char\(2));

-- Location: LC_X37_Y32_N7
\textmode_vga_inst|textmode_vga_h_sm_inst|current_char[3]\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|textmode_vga_h_sm_inst|Mux0~1\ = (\textmode_vga_inst|textmode_vga_h_sm_inst|Add0~0_combout\ & ((\textmode_vga_inst|textmode_vga_h_sm_inst|Mux0~0\ & ((!\textmode_vga_inst|textmode_vga_h_sm_inst|current_char\(2)))) # 
-- (!\textmode_vga_inst|textmode_vga_h_sm_inst|Mux0~0\ & (!T1_current_char[3])))) # (!\textmode_vga_inst|textmode_vga_h_sm_inst|Add0~0_combout\ & (\textmode_vga_inst|textmode_vga_h_sm_inst|Mux0~0\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "46ce",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "qfbk",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \pll_vga_clk|altpll_component|_clk0\,
	dataa => \textmode_vga_inst|textmode_vga_h_sm_inst|Add0~0_combout\,
	datab => \textmode_vga_inst|textmode_vga_h_sm_inst|Mux0~0\,
	datac => \textmode_vga_inst|font_rom_inst|Mux0_rtl_1|auto_generated|ram_block1a3~portadataout\,
	datad => \textmode_vga_inst|textmode_vga_h_sm_inst|current_char\(2),
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	sload => VCC,
	ena => \textmode_vga_inst|textmode_vga_h_sm_inst|WideOr13~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \textmode_vga_inst|textmode_vga_h_sm_inst|Mux0~1\,
	regout => \textmode_vga_inst|textmode_vga_h_sm_inst|current_char\(3));

-- Location: LC_X37_Y31_N1
\textmode_vga_inst|textmode_vga_h_sm_inst|Equal4~1\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|textmode_vga_h_sm_inst|Equal4~1_combout\ = (((\textmode_vga_inst|textmode_vga_h_sm_inst|char_width_pixel\(1) & \textmode_vga_inst|textmode_vga_h_sm_inst|char_width_pixel\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "f000",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datac => \textmode_vga_inst|textmode_vga_h_sm_inst|char_width_pixel\(1),
	datad => \textmode_vga_inst|textmode_vga_h_sm_inst|char_width_pixel\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \textmode_vga_inst|textmode_vga_h_sm_inst|Equal4~1_combout\);

-- Location: LC_X37_Y31_N0
\textmode_vga_inst|textmode_vga_h_sm_inst|char_width_pixel[2]\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|textmode_vga_h_sm_inst|char_width_pixel\(2) = DFFEAS((\textmode_vga_inst|textmode_vga_h_sm_inst|WideOr13~1_combout\ & (\textmode_vga_inst|textmode_vga_h_sm_inst|char_width_pixel\(2) $ 
-- (((\textmode_vga_inst|textmode_vga_h_sm_inst|char_width_pixel\(0) & \textmode_vga_inst|textmode_vga_h_sm_inst|char_width_pixel\(1)))))), GLOBAL(\pll_vga_clk|altpll_component|_clk0\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , 
-- \textmode_vga_inst|textmode_vga_h_sm_inst|WideOr12~combout\, , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "7080",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \pll_vga_clk|altpll_component|_clk0\,
	dataa => \textmode_vga_inst|textmode_vga_h_sm_inst|char_width_pixel\(0),
	datab => \textmode_vga_inst|textmode_vga_h_sm_inst|char_width_pixel\(1),
	datac => \textmode_vga_inst|textmode_vga_h_sm_inst|WideOr13~1_combout\,
	datad => \textmode_vga_inst|textmode_vga_h_sm_inst|char_width_pixel\(2),
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	ena => \textmode_vga_inst|textmode_vga_h_sm_inst|WideOr12~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \textmode_vga_inst|textmode_vga_h_sm_inst|char_width_pixel\(2));

-- Location: M4K_X15_Y32
\textmode_vga_inst|font_rom_inst|Mux0_rtl_1|auto_generated|ram_block1a5\ : stratix_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init1 => X"000007F0004E007E004000000002000C100000801DE600043B305000084000800002000208F93FE20FF80FFA0FF803F00FE00FE00FFB0FEC0FF80FFA0FB80FF8007F08080000FF80FFFF00800000080A080B080908000C180C1A0C1A07F80FF40FF0FFBF00A0FFBFFFA000BFFFA000BF0FF30FCC008000800080008000800080000002B8033000FFFFE0FFFFFFFF04040FF30FF30FF000000000FFFF5555AAAA01C0036007003B302E3007C004040E00009800BC0FFB0FEC0FE00FE008020FC0004206600FFE0C0C0FE00FFA0FFA3FE40FE00FE80FE00FE40FE80FFC09E00C190FE20FE20800080C08040CE00CE40CE80C600FC40FC00FC40FC80CE20FE40C0C",
	mem_init0 => X"07C000060040000008040C603FE00C600FE007E00FE00C200E6000E07FE00FE00FE00FE00FE008000E607FEC08000FE03FE0000C0CE00FFC0C600FC00FC000082000000C0FFC070008040C3C087C0F3C0FFC03FC0FFC080C0F9C0FFC3FFC007C0FFC0FFC0FFC0C000F3C07FC08040FFC078C000C0C0C07F80C0C0FFC0FF00BF8003C01C001200C180000000007FC0FFC007C0FC00FC40FFC0FFC0C3C080007F80060000000800000008003E003F0080400000FD80C600FCC0FF8001E0038000000F0078001C00200008001C0060000180B180F001DE600040DFC031807FC004001C00E14001402FC078CF99F0660FE7F018009F009F001C003F00F6C08940000",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "mjl_stratix.calc_top0.rtl.mif",
	init_file_layout => "port_a",
	logical_ram_name => "textmode_vga:textmode_vga_inst|font_rom:font_rom_inst|altsyncram:Mux0_rtl_1|altsyncram_7sv:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 12,
	port_a_byte_enable_clear => "none",
	port_a_byte_enable_clock => "none",
	port_a_data_in_clear => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 0,
	port_a_last_address => 4095,
	port_a_logical_ram_depth => 4096,
	port_a_logical_ram_width => 8,
	port_a_write_enable_clear => "none",
	port_a_write_enable_clock => "none",
	port_b_address_width => 12,
	port_b_data_width => 1,
	ram_block_type => "M4K")
-- pragma translate_on
PORT MAP (
	clk0 => \pll_vga_clk|altpll_component|_clk0\,
	portaaddr => \textmode_vga_inst|font_rom_inst|Mux0_rtl_1|auto_generated|ram_block1a5_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \textmode_vga_inst|font_rom_inst|Mux0_rtl_1|auto_generated|ram_block1a5_PORTADATAOUT_bus\);

-- Location: M4K_X39_Y34
\textmode_vga_inst|font_rom_inst|Mux0_rtl_1|auto_generated|ram_block1a4\ : stratix_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init1 => X"000007F0005A004A007E00800000001E380002A017320FFC0E60500009F00080000600020F836806080208030801021008200800080A0828080A080B08FC0809007F0FFA1F3EFF80FFFFFF8000FF0FF80FF90FFB0FE009CA09C809CB0C0C08580420000000A000000020008000200080009A07E8FFFF0080FFFFFF8000FF00FFFF800FE00E1C00800020000000000514009900990098FFFFFFFF5555AAAA0000036001C00FEC0E603A60004005A4080000BC00BC01C2002807E208220FE607E207FE03C0081C080608E008000808680007E807EC08280820082C0FFC0F2009CB013701300FE80FE60FE008A808A008AC182007EE07E807E407EC08A607E41804",
	mem_init0 => X"0460000407F80FFC0FBC08E0680007C00C000C0007E008200B2000207FC008200820002000600FFC03C040200FEC00207FC0084408A007FC0820086007E0000C200000060FFC0380080408640FC003F00E00060008000FFC08C400C43C040044080400E00038080001E00FFC0FFC0040088400E408E40C0C0804084400980BC80DE4036001200630063006300C44084400C4084408440FFC084408640FFC0C0C00C00C0000800E0003E001C007F80C0C000007BC00C038470FF800000DFC000003F007E003E00200008003E00FFC0FFC0FFC0F0017320FFC000007FC03F800E00F78001400140F840FDCFBDF0420FC3F03C00FF80E3803E007F00E7C09840000",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "mjl_stratix.calc_top0.rtl.mif",
	init_file_layout => "port_a",
	logical_ram_name => "textmode_vga:textmode_vga_inst|font_rom:font_rom_inst|altsyncram:Mux0_rtl_1|altsyncram_7sv:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 12,
	port_a_byte_enable_clear => "none",
	port_a_byte_enable_clock => "none",
	port_a_data_in_clear => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 0,
	port_a_last_address => 4095,
	port_a_logical_ram_depth => 4096,
	port_a_logical_ram_width => 8,
	port_a_write_enable_clear => "none",
	port_a_write_enable_clock => "none",
	port_b_address_width => 12,
	port_b_data_width => 1,
	ram_block_type => "M4K")
-- pragma translate_on
PORT MAP (
	clk0 => \pll_vga_clk|altpll_component|_clk0\,
	portaaddr => \textmode_vga_inst|font_rom_inst|Mux0_rtl_1|auto_generated|ram_block1a4_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \textmode_vga_inst|font_rom_inst|Mux0_rtl_1|auto_generated|ram_block1a4_PORTADATAOUT_bus\);

-- Location: LC_X37_Y32_N6
\textmode_vga_inst|textmode_vga_h_sm_inst|current_char[4]\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|textmode_vga_h_sm_inst|current_char\(4) = DFFEAS(GND, GLOBAL(\pll_vga_clk|altpll_component|_clk0\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , \textmode_vga_inst|textmode_vga_h_sm_inst|WideOr13~0_combout\, 
-- \textmode_vga_inst|font_rom_inst|Mux0_rtl_1|auto_generated|ram_block1a4~portadataout\, , , VCC)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \pll_vga_clk|altpll_component|_clk0\,
	datac => \textmode_vga_inst|font_rom_inst|Mux0_rtl_1|auto_generated|ram_block1a4~portadataout\,
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	sload => VCC,
	ena => \textmode_vga_inst|textmode_vga_h_sm_inst|WideOr13~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \textmode_vga_inst|textmode_vga_h_sm_inst|current_char\(4));

-- Location: LC_X37_Y32_N5
\textmode_vga_inst|textmode_vga_h_sm_inst|current_char[5]\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|textmode_vga_h_sm_inst|Mux0~2\ = (\textmode_vga_inst|textmode_vga_h_sm_inst|char_width_pixel\(1) & (\textmode_vga_inst|textmode_vga_h_sm_inst|char_width_pixel\(0) & ((!\textmode_vga_inst|textmode_vga_h_sm_inst|current_char\(4))))) # 
-- (!\textmode_vga_inst|textmode_vga_h_sm_inst|char_width_pixel\(1) & ((\textmode_vga_inst|textmode_vga_h_sm_inst|char_width_pixel\(0)) # ((!T1_current_char[5]))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "45cd",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "qfbk",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \pll_vga_clk|altpll_component|_clk0\,
	dataa => \textmode_vga_inst|textmode_vga_h_sm_inst|char_width_pixel\(1),
	datab => \textmode_vga_inst|textmode_vga_h_sm_inst|char_width_pixel\(0),
	datac => \textmode_vga_inst|font_rom_inst|Mux0_rtl_1|auto_generated|ram_block1a5~portadataout\,
	datad => \textmode_vga_inst|textmode_vga_h_sm_inst|current_char\(4),
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	sload => VCC,
	ena => \textmode_vga_inst|textmode_vga_h_sm_inst|WideOr13~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \textmode_vga_inst|textmode_vga_h_sm_inst|Mux0~2\,
	regout => \textmode_vga_inst|textmode_vga_h_sm_inst|current_char\(5));

-- Location: M4K_X39_Y35
\textmode_vga_inst|font_rom_inst|Mux0_rtl_1|auto_generated|ram_block1a7\ : stratix_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init1 => X"000000000000000000000000000000000000000000000FFC08005000000000000000000200000000000000000000000000000000000000000000000000000000007F00000000FF80FFFF00800000000000000000000000000000000000000000000000A000A000A000A000A000A000A0000000000080008000800080008000800000000000000000000000000000000000000000000000000000FFFF55555555000000000000080000000000000000000000000000000000000000000000000000040000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init0 => X"000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000800000000000000000000000000000000000000000000000000000000000000000000000000000000000000FFC000000000000000002A007FC001C00000000FFFF0000FFFF000000C001C00000000007F807F80000",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "mjl_stratix.calc_top0.rtl.mif",
	init_file_layout => "port_a",
	logical_ram_name => "textmode_vga:textmode_vga_inst|font_rom:font_rom_inst|altsyncram:Mux0_rtl_1|altsyncram_7sv:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 12,
	port_a_byte_enable_clear => "none",
	port_a_byte_enable_clock => "none",
	port_a_data_in_clear => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 0,
	port_a_last_address => 4095,
	port_a_logical_ram_depth => 4096,
	port_a_logical_ram_width => 8,
	port_a_write_enable_clear => "none",
	port_a_write_enable_clock => "none",
	port_b_address_width => 12,
	port_b_data_width => 1,
	ram_block_type => "M4K")
-- pragma translate_on
PORT MAP (
	clk0 => \pll_vga_clk|altpll_component|_clk0\,
	portaaddr => \textmode_vga_inst|font_rom_inst|Mux0_rtl_1|auto_generated|ram_block1a7_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \textmode_vga_inst|font_rom_inst|Mux0_rtl_1|auto_generated|ram_block1a7_PORTADATAOUT_bus\);

-- Location: M4K_X15_Y34
\textmode_vga_inst|font_rom_inst|Mux0_rtl_1|auto_generated|ram_block1a6\ : stratix_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init1 => X"000007F00064003400000000000200000000008008C40FFC3F185000084000800000000200781FE007F807F807F801E007C007E007F107C407F007F0070007F0007F00000000FF80FFFF0080000000020002000000000E380E3A0E3803F007E00BD0FFBF00A0FFBFFFA000BFFFA000BF0FE1080400800080008000800080008000000298012000FFFFE0FFFFFFFF03F80FE20FE20FE000000000AAAAAAAA00000080022000003F18241807C003F80600000000A00FF90FC4080007C0000008000046042007F8040007C007FA07F21FE40800080007C007C407C0084409C00E380FC00FC200000008000404C004C404C00440080008000800080004C008000618",
	mem_init0 => X"078000020040000008040C201FE0082007E003E008000400044000C0402007C007C00FC00FC000000C203FEC00000FC00020001804C0080004400780080000002000000800000E0000000E1C003C0C0C07FC01FC07FC001C07180F3827F8003807F80FFC0FFC0E000E1C000400000FFC0F98001C0E1C03F0061807B80FE001F000180080012008080000000003F807B8003C07800784088007B80C18080003F00030000000800000008002A000000000000008400C3007980220000E000000000030060000800200008000800200001009100F0008C40FFC0DFC01100FFE004002A00FFC001C0278003CFC3F03C0FFFF000001E001C0008001E00FFC08040000",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "mjl_stratix.calc_top0.rtl.mif",
	init_file_layout => "port_a",
	logical_ram_name => "textmode_vga:textmode_vga_inst|font_rom:font_rom_inst|altsyncram:Mux0_rtl_1|altsyncram_7sv:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 12,
	port_a_byte_enable_clear => "none",
	port_a_byte_enable_clock => "none",
	port_a_data_in_clear => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 0,
	port_a_last_address => 4095,
	port_a_logical_ram_depth => 4096,
	port_a_logical_ram_width => 8,
	port_a_write_enable_clear => "none",
	port_a_write_enable_clock => "none",
	port_b_address_width => 12,
	port_b_data_width => 1,
	ram_block_type => "M4K")
-- pragma translate_on
PORT MAP (
	clk0 => \pll_vga_clk|altpll_component|_clk0\,
	portaaddr => \textmode_vga_inst|font_rom_inst|Mux0_rtl_1|auto_generated|ram_block1a6_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \textmode_vga_inst|font_rom_inst|Mux0_rtl_1|auto_generated|ram_block1a6_PORTADATAOUT_bus\);

-- Location: LC_X37_Y32_N0
\textmode_vga_inst|textmode_vga_h_sm_inst|current_char[6]\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|textmode_vga_h_sm_inst|current_char\(6) = DFFEAS((((\textmode_vga_inst|font_rom_inst|Mux0_rtl_1|auto_generated|ram_block1a6~portadataout\))), GLOBAL(\pll_vga_clk|altpll_component|_clk0\), 
-- !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , \textmode_vga_inst|textmode_vga_h_sm_inst|WideOr13~0_combout\, , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "ff00",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \pll_vga_clk|altpll_component|_clk0\,
	datad => \textmode_vga_inst|font_rom_inst|Mux0_rtl_1|auto_generated|ram_block1a6~portadataout\,
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	ena => \textmode_vga_inst|textmode_vga_h_sm_inst|WideOr13~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \textmode_vga_inst|textmode_vga_h_sm_inst|current_char\(6));

-- Location: LC_X37_Y32_N4
\textmode_vga_inst|textmode_vga_h_sm_inst|current_char[7]\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|textmode_vga_h_sm_inst|Mux0~3\ = (\textmode_vga_inst|textmode_vga_h_sm_inst|Add0~0_combout\ & ((\textmode_vga_inst|textmode_vga_h_sm_inst|Mux0~2\ & ((!\textmode_vga_inst|textmode_vga_h_sm_inst|current_char\(6)))) # 
-- (!\textmode_vga_inst|textmode_vga_h_sm_inst|Mux0~2\ & (!T1_current_char[7])))) # (!\textmode_vga_inst|textmode_vga_h_sm_inst|Add0~0_combout\ & (\textmode_vga_inst|textmode_vga_h_sm_inst|Mux0~2\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "46ce",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "qfbk",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \pll_vga_clk|altpll_component|_clk0\,
	dataa => \textmode_vga_inst|textmode_vga_h_sm_inst|Add0~0_combout\,
	datab => \textmode_vga_inst|textmode_vga_h_sm_inst|Mux0~2\,
	datac => \textmode_vga_inst|font_rom_inst|Mux0_rtl_1|auto_generated|ram_block1a7~portadataout\,
	datad => \textmode_vga_inst|textmode_vga_h_sm_inst|current_char\(6),
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	sload => VCC,
	ena => \textmode_vga_inst|textmode_vga_h_sm_inst|WideOr13~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \textmode_vga_inst|textmode_vga_h_sm_inst|Mux0~3\,
	regout => \textmode_vga_inst|textmode_vga_h_sm_inst|current_char\(7));

-- Location: LC_X37_Y32_N3
\textmode_vga_inst|textmode_vga_h_sm_inst|Mux0~4\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|textmode_vga_h_sm_inst|Mux0~4_combout\ = (\textmode_vga_inst|textmode_vga_h_sm_inst|Mux0~1\ & ((\textmode_vga_inst|textmode_vga_h_sm_inst|Mux0~3\) # (\textmode_vga_inst|textmode_vga_h_sm_inst|Equal4~1_combout\ $ 
-- (!\textmode_vga_inst|textmode_vga_h_sm_inst|char_width_pixel\(2))))) # (!\textmode_vga_inst|textmode_vga_h_sm_inst|Mux0~1\ & (\textmode_vga_inst|textmode_vga_h_sm_inst|Mux0~3\ & (\textmode_vga_inst|textmode_vga_h_sm_inst|Equal4~1_combout\ $ 
-- (\textmode_vga_inst|textmode_vga_h_sm_inst|char_width_pixel\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "be82",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \textmode_vga_inst|textmode_vga_h_sm_inst|Mux0~1\,
	datab => \textmode_vga_inst|textmode_vga_h_sm_inst|Equal4~1_combout\,
	datac => \textmode_vga_inst|textmode_vga_h_sm_inst|char_width_pixel\(2),
	datad => \textmode_vga_inst|textmode_vga_h_sm_inst|Mux0~3\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \textmode_vga_inst|textmode_vga_h_sm_inst|Mux0~4_combout\);

-- Location: LC_X37_Y29_N1
\textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.PIXEL_BG\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.PIXEL_BG~regout\ = DFFEAS((\textmode_vga_inst|textmode_vga_h_sm_inst|Mux0~4_combout\ & ((\textmode_vga_inst|textmode_vga_h_sm_inst|Selector9~5_combout\) # 
-- ((!\textmode_vga_inst|textmode_vga_h_sm_inst|Selector9~3_combout\ & !\textmode_vga_inst|font_rom_inst|Mux0_rtl_1|auto_generated|ram_block1a1~portadataout\)))) # (!\textmode_vga_inst|textmode_vga_h_sm_inst|Mux0~4_combout\ & 
-- (!\textmode_vga_inst|textmode_vga_h_sm_inst|Selector9~3_combout\ & ((!\textmode_vga_inst|font_rom_inst|Mux0_rtl_1|auto_generated|ram_block1a1~portadataout\)))), GLOBAL(\pll_vga_clk|altpll_component|_clk0\), 
-- !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "a0b3",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \pll_vga_clk|altpll_component|_clk0\,
	dataa => \textmode_vga_inst|textmode_vga_h_sm_inst|Mux0~4_combout\,
	datab => \textmode_vga_inst|textmode_vga_h_sm_inst|Selector9~3_combout\,
	datac => \textmode_vga_inst|textmode_vga_h_sm_inst|Selector9~5_combout\,
	datad => \textmode_vga_inst|font_rom_inst|Mux0_rtl_1|auto_generated|ram_block1a1~portadataout\,
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.PIXEL_BG~regout\);

-- Location: LC_X37_Y29_N6
\textmode_vga_inst|textmode_vga_h_sm_inst|Selector9~2\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|textmode_vga_h_sm_inst|Selector9~2_combout\ = (((!\textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.PIXEL_BG~regout\ & !\textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.PIXEL_FG~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "000f",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datac => \textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.PIXEL_BG~regout\,
	datad => \textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.PIXEL_FG~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \textmode_vga_inst|textmode_vga_h_sm_inst|Selector9~2_combout\);

-- Location: LC_X36_Y30_N6
\textmode_vga_inst|textmode_vga_h_sm_inst|Selector13~0\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|textmode_vga_h_sm_inst|Selector13~0_combout\ = ((\textmode_vga_inst|textmode_vga_h_sm_inst|Equal1~1_combout\ & (!\textmode_vga_inst|textmode_vga_v_sm_inst|WideOr9~combout\ & 
-- \textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.HBACK~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0c00",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \textmode_vga_inst|textmode_vga_h_sm_inst|Equal1~1_combout\,
	datac => \textmode_vga_inst|textmode_vga_v_sm_inst|WideOr9~combout\,
	datad => \textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.HBACK~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \textmode_vga_inst|textmode_vga_h_sm_inst|Selector13~0_combout\);

-- Location: LC_X36_Y30_N5
\textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.CHAR_NEW_CURSOR\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.CHAR_NEW_CURSOR~regout\ = DFFEAS((\textmode_vga_inst|textmode_vga_h_sm_inst|h_sm_next_state~7_combout\ & ((\textmode_vga_inst|textmode_vga_h_sm_inst|Selector13~0_combout\) # 
-- ((!\textmode_vga_inst|textmode_vga_h_sm_inst|Selector9~2_combout\ & \textmode_vga_inst|textmode_vga_h_sm_inst|Selector4~0_combout\)))), GLOBAL(\pll_vga_clk|altpll_component|_clk0\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "f040",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \pll_vga_clk|altpll_component|_clk0\,
	dataa => \textmode_vga_inst|textmode_vga_h_sm_inst|Selector9~2_combout\,
	datab => \textmode_vga_inst|textmode_vga_h_sm_inst|Selector4~0_combout\,
	datac => \textmode_vga_inst|textmode_vga_h_sm_inst|h_sm_next_state~7_combout\,
	datad => \textmode_vga_inst|textmode_vga_h_sm_inst|Selector13~0_combout\,
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.CHAR_NEW_CURSOR~regout\);

-- Location: LC_X36_Y30_N4
\textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.PIXEL_CURSOR\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.PIXEL_CURSOR~regout\ = DFFEAS(((\textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.CHAR_NEW_CURSOR~regout\) # 
-- ((\textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.PIXEL_CURSOR~regout\ & !\textmode_vga_inst|textmode_vga_h_sm_inst|Equal4~0_combout\))), GLOBAL(\pll_vga_clk|altpll_component|_clk0\), 
-- !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "f0fa",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \pll_vga_clk|altpll_component|_clk0\,
	dataa => \textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.PIXEL_CURSOR~regout\,
	datac => \textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.CHAR_NEW_CURSOR~regout\,
	datad => \textmode_vga_inst|textmode_vga_h_sm_inst|Equal4~0_combout\,
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.PIXEL_CURSOR~regout\);

-- Location: LC_X36_Y30_N1
\textmode_vga_inst|textmode_vga_h_sm_inst|Selector8~0\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|textmode_vga_h_sm_inst|Selector8~0_combout\ = (\textmode_vga_inst|textmode_vga_h_sm_inst|Selector9~2_combout\ & (\textmode_vga_inst|textmode_vga_h_sm_inst|Equal1~1_combout\ & 
-- (\textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.HBACK~regout\))) # (!\textmode_vga_inst|textmode_vga_h_sm_inst|Selector9~2_combout\ & ((\textmode_vga_inst|textmode_vga_h_sm_inst|Equal4~0_combout\) # 
-- ((\textmode_vga_inst|textmode_vga_h_sm_inst|Equal1~1_combout\ & \textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.HBACK~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "d5c0",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \textmode_vga_inst|textmode_vga_h_sm_inst|Selector9~2_combout\,
	datab => \textmode_vga_inst|textmode_vga_h_sm_inst|Equal1~1_combout\,
	datac => \textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.HBACK~regout\,
	datad => \textmode_vga_inst|textmode_vga_h_sm_inst|Equal4~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \textmode_vga_inst|textmode_vga_h_sm_inst|Selector8~0_combout\);

-- Location: LC_X36_Y30_N7
\textmode_vga_inst|textmode_vga_h_sm_inst|Selector8~1\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|textmode_vga_h_sm_inst|Selector8~1_combout\ = ((\textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.HBACK~regout\ & ((!\textmode_vga_inst|textmode_vga_v_sm_inst|WideOr9~combout\))) # 
-- (!\textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.HBACK~regout\ & (!\textmode_vga_inst|textmode_vga_h_sm_inst|Equal5~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0f33",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \textmode_vga_inst|textmode_vga_h_sm_inst|Equal5~1_combout\,
	datac => \textmode_vga_inst|textmode_vga_v_sm_inst|WideOr9~combout\,
	datad => \textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.HBACK~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \textmode_vga_inst|textmode_vga_h_sm_inst|Selector8~1_combout\);

-- Location: LC_X36_Y30_N2
\textmode_vga_inst|textmode_vga_h_sm_inst|Selector8~2\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|textmode_vga_h_sm_inst|Selector8~2_combout\ = (\textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.PIXEL_CURSOR~regout\ & ((\textmode_vga_inst|textmode_vga_h_sm_inst|Equal4~0_combout\) # 
-- ((\textmode_vga_inst|textmode_vga_h_sm_inst|Selector8~0_combout\ & \textmode_vga_inst|textmode_vga_h_sm_inst|Selector8~1_combout\)))) # (!\textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.PIXEL_CURSOR~regout\ & 
-- (\textmode_vga_inst|textmode_vga_h_sm_inst|Selector8~0_combout\ & (\textmode_vga_inst|textmode_vga_h_sm_inst|Selector8~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "eac0",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.PIXEL_CURSOR~regout\,
	datab => \textmode_vga_inst|textmode_vga_h_sm_inst|Selector8~0_combout\,
	datac => \textmode_vga_inst|textmode_vga_h_sm_inst|Selector8~1_combout\,
	datad => \textmode_vga_inst|textmode_vga_h_sm_inst|Equal4~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \textmode_vga_inst|textmode_vga_h_sm_inst|Selector8~2_combout\);

-- Location: LC_X36_Y30_N3
\textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.CHAR_NEW_FG\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.CHAR_NEW_FG~regout\ = DFFEAS((\textmode_vga_inst|textmode_vga_h_sm_inst|Selector8~2_combout\ & (\textmode_vga_inst|textmode_vga_h_sm_inst|Selector6~0_combout\ & 
-- ((\textmode_vga_inst|font_rom_inst|Mux0_rtl_1|auto_generated|ram_block1a0~portadataout\)))), GLOBAL(\pll_vga_clk|altpll_component|_clk0\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "8800",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \pll_vga_clk|altpll_component|_clk0\,
	dataa => \textmode_vga_inst|textmode_vga_h_sm_inst|Selector8~2_combout\,
	datab => \textmode_vga_inst|textmode_vga_h_sm_inst|Selector6~0_combout\,
	datad => \textmode_vga_inst|font_rom_inst|Mux0_rtl_1|auto_generated|ram_block1a0~portadataout\,
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.CHAR_NEW_FG~regout\);

-- Location: LC_X36_Y30_N8
\textmode_vga_inst|textmode_vga_h_sm_inst|WideOr13~1\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|textmode_vga_h_sm_inst|WideOr13~1_combout\ = (!\textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.CHAR_NEW_FG~regout\ & (!\textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.CHAR_NEW_CURSOR~regout\ & 
-- (!\textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.BLACK_CHAR_NEW~regout\ & !\textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.CHAR_NEW_BG~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.CHAR_NEW_FG~regout\,
	datab => \textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.CHAR_NEW_CURSOR~regout\,
	datac => \textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.BLACK_CHAR_NEW~regout\,
	datad => \textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.CHAR_NEW_BG~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \textmode_vga_inst|textmode_vga_h_sm_inst|WideOr13~1_combout\);

-- Location: LC_X37_Y31_N2
\textmode_vga_inst|textmode_vga_h_sm_inst|char_width_pixel[0]\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|textmode_vga_h_sm_inst|char_width_pixel\(0) = DFFEAS((((!\textmode_vga_inst|textmode_vga_h_sm_inst|char_width_pixel\(0)) # (!\textmode_vga_inst|textmode_vga_h_sm_inst|WideOr13~1_combout\))), GLOBAL(\pll_vga_clk|altpll_component|_clk0\), 
-- !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , \textmode_vga_inst|textmode_vga_h_sm_inst|WideOr12~combout\, , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0fff",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \pll_vga_clk|altpll_component|_clk0\,
	datac => \textmode_vga_inst|textmode_vga_h_sm_inst|WideOr13~1_combout\,
	datad => \textmode_vga_inst|textmode_vga_h_sm_inst|char_width_pixel\(0),
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	ena => \textmode_vga_inst|textmode_vga_h_sm_inst|WideOr12~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \textmode_vga_inst|textmode_vga_h_sm_inst|char_width_pixel\(0));

-- Location: LC_X37_Y31_N3
\textmode_vga_inst|textmode_vga_h_sm_inst|char_width_pixel[3]\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|textmode_vga_h_sm_inst|char_width_pixel\(3) = DFFEAS((\textmode_vga_inst|textmode_vga_h_sm_inst|WideOr13~1_combout\ & (\textmode_vga_inst|textmode_vga_h_sm_inst|char_width_pixel\(3) $ 
-- (((\textmode_vga_inst|textmode_vga_h_sm_inst|Equal4~1_combout\ & \textmode_vga_inst|textmode_vga_h_sm_inst|char_width_pixel\(2)))))), GLOBAL(\pll_vga_clk|altpll_component|_clk0\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , 
-- \textmode_vga_inst|textmode_vga_h_sm_inst|WideOr12~combout\, , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "60a0",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \pll_vga_clk|altpll_component|_clk0\,
	dataa => \textmode_vga_inst|textmode_vga_h_sm_inst|char_width_pixel\(3),
	datab => \textmode_vga_inst|textmode_vga_h_sm_inst|Equal4~1_combout\,
	datac => \textmode_vga_inst|textmode_vga_h_sm_inst|WideOr13~1_combout\,
	datad => \textmode_vga_inst|textmode_vga_h_sm_inst|char_width_pixel\(2),
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	ena => \textmode_vga_inst|textmode_vga_h_sm_inst|WideOr12~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \textmode_vga_inst|textmode_vga_h_sm_inst|char_width_pixel\(3));

-- Location: LC_X37_Y31_N8
\textmode_vga_inst|textmode_vga_h_sm_inst|Equal4~0\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|textmode_vga_h_sm_inst|Equal4~0_combout\ = (\textmode_vga_inst|textmode_vga_h_sm_inst|char_width_pixel\(0) & (\textmode_vga_inst|textmode_vga_h_sm_inst|char_width_pixel\(1) & 
-- (!\textmode_vga_inst|textmode_vga_h_sm_inst|char_width_pixel\(3) & \textmode_vga_inst|textmode_vga_h_sm_inst|char_width_pixel\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0800",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \textmode_vga_inst|textmode_vga_h_sm_inst|char_width_pixel\(0),
	datab => \textmode_vga_inst|textmode_vga_h_sm_inst|char_width_pixel\(1),
	datac => \textmode_vga_inst|textmode_vga_h_sm_inst|char_width_pixel\(3),
	datad => \textmode_vga_inst|textmode_vga_h_sm_inst|char_width_pixel\(2),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \textmode_vga_inst|textmode_vga_h_sm_inst|Equal4~0_combout\);

-- Location: LC_X37_Y30_N7
\textmode_vga_inst|textmode_vga_h_sm_inst|Selector10~0\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|textmode_vga_h_sm_inst|Selector10~0_combout\ = (\textmode_vga_inst|textmode_vga_h_sm_inst|Equal5~1_combout\ & (\textmode_vga_inst|textmode_vga_h_sm_inst|Equal4~0_combout\ & 
-- ((!\textmode_vga_inst|textmode_vga_h_sm_inst|WideOr2~0_combout\) # (!\textmode_vga_inst|textmode_vga_h_sm_inst|Selector9~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "40c0",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \textmode_vga_inst|textmode_vga_h_sm_inst|Selector9~2_combout\,
	datab => \textmode_vga_inst|textmode_vga_h_sm_inst|Equal5~1_combout\,
	datac => \textmode_vga_inst|textmode_vga_h_sm_inst|Equal4~0_combout\,
	datad => \textmode_vga_inst|textmode_vga_h_sm_inst|WideOr2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \textmode_vga_inst|textmode_vga_h_sm_inst|Selector10~0_combout\);

-- Location: LC_X37_Y30_N9
\textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.HFRONT_FIRST\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.HFRONT_FIRST~regout\ = DFFEAS((\textmode_vga_inst|textmode_vga_h_sm_inst|Selector10~0_combout\) # ((!\textmode_vga_inst|textmode_vga_h_sm_inst|Equal4~0_combout\ & 
-- (!\textmode_vga_inst|textmode_vga_h_sm_inst|WideOr2~0_combout\ & \textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.HFRONT_FIRST~regout\))), GLOBAL(\pll_vga_clk|altpll_component|_clk0\), 
-- !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "f1f0",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \pll_vga_clk|altpll_component|_clk0\,
	dataa => \textmode_vga_inst|textmode_vga_h_sm_inst|Equal4~0_combout\,
	datab => \textmode_vga_inst|textmode_vga_h_sm_inst|WideOr2~0_combout\,
	datac => \textmode_vga_inst|textmode_vga_h_sm_inst|Selector10~0_combout\,
	datad => \textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.HFRONT_FIRST~regout\,
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.HFRONT_FIRST~regout\);

-- Location: LC_X37_Y30_N8
\textmode_vga_inst|textmode_vga_h_sm_inst|WideOr9~0\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|textmode_vga_h_sm_inst|WideOr9~0_combout\ = ((\textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.HFRONT_FIRST~regout\) # ((\textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.HBACK_FIRST~regout\) # 
-- (!\textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.HSYNC_FIRST~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "ffcf",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.HFRONT_FIRST~regout\,
	datac => \textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.HSYNC_FIRST~regout\,
	datad => \textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.HBACK_FIRST~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \textmode_vga_inst|textmode_vga_h_sm_inst|WideOr9~0_combout\);

-- Location: LC_X38_Y30_N8
\textmode_vga_inst|textmode_vga_h_sm_inst|Equal6~0\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|textmode_vga_h_sm_inst|Equal6~0_combout\ = (!\textmode_vga_inst|textmode_vga_h_sm_inst|hcnt\(0) & (!\textmode_vga_inst|textmode_vga_h_sm_inst|hcnt\(6) & (!\textmode_vga_inst|textmode_vga_h_sm_inst|hcnt\(5) & 
-- \textmode_vga_inst|textmode_vga_h_sm_inst|Equal1~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \textmode_vga_inst|textmode_vga_h_sm_inst|hcnt\(0),
	datab => \textmode_vga_inst|textmode_vga_h_sm_inst|hcnt\(6),
	datac => \textmode_vga_inst|textmode_vga_h_sm_inst|hcnt\(5),
	datad => \textmode_vga_inst|textmode_vga_h_sm_inst|Equal1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \textmode_vga_inst|textmode_vga_h_sm_inst|Equal6~0_combout\);

-- Location: LC_X38_Y30_N1
\textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.HFRONT_LAST\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.HFRONT_LAST~regout\ = DFFEAS((\textmode_vga_inst|textmode_vga_h_sm_inst|Equal6~0_combout\ & ((\textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.HFRONT~regout\) # 
-- ((\textmode_vga_inst|textmode_vga_h_sm_inst|Selector2~3_combout\ & \textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.HFRONT_LAST~regout\)))) # (!\textmode_vga_inst|textmode_vga_h_sm_inst|Equal6~0_combout\ & 
-- (((\textmode_vga_inst|textmode_vga_h_sm_inst|Selector2~3_combout\ & \textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.HFRONT_LAST~regout\)))), GLOBAL(\pll_vga_clk|altpll_component|_clk0\), 
-- !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "f888",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \pll_vga_clk|altpll_component|_clk0\,
	dataa => \textmode_vga_inst|textmode_vga_h_sm_inst|Equal6~0_combout\,
	datab => \textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.HFRONT~regout\,
	datac => \textmode_vga_inst|textmode_vga_h_sm_inst|Selector2~3_combout\,
	datad => \textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.HFRONT_LAST~regout\,
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.HFRONT_LAST~regout\);

-- Location: LC_X35_Y30_N6
\textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.HSYNC_FIRST\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.HSYNC_FIRST~regout\ = DFFEAS((((!\textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.HFRONT_LAST~regout\))), GLOBAL(\pll_vga_clk|altpll_component|_clk0\), 
-- !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "00ff",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \pll_vga_clk|altpll_component|_clk0\,
	datad => \textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.HFRONT_LAST~regout\,
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.HSYNC_FIRST~regout\);

-- Location: LC_X38_Y29_N9
\textmode_vga_inst|textmode_vga_h_sm_inst|hsync_n~0\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|textmode_vga_h_sm_inst|hsync_n~0_combout\ = (((\textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.HSYNC~regout\) # (!\textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.HSYNC_FIRST~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "ff0f",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datac => \textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.HSYNC_FIRST~regout\,
	datad => \textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.HSYNC~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \textmode_vga_inst|textmode_vga_h_sm_inst|hsync_n~0_combout\);

-- Location: LC_X35_Y31_N1
\textmode_vga_inst|textmode_vga_v_sm_inst|WideOr6\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|textmode_vga_v_sm_inst|WideOr6~combout\ = (\textmode_vga_inst|textmode_vga_v_sm_inst|textmode_vga_v_sm_state.VSYNC_NEXT~regout\) # (((\textmode_vga_inst|textmode_vga_v_sm_inst|textmode_vga_v_sm_state.VSYNC~regout\)) # 
-- (!\textmode_vga_inst|textmode_vga_v_sm_inst|textmode_vga_v_sm_state.VSYNC_FIRST~regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "ffbb",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \textmode_vga_inst|textmode_vga_v_sm_inst|textmode_vga_v_sm_state.VSYNC_NEXT~regout\,
	datab => \textmode_vga_inst|textmode_vga_v_sm_inst|textmode_vga_v_sm_state.VSYNC_FIRST~regout\,
	datad => \textmode_vga_inst|textmode_vga_v_sm_inst|textmode_vga_v_sm_state.VSYNC~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \textmode_vga_inst|textmode_vga_v_sm_inst|WideOr6~combout\);

-- Location: LC_X35_Y27_N0
\textmode_vga_inst|console_sm_inst|data[8]~0\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|console_sm_inst|data[8]~0_combout\ = (\textmode_vga_inst|console_sm_sync_inst|command_data_latched\(14) & ((\textmode_vga_inst|console_sm_inst|state.STATE_SET_CHAR_NEW_LINE_AND_CARRIAGE_RETURN_SCROLL~regout\) # 
-- ((\textmode_vga_inst|console_sm_inst|state.STATE_SET_CHAR~regout\) # (\textmode_vga_inst|console_sm_inst|state.STATE_SET_CHAR_NEW_LINE_AND_CARRIAGE_RETURN_SIMPLE~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "f0e0",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \textmode_vga_inst|console_sm_inst|state.STATE_SET_CHAR_NEW_LINE_AND_CARRIAGE_RETURN_SCROLL~regout\,
	datab => \textmode_vga_inst|console_sm_inst|state.STATE_SET_CHAR~regout\,
	datac => \textmode_vga_inst|console_sm_sync_inst|command_data_latched\(14),
	datad => \textmode_vga_inst|console_sm_inst|state.STATE_SET_CHAR_NEW_LINE_AND_CARRIAGE_RETURN_SIMPLE~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \textmode_vga_inst|console_sm_inst|data[8]~0_combout\);

-- Location: M4K_X39_Y27
\textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a13\ : stratix_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init1 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init0 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "db/mjl_stratix.ram0_video_memory_e8996fde.hdl.mif",
	init_file_layout => "port_a",
	logical_ram_name => "textmode_vga:textmode_vga_inst|video_memory:video_memory_inst|altsyncram:ram_rtl_0|altsyncram_cgm1:auto_generated|ALTSYNCRAM",
	mixed_port_feed_through_mode => "old",
	operation_mode => "dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 12,
	port_a_byte_enable_clear => "none",
	port_a_byte_enable_clock => "none",
	port_a_data_in_clear => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 13,
	port_a_last_address => 4095,
	port_a_logical_ram_depth => 4096,
	port_a_logical_ram_width => 16,
	port_a_write_enable_clear => "none",
	port_b_address_clear => "none",
	port_b_address_clock => "clock0",
	port_b_address_width => 12,
	port_b_byte_enable_clear => "none",
	port_b_data_in_clear => "none",
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "none",
	port_b_data_width => 1,
	port_b_first_address => 0,
	port_b_first_bit_number => 13,
	port_b_last_address => 4095,
	port_b_logical_ram_depth => 4096,
	port_b_logical_ram_width => 16,
	port_b_read_enable_write_enable_clear => "none",
	port_b_read_enable_write_enable_clock => "clock0",
	ram_block_type => "M4K")
-- pragma translate_on
PORT MAP (
	portawe => \textmode_vga_inst|console_sm_inst|WideOr12~0_combout\,
	portbrewe => VCC,
	clk0 => \pll_vga_clk|altpll_component|_clk0\,
	portadatain => \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a13_PORTADATAIN_bus\,
	portaaddr => \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a13_PORTAADDR_bus\,
	portbaddr => \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a13_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portbdataout => \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a13_PORTBDATAOUT_bus\);

-- Location: LC_X38_Y27_N9
\textmode_vga_inst|textmode_vga_h_sm_inst|current_color[5]\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|textmode_vga_h_sm_inst|current_color\(5) = DFFEAS((((!\textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a13~portbdataout\))), GLOBAL(\pll_vga_clk|altpll_component|_clk0\), 
-- !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , \textmode_vga_inst|textmode_vga_h_sm_inst|WideOr13~0_combout\, , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "00ff",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \pll_vga_clk|altpll_component|_clk0\,
	datad => \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a13~portbdataout\,
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	ena => \textmode_vga_inst|textmode_vga_h_sm_inst|WideOr13~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \textmode_vga_inst|textmode_vga_h_sm_inst|current_color\(5));

-- Location: LC_X37_Y29_N2
\textmode_vga_inst|textmode_vga_h_sm_inst|Selector34~0\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|textmode_vga_h_sm_inst|Selector34~0_combout\ = (\textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.CHAR_NEW_FG~regout\) # (((\textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.PIXEL_FG~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "ffaa",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.CHAR_NEW_FG~regout\,
	datad => \textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.PIXEL_FG~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \textmode_vga_inst|textmode_vga_h_sm_inst|Selector34~0_combout\);

-- Location: LC_X37_Y29_N4
\textmode_vga_inst|textmode_vga_h_sm_inst|rgb~0\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|textmode_vga_h_sm_inst|rgb~0_combout\ = (\textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.CHAR_NEW_BG~regout\) # (((\textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.PIXEL_BG~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "fafa",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.CHAR_NEW_BG~regout\,
	datac => \textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.PIXEL_BG~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \textmode_vga_inst|textmode_vga_h_sm_inst|rgb~0_combout\);

-- Location: LC_X37_Y29_N8
\textmode_vga_inst|textmode_vga_h_sm_inst|Selector34~1\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|textmode_vga_h_sm_inst|Selector34~1_combout\ = (\textmode_vga_inst|textmode_vga_h_sm_inst|Selector34~0_combout\ & (!\textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.CHAR_NEW_CURSOR~regout\ & 
-- (!\textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.PIXEL_CURSOR~regout\ & !\textmode_vga_inst|textmode_vga_h_sm_inst|rgb~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0002",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \textmode_vga_inst|textmode_vga_h_sm_inst|Selector34~0_combout\,
	datab => \textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.CHAR_NEW_CURSOR~regout\,
	datac => \textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.PIXEL_CURSOR~regout\,
	datad => \textmode_vga_inst|textmode_vga_h_sm_inst|rgb~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \textmode_vga_inst|textmode_vga_h_sm_inst|Selector34~1_combout\);

-- Location: LC_X37_Y29_N5
\textmode_vga_inst|textmode_vga_h_sm_inst|Selector35~0\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|textmode_vga_h_sm_inst|Selector35~0_combout\ = (!\textmode_vga_inst|textmode_vga_h_sm_inst|rgb~0_combout\ & ((\textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.CHAR_NEW_CURSOR~regout\) # 
-- ((\textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.PIXEL_CURSOR~regout\) # (\textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.PIXEL_FG~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "5554",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \textmode_vga_inst|textmode_vga_h_sm_inst|rgb~0_combout\,
	datab => \textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.CHAR_NEW_CURSOR~regout\,
	datac => \textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.PIXEL_CURSOR~regout\,
	datad => \textmode_vga_inst|textmode_vga_h_sm_inst|textmode_vga_h_sm_state.PIXEL_FG~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \textmode_vga_inst|textmode_vga_h_sm_inst|Selector35~0_combout\);

-- Location: LC_X38_Y27_N2
\textmode_vga_inst|textmode_vga_h_sm_inst|Selector35\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|textmode_vga_h_sm_inst|Selector35~combout\ = (\textmode_vga_inst|textmode_vga_h_sm_inst|Selector34~1_combout\ & ((\textmode_vga_inst|textmode_vga_h_sm_inst|Selector35~0_combout\ & 
-- ((!\textmode_vga_inst|textmode_vga_h_sm_inst|current_color\(5)))) # (!\textmode_vga_inst|textmode_vga_h_sm_inst|Selector35~0_combout\ & (\textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a13~portbdataout\)))) # 
-- (!\textmode_vga_inst|textmode_vga_h_sm_inst|Selector34~1_combout\ & (((\textmode_vga_inst|textmode_vga_h_sm_inst|Selector35~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "3fa0",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a13~portbdataout\,
	datab => \textmode_vga_inst|textmode_vga_h_sm_inst|current_color\(5),
	datac => \textmode_vga_inst|textmode_vga_h_sm_inst|Selector34~1_combout\,
	datad => \textmode_vga_inst|textmode_vga_h_sm_inst|Selector35~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \textmode_vga_inst|textmode_vga_h_sm_inst|Selector35~combout\);

-- Location: M4K_X39_Y25
\textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a14\ : stratix_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init1 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init0 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "db/mjl_stratix.ram0_video_memory_e8996fde.hdl.mif",
	init_file_layout => "port_a",
	logical_ram_name => "textmode_vga:textmode_vga_inst|video_memory:video_memory_inst|altsyncram:ram_rtl_0|altsyncram_cgm1:auto_generated|ALTSYNCRAM",
	mixed_port_feed_through_mode => "old",
	operation_mode => "dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 12,
	port_a_byte_enable_clear => "none",
	port_a_byte_enable_clock => "none",
	port_a_data_in_clear => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 14,
	port_a_last_address => 4095,
	port_a_logical_ram_depth => 4096,
	port_a_logical_ram_width => 16,
	port_a_write_enable_clear => "none",
	port_b_address_clear => "none",
	port_b_address_clock => "clock0",
	port_b_address_width => 12,
	port_b_byte_enable_clear => "none",
	port_b_data_in_clear => "none",
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "none",
	port_b_data_width => 1,
	port_b_first_address => 0,
	port_b_first_bit_number => 14,
	port_b_last_address => 4095,
	port_b_logical_ram_depth => 4096,
	port_b_logical_ram_width => 16,
	port_b_read_enable_write_enable_clear => "none",
	port_b_read_enable_write_enable_clock => "clock0",
	ram_block_type => "M4K")
-- pragma translate_on
PORT MAP (
	portawe => \textmode_vga_inst|console_sm_inst|WideOr12~0_combout\,
	portbrewe => VCC,
	clk0 => \pll_vga_clk|altpll_component|_clk0\,
	portadatain => \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a14_PORTADATAIN_bus\,
	portaaddr => \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a14_PORTAADDR_bus\,
	portbaddr => \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a14_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portbdataout => \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a14_PORTBDATAOUT_bus\);

-- Location: LC_X38_Y27_N6
\textmode_vga_inst|textmode_vga_h_sm_inst|current_color[6]\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|textmode_vga_h_sm_inst|current_color\(6) = DFFEAS((((!\textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a14~portbdataout\))), GLOBAL(\pll_vga_clk|altpll_component|_clk0\), 
-- !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , \textmode_vga_inst|textmode_vga_h_sm_inst|WideOr13~0_combout\, , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "00ff",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \pll_vga_clk|altpll_component|_clk0\,
	datad => \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a14~portbdataout\,
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	ena => \textmode_vga_inst|textmode_vga_h_sm_inst|WideOr13~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \textmode_vga_inst|textmode_vga_h_sm_inst|current_color\(6));

-- Location: LC_X38_Y27_N0
\textmode_vga_inst|textmode_vga_h_sm_inst|Selector34\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|textmode_vga_h_sm_inst|Selector34~combout\ = (\textmode_vga_inst|textmode_vga_h_sm_inst|Selector35~0_combout\ & (((!\textmode_vga_inst|textmode_vga_h_sm_inst|current_color\(6)) # 
-- (!\textmode_vga_inst|textmode_vga_h_sm_inst|Selector34~1_combout\)))) # (!\textmode_vga_inst|textmode_vga_h_sm_inst|Selector35~0_combout\ & (\textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a14~portbdataout\ & 
-- (\textmode_vga_inst|textmode_vga_h_sm_inst|Selector34~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "2cec",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a14~portbdataout\,
	datab => \textmode_vga_inst|textmode_vga_h_sm_inst|Selector35~0_combout\,
	datac => \textmode_vga_inst|textmode_vga_h_sm_inst|Selector34~1_combout\,
	datad => \textmode_vga_inst|textmode_vga_h_sm_inst|current_color\(6),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \textmode_vga_inst|textmode_vga_h_sm_inst|Selector34~combout\);

-- Location: M4K_X39_Y24
\textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a15\ : stratix_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init1 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init0 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "db/mjl_stratix.ram0_video_memory_e8996fde.hdl.mif",
	init_file_layout => "port_a",
	logical_ram_name => "textmode_vga:textmode_vga_inst|video_memory:video_memory_inst|altsyncram:ram_rtl_0|altsyncram_cgm1:auto_generated|ALTSYNCRAM",
	mixed_port_feed_through_mode => "old",
	operation_mode => "dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 12,
	port_a_byte_enable_clear => "none",
	port_a_byte_enable_clock => "none",
	port_a_data_in_clear => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 15,
	port_a_last_address => 4095,
	port_a_logical_ram_depth => 4096,
	port_a_logical_ram_width => 16,
	port_a_write_enable_clear => "none",
	port_b_address_clear => "none",
	port_b_address_clock => "clock0",
	port_b_address_width => 12,
	port_b_byte_enable_clear => "none",
	port_b_data_in_clear => "none",
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "none",
	port_b_data_width => 1,
	port_b_first_address => 0,
	port_b_first_bit_number => 15,
	port_b_last_address => 4095,
	port_b_logical_ram_depth => 4096,
	port_b_logical_ram_width => 16,
	port_b_read_enable_write_enable_clear => "none",
	port_b_read_enable_write_enable_clock => "clock0",
	ram_block_type => "M4K")
-- pragma translate_on
PORT MAP (
	portawe => \textmode_vga_inst|console_sm_inst|WideOr12~0_combout\,
	portbrewe => VCC,
	clk0 => \pll_vga_clk|altpll_component|_clk0\,
	portadatain => \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a15_PORTADATAIN_bus\,
	portaaddr => \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a15_PORTAADDR_bus\,
	portbaddr => \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a15_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portbdataout => \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a15_PORTBDATAOUT_bus\);

-- Location: LC_X38_Y27_N8
\textmode_vga_inst|textmode_vga_h_sm_inst|current_color[7]\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|textmode_vga_h_sm_inst|current_color\(7) = DFFEAS((((!\textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a15~portbdataout\))), GLOBAL(\pll_vga_clk|altpll_component|_clk0\), 
-- !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , \textmode_vga_inst|textmode_vga_h_sm_inst|WideOr13~0_combout\, , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0f0f",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \pll_vga_clk|altpll_component|_clk0\,
	datac => \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a15~portbdataout\,
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	ena => \textmode_vga_inst|textmode_vga_h_sm_inst|WideOr13~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \textmode_vga_inst|textmode_vga_h_sm_inst|current_color\(7));

-- Location: LC_X38_Y27_N5
\textmode_vga_inst|textmode_vga_h_sm_inst|Selector33\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|textmode_vga_h_sm_inst|Selector33~combout\ = (\textmode_vga_inst|textmode_vga_h_sm_inst|Selector34~1_combout\ & ((\textmode_vga_inst|textmode_vga_h_sm_inst|Selector35~0_combout\ & 
-- (!\textmode_vga_inst|textmode_vga_h_sm_inst|current_color\(7))) # (!\textmode_vga_inst|textmode_vga_h_sm_inst|Selector35~0_combout\ & ((\textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a15~portbdataout\))))) # 
-- (!\textmode_vga_inst|textmode_vga_h_sm_inst|Selector34~1_combout\ & (((\textmode_vga_inst|textmode_vga_h_sm_inst|Selector35~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "77c0",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \textmode_vga_inst|textmode_vga_h_sm_inst|current_color\(7),
	datab => \textmode_vga_inst|textmode_vga_h_sm_inst|Selector34~1_combout\,
	datac => \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a15~portbdataout\,
	datad => \textmode_vga_inst|textmode_vga_h_sm_inst|Selector35~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \textmode_vga_inst|textmode_vga_h_sm_inst|Selector33~combout\);

-- Location: M4K_X39_Y28
\textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a10\ : stratix_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init1 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init0 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "db/mjl_stratix.ram0_video_memory_e8996fde.hdl.mif",
	init_file_layout => "port_a",
	logical_ram_name => "textmode_vga:textmode_vga_inst|video_memory:video_memory_inst|altsyncram:ram_rtl_0|altsyncram_cgm1:auto_generated|ALTSYNCRAM",
	mixed_port_feed_through_mode => "old",
	operation_mode => "dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 12,
	port_a_byte_enable_clear => "none",
	port_a_byte_enable_clock => "none",
	port_a_data_in_clear => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 10,
	port_a_last_address => 4095,
	port_a_logical_ram_depth => 4096,
	port_a_logical_ram_width => 16,
	port_a_write_enable_clear => "none",
	port_b_address_clear => "none",
	port_b_address_clock => "clock0",
	port_b_address_width => 12,
	port_b_byte_enable_clear => "none",
	port_b_data_in_clear => "none",
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "none",
	port_b_data_width => 1,
	port_b_first_address => 0,
	port_b_first_bit_number => 10,
	port_b_last_address => 4095,
	port_b_logical_ram_depth => 4096,
	port_b_logical_ram_width => 16,
	port_b_read_enable_write_enable_clear => "none",
	port_b_read_enable_write_enable_clock => "clock0",
	ram_block_type => "M4K")
-- pragma translate_on
PORT MAP (
	portawe => \textmode_vga_inst|console_sm_inst|WideOr12~0_combout\,
	portbrewe => VCC,
	clk0 => \pll_vga_clk|altpll_component|_clk0\,
	portadatain => \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a10_PORTADATAIN_bus\,
	portaaddr => \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a10_PORTAADDR_bus\,
	portbaddr => \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a10_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portbdataout => \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a10_PORTBDATAOUT_bus\);

-- Location: LC_X38_Y27_N7
\textmode_vga_inst|textmode_vga_h_sm_inst|current_color[2]\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|textmode_vga_h_sm_inst|current_color\(2) = DFFEAS((((!\textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a10~portbdataout\))), GLOBAL(\pll_vga_clk|altpll_component|_clk0\), 
-- !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , \textmode_vga_inst|textmode_vga_h_sm_inst|WideOr13~0_combout\, , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "00ff",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \pll_vga_clk|altpll_component|_clk0\,
	datad => \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a10~portbdataout\,
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	ena => \textmode_vga_inst|textmode_vga_h_sm_inst|WideOr13~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \textmode_vga_inst|textmode_vga_h_sm_inst|current_color\(2));

-- Location: LC_X38_Y27_N1
\textmode_vga_inst|textmode_vga_h_sm_inst|Selector38\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|textmode_vga_h_sm_inst|Selector38~combout\ = (\textmode_vga_inst|textmode_vga_h_sm_inst|Selector35~0_combout\ & (((!\textmode_vga_inst|textmode_vga_h_sm_inst|Selector34~1_combout\)) # 
-- (!\textmode_vga_inst|textmode_vga_h_sm_inst|current_color\(2)))) # (!\textmode_vga_inst|textmode_vga_h_sm_inst|Selector35~0_combout\ & (((\textmode_vga_inst|textmode_vga_h_sm_inst|Selector34~1_combout\ & 
-- \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a10~portbdataout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "7c4c",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \textmode_vga_inst|textmode_vga_h_sm_inst|current_color\(2),
	datab => \textmode_vga_inst|textmode_vga_h_sm_inst|Selector35~0_combout\,
	datac => \textmode_vga_inst|textmode_vga_h_sm_inst|Selector34~1_combout\,
	datad => \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a10~portbdataout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \textmode_vga_inst|textmode_vga_h_sm_inst|Selector38~combout\);

-- Location: M4K_X39_Y26
\textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a11\ : stratix_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init1 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init0 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "db/mjl_stratix.ram0_video_memory_e8996fde.hdl.mif",
	init_file_layout => "port_a",
	logical_ram_name => "textmode_vga:textmode_vga_inst|video_memory:video_memory_inst|altsyncram:ram_rtl_0|altsyncram_cgm1:auto_generated|ALTSYNCRAM",
	mixed_port_feed_through_mode => "old",
	operation_mode => "dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 12,
	port_a_byte_enable_clear => "none",
	port_a_byte_enable_clock => "none",
	port_a_data_in_clear => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 11,
	port_a_last_address => 4095,
	port_a_logical_ram_depth => 4096,
	port_a_logical_ram_width => 16,
	port_a_write_enable_clear => "none",
	port_b_address_clear => "none",
	port_b_address_clock => "clock0",
	port_b_address_width => 12,
	port_b_byte_enable_clear => "none",
	port_b_data_in_clear => "none",
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "none",
	port_b_data_width => 1,
	port_b_first_address => 0,
	port_b_first_bit_number => 11,
	port_b_last_address => 4095,
	port_b_logical_ram_depth => 4096,
	port_b_logical_ram_width => 16,
	port_b_read_enable_write_enable_clear => "none",
	port_b_read_enable_write_enable_clock => "clock0",
	ram_block_type => "M4K")
-- pragma translate_on
PORT MAP (
	portawe => \textmode_vga_inst|console_sm_inst|WideOr12~0_combout\,
	portbrewe => VCC,
	clk0 => \pll_vga_clk|altpll_component|_clk0\,
	portadatain => \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a11_PORTADATAIN_bus\,
	portaaddr => \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a11_PORTAADDR_bus\,
	portbaddr => \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a11_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portbdataout => \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a11_PORTBDATAOUT_bus\);

-- Location: LC_X38_Y27_N3
\textmode_vga_inst|textmode_vga_h_sm_inst|current_color[3]\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|textmode_vga_h_sm_inst|current_color\(3) = DFFEAS((((!\textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a11~portbdataout\))), GLOBAL(\pll_vga_clk|altpll_component|_clk0\), 
-- !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , \textmode_vga_inst|textmode_vga_h_sm_inst|WideOr13~0_combout\, , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "00ff",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \pll_vga_clk|altpll_component|_clk0\,
	datad => \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a11~portbdataout\,
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	ena => \textmode_vga_inst|textmode_vga_h_sm_inst|WideOr13~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \textmode_vga_inst|textmode_vga_h_sm_inst|current_color\(3));

-- Location: LC_X38_Y27_N4
\textmode_vga_inst|textmode_vga_h_sm_inst|Selector37\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|textmode_vga_h_sm_inst|Selector37~combout\ = (\textmode_vga_inst|textmode_vga_h_sm_inst|Selector35~0_combout\ & (((!\textmode_vga_inst|textmode_vga_h_sm_inst|Selector34~1_combout\)) # 
-- (!\textmode_vga_inst|textmode_vga_h_sm_inst|current_color\(3)))) # (!\textmode_vga_inst|textmode_vga_h_sm_inst|Selector35~0_combout\ & (((\textmode_vga_inst|textmode_vga_h_sm_inst|Selector34~1_combout\ & 
-- \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a11~portbdataout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "7c4c",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \textmode_vga_inst|textmode_vga_h_sm_inst|current_color\(3),
	datab => \textmode_vga_inst|textmode_vga_h_sm_inst|Selector35~0_combout\,
	datac => \textmode_vga_inst|textmode_vga_h_sm_inst|Selector34~1_combout\,
	datad => \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a11~portbdataout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \textmode_vga_inst|textmode_vga_h_sm_inst|Selector37~combout\);

-- Location: M4K_X39_Y30
\textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a12\ : stratix_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init1 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init0 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "db/mjl_stratix.ram0_video_memory_e8996fde.hdl.mif",
	init_file_layout => "port_a",
	logical_ram_name => "textmode_vga:textmode_vga_inst|video_memory:video_memory_inst|altsyncram:ram_rtl_0|altsyncram_cgm1:auto_generated|ALTSYNCRAM",
	mixed_port_feed_through_mode => "old",
	operation_mode => "dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 12,
	port_a_byte_enable_clear => "none",
	port_a_byte_enable_clock => "none",
	port_a_data_in_clear => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 12,
	port_a_last_address => 4095,
	port_a_logical_ram_depth => 4096,
	port_a_logical_ram_width => 16,
	port_a_write_enable_clear => "none",
	port_b_address_clear => "none",
	port_b_address_clock => "clock0",
	port_b_address_width => 12,
	port_b_byte_enable_clear => "none",
	port_b_data_in_clear => "none",
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "none",
	port_b_data_width => 1,
	port_b_first_address => 0,
	port_b_first_bit_number => 12,
	port_b_last_address => 4095,
	port_b_logical_ram_depth => 4096,
	port_b_logical_ram_width => 16,
	port_b_read_enable_write_enable_clear => "none",
	port_b_read_enable_write_enable_clock => "clock0",
	ram_block_type => "M4K")
-- pragma translate_on
PORT MAP (
	portawe => \textmode_vga_inst|console_sm_inst|WideOr12~0_combout\,
	portbrewe => VCC,
	clk0 => \pll_vga_clk|altpll_component|_clk0\,
	portadatain => \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a12_PORTADATAIN_bus\,
	portaaddr => \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a12_PORTAADDR_bus\,
	portbaddr => \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a12_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portbdataout => \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a12_PORTBDATAOUT_bus\);

-- Location: LC_X38_Y29_N1
\textmode_vga_inst|textmode_vga_h_sm_inst|current_color[4]\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|textmode_vga_h_sm_inst|current_color\(4) = DFFEAS((((!\textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a12~portbdataout\))), GLOBAL(\pll_vga_clk|altpll_component|_clk0\), 
-- !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , \textmode_vga_inst|textmode_vga_h_sm_inst|WideOr13~0_combout\, , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "00ff",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \pll_vga_clk|altpll_component|_clk0\,
	datad => \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a12~portbdataout\,
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	ena => \textmode_vga_inst|textmode_vga_h_sm_inst|WideOr13~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \textmode_vga_inst|textmode_vga_h_sm_inst|current_color\(4));

-- Location: LC_X38_Y29_N7
\textmode_vga_inst|textmode_vga_h_sm_inst|Selector36\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|textmode_vga_h_sm_inst|Selector36~combout\ = (\textmode_vga_inst|textmode_vga_h_sm_inst|Selector35~0_combout\ & (((!\textmode_vga_inst|textmode_vga_h_sm_inst|current_color\(4))) # 
-- (!\textmode_vga_inst|textmode_vga_h_sm_inst|Selector34~1_combout\))) # (!\textmode_vga_inst|textmode_vga_h_sm_inst|Selector35~0_combout\ & (\textmode_vga_inst|textmode_vga_h_sm_inst|Selector34~1_combout\ & 
-- ((\textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a12~portbdataout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "6e2a",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \textmode_vga_inst|textmode_vga_h_sm_inst|Selector35~0_combout\,
	datab => \textmode_vga_inst|textmode_vga_h_sm_inst|Selector34~1_combout\,
	datac => \textmode_vga_inst|textmode_vga_h_sm_inst|current_color\(4),
	datad => \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a12~portbdataout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \textmode_vga_inst|textmode_vga_h_sm_inst|Selector36~combout\);

-- Location: M4K_X39_Y31
\textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a8\ : stratix_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init1 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init0 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "db/mjl_stratix.ram0_video_memory_e8996fde.hdl.mif",
	init_file_layout => "port_a",
	logical_ram_name => "textmode_vga:textmode_vga_inst|video_memory:video_memory_inst|altsyncram:ram_rtl_0|altsyncram_cgm1:auto_generated|ALTSYNCRAM",
	mixed_port_feed_through_mode => "old",
	operation_mode => "dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 12,
	port_a_byte_enable_clear => "none",
	port_a_byte_enable_clock => "none",
	port_a_data_in_clear => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 8,
	port_a_last_address => 4095,
	port_a_logical_ram_depth => 4096,
	port_a_logical_ram_width => 16,
	port_a_write_enable_clear => "none",
	port_b_address_clear => "none",
	port_b_address_clock => "clock0",
	port_b_address_width => 12,
	port_b_byte_enable_clear => "none",
	port_b_data_in_clear => "none",
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "none",
	port_b_data_width => 1,
	port_b_first_address => 0,
	port_b_first_bit_number => 8,
	port_b_last_address => 4095,
	port_b_logical_ram_depth => 4096,
	port_b_logical_ram_width => 16,
	port_b_read_enable_write_enable_clear => "none",
	port_b_read_enable_write_enable_clock => "clock0",
	ram_block_type => "M4K")
-- pragma translate_on
PORT MAP (
	portawe => \textmode_vga_inst|console_sm_inst|WideOr12~0_combout\,
	portbrewe => VCC,
	clk0 => \pll_vga_clk|altpll_component|_clk0\,
	portadatain => \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a8_PORTADATAIN_bus\,
	portaaddr => \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a8_PORTAADDR_bus\,
	portbaddr => \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a8_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portbdataout => \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a8_PORTBDATAOUT_bus\);

-- Location: LC_X38_Y29_N5
\textmode_vga_inst|textmode_vga_h_sm_inst|current_color[0]\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|textmode_vga_h_sm_inst|current_color\(0) = DFFEAS((((!\textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a8~portbdataout\))), GLOBAL(\pll_vga_clk|altpll_component|_clk0\), 
-- !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , \textmode_vga_inst|textmode_vga_h_sm_inst|WideOr13~0_combout\, , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "00ff",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \pll_vga_clk|altpll_component|_clk0\,
	datad => \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a8~portbdataout\,
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	ena => \textmode_vga_inst|textmode_vga_h_sm_inst|WideOr13~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \textmode_vga_inst|textmode_vga_h_sm_inst|current_color\(0));

-- Location: LC_X38_Y29_N2
\textmode_vga_inst|textmode_vga_h_sm_inst|Selector40\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|textmode_vga_h_sm_inst|Selector40~combout\ = (\textmode_vga_inst|textmode_vga_h_sm_inst|Selector35~0_combout\ & (((!\textmode_vga_inst|textmode_vga_h_sm_inst|current_color\(0))) # 
-- (!\textmode_vga_inst|textmode_vga_h_sm_inst|Selector34~1_combout\))) # (!\textmode_vga_inst|textmode_vga_h_sm_inst|Selector35~0_combout\ & (\textmode_vga_inst|textmode_vga_h_sm_inst|Selector34~1_combout\ & 
-- ((\textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a8~portbdataout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "6e2a",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \textmode_vga_inst|textmode_vga_h_sm_inst|Selector35~0_combout\,
	datab => \textmode_vga_inst|textmode_vga_h_sm_inst|Selector34~1_combout\,
	datac => \textmode_vga_inst|textmode_vga_h_sm_inst|current_color\(0),
	datad => \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a8~portbdataout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \textmode_vga_inst|textmode_vga_h_sm_inst|Selector40~combout\);

-- Location: M4K_X39_Y29
\textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a9\ : stratix_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init1 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init0 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "db/mjl_stratix.ram0_video_memory_e8996fde.hdl.mif",
	init_file_layout => "port_a",
	logical_ram_name => "textmode_vga:textmode_vga_inst|video_memory:video_memory_inst|altsyncram:ram_rtl_0|altsyncram_cgm1:auto_generated|ALTSYNCRAM",
	mixed_port_feed_through_mode => "old",
	operation_mode => "dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 12,
	port_a_byte_enable_clear => "none",
	port_a_byte_enable_clock => "none",
	port_a_data_in_clear => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 9,
	port_a_last_address => 4095,
	port_a_logical_ram_depth => 4096,
	port_a_logical_ram_width => 16,
	port_a_write_enable_clear => "none",
	port_b_address_clear => "none",
	port_b_address_clock => "clock0",
	port_b_address_width => 12,
	port_b_byte_enable_clear => "none",
	port_b_data_in_clear => "none",
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "none",
	port_b_data_width => 1,
	port_b_first_address => 0,
	port_b_first_bit_number => 9,
	port_b_last_address => 4095,
	port_b_logical_ram_depth => 4096,
	port_b_logical_ram_width => 16,
	port_b_read_enable_write_enable_clear => "none",
	port_b_read_enable_write_enable_clock => "clock0",
	ram_block_type => "M4K")
-- pragma translate_on
PORT MAP (
	portawe => \textmode_vga_inst|console_sm_inst|WideOr12~0_combout\,
	portbrewe => VCC,
	clk0 => \pll_vga_clk|altpll_component|_clk0\,
	portadatain => \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a9_PORTADATAIN_bus\,
	portaaddr => \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a9_PORTAADDR_bus\,
	portbaddr => \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a9_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portbdataout => \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a9_PORTBDATAOUT_bus\);

-- Location: LC_X38_Y29_N3
\textmode_vga_inst|textmode_vga_h_sm_inst|current_color[1]\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|textmode_vga_h_sm_inst|current_color\(1) = DFFEAS((((!\textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a9~portbdataout\))), GLOBAL(\pll_vga_clk|altpll_component|_clk0\), 
-- !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , \textmode_vga_inst|textmode_vga_h_sm_inst|WideOr13~0_combout\, , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "00ff",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \pll_vga_clk|altpll_component|_clk0\,
	datad => \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a9~portbdataout\,
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	ena => \textmode_vga_inst|textmode_vga_h_sm_inst|WideOr13~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \textmode_vga_inst|textmode_vga_h_sm_inst|current_color\(1));

-- Location: LC_X38_Y29_N8
\textmode_vga_inst|textmode_vga_h_sm_inst|Selector39\ : stratix_lcell
-- Equation(s):
-- \textmode_vga_inst|textmode_vga_h_sm_inst|Selector39~combout\ = (\textmode_vga_inst|textmode_vga_h_sm_inst|Selector35~0_combout\ & (((!\textmode_vga_inst|textmode_vga_h_sm_inst|current_color\(1))) # 
-- (!\textmode_vga_inst|textmode_vga_h_sm_inst|Selector34~1_combout\))) # (!\textmode_vga_inst|textmode_vga_h_sm_inst|Selector35~0_combout\ & (\textmode_vga_inst|textmode_vga_h_sm_inst|Selector34~1_combout\ & 
-- ((\textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a9~portbdataout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "6e2a",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \textmode_vga_inst|textmode_vga_h_sm_inst|Selector35~0_combout\,
	datab => \textmode_vga_inst|textmode_vga_h_sm_inst|Selector34~1_combout\,
	datac => \textmode_vga_inst|textmode_vga_h_sm_inst|current_color\(1),
	datad => \textmode_vga_inst|video_memory_inst|ram_rtl_0|auto_generated|ram_block1a9~portbdataout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \textmode_vga_inst|textmode_vga_h_sm_inst|Selector39~combout\);

-- Location: PIN_A6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\led_a~I\ : stratix_io
-- pragma translate_off
GENERIC MAP (
	ddio_mode => "none",
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \btn_a_debounce_inst|fsm_inst|o~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_led_a);

-- Location: PIN_A7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\led_b~I\ : stratix_io
-- pragma translate_off
GENERIC MAP (
	ddio_mode => "none",
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \~GND~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_led_b);

-- Location: PIN_F1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\hsync_n~I\ : stratix_io
-- pragma translate_off
GENERIC MAP (
	ddio_mode => "none",
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \textmode_vga_inst|textmode_vga_h_sm_inst|ALT_INV_hsync_n~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_hsync_n);

-- Location: PIN_F2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\vsync_n~I\ : stratix_io
-- pragma translate_off
GENERIC MAP (
	ddio_mode => "none",
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \textmode_vga_inst|textmode_vga_v_sm_inst|ALT_INV_WideOr6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_vsync_n);

-- Location: PIN_E22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\r[0]~I\ : stratix_io
-- pragma translate_off
GENERIC MAP (
	ddio_mode => "none",
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \textmode_vga_inst|textmode_vga_h_sm_inst|Selector35~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_r(0));

-- Location: PIN_T4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\r[1]~I\ : stratix_io
-- pragma translate_off
GENERIC MAP (
	ddio_mode => "none",
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \textmode_vga_inst|textmode_vga_h_sm_inst|Selector34~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_r(1));

-- Location: PIN_T7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\r[2]~I\ : stratix_io
-- pragma translate_off
GENERIC MAP (
	ddio_mode => "none",
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \textmode_vga_inst|textmode_vga_h_sm_inst|Selector33~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_r(2));

-- Location: PIN_E23,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\g[0]~I\ : stratix_io
-- pragma translate_off
GENERIC MAP (
	ddio_mode => "none",
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \textmode_vga_inst|textmode_vga_h_sm_inst|Selector38~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_g(0));

-- Location: PIN_T5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\g[1]~I\ : stratix_io
-- pragma translate_off
GENERIC MAP (
	ddio_mode => "none",
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \textmode_vga_inst|textmode_vga_h_sm_inst|Selector37~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_g(1));

-- Location: PIN_T24,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\g[2]~I\ : stratix_io
-- pragma translate_off
GENERIC MAP (
	ddio_mode => "none",
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \textmode_vga_inst|textmode_vga_h_sm_inst|Selector36~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_g(2));

-- Location: PIN_E24,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\b[0]~I\ : stratix_io
-- pragma translate_off
GENERIC MAP (
	ddio_mode => "none",
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \textmode_vga_inst|textmode_vga_h_sm_inst|Selector40~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_b(0));

-- Location: PIN_T6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\b[1]~I\ : stratix_io
-- pragma translate_off
GENERIC MAP (
	ddio_mode => "none",
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \textmode_vga_inst|textmode_vga_h_sm_inst|Selector39~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_b(1));

-- Location: PIN_D22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\uart_tx~I\ : stratix_io
-- pragma translate_off
GENERIC MAP (
	ddio_mode => "none",
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \~GND~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_uart_tx);

-- Location: PIN_D23,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\uart_rx~I\ : stratix_io
-- pragma translate_off
GENERIC MAP (
	ddio_mode => "none",
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_uart_rx);
END structure;


