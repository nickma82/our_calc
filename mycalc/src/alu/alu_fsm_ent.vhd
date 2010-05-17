library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
--use work.math_pkg.all;
--use work.alu_pkg.all;
use work.big_pkg.all;

entity alu_fsm_ent is
  generic
  (
    RESET_VALUE : std_logic := '0';
    SIZE: INTEGER := 32
  );
  port
  (
    sys_clk : in std_logic;
    sys_res_n : in std_logic;

	calc_data:	IN CALCSIGNED;
	calc_data2:	IN CALCSIGNED;
	calc_operator: IN  alu_operator_TYPE;
	calc_start:	IN  STD_LOGIC;
	calc_finished: OUT STD_LOGIC;
	calc_result:	OUT CALCSIGNED;
	calc_status: 	OUT alu_calc_error_TYPE;
	
	--Communication to DIV_Module
	div_en: out STD_LOGIC;
	division_by_zero, div_calc_finished: in STD_LOGIC;
	div_number: out  STD_LOGIC_VECTOR((SIZE - 1) downto 0);
	div_dividend: out  STD_LOGIC_VECTOR((SIZE - 1) downto 0);
	div_result: in STD_LOGIC_VECTOR((SIZE - 1) downto 0)
   );
end entity alu_fsm_ent;
