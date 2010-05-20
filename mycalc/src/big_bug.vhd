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
	subtype LINE_NUM is INTEGER range 0 to MAXLINE_NUM;

	--- RINGBUFFER
	constant CHAR_LENGTH : INTEGER := 8;
	constant LINE_LENGTH : INTEGER := 81;
	constant LINE_NUMB : INTEGER := 51;
	--subtype RAM_CELL is integer range 0 to CHAR_LENGTH -1;
	subtype RAM_CELL is std_logic_vector(CHAR_LENGTH -1 downto 0);
	type RAM_LINE is array (LINE_LENGTH - 1 downto 0) of RAM_CELL;
	type RAM_ARRAY is array (LINE_NUMB - 1 downto 0, LINE_LENGTH - 1 downto 0) of RAM_CELL;
	
	
	--- ALLGEMEIN
	subtype ASCII_CHAR is std_logic_vector(7 downto 0);
	
end package big_pkg;
