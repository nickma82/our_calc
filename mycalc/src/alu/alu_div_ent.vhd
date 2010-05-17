-- @module : alu_div
-- @author : s0726179
-- @date   : Apr 26, 2010


library ieee;
use ieee.std_logic_1164.all;

ENTITY alu_div_ent IS 
	 generic(
	 	SIZE: INTEGER := 32
	 );
	 PORT 
	 ( 
		 sys_clk, sys_res_n       : in    std_logic;
		 div_en	:	IN  STD_LOGIC;
		 number	:	IN  STD_LOGIC_VECTOR((SIZE - 1) downto 0);
		 dividend:	IN  STD_LOGIC_VECTOR((SIZE - 1) downto 0);
		 result	:	OUT  STD_LOGIC_VECTOR((SIZE - 1) downto 0);
		 division_by_zero	:	OUT  STD_LOGIC;
		 calc_finished: OUT STD_LOGIC 
	 ); 
END entity alu_div_ent;




