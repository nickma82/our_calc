library ieee;
use ieee.std_logic_1164.all;
use work.big_pkg.all;
use work.parser_pkg.all;

entity parser_sm_top is
  generic
  (
	RESET_VALUE : std_logic := '0'
  );  
  port
  (	sys_clk, sys_res_n       : in    std_logic;
		
	calc_data:	OUT CALCSIGNED;
	calc_data2:	OUT CALCSIGNED;
	calc_operator: 	OUT alu_operator_TYPE;
	calc_start:	OUT STD_LOGIC := '0';
	calc_finished:	IN STD_LOGIC;
	calc_result:	IN CALCSIGNED;
	calc_status: 	IN alu_calc_error_TYPE;
	
	parse_start:	IN STD_LOGIC;
	parse_new_data: 	out STD_LOGIC;	--pars new data out 1 Vom Parser kann ein neuer ASCII Code gelesenwerden.
	parse_data:	out ASCII_CHAR; 		--Der neue ASCII Code.
	
	charUnit_en:		OUT STD_LOGIC :='0';
	charUnit_get_next: 	OUT STD_LOGIC :='0';
	charUnit_next_valid:	IN  STD_LOGIC;
	charUnit_digit: 	IN ONEDIGIT;
	charUnit_op:		IN alu_operator_TYPE;
	charUnit_lastChar_type :IN PARSER_CHAR_TYPE;
	charUnit_char_type: 	IN PARSER_CHAR_TYPE
	
  );
end parser_sm_top;