LIBRARY ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.big_pkg.all;

package parser_pkg is
    type PARSER_CHAR_TYPE is
      (RESET, DIGIT, OP, EOL);
    	
    	--subtype ONEDIGIT is SIGNED(7 downto 0);
    	subtype ONEDIGIT is INTEGER range 0 to 9;
	
	constant STAGES_TOP: INTEGER := 3;
	subtype STAGE_POS_TYPE is INTEGER range 0 TO (STAGES_TOP-1);
	
	TYPE calc_buffs_TYPE  	is ARRAY (2 downto 0) of CALCSIGNED;
	TYPE alu_ops_buff_TYPE 	is ARRAY (2 downto 0) of alu_operator_TYPE;
	
-- 	component alu_top IS 
-- 	generic
-- 	(
-- 	      RESET_VALUE : std_logic := '0'
-- 	);
-- 	port
-- 	(
-- 	  sys_clk : in std_logic;
-- 	  sys_res_n : in std_logic;
-- 
-- 	      calc_data:	IN CALCSIGNED;
-- 	      calc_data2:	IN CALCSIGNED;
-- 	      calc_operator: IN  alu_operator_TYPE;
-- 	      calc_start:	IN  STD_LOGIC := '0';
-- 	      calc_finished:	OUT STD_LOGIC := '0';
-- 	      calc_result:	OUT CALCSIGNED;
-- 	      calc_status: 	OUT alu_calc_error_TYPE
-- 	);
--     END component alu_top;
	
    
end package parser_pkg;