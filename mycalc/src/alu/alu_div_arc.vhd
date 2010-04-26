

-- @module : alu_div_arc
-- @author : s0726179
-- @date   : Apr 26, 2010
 LIBRARY ieee;
 USE ieee.std_logic_1164.all;

ARCHITECTURE alu_div OF alu_div_ent IS

	SIGNAL sub_wire0	: STD_LOGIC ;
	SIGNAL sub_wire3	: STD_LOGIC_VECTOR (31 DOWNTO 0);

BEGIN
	
	division_by_zero <= '1';
	
--	process(clock)
--		begin
--		    division_by_zero <='1';
--		end process;
	
END alu_div;