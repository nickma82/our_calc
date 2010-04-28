if {[file exists behav_work]} {
  vdel -all -lib behav_work
}

# create work library directory
vlib behav_work

# map directory to library name "work"
vmap work behav_work

variable DIR ../../src
#compile vhdl files
vcom -work work $DIR/libs/sync.vhd
vcom -work work $DIR/libs/sync_beh.vhd
vcom -work work $DIR/libs/sync_pkg.vhd
vcom -work work $DIR/libs/math_pkg.vhd
vcom -work work $DIR/debounce/debounce.vhd
vcom -work work $DIR/debounce/debounce_fsm.vhd
vcom -work work $DIR/debounce/debounce_fsm_beh.vhd
vcom -work work $DIR/debounce/debounce_pkg.vhd
vcom -work work $DIR/debounce/debounce_struct.vhd
vcom -work work $DIR/debounce/debounce_top.vhd
vcom -work work $DIR/libs/counter.vhd
vcom -work work $DIR/libs/counter_beh.vhd
vcom -work work $DIR/calc_top.vhd
vcom -work work $DIR/calc_top_struct.vhd


## compile testbench
vcom -work work calc_tb.vhd

## compile configuration file
vcom -work work config_behav.vhd

## start simulation
#coverage zeigt %des Codes der Simuliert ist
vsim -coverage work.conf
vsim work.calc_tb

view -undock wave

# add signals to waveform
# add all testbench signals
add wave *

# add internal signals of unit under test
add wave -divider DEBOUNCE
add wave uut/btn_a_sync
add wave uut/btn_a_debounce_inst/cnt


# auto-run simulation
run 10 ms
wave zoomfull
