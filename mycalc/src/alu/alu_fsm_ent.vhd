library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
--use work.math_pkg.all;

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

	calc_data:	IN SIGNED(SIZE-1 downto 0);
	calc_data2:	IN SIGNED(SIZE-1 downto 0);
	calc_operator: IN  STD_LOGIC_VECTOR(1 downto 0);
	calc_start:	IN  STD_LOGIC := '0';
	calc_finished: OUT STD_LOGIC;
	calc_result:	OUT SIGNED(SIZE-1 downto 0);
	calc_status: 	OUT STD_LOGIC_VECTOR(1 downto 0);
	
	--Communication to DIV_Module
	div_en, division_by_zero, div_calc_finished: STD_LOGIC;
	div_number, div_dividend, div_result: STD_LOGIC_VECTOR((SIZE - 1) downto 0)
   );
end entity alu_fsm_ent;
