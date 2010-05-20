library ieee;
use ieee.std_logic_1164.all;
use work.big_pkg.all;

entity parser_top is
  generic
  (
	RESET_VALUE : std_logic := '0'
  );  
  port
  (	sys_clk, sys_res_n       : in    std_logic;	
	
-- 	calc_data:	OUT CALCSIGNED;
-- 	calc_data2:	OUT CALCSIGNED;
-- 	calc_operator: 	OUT alu_operator_TYPE;
-- 	calc_start:	OUT STD_LOGIC := '0';
-- 	calc_finished:	IN STD_LOGIC := '0';
-- 	calc_result:	IN CALCSIGNED;
-- 	calc_status: 	IN alu_calc_error_TYPE;
	
	ps_start:	IN STD_LOGIC := '0';
	parse_new_data: 	out STD_LOGIC;
	
	parse_data:	out ASCII_CHAR; --Der neue ASCII Code.
	rb_busy:	in  STD_LOGIC;
	rb_read_en:	out STD_LOGIC; 	--Eine neue Zeile wird angefordert.
	rb_read_lineNr:	out LINE_NUM;	--Die neue Zeile die gelesen werden soll.
	rb_read_data_rdy:in STD_LOGIC;	--Die neue Zeile kann gelesen werden.
	rb_read_data:	in  std_logic_vector(647 downto 0)
	
	
end entity parser_top;