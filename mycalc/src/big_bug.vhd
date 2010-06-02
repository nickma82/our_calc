--GLOBAL PACKAGE


LIBRARY ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package big_pkg is
	--- ALU
	constant SIZEI: INTEGER := 32;
	constant SIZEI_BCD_CHARS: INTEGER:= 10; --10chars  exklusive einem Vorzeichen
	
	subtype CALCSIGNED is SIGNED((SIZEI-1) downto 0);
	
	subtype MINMAX is INTEGER range -2147483647 TO 2147483647;
	constant CALCMAX: MINMAX:=  2147483647; --  (2**(SIZEI-1))-1 , minmax'right;
	constant CALCMIN: MINMAX:= -2147483647; -- -(2**(SIZEI-1));,   minmax'left;
	
	
	--- PARSER
	type parser_status_TYPE is
		(PRESET, PGOOD, PDIV_ZERO, POVERFLOW, PTOO_MUCH_OPS, PINVALID_OP_SEQUENCE);
	--@TODO alu_operator_TYPE  ---- WARNING
	--	will be moved to PARSER_PKG
	type alu_operator_TYPE is 
		(ADDITION, SUBTRAKTION, MULTIPLIKATION, DIVISION, NOP);
	type alu_calc_error_TYPE is
		(GOOD, RESET, DIV_ZERO, OVERFLOW);
	
	constant MAXLINE_NUM: INTEGER := 51;
	subtype LINE_NUM is INTEGER range 0 to MAXLINE_NUM;

	--- OUTPUT
	constant RED   : std_logic_vector(8*3-1 downto 0) := x"FF0000";
	constant GREEN : std_logic_vector(8*3-1 downto 0) := x"00FF00";
	constant BLUE  : std_logic_vector(8*3-1 downto 0) := x"0000FF";
	constant BLACK : std_logic_vector(8*3-1 downto 0) := x"000000";
	constant WHITE : std_logic_vector(8*3-1 downto 0) := x"FFFFFF";

	--- RINGBUFFER
	constant CHAR_LENGTH : INTEGER := 8;
	constant LINE_LENGTH : INTEGER := 82;
	constant LINE_NUMB : INTEGER := 51;
	constant RESULT_LENGTH : INTEGER := 11;
	--subtype RAM_CELL is integer range 0 to CHAR_LENGTH -1;
	subtype RAM_CELL is std_logic_vector(CHAR_LENGTH -1 downto 0);
	type RAM_LINE is array (LINE_LENGTH - 1 downto 0) of RAM_CELL;
	type RAM_ARRAY is array (LINE_NUMB - 1 downto 0, LINE_LENGTH - 1 downto 0) of RAM_CELL;
	type RESULT_LINE is array (RESULT_LENGTH - 1 downto 0) of RAM_CELL;

	
	constant MSG_OVERFLOW : RESULT_LINE := (10 => x"4F", 9 => x"56", 8 => x"45", 7 => x"52", 6 => x"46", 5 => x"4C", 4 => x"4F", 3 => x"57", 2 => x"00", 1 => x"00", 0 => x"00");
	constant MSG_ZERO : RESULT_LINE := (10 => x"44", 9 => x"49", 8 => x"56", 7 => x"20", 6 => x"42", 5 => x"59", 4 => x"20", 3 => x"5A", 2 => x"45", 1 => x"52", 0 => x"4F");
	constant MSG_SYNTAX : RESULT_LINE := (10 => x"53", 9 => x"59", 8 => x"4E", 7 => x"54", 6 => x"41", 5 => x"58", 4 => x"00", 3 => x"00", 2 => x"00", 1 => x"00", 0 => x"00");
	
	
	
	--- ALLGEMEIN
	subtype ASCII_CHAR is std_logic_vector(7 downto 0);
	
end package big_pkg;
