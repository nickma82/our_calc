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

-- DATE "05/18/2010 15:26:59"

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
	led_b : OUT std_logic
	);
END calc_top;

-- Design Ports Information
-- led_a	=>  Location: PIN_A6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- led_b	=>  Location: PIN_A7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
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
SIGNAL \sys_clk~combout\ : std_logic;
SIGNAL \sys_res_n_debounce_inst|fsm_inst|Selector2~3_combout\ : std_logic;
SIGNAL \sys_res_n_debounce_inst|counter_inst|cnt_int[3]~27\ : std_logic;
SIGNAL \sys_res_n_debounce_inst|counter_inst|cnt_int[3]~27COUT1_50\ : std_logic;
SIGNAL \sys_res_n_debounce_inst|counter_inst|cnt_int[4]~29\ : std_logic;
SIGNAL \sys_res_n_debounce_inst|counter_inst|cnt_int[4]~29COUT1_52\ : std_logic;
SIGNAL \sys_res_n_debounce_inst|counter_inst|cnt_int[5]~31\ : std_logic;
SIGNAL \sys_res_n_debounce_inst|counter_inst|cnt_int[5]~31COUT1_54\ : std_logic;
SIGNAL \sys_res_n_debounce_inst|counter_inst|cnt_int[6]~19\ : std_logic;
SIGNAL \sys_res_n_debounce_inst|counter_inst|cnt_int[6]~19COUT1_56\ : std_logic;
SIGNAL \sys_res_n_debounce_inst|counter_inst|cnt_int[7]~21\ : std_logic;
SIGNAL \sys_res_n_debounce_inst|counter_inst|cnt_int[8]~23\ : std_logic;
SIGNAL \sys_res_n_debounce_inst|counter_inst|cnt_int[8]~23COUT1_58\ : std_logic;
SIGNAL \sys_res_n_debounce_inst|counter_inst|cnt_int[9]~5\ : std_logic;
SIGNAL \sys_res_n_debounce_inst|counter_inst|cnt_int[9]~5COUT1_60\ : std_logic;
SIGNAL \sys_res_n_debounce_inst|counter_inst|cnt_int[10]~9\ : std_logic;
SIGNAL \sys_res_n_debounce_inst|counter_inst|cnt_int[10]~9COUT1_62\ : std_logic;
SIGNAL \sys_res_n_debounce_inst|counter_inst|cnt_int[11]~11\ : std_logic;
SIGNAL \sys_res_n_debounce_inst|counter_inst|cnt_int[11]~11COUT1_64\ : std_logic;
SIGNAL \sys_res_n_debounce_inst|counter_inst|cnt_int[12]~15\ : std_logic;
SIGNAL \sys_res_n_debounce_inst|counter_inst|cnt_int[13]~17\ : std_logic;
SIGNAL \sys_res_n_debounce_inst|counter_inst|cnt_int[13]~17COUT1_66\ : std_logic;
SIGNAL \sys_res_n_debounce_inst|counter_inst|cnt_int[14]~13\ : std_logic;
SIGNAL \sys_res_n_debounce_inst|counter_inst|cnt_int[14]~13COUT1_68\ : std_logic;
SIGNAL \sys_res_n_debounce_inst|fsm_inst|Equal0~1_combout\ : std_logic;
SIGNAL \sys_res_n_debounce_inst|fsm_inst|Equal0~2_combout\ : std_logic;
SIGNAL \sys_res_n_debounce_inst|counter_inst|LessThan0~0_combout\ : std_logic;
SIGNAL \sys_res_n_debounce_inst|counter_inst|LessThan0~1_combout\ : std_logic;
SIGNAL \sys_res_n_debounce_inst|fsm_inst|Equal0~3_combout\ : std_logic;
SIGNAL \sys_res_n_debounce_inst|counter_inst|LessThan0~2_combout\ : std_logic;
SIGNAL \sys_res_n_debounce_inst|counter_inst|cnt_int[0]~1\ : std_logic;
SIGNAL \sys_res_n_debounce_inst|counter_inst|cnt_int[0]~1COUT1_46\ : std_logic;
SIGNAL \sys_res_n_debounce_inst|counter_inst|cnt_int[1]~25\ : std_logic;
SIGNAL \sys_res_n_debounce_inst|counter_inst|cnt_int[1]~25COUT1_48\ : std_logic;
SIGNAL \sys_res_n_debounce_inst|counter_inst|cnt_int[2]~3\ : std_logic;
SIGNAL \sys_res_n_debounce_inst|fsm_inst|Equal0~5_combout\ : std_logic;
SIGNAL \sys_res_n_debounce_inst|fsm_inst|Equal0~0_combout\ : std_logic;
SIGNAL \sys_res_n_debounce_inst|fsm_inst|Equal0~4_combout\ : std_logic;
SIGNAL \sys_res_n_debounce_inst|fsm_inst|Equal0~6_combout\ : std_logic;
SIGNAL \sys_res_n~combout\ : std_logic;
SIGNAL \sys_res_n_debounce_inst|fsm_inst|Selector2~0\ : std_logic;
SIGNAL \sys_res_n_debounce_inst|fsm_inst|Selector2~1_combout\ : std_logic;
SIGNAL \sys_res_n_debounce_inst|fsm_inst|debounce_fsm_state.IDLE1~regout\ : std_logic;
SIGNAL \sys_res_n_debounce_inst|fsm_inst|Selector3~0_combout\ : std_logic;
SIGNAL \sys_res_n_debounce_inst|fsm_inst|Selector3~1_combout\ : std_logic;
SIGNAL \sys_res_n_debounce_inst|fsm_inst|debounce_fsm_state.TIMEOUT1~regout\ : std_logic;
SIGNAL \sys_res_n_debounce_inst|fsm_inst|debounce_fsm_state.TIMEOUT0~regout\ : std_logic;
SIGNAL \sys_res_n_debounce_inst|fsm_inst|debounce_fsm_state.IDLE0~regout\ : std_logic;
SIGNAL \sys_res_n_debounce_inst|fsm_inst|o~0_combout\ : std_logic;
SIGNAL \btn_a_debounce_inst|fsm_inst|debounce_fsm_state.TIMEOUT1~regout\ : std_logic;
SIGNAL \btn_a_debounce_inst|fsm_inst|Selector1~0_combout\ : std_logic;
SIGNAL \btn_a_debounce_inst|fsm_inst|Selector1~1_combout\ : std_logic;
SIGNAL \btn_a_debounce_inst|fsm_inst|debounce_fsm_state.TIMEOUT0~regout\ : std_logic;
SIGNAL \btn_a~combout\ : std_logic;
SIGNAL \btn_a_debounce_inst|fsm_inst|Selector0~1\ : std_logic;
SIGNAL \btn_a_debounce_inst|fsm_inst|Selector0~2_combout\ : std_logic;
SIGNAL \btn_a_debounce_inst|fsm_inst|debounce_fsm_state.IDLE1~regout\ : std_logic;
SIGNAL \btn_a_debounce_inst|fsm_inst|Selector0~3_combout\ : std_logic;
SIGNAL \btn_a_debounce_inst|counter_inst|cnt_int[3]~27\ : std_logic;
SIGNAL \btn_a_debounce_inst|counter_inst|cnt_int[3]~27COUT1_50\ : std_logic;
SIGNAL \btn_a_debounce_inst|counter_inst|cnt_int[4]~29\ : std_logic;
SIGNAL \btn_a_debounce_inst|counter_inst|cnt_int[4]~29COUT1_52\ : std_logic;
SIGNAL \btn_a_debounce_inst|fsm_inst|Equal0~5_combout\ : std_logic;
SIGNAL \btn_a_debounce_inst|counter_inst|LessThan0~1_combout\ : std_logic;
SIGNAL \btn_a_debounce_inst|counter_inst|cnt_int[5]~31\ : std_logic;
SIGNAL \btn_a_debounce_inst|counter_inst|cnt_int[5]~31COUT1_54\ : std_logic;
SIGNAL \btn_a_debounce_inst|counter_inst|cnt_int[6]~19\ : std_logic;
SIGNAL \btn_a_debounce_inst|counter_inst|cnt_int[6]~19COUT1_56\ : std_logic;
SIGNAL \btn_a_debounce_inst|counter_inst|cnt_int[7]~21\ : std_logic;
SIGNAL \btn_a_debounce_inst|counter_inst|cnt_int[8]~23\ : std_logic;
SIGNAL \btn_a_debounce_inst|counter_inst|cnt_int[8]~23COUT1_58\ : std_logic;
SIGNAL \btn_a_debounce_inst|counter_inst|cnt_int[9]~5\ : std_logic;
SIGNAL \btn_a_debounce_inst|counter_inst|cnt_int[9]~5COUT1_60\ : std_logic;
SIGNAL \btn_a_debounce_inst|counter_inst|cnt_int[10]~9\ : std_logic;
SIGNAL \btn_a_debounce_inst|counter_inst|cnt_int[10]~9COUT1_62\ : std_logic;
SIGNAL \btn_a_debounce_inst|counter_inst|cnt_int[11]~11\ : std_logic;
SIGNAL \btn_a_debounce_inst|counter_inst|cnt_int[11]~11COUT1_64\ : std_logic;
SIGNAL \btn_a_debounce_inst|counter_inst|cnt_int[12]~15\ : std_logic;
SIGNAL \btn_a_debounce_inst|counter_inst|cnt_int[13]~17\ : std_logic;
SIGNAL \btn_a_debounce_inst|counter_inst|cnt_int[13]~17COUT1_66\ : std_logic;
SIGNAL \btn_a_debounce_inst|counter_inst|cnt_int[14]~13\ : std_logic;
SIGNAL \btn_a_debounce_inst|counter_inst|cnt_int[14]~13COUT1_68\ : std_logic;
SIGNAL \btn_a_debounce_inst|fsm_inst|Equal0~1_combout\ : std_logic;
SIGNAL \btn_a_debounce_inst|fsm_inst|Equal0~2_combout\ : std_logic;
SIGNAL \btn_a_debounce_inst|counter_inst|LessThan0~0_combout\ : std_logic;
SIGNAL \btn_a_debounce_inst|counter_inst|LessThan0~2_combout\ : std_logic;
SIGNAL \btn_a_debounce_inst|counter_inst|cnt_int[0]~1\ : std_logic;
SIGNAL \btn_a_debounce_inst|counter_inst|cnt_int[0]~1COUT1_46\ : std_logic;
SIGNAL \btn_a_debounce_inst|counter_inst|cnt_int[1]~25\ : std_logic;
SIGNAL \btn_a_debounce_inst|counter_inst|cnt_int[1]~25COUT1_48\ : std_logic;
SIGNAL \btn_a_debounce_inst|counter_inst|cnt_int[2]~3\ : std_logic;
SIGNAL \btn_a_debounce_inst|fsm_inst|Equal0~3_combout\ : std_logic;
SIGNAL \btn_a_debounce_inst|fsm_inst|Equal0~0_combout\ : std_logic;
SIGNAL \btn_a_debounce_inst|fsm_inst|Equal0~4_combout\ : std_logic;
SIGNAL \btn_a_debounce_inst|fsm_inst|Equal0~6_combout\ : std_logic;
SIGNAL \btn_a_debounce_inst|fsm_inst|debounce_fsm_state.IDLE0~regout\ : std_logic;
SIGNAL \btn_a_debounce_inst|fsm_inst|o~0_combout\ : std_logic;
SIGNAL \~STRATIX_FITTER_CREATED_GND~I_combout\ : std_logic;
SIGNAL \sys_res_n_debounce_inst|counter_inst|cnt_int\ : std_logic_vector(15 DOWNTO 0);
SIGNAL \sys_res_n_debounce_inst|sync_inst|sync\ : std_logic_vector(1 TO 2);
SIGNAL \btn_a_debounce_inst|counter_inst|cnt_int\ : std_logic_vector(15 DOWNTO 0);
SIGNAL \btn_a_debounce_inst|sync_inst|sync\ : std_logic_vector(1 TO 2);

BEGIN

ww_sys_clk <= sys_clk;
ww_sys_res_n <= sys_res_n;
ww_btn_a <= btn_a;
led_a <= ww_led_a;
led_b <= ww_led_b;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

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

-- Location: LC_X23_Y3_N8
\sys_res_n_debounce_inst|fsm_inst|Selector2~3\ : stratix_lcell
-- Equation(s):
-- \sys_res_n_debounce_inst|fsm_inst|Selector2~3_combout\ = (((\sys_res_n_debounce_inst|fsm_inst|debounce_fsm_state.IDLE0~regout\)) # (!\sys_res_n_debounce_inst|fsm_inst|debounce_fsm_state.IDLE1~regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "f3f3",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \sys_res_n_debounce_inst|fsm_inst|debounce_fsm_state.IDLE1~regout\,
	datac => \sys_res_n_debounce_inst|fsm_inst|debounce_fsm_state.IDLE0~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \sys_res_n_debounce_inst|fsm_inst|Selector2~3_combout\);

-- Location: LC_X23_Y4_N5
\sys_res_n_debounce_inst|counter_inst|cnt_int[3]\ : stratix_lcell
-- Equation(s):
-- \sys_res_n_debounce_inst|counter_inst|cnt_int\(3) = DFFEAS((\sys_res_n_debounce_inst|counter_inst|cnt_int\(3) $ ((\sys_res_n_debounce_inst|counter_inst|cnt_int[2]~3\))), GLOBAL(\sys_clk~combout\), VCC, , , , , 
-- \sys_res_n_debounce_inst|fsm_inst|Selector2~3_combout\, )
-- \sys_res_n_debounce_inst|counter_inst|cnt_int[3]~27\ = CARRY(((!\sys_res_n_debounce_inst|counter_inst|cnt_int[2]~3\) # (!\sys_res_n_debounce_inst|counter_inst|cnt_int\(3))))
-- \sys_res_n_debounce_inst|counter_inst|cnt_int[3]~27COUT1_50\ = CARRY(((!\sys_res_n_debounce_inst|counter_inst|cnt_int[2]~3\) # (!\sys_res_n_debounce_inst|counter_inst|cnt_int\(3))))

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
	sclr => \sys_res_n_debounce_inst|fsm_inst|Selector2~3_combout\,
	cin => \sys_res_n_debounce_inst|counter_inst|cnt_int[2]~3\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \sys_res_n_debounce_inst|counter_inst|cnt_int\(3),
	cout0 => \sys_res_n_debounce_inst|counter_inst|cnt_int[3]~27\,
	cout1 => \sys_res_n_debounce_inst|counter_inst|cnt_int[3]~27COUT1_50\);

-- Location: LC_X23_Y4_N6
\sys_res_n_debounce_inst|counter_inst|cnt_int[4]\ : stratix_lcell
-- Equation(s):
-- \sys_res_n_debounce_inst|counter_inst|cnt_int\(4) = DFFEAS((\sys_res_n_debounce_inst|counter_inst|cnt_int\(4) $ ((!(!\sys_res_n_debounce_inst|counter_inst|cnt_int[2]~3\ & \sys_res_n_debounce_inst|counter_inst|cnt_int[3]~27\) # 
-- (\sys_res_n_debounce_inst|counter_inst|cnt_int[2]~3\ & \sys_res_n_debounce_inst|counter_inst|cnt_int[3]~27COUT1_50\)))), GLOBAL(\sys_clk~combout\), VCC, , , , , \sys_res_n_debounce_inst|fsm_inst|Selector2~3_combout\, )
-- \sys_res_n_debounce_inst|counter_inst|cnt_int[4]~29\ = CARRY(((\sys_res_n_debounce_inst|counter_inst|cnt_int\(4) & !\sys_res_n_debounce_inst|counter_inst|cnt_int[3]~27\)))
-- \sys_res_n_debounce_inst|counter_inst|cnt_int[4]~29COUT1_52\ = CARRY(((\sys_res_n_debounce_inst|counter_inst|cnt_int\(4) & !\sys_res_n_debounce_inst|counter_inst|cnt_int[3]~27COUT1_50\)))

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
	sclr => \sys_res_n_debounce_inst|fsm_inst|Selector2~3_combout\,
	cin => \sys_res_n_debounce_inst|counter_inst|cnt_int[2]~3\,
	cin0 => \sys_res_n_debounce_inst|counter_inst|cnt_int[3]~27\,
	cin1 => \sys_res_n_debounce_inst|counter_inst|cnt_int[3]~27COUT1_50\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \sys_res_n_debounce_inst|counter_inst|cnt_int\(4),
	cout0 => \sys_res_n_debounce_inst|counter_inst|cnt_int[4]~29\,
	cout1 => \sys_res_n_debounce_inst|counter_inst|cnt_int[4]~29COUT1_52\);

-- Location: LC_X23_Y4_N7
\sys_res_n_debounce_inst|counter_inst|cnt_int[5]\ : stratix_lcell
-- Equation(s):
-- \sys_res_n_debounce_inst|counter_inst|cnt_int\(5) = DFFEAS(\sys_res_n_debounce_inst|counter_inst|cnt_int\(5) $ (((((!\sys_res_n_debounce_inst|counter_inst|cnt_int[2]~3\ & \sys_res_n_debounce_inst|counter_inst|cnt_int[4]~29\) # 
-- (\sys_res_n_debounce_inst|counter_inst|cnt_int[2]~3\ & \sys_res_n_debounce_inst|counter_inst|cnt_int[4]~29COUT1_52\))))), GLOBAL(\sys_clk~combout\), VCC, , , , , \sys_res_n_debounce_inst|fsm_inst|Selector2~3_combout\, )
-- \sys_res_n_debounce_inst|counter_inst|cnt_int[5]~31\ = CARRY(((!\sys_res_n_debounce_inst|counter_inst|cnt_int[4]~29\)) # (!\sys_res_n_debounce_inst|counter_inst|cnt_int\(5)))
-- \sys_res_n_debounce_inst|counter_inst|cnt_int[5]~31COUT1_54\ = CARRY(((!\sys_res_n_debounce_inst|counter_inst|cnt_int[4]~29COUT1_52\)) # (!\sys_res_n_debounce_inst|counter_inst|cnt_int\(5)))

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
	sclr => \sys_res_n_debounce_inst|fsm_inst|Selector2~3_combout\,
	cin => \sys_res_n_debounce_inst|counter_inst|cnt_int[2]~3\,
	cin0 => \sys_res_n_debounce_inst|counter_inst|cnt_int[4]~29\,
	cin1 => \sys_res_n_debounce_inst|counter_inst|cnt_int[4]~29COUT1_52\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \sys_res_n_debounce_inst|counter_inst|cnt_int\(5),
	cout0 => \sys_res_n_debounce_inst|counter_inst|cnt_int[5]~31\,
	cout1 => \sys_res_n_debounce_inst|counter_inst|cnt_int[5]~31COUT1_54\);

-- Location: LC_X23_Y4_N8
\sys_res_n_debounce_inst|counter_inst|cnt_int[6]\ : stratix_lcell
-- Equation(s):
-- \sys_res_n_debounce_inst|counter_inst|cnt_int\(6) = DFFEAS(\sys_res_n_debounce_inst|counter_inst|cnt_int\(6) $ ((((!(!\sys_res_n_debounce_inst|counter_inst|cnt_int[2]~3\ & \sys_res_n_debounce_inst|counter_inst|cnt_int[5]~31\) # 
-- (\sys_res_n_debounce_inst|counter_inst|cnt_int[2]~3\ & \sys_res_n_debounce_inst|counter_inst|cnt_int[5]~31COUT1_54\))))), GLOBAL(\sys_clk~combout\), VCC, , , , , \sys_res_n_debounce_inst|fsm_inst|Selector2~3_combout\, )
-- \sys_res_n_debounce_inst|counter_inst|cnt_int[6]~19\ = CARRY((\sys_res_n_debounce_inst|counter_inst|cnt_int\(6) & ((!\sys_res_n_debounce_inst|counter_inst|cnt_int[5]~31\))))
-- \sys_res_n_debounce_inst|counter_inst|cnt_int[6]~19COUT1_56\ = CARRY((\sys_res_n_debounce_inst|counter_inst|cnt_int\(6) & ((!\sys_res_n_debounce_inst|counter_inst|cnt_int[5]~31COUT1_54\))))

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
	sclr => \sys_res_n_debounce_inst|fsm_inst|Selector2~3_combout\,
	cin => \sys_res_n_debounce_inst|counter_inst|cnt_int[2]~3\,
	cin0 => \sys_res_n_debounce_inst|counter_inst|cnt_int[5]~31\,
	cin1 => \sys_res_n_debounce_inst|counter_inst|cnt_int[5]~31COUT1_54\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \sys_res_n_debounce_inst|counter_inst|cnt_int\(6),
	cout0 => \sys_res_n_debounce_inst|counter_inst|cnt_int[6]~19\,
	cout1 => \sys_res_n_debounce_inst|counter_inst|cnt_int[6]~19COUT1_56\);

-- Location: LC_X23_Y4_N9
\sys_res_n_debounce_inst|counter_inst|cnt_int[7]\ : stratix_lcell
-- Equation(s):
-- \sys_res_n_debounce_inst|counter_inst|cnt_int\(7) = DFFEAS(\sys_res_n_debounce_inst|counter_inst|cnt_int\(7) $ (((((!\sys_res_n_debounce_inst|counter_inst|cnt_int[2]~3\ & \sys_res_n_debounce_inst|counter_inst|cnt_int[6]~19\) # 
-- (\sys_res_n_debounce_inst|counter_inst|cnt_int[2]~3\ & \sys_res_n_debounce_inst|counter_inst|cnt_int[6]~19COUT1_56\))))), GLOBAL(\sys_clk~combout\), VCC, , , , , \sys_res_n_debounce_inst|fsm_inst|Selector2~3_combout\, )
-- \sys_res_n_debounce_inst|counter_inst|cnt_int[7]~21\ = CARRY(((!\sys_res_n_debounce_inst|counter_inst|cnt_int[6]~19COUT1_56\)) # (!\sys_res_n_debounce_inst|counter_inst|cnt_int\(7)))

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
	dataa => \sys_res_n_debounce_inst|counter_inst|cnt_int\(7),
	aclr => GND,
	sclr => \sys_res_n_debounce_inst|fsm_inst|Selector2~3_combout\,
	cin => \sys_res_n_debounce_inst|counter_inst|cnt_int[2]~3\,
	cin0 => \sys_res_n_debounce_inst|counter_inst|cnt_int[6]~19\,
	cin1 => \sys_res_n_debounce_inst|counter_inst|cnt_int[6]~19COUT1_56\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \sys_res_n_debounce_inst|counter_inst|cnt_int\(7),
	cout => \sys_res_n_debounce_inst|counter_inst|cnt_int[7]~21\);

-- Location: LC_X23_Y3_N0
\sys_res_n_debounce_inst|counter_inst|cnt_int[8]\ : stratix_lcell
-- Equation(s):
-- \sys_res_n_debounce_inst|counter_inst|cnt_int\(8) = DFFEAS((\sys_res_n_debounce_inst|counter_inst|cnt_int\(8) $ ((!\sys_res_n_debounce_inst|counter_inst|cnt_int[7]~21\))), GLOBAL(\sys_clk~combout\), VCC, , , , , 
-- \sys_res_n_debounce_inst|fsm_inst|Selector2~3_combout\, )
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
	sclr => \sys_res_n_debounce_inst|fsm_inst|Selector2~3_combout\,
	cin => \sys_res_n_debounce_inst|counter_inst|cnt_int[7]~21\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \sys_res_n_debounce_inst|counter_inst|cnt_int\(8),
	cout0 => \sys_res_n_debounce_inst|counter_inst|cnt_int[8]~23\,
	cout1 => \sys_res_n_debounce_inst|counter_inst|cnt_int[8]~23COUT1_58\);

-- Location: LC_X23_Y3_N1
\sys_res_n_debounce_inst|counter_inst|cnt_int[9]\ : stratix_lcell
-- Equation(s):
-- \sys_res_n_debounce_inst|counter_inst|cnt_int\(9) = DFFEAS(\sys_res_n_debounce_inst|counter_inst|cnt_int\(9) $ (((((!\sys_res_n_debounce_inst|counter_inst|cnt_int[7]~21\ & \sys_res_n_debounce_inst|counter_inst|cnt_int[8]~23\) # 
-- (\sys_res_n_debounce_inst|counter_inst|cnt_int[7]~21\ & \sys_res_n_debounce_inst|counter_inst|cnt_int[8]~23COUT1_58\))))), GLOBAL(\sys_clk~combout\), VCC, , , , , \sys_res_n_debounce_inst|fsm_inst|Selector2~3_combout\, )
-- \sys_res_n_debounce_inst|counter_inst|cnt_int[9]~5\ = CARRY(((!\sys_res_n_debounce_inst|counter_inst|cnt_int[8]~23\)) # (!\sys_res_n_debounce_inst|counter_inst|cnt_int\(9)))
-- \sys_res_n_debounce_inst|counter_inst|cnt_int[9]~5COUT1_60\ = CARRY(((!\sys_res_n_debounce_inst|counter_inst|cnt_int[8]~23COUT1_58\)) # (!\sys_res_n_debounce_inst|counter_inst|cnt_int\(9)))

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
	dataa => \sys_res_n_debounce_inst|counter_inst|cnt_int\(9),
	aclr => GND,
	sclr => \sys_res_n_debounce_inst|fsm_inst|Selector2~3_combout\,
	cin => \sys_res_n_debounce_inst|counter_inst|cnt_int[7]~21\,
	cin0 => \sys_res_n_debounce_inst|counter_inst|cnt_int[8]~23\,
	cin1 => \sys_res_n_debounce_inst|counter_inst|cnt_int[8]~23COUT1_58\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \sys_res_n_debounce_inst|counter_inst|cnt_int\(9),
	cout0 => \sys_res_n_debounce_inst|counter_inst|cnt_int[9]~5\,
	cout1 => \sys_res_n_debounce_inst|counter_inst|cnt_int[9]~5COUT1_60\);

-- Location: LC_X23_Y3_N2
\sys_res_n_debounce_inst|counter_inst|cnt_int[10]\ : stratix_lcell
-- Equation(s):
-- \sys_res_n_debounce_inst|counter_inst|cnt_int\(10) = DFFEAS(\sys_res_n_debounce_inst|counter_inst|cnt_int\(10) $ ((((!(!\sys_res_n_debounce_inst|counter_inst|cnt_int[7]~21\ & \sys_res_n_debounce_inst|counter_inst|cnt_int[9]~5\) # 
-- (\sys_res_n_debounce_inst|counter_inst|cnt_int[7]~21\ & \sys_res_n_debounce_inst|counter_inst|cnt_int[9]~5COUT1_60\))))), GLOBAL(\sys_clk~combout\), VCC, , , , , \sys_res_n_debounce_inst|fsm_inst|Selector2~3_combout\, )
-- \sys_res_n_debounce_inst|counter_inst|cnt_int[10]~9\ = CARRY((\sys_res_n_debounce_inst|counter_inst|cnt_int\(10) & ((!\sys_res_n_debounce_inst|counter_inst|cnt_int[9]~5\))))
-- \sys_res_n_debounce_inst|counter_inst|cnt_int[10]~9COUT1_62\ = CARRY((\sys_res_n_debounce_inst|counter_inst|cnt_int\(10) & ((!\sys_res_n_debounce_inst|counter_inst|cnt_int[9]~5COUT1_60\))))

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
	sclr => \sys_res_n_debounce_inst|fsm_inst|Selector2~3_combout\,
	cin => \sys_res_n_debounce_inst|counter_inst|cnt_int[7]~21\,
	cin0 => \sys_res_n_debounce_inst|counter_inst|cnt_int[9]~5\,
	cin1 => \sys_res_n_debounce_inst|counter_inst|cnt_int[9]~5COUT1_60\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \sys_res_n_debounce_inst|counter_inst|cnt_int\(10),
	cout0 => \sys_res_n_debounce_inst|counter_inst|cnt_int[10]~9\,
	cout1 => \sys_res_n_debounce_inst|counter_inst|cnt_int[10]~9COUT1_62\);

-- Location: LC_X23_Y3_N3
\sys_res_n_debounce_inst|counter_inst|cnt_int[11]\ : stratix_lcell
-- Equation(s):
-- \sys_res_n_debounce_inst|counter_inst|cnt_int\(11) = DFFEAS(\sys_res_n_debounce_inst|counter_inst|cnt_int\(11) $ (((((!\sys_res_n_debounce_inst|counter_inst|cnt_int[7]~21\ & \sys_res_n_debounce_inst|counter_inst|cnt_int[10]~9\) # 
-- (\sys_res_n_debounce_inst|counter_inst|cnt_int[7]~21\ & \sys_res_n_debounce_inst|counter_inst|cnt_int[10]~9COUT1_62\))))), GLOBAL(\sys_clk~combout\), VCC, , , , , \sys_res_n_debounce_inst|fsm_inst|Selector2~3_combout\, )
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
	sclr => \sys_res_n_debounce_inst|fsm_inst|Selector2~3_combout\,
	cin => \sys_res_n_debounce_inst|counter_inst|cnt_int[7]~21\,
	cin0 => \sys_res_n_debounce_inst|counter_inst|cnt_int[10]~9\,
	cin1 => \sys_res_n_debounce_inst|counter_inst|cnt_int[10]~9COUT1_62\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \sys_res_n_debounce_inst|counter_inst|cnt_int\(11),
	cout0 => \sys_res_n_debounce_inst|counter_inst|cnt_int[11]~11\,
	cout1 => \sys_res_n_debounce_inst|counter_inst|cnt_int[11]~11COUT1_64\);

-- Location: LC_X23_Y3_N4
\sys_res_n_debounce_inst|counter_inst|cnt_int[12]\ : stratix_lcell
-- Equation(s):
-- \sys_res_n_debounce_inst|counter_inst|cnt_int\(12) = DFFEAS(\sys_res_n_debounce_inst|counter_inst|cnt_int\(12) $ ((((!(!\sys_res_n_debounce_inst|counter_inst|cnt_int[7]~21\ & \sys_res_n_debounce_inst|counter_inst|cnt_int[11]~11\) # 
-- (\sys_res_n_debounce_inst|counter_inst|cnt_int[7]~21\ & \sys_res_n_debounce_inst|counter_inst|cnt_int[11]~11COUT1_64\))))), GLOBAL(\sys_clk~combout\), VCC, , , , , \sys_res_n_debounce_inst|fsm_inst|Selector2~3_combout\, )
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
	sclr => \sys_res_n_debounce_inst|fsm_inst|Selector2~3_combout\,
	cin => \sys_res_n_debounce_inst|counter_inst|cnt_int[7]~21\,
	cin0 => \sys_res_n_debounce_inst|counter_inst|cnt_int[11]~11\,
	cin1 => \sys_res_n_debounce_inst|counter_inst|cnt_int[11]~11COUT1_64\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \sys_res_n_debounce_inst|counter_inst|cnt_int\(12),
	cout => \sys_res_n_debounce_inst|counter_inst|cnt_int[12]~15\);

-- Location: LC_X23_Y3_N5
\sys_res_n_debounce_inst|counter_inst|cnt_int[13]\ : stratix_lcell
-- Equation(s):
-- \sys_res_n_debounce_inst|counter_inst|cnt_int\(13) = DFFEAS((\sys_res_n_debounce_inst|counter_inst|cnt_int\(13) $ ((\sys_res_n_debounce_inst|counter_inst|cnt_int[12]~15\))), GLOBAL(\sys_clk~combout\), VCC, , , , , 
-- \sys_res_n_debounce_inst|fsm_inst|Selector2~3_combout\, )
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
	sclr => \sys_res_n_debounce_inst|fsm_inst|Selector2~3_combout\,
	cin => \sys_res_n_debounce_inst|counter_inst|cnt_int[12]~15\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \sys_res_n_debounce_inst|counter_inst|cnt_int\(13),
	cout0 => \sys_res_n_debounce_inst|counter_inst|cnt_int[13]~17\,
	cout1 => \sys_res_n_debounce_inst|counter_inst|cnt_int[13]~17COUT1_66\);

-- Location: LC_X23_Y3_N6
\sys_res_n_debounce_inst|counter_inst|cnt_int[14]\ : stratix_lcell
-- Equation(s):
-- \sys_res_n_debounce_inst|counter_inst|cnt_int\(14) = DFFEAS((\sys_res_n_debounce_inst|counter_inst|cnt_int\(14) $ ((!(!\sys_res_n_debounce_inst|counter_inst|cnt_int[12]~15\ & \sys_res_n_debounce_inst|counter_inst|cnt_int[13]~17\) # 
-- (\sys_res_n_debounce_inst|counter_inst|cnt_int[12]~15\ & \sys_res_n_debounce_inst|counter_inst|cnt_int[13]~17COUT1_66\)))), GLOBAL(\sys_clk~combout\), VCC, , , , , \sys_res_n_debounce_inst|fsm_inst|Selector2~3_combout\, )
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
	sclr => \sys_res_n_debounce_inst|fsm_inst|Selector2~3_combout\,
	cin => \sys_res_n_debounce_inst|counter_inst|cnt_int[12]~15\,
	cin0 => \sys_res_n_debounce_inst|counter_inst|cnt_int[13]~17\,
	cin1 => \sys_res_n_debounce_inst|counter_inst|cnt_int[13]~17COUT1_66\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \sys_res_n_debounce_inst|counter_inst|cnt_int\(14),
	cout0 => \sys_res_n_debounce_inst|counter_inst|cnt_int[14]~13\,
	cout1 => \sys_res_n_debounce_inst|counter_inst|cnt_int[14]~13COUT1_68\);

-- Location: LC_X23_Y3_N7
\sys_res_n_debounce_inst|counter_inst|cnt_int[15]\ : stratix_lcell
-- Equation(s):
-- \sys_res_n_debounce_inst|counter_inst|cnt_int\(15) = DFFEAS(\sys_res_n_debounce_inst|counter_inst|cnt_int\(15) $ (((((!\sys_res_n_debounce_inst|counter_inst|cnt_int[12]~15\ & \sys_res_n_debounce_inst|counter_inst|cnt_int[14]~13\) # 
-- (\sys_res_n_debounce_inst|counter_inst|cnt_int[12]~15\ & \sys_res_n_debounce_inst|counter_inst|cnt_int[14]~13COUT1_68\))))), GLOBAL(\sys_clk~combout\), VCC, , , , , \sys_res_n_debounce_inst|fsm_inst|Selector2~3_combout\, )

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
	sclr => \sys_res_n_debounce_inst|fsm_inst|Selector2~3_combout\,
	cin => \sys_res_n_debounce_inst|counter_inst|cnt_int[12]~15\,
	cin0 => \sys_res_n_debounce_inst|counter_inst|cnt_int[14]~13\,
	cin1 => \sys_res_n_debounce_inst|counter_inst|cnt_int[14]~13COUT1_68\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \sys_res_n_debounce_inst|counter_inst|cnt_int\(15));

-- Location: LC_X22_Y4_N7
\sys_res_n_debounce_inst|fsm_inst|Equal0~1\ : stratix_lcell
-- Equation(s):
-- \sys_res_n_debounce_inst|fsm_inst|Equal0~1_combout\ = ((!\sys_res_n_debounce_inst|counter_inst|cnt_int\(10) & (!\sys_res_n_debounce_inst|counter_inst|cnt_int\(11))))

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
	datab => \sys_res_n_debounce_inst|counter_inst|cnt_int\(10),
	datac => \sys_res_n_debounce_inst|counter_inst|cnt_int\(11),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \sys_res_n_debounce_inst|fsm_inst|Equal0~1_combout\);

-- Location: LC_X22_Y4_N2
\sys_res_n_debounce_inst|fsm_inst|Equal0~2\ : stratix_lcell
-- Equation(s):
-- \sys_res_n_debounce_inst|fsm_inst|Equal0~2_combout\ = (!\sys_res_n_debounce_inst|counter_inst|cnt_int\(14) & (!\sys_res_n_debounce_inst|counter_inst|cnt_int\(13) & (\sys_res_n_debounce_inst|fsm_inst|Equal0~1_combout\ & 
-- !\sys_res_n_debounce_inst|counter_inst|cnt_int\(12))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \sys_res_n_debounce_inst|counter_inst|cnt_int\(14),
	datab => \sys_res_n_debounce_inst|counter_inst|cnt_int\(13),
	datac => \sys_res_n_debounce_inst|fsm_inst|Equal0~1_combout\,
	datad => \sys_res_n_debounce_inst|counter_inst|cnt_int\(12),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \sys_res_n_debounce_inst|fsm_inst|Equal0~2_combout\);

-- Location: LC_X22_Y4_N0
\sys_res_n_debounce_inst|counter_inst|LessThan0~0\ : stratix_lcell
-- Equation(s):
-- \sys_res_n_debounce_inst|counter_inst|LessThan0~0_combout\ = (((!\sys_res_n_debounce_inst|counter_inst|cnt_int\(9) & \sys_res_n_debounce_inst|fsm_inst|Equal0~2_combout\)) # (!\sys_res_n_debounce_inst|counter_inst|cnt_int\(15)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "3f0f",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \sys_res_n_debounce_inst|counter_inst|cnt_int\(9),
	datac => \sys_res_n_debounce_inst|counter_inst|cnt_int\(15),
	datad => \sys_res_n_debounce_inst|fsm_inst|Equal0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \sys_res_n_debounce_inst|counter_inst|LessThan0~0_combout\);

-- Location: LC_X22_Y4_N9
\sys_res_n_debounce_inst|counter_inst|LessThan0~1\ : stratix_lcell
-- Equation(s):
-- \sys_res_n_debounce_inst|counter_inst|LessThan0~1_combout\ = (!\sys_res_n_debounce_inst|counter_inst|cnt_int\(3) & (((!\sys_res_n_debounce_inst|counter_inst|cnt_int\(1) & !\sys_res_n_debounce_inst|counter_inst|cnt_int\(0))) # 
-- (!\sys_res_n_debounce_inst|counter_inst|cnt_int\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0515",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \sys_res_n_debounce_inst|counter_inst|cnt_int\(3),
	datab => \sys_res_n_debounce_inst|counter_inst|cnt_int\(1),
	datac => \sys_res_n_debounce_inst|counter_inst|cnt_int\(2),
	datad => \sys_res_n_debounce_inst|counter_inst|cnt_int\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \sys_res_n_debounce_inst|counter_inst|LessThan0~1_combout\);

-- Location: LC_X23_Y4_N1
\sys_res_n_debounce_inst|fsm_inst|Equal0~3\ : stratix_lcell
-- Equation(s):
-- \sys_res_n_debounce_inst|fsm_inst|Equal0~3_combout\ = (!\sys_res_n_debounce_inst|counter_inst|cnt_int\(8) & (\sys_res_n_debounce_inst|fsm_inst|Equal0~2_combout\ & (!\sys_res_n_debounce_inst|counter_inst|cnt_int\(7) & 
-- !\sys_res_n_debounce_inst|counter_inst|cnt_int\(6))))

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
	dataa => \sys_res_n_debounce_inst|counter_inst|cnt_int\(8),
	datab => \sys_res_n_debounce_inst|fsm_inst|Equal0~2_combout\,
	datac => \sys_res_n_debounce_inst|counter_inst|cnt_int\(7),
	datad => \sys_res_n_debounce_inst|counter_inst|cnt_int\(6),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \sys_res_n_debounce_inst|fsm_inst|Equal0~3_combout\);

-- Location: LC_X23_Y4_N0
\sys_res_n_debounce_inst|counter_inst|LessThan0~2\ : stratix_lcell
-- Equation(s):
-- \sys_res_n_debounce_inst|counter_inst|LessThan0~2_combout\ = (\sys_res_n_debounce_inst|counter_inst|LessThan0~0_combout\) # ((\sys_res_n_debounce_inst|fsm_inst|Equal0~3_combout\ & ((\sys_res_n_debounce_inst|counter_inst|LessThan0~1_combout\) # 
-- (!\sys_res_n_debounce_inst|fsm_inst|Equal0~5_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "eafa",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \sys_res_n_debounce_inst|counter_inst|LessThan0~0_combout\,
	datab => \sys_res_n_debounce_inst|counter_inst|LessThan0~1_combout\,
	datac => \sys_res_n_debounce_inst|fsm_inst|Equal0~3_combout\,
	datad => \sys_res_n_debounce_inst|fsm_inst|Equal0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \sys_res_n_debounce_inst|counter_inst|LessThan0~2_combout\);

-- Location: LC_X23_Y4_N2
\sys_res_n_debounce_inst|counter_inst|cnt_int[0]\ : stratix_lcell
-- Equation(s):
-- \sys_res_n_debounce_inst|counter_inst|cnt_int\(0) = DFFEAS(\sys_res_n_debounce_inst|counter_inst|cnt_int\(0) $ ((\sys_res_n_debounce_inst|counter_inst|LessThan0~2_combout\)), GLOBAL(\sys_clk~combout\), VCC, , , , , 
-- \sys_res_n_debounce_inst|fsm_inst|Selector2~3_combout\, )
-- \sys_res_n_debounce_inst|counter_inst|cnt_int[0]~1\ = CARRY((\sys_res_n_debounce_inst|counter_inst|cnt_int\(0) & (\sys_res_n_debounce_inst|counter_inst|LessThan0~2_combout\)))
-- \sys_res_n_debounce_inst|counter_inst|cnt_int[0]~1COUT1_46\ = CARRY((\sys_res_n_debounce_inst|counter_inst|cnt_int\(0) & (\sys_res_n_debounce_inst|counter_inst|LessThan0~2_combout\)))

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
	datab => \sys_res_n_debounce_inst|counter_inst|LessThan0~2_combout\,
	aclr => GND,
	sclr => \sys_res_n_debounce_inst|fsm_inst|Selector2~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \sys_res_n_debounce_inst|counter_inst|cnt_int\(0),
	cout0 => \sys_res_n_debounce_inst|counter_inst|cnt_int[0]~1\,
	cout1 => \sys_res_n_debounce_inst|counter_inst|cnt_int[0]~1COUT1_46\);

-- Location: LC_X23_Y4_N3
\sys_res_n_debounce_inst|counter_inst|cnt_int[1]\ : stratix_lcell
-- Equation(s):
-- \sys_res_n_debounce_inst|counter_inst|cnt_int\(1) = DFFEAS(\sys_res_n_debounce_inst|counter_inst|cnt_int\(1) $ ((((\sys_res_n_debounce_inst|counter_inst|cnt_int[0]~1\)))), GLOBAL(\sys_clk~combout\), VCC, , , , , 
-- \sys_res_n_debounce_inst|fsm_inst|Selector2~3_combout\, )
-- \sys_res_n_debounce_inst|counter_inst|cnt_int[1]~25\ = CARRY(((!\sys_res_n_debounce_inst|counter_inst|cnt_int[0]~1\)) # (!\sys_res_n_debounce_inst|counter_inst|cnt_int\(1)))
-- \sys_res_n_debounce_inst|counter_inst|cnt_int[1]~25COUT1_48\ = CARRY(((!\sys_res_n_debounce_inst|counter_inst|cnt_int[0]~1COUT1_46\)) # (!\sys_res_n_debounce_inst|counter_inst|cnt_int\(1)))

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
	sclr => \sys_res_n_debounce_inst|fsm_inst|Selector2~3_combout\,
	cin0 => \sys_res_n_debounce_inst|counter_inst|cnt_int[0]~1\,
	cin1 => \sys_res_n_debounce_inst|counter_inst|cnt_int[0]~1COUT1_46\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \sys_res_n_debounce_inst|counter_inst|cnt_int\(1),
	cout0 => \sys_res_n_debounce_inst|counter_inst|cnt_int[1]~25\,
	cout1 => \sys_res_n_debounce_inst|counter_inst|cnt_int[1]~25COUT1_48\);

-- Location: LC_X23_Y4_N4
\sys_res_n_debounce_inst|counter_inst|cnt_int[2]\ : stratix_lcell
-- Equation(s):
-- \sys_res_n_debounce_inst|counter_inst|cnt_int\(2) = DFFEAS(\sys_res_n_debounce_inst|counter_inst|cnt_int\(2) $ ((((!\sys_res_n_debounce_inst|counter_inst|cnt_int[1]~25\)))), GLOBAL(\sys_clk~combout\), VCC, , , , , 
-- \sys_res_n_debounce_inst|fsm_inst|Selector2~3_combout\, )
-- \sys_res_n_debounce_inst|counter_inst|cnt_int[2]~3\ = CARRY((\sys_res_n_debounce_inst|counter_inst|cnt_int\(2) & ((!\sys_res_n_debounce_inst|counter_inst|cnt_int[1]~25COUT1_48\))))

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
	sclr => \sys_res_n_debounce_inst|fsm_inst|Selector2~3_combout\,
	cin0 => \sys_res_n_debounce_inst|counter_inst|cnt_int[1]~25\,
	cin1 => \sys_res_n_debounce_inst|counter_inst|cnt_int[1]~25COUT1_48\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \sys_res_n_debounce_inst|counter_inst|cnt_int\(2),
	cout => \sys_res_n_debounce_inst|counter_inst|cnt_int[2]~3\);

-- Location: LC_X22_Y4_N8
\sys_res_n_debounce_inst|fsm_inst|Equal0~5\ : stratix_lcell
-- Equation(s):
-- \sys_res_n_debounce_inst|fsm_inst|Equal0~5_combout\ = (\sys_res_n_debounce_inst|counter_inst|cnt_int\(5) & (((\sys_res_n_debounce_inst|counter_inst|cnt_int\(4)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "a0a0",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \sys_res_n_debounce_inst|counter_inst|cnt_int\(5),
	datac => \sys_res_n_debounce_inst|counter_inst|cnt_int\(4),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \sys_res_n_debounce_inst|fsm_inst|Equal0~5_combout\);

-- Location: LC_X22_Y4_N6
\sys_res_n_debounce_inst|fsm_inst|Equal0~0\ : stratix_lcell
-- Equation(s):
-- \sys_res_n_debounce_inst|fsm_inst|Equal0~0_combout\ = (\sys_res_n_debounce_inst|counter_inst|cnt_int\(15) & (\sys_res_n_debounce_inst|counter_inst|cnt_int\(9) & (\sys_res_n_debounce_inst|counter_inst|cnt_int\(2) & 
-- \sys_res_n_debounce_inst|counter_inst|cnt_int\(0))))

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
	dataa => \sys_res_n_debounce_inst|counter_inst|cnt_int\(15),
	datab => \sys_res_n_debounce_inst|counter_inst|cnt_int\(9),
	datac => \sys_res_n_debounce_inst|counter_inst|cnt_int\(2),
	datad => \sys_res_n_debounce_inst|counter_inst|cnt_int\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \sys_res_n_debounce_inst|fsm_inst|Equal0~0_combout\);

-- Location: LC_X22_Y4_N5
\sys_res_n_debounce_inst|fsm_inst|Equal0~4\ : stratix_lcell
-- Equation(s):
-- \sys_res_n_debounce_inst|fsm_inst|Equal0~4_combout\ = ((!\sys_res_n_debounce_inst|counter_inst|cnt_int\(1) & ((!\sys_res_n_debounce_inst|counter_inst|cnt_int\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0033",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \sys_res_n_debounce_inst|counter_inst|cnt_int\(1),
	datad => \sys_res_n_debounce_inst|counter_inst|cnt_int\(3),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \sys_res_n_debounce_inst|fsm_inst|Equal0~4_combout\);

-- Location: LC_X22_Y4_N1
\sys_res_n_debounce_inst|fsm_inst|Equal0~6\ : stratix_lcell
-- Equation(s):
-- \sys_res_n_debounce_inst|fsm_inst|Equal0~6_combout\ = (\sys_res_n_debounce_inst|fsm_inst|Equal0~5_combout\ & (\sys_res_n_debounce_inst|fsm_inst|Equal0~0_combout\ & (\sys_res_n_debounce_inst|fsm_inst|Equal0~4_combout\ & 
-- \sys_res_n_debounce_inst|fsm_inst|Equal0~3_combout\)))

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
	dataa => \sys_res_n_debounce_inst|fsm_inst|Equal0~5_combout\,
	datab => \sys_res_n_debounce_inst|fsm_inst|Equal0~0_combout\,
	datac => \sys_res_n_debounce_inst|fsm_inst|Equal0~4_combout\,
	datad => \sys_res_n_debounce_inst|fsm_inst|Equal0~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \sys_res_n_debounce_inst|fsm_inst|Equal0~6_combout\);

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

-- Location: LC_X33_Y3_N2
\sys_res_n_debounce_inst|sync_inst|sync[1]\ : stratix_lcell
-- Equation(s):
-- \sys_res_n_debounce_inst|sync_inst|sync\(1) = DFFEAS((((\sys_res_n~combout\))), GLOBAL(\sys_clk~combout\), VCC, , , , , , )

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
	datad => \sys_res_n~combout\,
	aclr => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \sys_res_n_debounce_inst|sync_inst|sync\(1));

-- Location: LC_X22_Y4_N4
\sys_res_n_debounce_inst|sync_inst|sync[2]\ : stratix_lcell
-- Equation(s):
-- \sys_res_n_debounce_inst|fsm_inst|Selector2~0\ = (\sys_res_n_debounce_inst|fsm_inst|Equal0~6_combout\ & (\sys_res_n_debounce_inst|fsm_inst|debounce_fsm_state.TIMEOUT1~regout\ $ ((\sys_res_n_debounce_inst|fsm_inst|debounce_fsm_state.TIMEOUT0~regout\)))) # 
-- (!\sys_res_n_debounce_inst|fsm_inst|Equal0~6_combout\ & ((F1_sync[2] & (\sys_res_n_debounce_inst|fsm_inst|debounce_fsm_state.TIMEOUT1~regout\)) # (!F1_sync[2] & ((\sys_res_n_debounce_inst|fsm_inst|debounce_fsm_state.TIMEOUT0~regout\)))))
-- \sys_res_n_debounce_inst|sync_inst|sync\(2) = DFFEAS(\sys_res_n_debounce_inst|fsm_inst|Selector2~0\, GLOBAL(\sys_clk~combout\), VCC, , , \sys_res_n_debounce_inst|sync_inst|sync\(1), , , VCC)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "66ac",
	operation_mode => "normal",
	output_mode => "reg_and_comb",
	register_cascade_mode => "off",
	sum_lutc_input => "qfbk",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~combout\,
	dataa => \sys_res_n_debounce_inst|fsm_inst|debounce_fsm_state.TIMEOUT1~regout\,
	datab => \sys_res_n_debounce_inst|fsm_inst|debounce_fsm_state.TIMEOUT0~regout\,
	datac => \sys_res_n_debounce_inst|sync_inst|sync\(1),
	datad => \sys_res_n_debounce_inst|fsm_inst|Equal0~6_combout\,
	aclr => GND,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \sys_res_n_debounce_inst|fsm_inst|Selector2~0\,
	regout => \sys_res_n_debounce_inst|sync_inst|sync\(2));

-- Location: LC_X22_Y4_N3
\sys_res_n_debounce_inst|fsm_inst|Selector2~1\ : stratix_lcell
-- Equation(s):
-- \sys_res_n_debounce_inst|fsm_inst|Selector2~1_combout\ = \sys_res_n_debounce_inst|fsm_inst|Selector2~0\ $ (((\sys_res_n_debounce_inst|fsm_inst|debounce_fsm_state.IDLE1~regout\ & (\sys_res_n_debounce_inst|fsm_inst|debounce_fsm_state.IDLE0~regout\ & 
-- \sys_res_n_debounce_inst|sync_inst|sync\(2))) # (!\sys_res_n_debounce_inst|fsm_inst|debounce_fsm_state.IDLE1~regout\ & ((!\sys_res_n_debounce_inst|sync_inst|sync\(2))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "7a85",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \sys_res_n_debounce_inst|fsm_inst|debounce_fsm_state.IDLE1~regout\,
	datab => \sys_res_n_debounce_inst|fsm_inst|debounce_fsm_state.IDLE0~regout\,
	datac => \sys_res_n_debounce_inst|sync_inst|sync\(2),
	datad => \sys_res_n_debounce_inst|fsm_inst|Selector2~0\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \sys_res_n_debounce_inst|fsm_inst|Selector2~1_combout\);

-- Location: LC_X22_Y3_N6
\sys_res_n_debounce_inst|fsm_inst|debounce_fsm_state.IDLE1\ : stratix_lcell
-- Equation(s):
-- \sys_res_n_debounce_inst|fsm_inst|debounce_fsm_state.IDLE1~regout\ = DFFEAS(((!\sys_res_n_debounce_inst|fsm_inst|debounce_fsm_state.TIMEOUT1~regout\ & ((!\sys_res_n_debounce_inst|fsm_inst|Equal0~6_combout\) # 
-- (!\sys_res_n_debounce_inst|fsm_inst|debounce_fsm_state.TIMEOUT0~regout\)))) # (!\sys_res_n_debounce_inst|sync_inst|sync\(2)), GLOBAL(\sys_clk~combout\), VCC, , \sys_res_n_debounce_inst|fsm_inst|Selector2~1_combout\, , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "373f",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~combout\,
	dataa => \sys_res_n_debounce_inst|fsm_inst|debounce_fsm_state.TIMEOUT0~regout\,
	datab => \sys_res_n_debounce_inst|sync_inst|sync\(2),
	datac => \sys_res_n_debounce_inst|fsm_inst|debounce_fsm_state.TIMEOUT1~regout\,
	datad => \sys_res_n_debounce_inst|fsm_inst|Equal0~6_combout\,
	aclr => GND,
	ena => \sys_res_n_debounce_inst|fsm_inst|Selector2~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \sys_res_n_debounce_inst|fsm_inst|debounce_fsm_state.IDLE1~regout\);

-- Location: LC_X22_Y3_N3
\sys_res_n_debounce_inst|fsm_inst|Selector3~0\ : stratix_lcell
-- Equation(s):
-- \sys_res_n_debounce_inst|fsm_inst|Selector3~0_combout\ = (\sys_res_n_debounce_inst|fsm_inst|debounce_fsm_state.TIMEOUT1~regout\ & (((\sys_res_n_debounce_inst|sync_inst|sync\(2)) # (\sys_res_n_debounce_inst|fsm_inst|Equal0~6_combout\)))) # 
-- (!\sys_res_n_debounce_inst|fsm_inst|debounce_fsm_state.TIMEOUT1~regout\ & (\sys_res_n_debounce_inst|fsm_inst|debounce_fsm_state.TIMEOUT0~regout\ & ((\sys_res_n_debounce_inst|fsm_inst|Equal0~6_combout\) # (!\sys_res_n_debounce_inst|sync_inst|sync\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "fac2",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \sys_res_n_debounce_inst|fsm_inst|debounce_fsm_state.TIMEOUT0~regout\,
	datab => \sys_res_n_debounce_inst|sync_inst|sync\(2),
	datac => \sys_res_n_debounce_inst|fsm_inst|debounce_fsm_state.TIMEOUT1~regout\,
	datad => \sys_res_n_debounce_inst|fsm_inst|Equal0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \sys_res_n_debounce_inst|fsm_inst|Selector3~0_combout\);

-- Location: LC_X23_Y3_N9
\sys_res_n_debounce_inst|fsm_inst|Selector3~1\ : stratix_lcell
-- Equation(s):
-- \sys_res_n_debounce_inst|fsm_inst|Selector3~1_combout\ = (!\sys_res_n_debounce_inst|fsm_inst|Selector3~0_combout\ & ((\sys_res_n_debounce_inst|sync_inst|sync\(2) & (!\sys_res_n_debounce_inst|fsm_inst|debounce_fsm_state.IDLE0~regout\)) # 
-- (!\sys_res_n_debounce_inst|sync_inst|sync\(2) & ((\sys_res_n_debounce_inst|fsm_inst|debounce_fsm_state.IDLE1~regout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0702",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \sys_res_n_debounce_inst|sync_inst|sync\(2),
	datab => \sys_res_n_debounce_inst|fsm_inst|debounce_fsm_state.IDLE0~regout\,
	datac => \sys_res_n_debounce_inst|fsm_inst|Selector3~0_combout\,
	datad => \sys_res_n_debounce_inst|fsm_inst|debounce_fsm_state.IDLE1~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \sys_res_n_debounce_inst|fsm_inst|Selector3~1_combout\);

-- Location: LC_X22_Y3_N5
\sys_res_n_debounce_inst|fsm_inst|debounce_fsm_state.TIMEOUT1\ : stratix_lcell
-- Equation(s):
-- \sys_res_n_debounce_inst|fsm_inst|debounce_fsm_state.TIMEOUT1~regout\ = DFFEAS((\sys_res_n_debounce_inst|fsm_inst|debounce_fsm_state.IDLE1~regout\ & (((\sys_res_n_debounce_inst|fsm_inst|debounce_fsm_state.TIMEOUT1~regout\ & 
-- \sys_res_n_debounce_inst|fsm_inst|Selector3~1_combout\)))) # (!\sys_res_n_debounce_inst|fsm_inst|debounce_fsm_state.IDLE1~regout\ & (((\sys_res_n_debounce_inst|fsm_inst|debounce_fsm_state.TIMEOUT1~regout\ & 
-- \sys_res_n_debounce_inst|fsm_inst|Selector3~1_combout\)) # (!\sys_res_n_debounce_inst|sync_inst|sync\(2)))), GLOBAL(\sys_clk~combout\), VCC, , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "f111",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~combout\,
	dataa => \sys_res_n_debounce_inst|fsm_inst|debounce_fsm_state.IDLE1~regout\,
	datab => \sys_res_n_debounce_inst|sync_inst|sync\(2),
	datac => \sys_res_n_debounce_inst|fsm_inst|debounce_fsm_state.TIMEOUT1~regout\,
	datad => \sys_res_n_debounce_inst|fsm_inst|Selector3~1_combout\,
	aclr => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \sys_res_n_debounce_inst|fsm_inst|debounce_fsm_state.TIMEOUT1~regout\);

-- Location: LC_X22_Y3_N8
\sys_res_n_debounce_inst|fsm_inst|debounce_fsm_state.TIMEOUT0\ : stratix_lcell
-- Equation(s):
-- \sys_res_n_debounce_inst|fsm_inst|debounce_fsm_state.TIMEOUT0~regout\ = DFFEAS((\sys_res_n_debounce_inst|fsm_inst|debounce_fsm_state.TIMEOUT0~regout\ & ((\sys_res_n_debounce_inst|fsm_inst|Selector3~1_combout\) # 
-- ((\sys_res_n_debounce_inst|sync_inst|sync\(2) & \sys_res_n_debounce_inst|fsm_inst|debounce_fsm_state.IDLE0~regout\)))) # (!\sys_res_n_debounce_inst|fsm_inst|debounce_fsm_state.TIMEOUT0~regout\ & (\sys_res_n_debounce_inst|sync_inst|sync\(2) & 
-- (\sys_res_n_debounce_inst|fsm_inst|debounce_fsm_state.IDLE0~regout\))), GLOBAL(\sys_clk~combout\), VCC, , , , , , )

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
	clk => \sys_clk~combout\,
	dataa => \sys_res_n_debounce_inst|fsm_inst|debounce_fsm_state.TIMEOUT0~regout\,
	datab => \sys_res_n_debounce_inst|sync_inst|sync\(2),
	datac => \sys_res_n_debounce_inst|fsm_inst|debounce_fsm_state.IDLE0~regout\,
	datad => \sys_res_n_debounce_inst|fsm_inst|Selector3~1_combout\,
	aclr => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \sys_res_n_debounce_inst|fsm_inst|debounce_fsm_state.TIMEOUT0~regout\);

-- Location: LC_X22_Y3_N4
\sys_res_n_debounce_inst|fsm_inst|debounce_fsm_state.IDLE0\ : stratix_lcell
-- Equation(s):
-- \sys_res_n_debounce_inst|fsm_inst|debounce_fsm_state.IDLE0~regout\ = DFFEAS((!\sys_res_n_debounce_inst|sync_inst|sync\(2) & ((\sys_res_n_debounce_inst|fsm_inst|debounce_fsm_state.TIMEOUT0~regout\) # 
-- ((\sys_res_n_debounce_inst|fsm_inst|debounce_fsm_state.TIMEOUT1~regout\ & \sys_res_n_debounce_inst|fsm_inst|Equal0~6_combout\)))), GLOBAL(\sys_clk~combout\), VCC, , \sys_res_n_debounce_inst|fsm_inst|Selector2~1_combout\, , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "3222",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~combout\,
	dataa => \sys_res_n_debounce_inst|fsm_inst|debounce_fsm_state.TIMEOUT0~regout\,
	datab => \sys_res_n_debounce_inst|sync_inst|sync\(2),
	datac => \sys_res_n_debounce_inst|fsm_inst|debounce_fsm_state.TIMEOUT1~regout\,
	datad => \sys_res_n_debounce_inst|fsm_inst|Equal0~6_combout\,
	aclr => GND,
	ena => \sys_res_n_debounce_inst|fsm_inst|Selector2~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \sys_res_n_debounce_inst|fsm_inst|debounce_fsm_state.IDLE0~regout\);

-- Location: LC_X22_Y3_N9
\sys_res_n_debounce_inst|fsm_inst|o~0\ : stratix_lcell
-- Equation(s):
-- \sys_res_n_debounce_inst|fsm_inst|o~0_combout\ = (\sys_res_n_debounce_inst|fsm_inst|debounce_fsm_state.IDLE0~regout\) # (((\sys_res_n_debounce_inst|fsm_inst|debounce_fsm_state.TIMEOUT0~regout\)))

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
	dataa => \sys_res_n_debounce_inst|fsm_inst|debounce_fsm_state.IDLE0~regout\,
	datad => \sys_res_n_debounce_inst|fsm_inst|debounce_fsm_state.TIMEOUT0~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\);

-- Location: LC_X77_Y3_N8
\btn_a_debounce_inst|fsm_inst|debounce_fsm_state.TIMEOUT1\ : stratix_lcell
-- Equation(s):
-- \btn_a_debounce_inst|fsm_inst|debounce_fsm_state.TIMEOUT1~regout\ = DFFEAS((\btn_a_debounce_inst|fsm_inst|debounce_fsm_state.TIMEOUT1~regout\ & ((\btn_a_debounce_inst|fsm_inst|Selector1~1_combout\) # ((\btn_a_debounce_inst|sync_inst|sync\(2) & 
-- !\btn_a_debounce_inst|fsm_inst|debounce_fsm_state.IDLE1~regout\)))) # (!\btn_a_debounce_inst|fsm_inst|debounce_fsm_state.TIMEOUT1~regout\ & (\btn_a_debounce_inst|sync_inst|sync\(2) & ((!\btn_a_debounce_inst|fsm_inst|debounce_fsm_state.IDLE1~regout\)))), 
-- GLOBAL(\sys_clk~combout\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , , , , )

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
	dataa => \btn_a_debounce_inst|fsm_inst|debounce_fsm_state.TIMEOUT1~regout\,
	datab => \btn_a_debounce_inst|sync_inst|sync\(2),
	datac => \btn_a_debounce_inst|fsm_inst|Selector1~1_combout\,
	datad => \btn_a_debounce_inst|fsm_inst|debounce_fsm_state.IDLE1~regout\,
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \btn_a_debounce_inst|fsm_inst|debounce_fsm_state.TIMEOUT1~regout\);

-- Location: LC_X77_Y3_N4
\btn_a_debounce_inst|fsm_inst|Selector1~0\ : stratix_lcell
-- Equation(s):
-- \btn_a_debounce_inst|fsm_inst|Selector1~0_combout\ = (\btn_a_debounce_inst|fsm_inst|debounce_fsm_state.TIMEOUT1~regout\ & (((\btn_a_debounce_inst|fsm_inst|Equal0~6_combout\)) # (!\btn_a_debounce_inst|sync_inst|sync\(2)))) # 
-- (!\btn_a_debounce_inst|fsm_inst|debounce_fsm_state.TIMEOUT1~regout\ & (\btn_a_debounce_inst|fsm_inst|debounce_fsm_state.TIMEOUT0~regout\ & ((\btn_a_debounce_inst|sync_inst|sync\(2)) # (\btn_a_debounce_inst|fsm_inst|Equal0~6_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "f5c8",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \btn_a_debounce_inst|sync_inst|sync\(2),
	datab => \btn_a_debounce_inst|fsm_inst|debounce_fsm_state.TIMEOUT0~regout\,
	datac => \btn_a_debounce_inst|fsm_inst|Equal0~6_combout\,
	datad => \btn_a_debounce_inst|fsm_inst|debounce_fsm_state.TIMEOUT1~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \btn_a_debounce_inst|fsm_inst|Selector1~0_combout\);

-- Location: LC_X77_Y3_N5
\btn_a_debounce_inst|fsm_inst|Selector1~1\ : stratix_lcell
-- Equation(s):
-- \btn_a_debounce_inst|fsm_inst|Selector1~1_combout\ = (!\btn_a_debounce_inst|fsm_inst|Selector1~0_combout\ & ((\btn_a_debounce_inst|sync_inst|sync\(2) & ((\btn_a_debounce_inst|fsm_inst|debounce_fsm_state.IDLE1~regout\))) # 
-- (!\btn_a_debounce_inst|sync_inst|sync\(2) & (!\btn_a_debounce_inst|fsm_inst|debounce_fsm_state.IDLE0~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "4501",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \btn_a_debounce_inst|fsm_inst|Selector1~0_combout\,
	datab => \btn_a_debounce_inst|sync_inst|sync\(2),
	datac => \btn_a_debounce_inst|fsm_inst|debounce_fsm_state.IDLE0~regout\,
	datad => \btn_a_debounce_inst|fsm_inst|debounce_fsm_state.IDLE1~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \btn_a_debounce_inst|fsm_inst|Selector1~1_combout\);

-- Location: LC_X77_Y3_N6
\btn_a_debounce_inst|fsm_inst|debounce_fsm_state.TIMEOUT0\ : stratix_lcell
-- Equation(s):
-- \btn_a_debounce_inst|fsm_inst|debounce_fsm_state.TIMEOUT0~regout\ = DFFEAS((\btn_a_debounce_inst|sync_inst|sync\(2) & (((\btn_a_debounce_inst|fsm_inst|Selector1~1_combout\ & \btn_a_debounce_inst|fsm_inst|debounce_fsm_state.TIMEOUT0~regout\)))) # 
-- (!\btn_a_debounce_inst|sync_inst|sync\(2) & ((\btn_a_debounce_inst|fsm_inst|debounce_fsm_state.IDLE0~regout\) # ((\btn_a_debounce_inst|fsm_inst|Selector1~1_combout\ & \btn_a_debounce_inst|fsm_inst|debounce_fsm_state.TIMEOUT0~regout\)))), 
-- GLOBAL(\sys_clk~combout\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "f444",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~combout\,
	dataa => \btn_a_debounce_inst|sync_inst|sync\(2),
	datab => \btn_a_debounce_inst|fsm_inst|debounce_fsm_state.IDLE0~regout\,
	datac => \btn_a_debounce_inst|fsm_inst|Selector1~1_combout\,
	datad => \btn_a_debounce_inst|fsm_inst|debounce_fsm_state.TIMEOUT0~regout\,
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \btn_a_debounce_inst|fsm_inst|debounce_fsm_state.TIMEOUT0~regout\);

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

-- Location: LC_X71_Y5_N2
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

-- Location: LC_X76_Y3_N8
\btn_a_debounce_inst|sync_inst|sync[2]\ : stratix_lcell
-- Equation(s):
-- \btn_a_debounce_inst|fsm_inst|Selector0~1\ = (\btn_a_debounce_inst|fsm_inst|Equal0~6_combout\ & (\btn_a_debounce_inst|fsm_inst|debounce_fsm_state.TIMEOUT0~regout\ $ ((\btn_a_debounce_inst|fsm_inst|debounce_fsm_state.TIMEOUT1~regout\)))) # 
-- (!\btn_a_debounce_inst|fsm_inst|Equal0~6_combout\ & ((F2_sync[2] & (\btn_a_debounce_inst|fsm_inst|debounce_fsm_state.TIMEOUT0~regout\)) # (!F2_sync[2] & ((\btn_a_debounce_inst|fsm_inst|debounce_fsm_state.TIMEOUT1~regout\)))))
-- \btn_a_debounce_inst|sync_inst|sync\(2) = DFFEAS(\btn_a_debounce_inst|fsm_inst|Selector0~1\, GLOBAL(\sys_clk~combout\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , \btn_a_debounce_inst|sync_inst|sync\(1), , , VCC)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "66ac",
	operation_mode => "normal",
	output_mode => "reg_and_comb",
	register_cascade_mode => "off",
	sum_lutc_input => "qfbk",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~combout\,
	dataa => \btn_a_debounce_inst|fsm_inst|debounce_fsm_state.TIMEOUT0~regout\,
	datab => \btn_a_debounce_inst|fsm_inst|debounce_fsm_state.TIMEOUT1~regout\,
	datac => \btn_a_debounce_inst|sync_inst|sync\(1),
	datad => \btn_a_debounce_inst|fsm_inst|Equal0~6_combout\,
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \btn_a_debounce_inst|fsm_inst|Selector0~1\,
	regout => \btn_a_debounce_inst|sync_inst|sync\(2));

-- Location: LC_X76_Y3_N6
\btn_a_debounce_inst|fsm_inst|Selector0~2\ : stratix_lcell
-- Equation(s):
-- \btn_a_debounce_inst|fsm_inst|Selector0~2_combout\ = \btn_a_debounce_inst|fsm_inst|Selector0~1\ $ (((\btn_a_debounce_inst|fsm_inst|debounce_fsm_state.IDLE1~regout\ & (!\btn_a_debounce_inst|sync_inst|sync\(2) & 
-- \btn_a_debounce_inst|fsm_inst|debounce_fsm_state.IDLE0~regout\)) # (!\btn_a_debounce_inst|fsm_inst|debounce_fsm_state.IDLE1~regout\ & (\btn_a_debounce_inst|sync_inst|sync\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "969a",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \btn_a_debounce_inst|fsm_inst|Selector0~1\,
	datab => \btn_a_debounce_inst|fsm_inst|debounce_fsm_state.IDLE1~regout\,
	datac => \btn_a_debounce_inst|sync_inst|sync\(2),
	datad => \btn_a_debounce_inst|fsm_inst|debounce_fsm_state.IDLE0~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \btn_a_debounce_inst|fsm_inst|Selector0~2_combout\);

-- Location: LC_X76_Y3_N2
\btn_a_debounce_inst|fsm_inst|debounce_fsm_state.IDLE1\ : stratix_lcell
-- Equation(s):
-- \btn_a_debounce_inst|fsm_inst|debounce_fsm_state.IDLE1~regout\ = DFFEAS((\btn_a_debounce_inst|sync_inst|sync\(2)) # ((!\btn_a_debounce_inst|fsm_inst|debounce_fsm_state.TIMEOUT1~regout\ & ((!\btn_a_debounce_inst|fsm_inst|Equal0~6_combout\) # 
-- (!\btn_a_debounce_inst|fsm_inst|debounce_fsm_state.TIMEOUT0~regout\)))), GLOBAL(\sys_clk~combout\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , \btn_a_debounce_inst|fsm_inst|Selector0~2_combout\, , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "abbb",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~combout\,
	dataa => \btn_a_debounce_inst|sync_inst|sync\(2),
	datab => \btn_a_debounce_inst|fsm_inst|debounce_fsm_state.TIMEOUT1~regout\,
	datac => \btn_a_debounce_inst|fsm_inst|debounce_fsm_state.TIMEOUT0~regout\,
	datad => \btn_a_debounce_inst|fsm_inst|Equal0~6_combout\,
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	ena => \btn_a_debounce_inst|fsm_inst|Selector0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \btn_a_debounce_inst|fsm_inst|debounce_fsm_state.IDLE1~regout\);

-- Location: LC_X77_Y3_N2
\btn_a_debounce_inst|fsm_inst|Selector0~3\ : stratix_lcell
-- Equation(s):
-- \btn_a_debounce_inst|fsm_inst|Selector0~3_combout\ = (((\btn_a_debounce_inst|fsm_inst|debounce_fsm_state.IDLE0~regout\)) # (!\btn_a_debounce_inst|fsm_inst|debounce_fsm_state.IDLE1~regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "f3f3",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \btn_a_debounce_inst|fsm_inst|debounce_fsm_state.IDLE1~regout\,
	datac => \btn_a_debounce_inst|fsm_inst|debounce_fsm_state.IDLE0~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \btn_a_debounce_inst|fsm_inst|Selector0~3_combout\);

-- Location: LC_X76_Y2_N5
\btn_a_debounce_inst|counter_inst|cnt_int[3]\ : stratix_lcell
-- Equation(s):
-- \btn_a_debounce_inst|counter_inst|cnt_int\(3) = DFFEAS((\btn_a_debounce_inst|counter_inst|cnt_int\(3) $ ((\btn_a_debounce_inst|counter_inst|cnt_int[2]~3\))), GLOBAL(\sys_clk~combout\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , , , 
-- \btn_a_debounce_inst|fsm_inst|Selector0~3_combout\, )
-- \btn_a_debounce_inst|counter_inst|cnt_int[3]~27\ = CARRY(((!\btn_a_debounce_inst|counter_inst|cnt_int[2]~3\) # (!\btn_a_debounce_inst|counter_inst|cnt_int\(3))))
-- \btn_a_debounce_inst|counter_inst|cnt_int[3]~27COUT1_50\ = CARRY(((!\btn_a_debounce_inst|counter_inst|cnt_int[2]~3\) # (!\btn_a_debounce_inst|counter_inst|cnt_int\(3))))

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
	sclr => \btn_a_debounce_inst|fsm_inst|Selector0~3_combout\,
	cin => \btn_a_debounce_inst|counter_inst|cnt_int[2]~3\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \btn_a_debounce_inst|counter_inst|cnt_int\(3),
	cout0 => \btn_a_debounce_inst|counter_inst|cnt_int[3]~27\,
	cout1 => \btn_a_debounce_inst|counter_inst|cnt_int[3]~27COUT1_50\);

-- Location: LC_X76_Y2_N6
\btn_a_debounce_inst|counter_inst|cnt_int[4]\ : stratix_lcell
-- Equation(s):
-- \btn_a_debounce_inst|counter_inst|cnt_int\(4) = DFFEAS((\btn_a_debounce_inst|counter_inst|cnt_int\(4) $ ((!(!\btn_a_debounce_inst|counter_inst|cnt_int[2]~3\ & \btn_a_debounce_inst|counter_inst|cnt_int[3]~27\) # 
-- (\btn_a_debounce_inst|counter_inst|cnt_int[2]~3\ & \btn_a_debounce_inst|counter_inst|cnt_int[3]~27COUT1_50\)))), GLOBAL(\sys_clk~combout\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , , , 
-- \btn_a_debounce_inst|fsm_inst|Selector0~3_combout\, )
-- \btn_a_debounce_inst|counter_inst|cnt_int[4]~29\ = CARRY(((\btn_a_debounce_inst|counter_inst|cnt_int\(4) & !\btn_a_debounce_inst|counter_inst|cnt_int[3]~27\)))
-- \btn_a_debounce_inst|counter_inst|cnt_int[4]~29COUT1_52\ = CARRY(((\btn_a_debounce_inst|counter_inst|cnt_int\(4) & !\btn_a_debounce_inst|counter_inst|cnt_int[3]~27COUT1_50\)))

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
	sclr => \btn_a_debounce_inst|fsm_inst|Selector0~3_combout\,
	cin => \btn_a_debounce_inst|counter_inst|cnt_int[2]~3\,
	cin0 => \btn_a_debounce_inst|counter_inst|cnt_int[3]~27\,
	cin1 => \btn_a_debounce_inst|counter_inst|cnt_int[3]~27COUT1_50\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \btn_a_debounce_inst|counter_inst|cnt_int\(4),
	cout0 => \btn_a_debounce_inst|counter_inst|cnt_int[4]~29\,
	cout1 => \btn_a_debounce_inst|counter_inst|cnt_int[4]~29COUT1_52\);

-- Location: LC_X76_Y2_N7
\btn_a_debounce_inst|counter_inst|cnt_int[5]\ : stratix_lcell
-- Equation(s):
-- \btn_a_debounce_inst|counter_inst|cnt_int\(5) = DFFEAS(\btn_a_debounce_inst|counter_inst|cnt_int\(5) $ (((((!\btn_a_debounce_inst|counter_inst|cnt_int[2]~3\ & \btn_a_debounce_inst|counter_inst|cnt_int[4]~29\) # 
-- (\btn_a_debounce_inst|counter_inst|cnt_int[2]~3\ & \btn_a_debounce_inst|counter_inst|cnt_int[4]~29COUT1_52\))))), GLOBAL(\sys_clk~combout\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , , , 
-- \btn_a_debounce_inst|fsm_inst|Selector0~3_combout\, )
-- \btn_a_debounce_inst|counter_inst|cnt_int[5]~31\ = CARRY(((!\btn_a_debounce_inst|counter_inst|cnt_int[4]~29\)) # (!\btn_a_debounce_inst|counter_inst|cnt_int\(5)))
-- \btn_a_debounce_inst|counter_inst|cnt_int[5]~31COUT1_54\ = CARRY(((!\btn_a_debounce_inst|counter_inst|cnt_int[4]~29COUT1_52\)) # (!\btn_a_debounce_inst|counter_inst|cnt_int\(5)))

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
	sclr => \btn_a_debounce_inst|fsm_inst|Selector0~3_combout\,
	cin => \btn_a_debounce_inst|counter_inst|cnt_int[2]~3\,
	cin0 => \btn_a_debounce_inst|counter_inst|cnt_int[4]~29\,
	cin1 => \btn_a_debounce_inst|counter_inst|cnt_int[4]~29COUT1_52\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \btn_a_debounce_inst|counter_inst|cnt_int\(5),
	cout0 => \btn_a_debounce_inst|counter_inst|cnt_int[5]~31\,
	cout1 => \btn_a_debounce_inst|counter_inst|cnt_int[5]~31COUT1_54\);

-- Location: LC_X76_Y3_N5
\btn_a_debounce_inst|fsm_inst|Equal0~5\ : stratix_lcell
-- Equation(s):
-- \btn_a_debounce_inst|fsm_inst|Equal0~5_combout\ = ((\btn_a_debounce_inst|counter_inst|cnt_int\(4) & ((\btn_a_debounce_inst|counter_inst|cnt_int\(5)))))

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
	datab => \btn_a_debounce_inst|counter_inst|cnt_int\(4),
	datad => \btn_a_debounce_inst|counter_inst|cnt_int\(5),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \btn_a_debounce_inst|fsm_inst|Equal0~5_combout\);

-- Location: LC_X76_Y3_N7
\btn_a_debounce_inst|counter_inst|LessThan0~1\ : stratix_lcell
-- Equation(s):
-- \btn_a_debounce_inst|counter_inst|LessThan0~1_combout\ = (!\btn_a_debounce_inst|counter_inst|cnt_int\(3) & (((!\btn_a_debounce_inst|counter_inst|cnt_int\(1) & !\btn_a_debounce_inst|counter_inst|cnt_int\(0))) # 
-- (!\btn_a_debounce_inst|counter_inst|cnt_int\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0307",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \btn_a_debounce_inst|counter_inst|cnt_int\(1),
	datab => \btn_a_debounce_inst|counter_inst|cnt_int\(2),
	datac => \btn_a_debounce_inst|counter_inst|cnt_int\(3),
	datad => \btn_a_debounce_inst|counter_inst|cnt_int\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \btn_a_debounce_inst|counter_inst|LessThan0~1_combout\);

-- Location: LC_X76_Y2_N8
\btn_a_debounce_inst|counter_inst|cnt_int[6]\ : stratix_lcell
-- Equation(s):
-- \btn_a_debounce_inst|counter_inst|cnt_int\(6) = DFFEAS(\btn_a_debounce_inst|counter_inst|cnt_int\(6) $ ((((!(!\btn_a_debounce_inst|counter_inst|cnt_int[2]~3\ & \btn_a_debounce_inst|counter_inst|cnt_int[5]~31\) # 
-- (\btn_a_debounce_inst|counter_inst|cnt_int[2]~3\ & \btn_a_debounce_inst|counter_inst|cnt_int[5]~31COUT1_54\))))), GLOBAL(\sys_clk~combout\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , , , 
-- \btn_a_debounce_inst|fsm_inst|Selector0~3_combout\, )
-- \btn_a_debounce_inst|counter_inst|cnt_int[6]~19\ = CARRY((\btn_a_debounce_inst|counter_inst|cnt_int\(6) & ((!\btn_a_debounce_inst|counter_inst|cnt_int[5]~31\))))
-- \btn_a_debounce_inst|counter_inst|cnt_int[6]~19COUT1_56\ = CARRY((\btn_a_debounce_inst|counter_inst|cnt_int\(6) & ((!\btn_a_debounce_inst|counter_inst|cnt_int[5]~31COUT1_54\))))

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
	sclr => \btn_a_debounce_inst|fsm_inst|Selector0~3_combout\,
	cin => \btn_a_debounce_inst|counter_inst|cnt_int[2]~3\,
	cin0 => \btn_a_debounce_inst|counter_inst|cnt_int[5]~31\,
	cin1 => \btn_a_debounce_inst|counter_inst|cnt_int[5]~31COUT1_54\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \btn_a_debounce_inst|counter_inst|cnt_int\(6),
	cout0 => \btn_a_debounce_inst|counter_inst|cnt_int[6]~19\,
	cout1 => \btn_a_debounce_inst|counter_inst|cnt_int[6]~19COUT1_56\);

-- Location: LC_X76_Y2_N9
\btn_a_debounce_inst|counter_inst|cnt_int[7]\ : stratix_lcell
-- Equation(s):
-- \btn_a_debounce_inst|counter_inst|cnt_int\(7) = DFFEAS((\btn_a_debounce_inst|counter_inst|cnt_int\(7) $ (((!\btn_a_debounce_inst|counter_inst|cnt_int[2]~3\ & \btn_a_debounce_inst|counter_inst|cnt_int[6]~19\) # 
-- (\btn_a_debounce_inst|counter_inst|cnt_int[2]~3\ & \btn_a_debounce_inst|counter_inst|cnt_int[6]~19COUT1_56\)))), GLOBAL(\sys_clk~combout\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , , , 
-- \btn_a_debounce_inst|fsm_inst|Selector0~3_combout\, )
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
	sclr => \btn_a_debounce_inst|fsm_inst|Selector0~3_combout\,
	cin => \btn_a_debounce_inst|counter_inst|cnt_int[2]~3\,
	cin0 => \btn_a_debounce_inst|counter_inst|cnt_int[6]~19\,
	cin1 => \btn_a_debounce_inst|counter_inst|cnt_int[6]~19COUT1_56\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \btn_a_debounce_inst|counter_inst|cnt_int\(7),
	cout => \btn_a_debounce_inst|counter_inst|cnt_int[7]~21\);

-- Location: LC_X76_Y1_N0
\btn_a_debounce_inst|counter_inst|cnt_int[8]\ : stratix_lcell
-- Equation(s):
-- \btn_a_debounce_inst|counter_inst|cnt_int\(8) = DFFEAS((\btn_a_debounce_inst|counter_inst|cnt_int\(8) $ ((!\btn_a_debounce_inst|counter_inst|cnt_int[7]~21\))), GLOBAL(\sys_clk~combout\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , , , 
-- \btn_a_debounce_inst|fsm_inst|Selector0~3_combout\, )
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
	sclr => \btn_a_debounce_inst|fsm_inst|Selector0~3_combout\,
	cin => \btn_a_debounce_inst|counter_inst|cnt_int[7]~21\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \btn_a_debounce_inst|counter_inst|cnt_int\(8),
	cout0 => \btn_a_debounce_inst|counter_inst|cnt_int[8]~23\,
	cout1 => \btn_a_debounce_inst|counter_inst|cnt_int[8]~23COUT1_58\);

-- Location: LC_X76_Y1_N1
\btn_a_debounce_inst|counter_inst|cnt_int[9]\ : stratix_lcell
-- Equation(s):
-- \btn_a_debounce_inst|counter_inst|cnt_int\(9) = DFFEAS((\btn_a_debounce_inst|counter_inst|cnt_int\(9) $ (((!\btn_a_debounce_inst|counter_inst|cnt_int[7]~21\ & \btn_a_debounce_inst|counter_inst|cnt_int[8]~23\) # 
-- (\btn_a_debounce_inst|counter_inst|cnt_int[7]~21\ & \btn_a_debounce_inst|counter_inst|cnt_int[8]~23COUT1_58\)))), GLOBAL(\sys_clk~combout\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , , , 
-- \btn_a_debounce_inst|fsm_inst|Selector0~3_combout\, )
-- \btn_a_debounce_inst|counter_inst|cnt_int[9]~5\ = CARRY(((!\btn_a_debounce_inst|counter_inst|cnt_int[8]~23\) # (!\btn_a_debounce_inst|counter_inst|cnt_int\(9))))
-- \btn_a_debounce_inst|counter_inst|cnt_int[9]~5COUT1_60\ = CARRY(((!\btn_a_debounce_inst|counter_inst|cnt_int[8]~23COUT1_58\) # (!\btn_a_debounce_inst|counter_inst|cnt_int\(9))))

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
	sclr => \btn_a_debounce_inst|fsm_inst|Selector0~3_combout\,
	cin => \btn_a_debounce_inst|counter_inst|cnt_int[7]~21\,
	cin0 => \btn_a_debounce_inst|counter_inst|cnt_int[8]~23\,
	cin1 => \btn_a_debounce_inst|counter_inst|cnt_int[8]~23COUT1_58\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \btn_a_debounce_inst|counter_inst|cnt_int\(9),
	cout0 => \btn_a_debounce_inst|counter_inst|cnt_int[9]~5\,
	cout1 => \btn_a_debounce_inst|counter_inst|cnt_int[9]~5COUT1_60\);

-- Location: LC_X76_Y1_N2
\btn_a_debounce_inst|counter_inst|cnt_int[10]\ : stratix_lcell
-- Equation(s):
-- \btn_a_debounce_inst|counter_inst|cnt_int\(10) = DFFEAS(\btn_a_debounce_inst|counter_inst|cnt_int\(10) $ ((((!(!\btn_a_debounce_inst|counter_inst|cnt_int[7]~21\ & \btn_a_debounce_inst|counter_inst|cnt_int[9]~5\) # 
-- (\btn_a_debounce_inst|counter_inst|cnt_int[7]~21\ & \btn_a_debounce_inst|counter_inst|cnt_int[9]~5COUT1_60\))))), GLOBAL(\sys_clk~combout\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , , , 
-- \btn_a_debounce_inst|fsm_inst|Selector0~3_combout\, )
-- \btn_a_debounce_inst|counter_inst|cnt_int[10]~9\ = CARRY((\btn_a_debounce_inst|counter_inst|cnt_int\(10) & ((!\btn_a_debounce_inst|counter_inst|cnt_int[9]~5\))))
-- \btn_a_debounce_inst|counter_inst|cnt_int[10]~9COUT1_62\ = CARRY((\btn_a_debounce_inst|counter_inst|cnt_int\(10) & ((!\btn_a_debounce_inst|counter_inst|cnt_int[9]~5COUT1_60\))))

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
	sclr => \btn_a_debounce_inst|fsm_inst|Selector0~3_combout\,
	cin => \btn_a_debounce_inst|counter_inst|cnt_int[7]~21\,
	cin0 => \btn_a_debounce_inst|counter_inst|cnt_int[9]~5\,
	cin1 => \btn_a_debounce_inst|counter_inst|cnt_int[9]~5COUT1_60\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \btn_a_debounce_inst|counter_inst|cnt_int\(10),
	cout0 => \btn_a_debounce_inst|counter_inst|cnt_int[10]~9\,
	cout1 => \btn_a_debounce_inst|counter_inst|cnt_int[10]~9COUT1_62\);

-- Location: LC_X76_Y1_N3
\btn_a_debounce_inst|counter_inst|cnt_int[11]\ : stratix_lcell
-- Equation(s):
-- \btn_a_debounce_inst|counter_inst|cnt_int\(11) = DFFEAS(\btn_a_debounce_inst|counter_inst|cnt_int\(11) $ (((((!\btn_a_debounce_inst|counter_inst|cnt_int[7]~21\ & \btn_a_debounce_inst|counter_inst|cnt_int[10]~9\) # 
-- (\btn_a_debounce_inst|counter_inst|cnt_int[7]~21\ & \btn_a_debounce_inst|counter_inst|cnt_int[10]~9COUT1_62\))))), GLOBAL(\sys_clk~combout\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , , , 
-- \btn_a_debounce_inst|fsm_inst|Selector0~3_combout\, )
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
	sclr => \btn_a_debounce_inst|fsm_inst|Selector0~3_combout\,
	cin => \btn_a_debounce_inst|counter_inst|cnt_int[7]~21\,
	cin0 => \btn_a_debounce_inst|counter_inst|cnt_int[10]~9\,
	cin1 => \btn_a_debounce_inst|counter_inst|cnt_int[10]~9COUT1_62\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \btn_a_debounce_inst|counter_inst|cnt_int\(11),
	cout0 => \btn_a_debounce_inst|counter_inst|cnt_int[11]~11\,
	cout1 => \btn_a_debounce_inst|counter_inst|cnt_int[11]~11COUT1_64\);

-- Location: LC_X76_Y1_N4
\btn_a_debounce_inst|counter_inst|cnt_int[12]\ : stratix_lcell
-- Equation(s):
-- \btn_a_debounce_inst|counter_inst|cnt_int\(12) = DFFEAS(\btn_a_debounce_inst|counter_inst|cnt_int\(12) $ ((((!(!\btn_a_debounce_inst|counter_inst|cnt_int[7]~21\ & \btn_a_debounce_inst|counter_inst|cnt_int[11]~11\) # 
-- (\btn_a_debounce_inst|counter_inst|cnt_int[7]~21\ & \btn_a_debounce_inst|counter_inst|cnt_int[11]~11COUT1_64\))))), GLOBAL(\sys_clk~combout\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , , , 
-- \btn_a_debounce_inst|fsm_inst|Selector0~3_combout\, )
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
	sclr => \btn_a_debounce_inst|fsm_inst|Selector0~3_combout\,
	cin => \btn_a_debounce_inst|counter_inst|cnt_int[7]~21\,
	cin0 => \btn_a_debounce_inst|counter_inst|cnt_int[11]~11\,
	cin1 => \btn_a_debounce_inst|counter_inst|cnt_int[11]~11COUT1_64\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \btn_a_debounce_inst|counter_inst|cnt_int\(12),
	cout => \btn_a_debounce_inst|counter_inst|cnt_int[12]~15\);

-- Location: LC_X76_Y1_N5
\btn_a_debounce_inst|counter_inst|cnt_int[13]\ : stratix_lcell
-- Equation(s):
-- \btn_a_debounce_inst|counter_inst|cnt_int\(13) = DFFEAS((\btn_a_debounce_inst|counter_inst|cnt_int\(13) $ ((\btn_a_debounce_inst|counter_inst|cnt_int[12]~15\))), GLOBAL(\sys_clk~combout\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , , , 
-- \btn_a_debounce_inst|fsm_inst|Selector0~3_combout\, )
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
	sclr => \btn_a_debounce_inst|fsm_inst|Selector0~3_combout\,
	cin => \btn_a_debounce_inst|counter_inst|cnt_int[12]~15\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \btn_a_debounce_inst|counter_inst|cnt_int\(13),
	cout0 => \btn_a_debounce_inst|counter_inst|cnt_int[13]~17\,
	cout1 => \btn_a_debounce_inst|counter_inst|cnt_int[13]~17COUT1_66\);

-- Location: LC_X76_Y1_N6
\btn_a_debounce_inst|counter_inst|cnt_int[14]\ : stratix_lcell
-- Equation(s):
-- \btn_a_debounce_inst|counter_inst|cnt_int\(14) = DFFEAS((\btn_a_debounce_inst|counter_inst|cnt_int\(14) $ ((!(!\btn_a_debounce_inst|counter_inst|cnt_int[12]~15\ & \btn_a_debounce_inst|counter_inst|cnt_int[13]~17\) # 
-- (\btn_a_debounce_inst|counter_inst|cnt_int[12]~15\ & \btn_a_debounce_inst|counter_inst|cnt_int[13]~17COUT1_66\)))), GLOBAL(\sys_clk~combout\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , , , 
-- \btn_a_debounce_inst|fsm_inst|Selector0~3_combout\, )
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
	sclr => \btn_a_debounce_inst|fsm_inst|Selector0~3_combout\,
	cin => \btn_a_debounce_inst|counter_inst|cnt_int[12]~15\,
	cin0 => \btn_a_debounce_inst|counter_inst|cnt_int[13]~17\,
	cin1 => \btn_a_debounce_inst|counter_inst|cnt_int[13]~17COUT1_66\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \btn_a_debounce_inst|counter_inst|cnt_int\(14),
	cout0 => \btn_a_debounce_inst|counter_inst|cnt_int[14]~13\,
	cout1 => \btn_a_debounce_inst|counter_inst|cnt_int[14]~13COUT1_68\);

-- Location: LC_X76_Y1_N7
\btn_a_debounce_inst|counter_inst|cnt_int[15]\ : stratix_lcell
-- Equation(s):
-- \btn_a_debounce_inst|counter_inst|cnt_int\(15) = DFFEAS(\btn_a_debounce_inst|counter_inst|cnt_int\(15) $ (((((!\btn_a_debounce_inst|counter_inst|cnt_int[12]~15\ & \btn_a_debounce_inst|counter_inst|cnt_int[14]~13\) # 
-- (\btn_a_debounce_inst|counter_inst|cnt_int[12]~15\ & \btn_a_debounce_inst|counter_inst|cnt_int[14]~13COUT1_68\))))), GLOBAL(\sys_clk~combout\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , , , 
-- \btn_a_debounce_inst|fsm_inst|Selector0~3_combout\, )

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
	sclr => \btn_a_debounce_inst|fsm_inst|Selector0~3_combout\,
	cin => \btn_a_debounce_inst|counter_inst|cnt_int[12]~15\,
	cin0 => \btn_a_debounce_inst|counter_inst|cnt_int[14]~13\,
	cin1 => \btn_a_debounce_inst|counter_inst|cnt_int[14]~13COUT1_68\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \btn_a_debounce_inst|counter_inst|cnt_int\(15));

-- Location: LC_X76_Y1_N9
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

-- Location: LC_X76_Y1_N8
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

-- Location: LC_X76_Y3_N0
\btn_a_debounce_inst|counter_inst|LessThan0~0\ : stratix_lcell
-- Equation(s):
-- \btn_a_debounce_inst|counter_inst|LessThan0~0_combout\ = (((!\btn_a_debounce_inst|counter_inst|cnt_int\(9) & \btn_a_debounce_inst|fsm_inst|Equal0~2_combout\)) # (!\btn_a_debounce_inst|counter_inst|cnt_int\(15)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "3f33",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \btn_a_debounce_inst|counter_inst|cnt_int\(15),
	datac => \btn_a_debounce_inst|counter_inst|cnt_int\(9),
	datad => \btn_a_debounce_inst|fsm_inst|Equal0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \btn_a_debounce_inst|counter_inst|LessThan0~0_combout\);

-- Location: LC_X76_Y2_N0
\btn_a_debounce_inst|counter_inst|LessThan0~2\ : stratix_lcell
-- Equation(s):
-- \btn_a_debounce_inst|counter_inst|LessThan0~2_combout\ = (\btn_a_debounce_inst|counter_inst|LessThan0~0_combout\) # ((\btn_a_debounce_inst|fsm_inst|Equal0~3_combout\ & ((\btn_a_debounce_inst|counter_inst|LessThan0~1_combout\) # 
-- (!\btn_a_debounce_inst|fsm_inst|Equal0~5_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "ffd0",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \btn_a_debounce_inst|fsm_inst|Equal0~5_combout\,
	datab => \btn_a_debounce_inst|counter_inst|LessThan0~1_combout\,
	datac => \btn_a_debounce_inst|fsm_inst|Equal0~3_combout\,
	datad => \btn_a_debounce_inst|counter_inst|LessThan0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \btn_a_debounce_inst|counter_inst|LessThan0~2_combout\);

-- Location: LC_X76_Y2_N2
\btn_a_debounce_inst|counter_inst|cnt_int[0]\ : stratix_lcell
-- Equation(s):
-- \btn_a_debounce_inst|counter_inst|cnt_int\(0) = DFFEAS(\btn_a_debounce_inst|counter_inst|cnt_int\(0) $ ((\btn_a_debounce_inst|counter_inst|LessThan0~2_combout\)), GLOBAL(\sys_clk~combout\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , , , 
-- \btn_a_debounce_inst|fsm_inst|Selector0~3_combout\, )
-- \btn_a_debounce_inst|counter_inst|cnt_int[0]~1\ = CARRY((\btn_a_debounce_inst|counter_inst|cnt_int\(0) & (\btn_a_debounce_inst|counter_inst|LessThan0~2_combout\)))
-- \btn_a_debounce_inst|counter_inst|cnt_int[0]~1COUT1_46\ = CARRY((\btn_a_debounce_inst|counter_inst|cnt_int\(0) & (\btn_a_debounce_inst|counter_inst|LessThan0~2_combout\)))

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
	datab => \btn_a_debounce_inst|counter_inst|LessThan0~2_combout\,
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	sclr => \btn_a_debounce_inst|fsm_inst|Selector0~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \btn_a_debounce_inst|counter_inst|cnt_int\(0),
	cout0 => \btn_a_debounce_inst|counter_inst|cnt_int[0]~1\,
	cout1 => \btn_a_debounce_inst|counter_inst|cnt_int[0]~1COUT1_46\);

-- Location: LC_X76_Y2_N3
\btn_a_debounce_inst|counter_inst|cnt_int[1]\ : stratix_lcell
-- Equation(s):
-- \btn_a_debounce_inst|counter_inst|cnt_int\(1) = DFFEAS(\btn_a_debounce_inst|counter_inst|cnt_int\(1) $ ((((\btn_a_debounce_inst|counter_inst|cnt_int[0]~1\)))), GLOBAL(\sys_clk~combout\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , , , 
-- \btn_a_debounce_inst|fsm_inst|Selector0~3_combout\, )
-- \btn_a_debounce_inst|counter_inst|cnt_int[1]~25\ = CARRY(((!\btn_a_debounce_inst|counter_inst|cnt_int[0]~1\)) # (!\btn_a_debounce_inst|counter_inst|cnt_int\(1)))
-- \btn_a_debounce_inst|counter_inst|cnt_int[1]~25COUT1_48\ = CARRY(((!\btn_a_debounce_inst|counter_inst|cnt_int[0]~1COUT1_46\)) # (!\btn_a_debounce_inst|counter_inst|cnt_int\(1)))

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
	sclr => \btn_a_debounce_inst|fsm_inst|Selector0~3_combout\,
	cin0 => \btn_a_debounce_inst|counter_inst|cnt_int[0]~1\,
	cin1 => \btn_a_debounce_inst|counter_inst|cnt_int[0]~1COUT1_46\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \btn_a_debounce_inst|counter_inst|cnt_int\(1),
	cout0 => \btn_a_debounce_inst|counter_inst|cnt_int[1]~25\,
	cout1 => \btn_a_debounce_inst|counter_inst|cnt_int[1]~25COUT1_48\);

-- Location: LC_X76_Y2_N4
\btn_a_debounce_inst|counter_inst|cnt_int[2]\ : stratix_lcell
-- Equation(s):
-- \btn_a_debounce_inst|counter_inst|cnt_int\(2) = DFFEAS(\btn_a_debounce_inst|counter_inst|cnt_int\(2) $ ((((!\btn_a_debounce_inst|counter_inst|cnt_int[1]~25\)))), GLOBAL(\sys_clk~combout\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , , , , 
-- \btn_a_debounce_inst|fsm_inst|Selector0~3_combout\, )
-- \btn_a_debounce_inst|counter_inst|cnt_int[2]~3\ = CARRY((\btn_a_debounce_inst|counter_inst|cnt_int\(2) & ((!\btn_a_debounce_inst|counter_inst|cnt_int[1]~25COUT1_48\))))

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
	sclr => \btn_a_debounce_inst|fsm_inst|Selector0~3_combout\,
	cin0 => \btn_a_debounce_inst|counter_inst|cnt_int[1]~25\,
	cin1 => \btn_a_debounce_inst|counter_inst|cnt_int[1]~25COUT1_48\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \btn_a_debounce_inst|counter_inst|cnt_int\(2),
	cout => \btn_a_debounce_inst|counter_inst|cnt_int[2]~3\);

-- Location: LC_X76_Y2_N1
\btn_a_debounce_inst|fsm_inst|Equal0~3\ : stratix_lcell
-- Equation(s):
-- \btn_a_debounce_inst|fsm_inst|Equal0~3_combout\ = (!\btn_a_debounce_inst|counter_inst|cnt_int\(6) & (\btn_a_debounce_inst|fsm_inst|Equal0~2_combout\ & (!\btn_a_debounce_inst|counter_inst|cnt_int\(8) & !\btn_a_debounce_inst|counter_inst|cnt_int\(7))))

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
	dataa => \btn_a_debounce_inst|counter_inst|cnt_int\(6),
	datab => \btn_a_debounce_inst|fsm_inst|Equal0~2_combout\,
	datac => \btn_a_debounce_inst|counter_inst|cnt_int\(8),
	datad => \btn_a_debounce_inst|counter_inst|cnt_int\(7),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \btn_a_debounce_inst|fsm_inst|Equal0~3_combout\);

-- Location: LC_X76_Y3_N4
\btn_a_debounce_inst|fsm_inst|Equal0~0\ : stratix_lcell
-- Equation(s):
-- \btn_a_debounce_inst|fsm_inst|Equal0~0_combout\ = (\btn_a_debounce_inst|counter_inst|cnt_int\(9) & (\btn_a_debounce_inst|counter_inst|cnt_int\(15) & (\btn_a_debounce_inst|counter_inst|cnt_int\(2) & \btn_a_debounce_inst|counter_inst|cnt_int\(0))))

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
	dataa => \btn_a_debounce_inst|counter_inst|cnt_int\(9),
	datab => \btn_a_debounce_inst|counter_inst|cnt_int\(15),
	datac => \btn_a_debounce_inst|counter_inst|cnt_int\(2),
	datad => \btn_a_debounce_inst|counter_inst|cnt_int\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \btn_a_debounce_inst|fsm_inst|Equal0~0_combout\);

-- Location: LC_X76_Y3_N1
\btn_a_debounce_inst|fsm_inst|Equal0~4\ : stratix_lcell
-- Equation(s):
-- \btn_a_debounce_inst|fsm_inst|Equal0~4_combout\ = (((!\btn_a_debounce_inst|counter_inst|cnt_int\(3) & !\btn_a_debounce_inst|counter_inst|cnt_int\(1))))

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
	datac => \btn_a_debounce_inst|counter_inst|cnt_int\(3),
	datad => \btn_a_debounce_inst|counter_inst|cnt_int\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \btn_a_debounce_inst|fsm_inst|Equal0~4_combout\);

-- Location: LC_X76_Y3_N3
\btn_a_debounce_inst|fsm_inst|Equal0~6\ : stratix_lcell
-- Equation(s):
-- \btn_a_debounce_inst|fsm_inst|Equal0~6_combout\ = (\btn_a_debounce_inst|fsm_inst|Equal0~3_combout\ & (\btn_a_debounce_inst|fsm_inst|Equal0~0_combout\ & (\btn_a_debounce_inst|fsm_inst|Equal0~4_combout\ & \btn_a_debounce_inst|fsm_inst|Equal0~5_combout\)))

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
	dataa => \btn_a_debounce_inst|fsm_inst|Equal0~3_combout\,
	datab => \btn_a_debounce_inst|fsm_inst|Equal0~0_combout\,
	datac => \btn_a_debounce_inst|fsm_inst|Equal0~4_combout\,
	datad => \btn_a_debounce_inst|fsm_inst|Equal0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \btn_a_debounce_inst|fsm_inst|Equal0~6_combout\);

-- Location: LC_X76_Y3_N9
\btn_a_debounce_inst|fsm_inst|debounce_fsm_state.IDLE0\ : stratix_lcell
-- Equation(s):
-- \btn_a_debounce_inst|fsm_inst|debounce_fsm_state.IDLE0~regout\ = DFFEAS((\btn_a_debounce_inst|sync_inst|sync\(2) & ((\btn_a_debounce_inst|fsm_inst|debounce_fsm_state.TIMEOUT0~regout\) # ((\btn_a_debounce_inst|fsm_inst|Equal0~6_combout\ & 
-- \btn_a_debounce_inst|fsm_inst|debounce_fsm_state.TIMEOUT1~regout\)))), GLOBAL(\sys_clk~combout\), !GLOBAL(\sys_res_n_debounce_inst|fsm_inst|o~0_combout\), , \btn_a_debounce_inst|fsm_inst|Selector0~2_combout\, , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "f800",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~combout\,
	dataa => \btn_a_debounce_inst|fsm_inst|Equal0~6_combout\,
	datab => \btn_a_debounce_inst|fsm_inst|debounce_fsm_state.TIMEOUT1~regout\,
	datac => \btn_a_debounce_inst|fsm_inst|debounce_fsm_state.TIMEOUT0~regout\,
	datad => \btn_a_debounce_inst|sync_inst|sync\(2),
	aclr => \sys_res_n_debounce_inst|fsm_inst|o~0_combout\,
	ena => \btn_a_debounce_inst|fsm_inst|Selector0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \btn_a_debounce_inst|fsm_inst|debounce_fsm_state.IDLE0~regout\);

-- Location: LC_X77_Y3_N7
\btn_a_debounce_inst|fsm_inst|o~0\ : stratix_lcell
-- Equation(s):
-- \btn_a_debounce_inst|fsm_inst|o~0_combout\ = (((\btn_a_debounce_inst|fsm_inst|debounce_fsm_state.IDLE0~regout\) # (\btn_a_debounce_inst|fsm_inst|debounce_fsm_state.TIMEOUT0~regout\)))

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
	datac => \btn_a_debounce_inst|fsm_inst|debounce_fsm_state.IDLE0~regout\,
	datad => \btn_a_debounce_inst|fsm_inst|debounce_fsm_state.TIMEOUT0~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \btn_a_debounce_inst|fsm_inst|o~0_combout\);

-- Location: LC_X14_Y46_N2
\~STRATIX_FITTER_CREATED_GND~I\ : stratix_lcell
-- Equation(s):
-- \~STRATIX_FITTER_CREATED_GND~I_combout\ = GND

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
	combout => \~STRATIX_FITTER_CREATED_GND~I_combout\);

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
	datain => \~STRATIX_FITTER_CREATED_GND~I_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_led_b);
END structure;


