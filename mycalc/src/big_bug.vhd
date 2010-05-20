--GLOBAL PACKAGE


LIBRARY ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package big_pkg is
	--- ALU
	constant SIZEI: INTEGER := 32;
	subtype CALCSIGNED is SIGNED((SIZEI-1) downto 0);
	constant CALCMAX: INTEGER:=  (2**(SIZEI-1))-1; --2147483647;
	constant CALCMIN: INTEGER:= -(2**(SIZEI-1));
	
	type alu_operator_TYPE is
		(ADDITION, SUBTRAKTION, MULTIPLIKATION, DIVISION, NOP);
	type alu_calc_error_TYPE is
		(GOOD, RESET, DIV_ZERO, OVERFLOW) ;
	
	--- PARSER
	constant MAXLINE_NUM: INTEGER := 51;
	subtype LINE_NUM is INTEGER 0 to MAXLINE_NUM;
	
	
	--- ALLGEMEIN
	subtype ASCII_CHAR is std_logic_vector(7 downto 0);
	
end package big_pkg;
