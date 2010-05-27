library ieee;
use ieee.std_logic_1164.all;
use work.big_pkg.all;
use work.parser_pkg.all;

entity parser_top is
  generic
  (
	RESET_VALUE : std_logic := '0'
  );  
  port
  (	sys_clk, sys_res_n       : in    std_logic;	
		
	ps_start:	IN STD_LOGIC;
	parse_new_data: 	out STD_LOGIC;
	
	parse_data:	out RESULT_LINE; 	--Der neue ASCII Code.
	parse_state:	out parser_status_TYPE;	--
	
	rb_busy:	in  STD_LOGIC;	--not(rb_busy)
	rb_read_en:	out STD_LOGIC;	--Eine neue Zeile wird angefordert.
	rb_read_lineNr:	out LINE_NUM;	--Die neue Zeile die gelesen werden soll.
	rb_read_data_rdy:in STD_LOGIC;	--Die neue Zeile kann gelesen werden.
	rb_read_data:	in  RAM_LINE
	);
	
end entity parser_top;