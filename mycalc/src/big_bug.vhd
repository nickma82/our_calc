--GLOBAL PACKAGE


LIBRARY ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package big_pkg is
	constant SIZEI: INTEGER := 32;
	subtype CALCSIGNED is SIGNED((SIZEI-1) downto 0);


	
	type alu_operator_TYPE is
		(ADDITION, SUBTRAKTION, MULTIPLIKATION, DIVISION, NOP);
	type alu_calc_error_TYPE is
		(GOOD, RESET, DIV_ZERO, OVERFLOW) ;
end package big_pkg;
