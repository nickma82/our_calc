
-- @module : alu_pkg
-- @author : s0726179
-- @date   : Apr 26, 2010
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.big_pkg.all;

package alu_pkg is
    constant RESETVALUE : std_logic := '0';
    
    
    component alu_div_ent IS 
	 generic(
	 	SIZE: INTEGER := 32
	 );
	 PORT 
	 ( 
		 sys_clk, sys_res_n       : in    std_logic;
		 div_en	:	IN  STD_LOGIC := '0';
		 number	:	IN  STD_LOGIC_VECTOR((SIZE - 1) downto 0);
		 dividend	:	IN  STD_LOGIC_VECTOR((SIZE - 1) downto 0);
		 result	:	OUT  STD_LOGIC_VECTOR((SIZE - 1) downto 0);
		 division_by_zero:	OUT  STD_LOGIC;
		 calc_finished: OUT STD_LOGIC 
	 ); 
   END component alu_div_ent;
   
   
     component alu_fsm_ent is
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
		calc_operator: IN  STD_LOGIC_VECTOR(1 downto 0);
		calc_start:	IN  STD_LOGIC := '0';
		calc_finished: OUT STD_LOGIC;
		calc_result:	OUT CALCSIGNED;
		calc_status: 	OUT STD_LOGIC_VECTOR(1 downto 0);
		
		--Communication to DIV_Module
		div_en, division_by_zero, div_calc_finished: STD_LOGIC;
		div_number, div_dividend, div_result: STD_LOGIC_VECTOR((SIZE - 1) downto 0)
	   );
    end component alu_fsm_ent;



end package alu_pkg;  
 







