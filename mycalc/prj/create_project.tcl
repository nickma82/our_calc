package require ::quartus::project

set need_to_close_project 0
set make_assignments 1

# Check that the right project is open
if {[is_project_open]} {
	if {[string compare $quartus(project) "mjl_stratix"]} {
		puts "Project mjl_stratix is not open"
		set make_assignments 0
	}
} else {
	# Only open if not already open
	if {[project_exists mjl_stratix]} {
		project_open -revision mjl_stratix mjl_stratix
	} else {
		project_new -revision mjl_stratix mjl_stratix
	}
	set need_to_close_project 1
}

# Make assignments
if {$make_assignments} {
	#Quartus Settings
	set_global_assignment -name FAMILY Stratix
	set_global_assignment -name DEVICE EP1S25F672C6
	set_global_assignment -name EDA_SIMULATION_TOOL "ModelSim (VHDL)"
	set_global_assignment -name EDA_OUTPUT_DATA_FORMAT VHDL -section_id eda_simulation
	set_global_assignment -name USE_GENERATED_PHYSICAL_CONSTRAINTS OFF -section_id eda_blast_fpga
	set_global_assignment -name MISC_FILE "mjl_stratix.dpf"
	set_global_assignment -name STRATIX_DEVICE_IO_STANDARD "3.3-V LVTTL"
	set_global_assignment -name RESERVE_ALL_UNUSED_PINS "AS INPUT TRI-STATED WITH WEAK PULL-UP"
	set_global_assignment -name RESERVE_ASDO_AFTER_CONFIGURATION "AS INPUT TRI-STATED"
	
	################ FILES
	#vhdl Files
	set_global_assignment -name TOP_LEVEL_ENTITY calc_top
	set_global_assignment -name VHDL_FILE ../src/calc_top.vhd
	set_global_assignment -name VHDL_FILE ../src/calc_top_struct.vhd
	#debounce
	set_global_assignment -name VHDL_FILE ../src/libs/counter.vhd
	set_global_assignment -name VHDL_FILE ../src/libs/counter_beh.vhd
	set_global_assignment -name VHDL_FILE ../src/debounce/debounce.vhd
	set_global_assignment -name VHDL_FILE ../src/debounce/debounce_fsm.vhd
	set_global_assignment -name VHDL_FILE ../src/debounce/debounce_fsm_beh.vhd
	set_global_assignment -name VHDL_FILE ../src/debounce/debounce_pkg.vhd
	set_global_assignment -name VHDL_FILE ../src/debounce/debounce_struct.vhd
	set_global_assignment -name VHDL_FILE ../src/libs/math_pkg.vhd
	set_global_assignment -name VHDL_FILE ../src/libs/sync.vhd
	set_global_assignment -name VHDL_FILE ../src/libs/sync_beh.vhd
	set_global_assignment -name VHDL_FILE ../src/libs/sync_pkg.vhd
	
	################ PINNING
	#System
	set_location_assignment PIN_N3 -to sys_clk
	set_location_assignment PIN_AF17 -to sys_res_n
	#OnBoard (btn, led)
     	set_location_assignment PIN_A3 -to btn_a
     	set_location_assignment PIN_A5 -to btn_b
	set_location_assignment PIN_A6 -to led_a
	set_location_assignment PIN_A7 -to led_b
	#usart
	set_location_assignment PIN_D20 -to uart_cts
	set_location_assignment PIN_D21 -to uart_rts
	set_location_assignment PIN_D22 -to uart_tx
	set_location_assignment PIN_D23 -to uart_rx
	#ps2 (bidirectional)
	set_location_assignment PIN_E21 -to ps2_data
	set_location_assignment PIN_Y26 -to ps2_clk
	#vga
	set_location_assignment PIN_E22 -to r[0]
	set_location_assignment PIN_T4 -to r[1]
	set_location_assignment PIN_T7 -to r[2]
	set_location_assignment PIN_E23 -to g[0]
	set_location_assignment PIN_T5 -to g[1]
	set_location_assignment PIN_T24 -to g[2]
	set_location_assignment PIN_E24 -to b[0]
	set_location_assignment PIN_T6 -to b[1]
	set_location_assignment PIN_F1 -to hsync_n
	set_location_assignment PIN_F2 -to vsync_n
	
	

	set_global_assignment -name FMAX_REQUIREMENT "33.33 MHz" -section_id sys_clk
	set_instance_assignment -name CLOCK_SETTINGS sys_clk -to sys_clk

	set_global_assignment -name LL_ROOT_REGION ON -section_id "Root Region"
	set_global_assignment -name LL_MEMBER_STATE LOCKED -section_id "Root Region"
	set_global_assignment -name PARTITION_NETLIST_TYPE SOURCE -section_id Top
	set_global_assignment -name PARTITION_COLOR 16764057 -section_id Top
	set_instance_assignment -name PARTITION_HIERARCHY root_partition -to | -section_id Top

	# Commit assignments
	export_assignments

	# Close project
	if {$need_to_close_project} {
		project_close
	}
}
