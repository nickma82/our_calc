library ieee;
use ieee.std_logic_1164.all;
use work.big_pkg.all;
use work.parser_pkg.all;

entity char_unit is
  generic
  (
	RESET_VALUE : std_logic := '0'
  );
  port
  (	sys_clk, sys_res_n       : in    std_logic;
	
	rb_busy:	in  STD_LOGIC;
	rb_read_en:	out STD_LOGIC; 	--Eine neue Zeile wird angefordert.
	rb_read_lineNr:	out LINE_NUM;	--Die neue Zeile die gelesen werden soll.
	rb_read_data_rdy:in STD_LOGIC;	--Die neue Zeile kann gelesen werden.
	rb_read_data:	in  RAM_LINE;
	
	charUnit_en:		IN STD_LOGIC;
	charUnit_get_next: 	IN STD_LOGIC;
	charUnit_next_valid:	OUT STD_LOGIC := '0';
	charUnit_digit: 		OUT ONEDIGIT;
	charUnit_op:		OUT alu_operator_TYPE := NOP;
	charUnit_lastChar_type : OUT PARSER_CHAR_TYPE  := RESET;
	charUnit_char_type: 	OUT PARSER_CHAR_TYPE  := RESET
	
  );
end char_unit;

--double dabble