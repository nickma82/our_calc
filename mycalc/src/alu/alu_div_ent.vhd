-- @module : alu_div
-- @author : s0726179
-- @date   : Apr 26, 2010


library ieee;
use ieee.std_logic_1164.all;

ENTITY alu_div_ent IS 
	 PORT 
	 ( 
		 sys_clk, sys_res_n       : in    std_logic;
		 aclr	:	IN  STD_LOGIC := '0';
		 dataa	:	IN  STD_LOGIC_VECTOR (31 DOWNTO 0);
		 datab	:	IN  STD_LOGIC_VECTOR (31 DOWNTO 0);
		 division_by_zero	:	OUT  STD_LOGIC;
		 overflow	:	OUT  STD_LOGIC;
		 result	:	OUT  STD_LOGIC_VECTOR (31 DOWNTO 0);
		 calc_finished: OUT STD_LOGIC 
	 ); 
END alu_div_ent;




