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
	subtype STAGE_POS_TYPE is INTEGER range 0 TO (STAGES_TOP);
	
	TYPE calc_buffs_TYPE  	is ARRAY (2 downto 0) of CALCSIGNED;
	TYPE alu_ops_buff_TYPE 	is ARRAY (2 downto 0) of alu_operator_TYPE;
	
	
	
	component parser_top is
	generic
	(
	      RESET_VALUE : std_logic := '0'
	);  
	port
	(	sys_clk, sys_res_n       : in    std_logic;	
		      
	      ps_start:		IN STD_LOGIC;
	      parse_new_data: 	out STD_LOGIC;
	      
	      parse_data:	out RESULT_LINE; 	--Der neue ASCII Code.
	      parse_state:	out parser_status_TYPE;	--
	      
	      rb_busy:		in  STD_LOGIC;	--not(rb_busy)
	      rb_read_en:	out STD_LOGIC;	--Eine neue Zeile wird angefordert.
	      rb_read_lineNr:	out std_logic_vector(7 downto 0);	--Die neue Zeile die gelesen werden soll.
	      rb_read_data_rdy:	in STD_LOGIC;	--Die neue Zeile kann gelesen werden.
	      rb_read_data:	in  RAM_LINE
	 );
	 end component parser_top;
    
end package parser_pkg;
