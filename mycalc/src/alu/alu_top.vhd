library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; --Enthält auch +,-, ..
use work.big_pkg.all;

entity alu_top is
  generic
  (
  	RESET_VALUE : std_logic := '0'
  );
  port
  (
    sys_clk : in std_logic;
    sys_res_n : in std_logic;

	calc_data:	IN CALCSIGNED;
	calc_data2:	IN CALCSIGNED;
	calc_operator: IN  alu_operator_TYPE;
	calc_start:	IN  STD_LOGIC := '0';
	calc_finished:	OUT STD_LOGIC := '0';
	calc_result:	OUT CALCSIGNED;
	calc_status: 	OUT alu_calc_error_TYPE
  );
end entity alu_top;
