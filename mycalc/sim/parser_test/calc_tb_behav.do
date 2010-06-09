if {[file exists behav_work]} {
  vdel -all -lib behav_work
}

# create work library directory
vlib behav_work

# map directory to library name "work"
vmap work behav_work

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


#####ALU
vcom -work work $DIR/alu/alu_div_ent.vhd
vcom -work work $DIR/alu/alu_div_arc.vhd
vcom -work work $DIR/alu/alu_fsm_ent.vhd
vcom -work work $DIR/alu/alu_fsm_arc.vhd
vcom -work work $DIR/alu/alu_top.vhd
vcom -work work $DIR/alu/alu_top_struct.vhd
vcom -work work $DIR/alu/alu_pkg.vhd

###PARSER
vcom -work work $DIR/parser/parser_pkg.vhd
vcom -work work $DIR/parser/parser_sm_ent.vhd
vcom -work work $DIR/parser/parser_sm_arc.vhd
###vcom -work work $DIR/parser/char_unit_ent.vhd
###vcom -work work $DIR/parser/char_unit_arc.vhd
vcom -work work $DIR/parser/b2bcd_ent.vhd
vcom -work work $DIR/parser/b2bcd_arc.vhd
vcom -work work $DIR/parser/parser_top.vhd
vcom -work work $DIR/parser/parser_top_struct.vhd
#vcom -work work $DIR/parser/.vhd


## compile testbench
vcom -work work calc_tb.vhd



## start simulation
#coverage zeigt %des Codes der Simuliert ist
# EIN START SIM cmd
#vsim -coverage work.conf
vsim -coverage -voptargs=+acc work.parser_tb

view -undock wave

# add signals to waveform
# add all testbench signals
add wave -group "parser tb" -radix Decimal *

# add internal signals of unit under test
#add wave -divider PARSER
add wave -radix Decimal uut/parser_sm_inst/*
#add wave -group "Div Comm" uut/div_*
add wave -group "alu" -radix Decimal uut/alu_top_inst/*


# auto-run simulation
#run 2 ms
run -all
wave zoomfull

#restart -f
#run -all
