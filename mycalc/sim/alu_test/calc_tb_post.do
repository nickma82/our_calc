# compile technology libraries
# if you're using Quartus Web Edition combined with ModelSim-Altera you have
# to omit this step. ModelSim-Altera uses its own precompiled Altera technology
# libraries.

set SIM_LIBRARY_PATH /opt/quartus/quartus/eda/sim_lib
#--/opt/altera8.1/quartus/eda/sim_lib

if {[file exists cyclonelib]} {
  vdel -all -lib cyclonelib
}

vlib cyclonelib
vmap cycloneii cyclonelib

vcom -work cycloneii $SIM_LIBRARY_PATH/stratix_atoms.vhd
vcom -work cycloneii $SIM_LIBRARY_PATH/stratix_components.vhd

# end compile technology libraries


# create work library directory
vlib post_work

# map directory to library name "work"
vmap work post_work

# compile gate-level netlist
set NETLIST_PATH ../../mjl_stratix/simulation/modelsim

vcom -work work "$NETLIST_PATH/mjl_stratix.vho"


variable DIR ../../src
#compile vhdl files
vcom -work work $DIR/big_bug.vhd
vcom -work work $DIR/libs/sync.vhd
vcom -work work $DIR/libs/sync.vhd
vcom -work work $DIR/libs/sync_beh.vhd
vcom -work work $DIR/libs/sync_pkg.vhd
vcom -work work $DIR/libs/math_pkg.vhd
vcom -work work $DIR/debounce/debounce.vhd
vcom -work work $DIR/debounce/debounce_fsm.vhd
vcom -work work $DIR/debounce/debounce_fsm_beh.vhd
vcom -work work $DIR/debounce/debounce_pkg.vhd
vcom -work work $DIR/debounce/debounce_struct.vhd
#vcom -work work $DIR/debounce/debounce_top.vhd
vcom -work work $DIR/libs/counter.vhd
vcom -work work $DIR/libs/counter_beh.vhd

#vcom -work work $DIR/alu/alu_pkg.vhd

vcom -work work $DIR/alu/alu_div_ent.vhd
vcom -work work $DIR/alu/alu_div_arc.vhd
vcom -work work $DIR/alu/alu_fsm_ent.vhd
vcom -work work $DIR/alu/alu_fsm_arc.vhd
##ALU_top
vcom -work work $DIR/alu/alu_top.vhd
vcom -work work $DIR/alu/alu_top_struct.vhd


## compile testbench
vcom -work work calc_tb.vhd

## compile configuration file
#vcom -work work config_behav.vhd

## start simulation
#coverage zeigt %des Codes der Simuliert ist
# EIN START SIM cmd
#vsim -coverage work.conf
vsim -voptargs=+acc work.alu_tb

view -undock wave

# add signals to waveform
# add all testbench signals
add wave *

# add internal signals of unit under test
add wave -divider ALU_FSM
add wave uut/alu_logic_inst/alu_fsm*
add wave uut/alu_logic_inst/tmp*
add wave -group "Div Comm" uut/div_*


# auto-run simulation
#run 2 ms
run -all
wave zoomfull

#restart -f
#run -all
