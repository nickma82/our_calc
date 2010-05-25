library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.alu_pkg.all;


architecture struct of parser_top is 


	signal calc_data:	CALCSIGNED;
	signal calc_data2:	CALCSIGNED;
	signal calc_operator: 	alu_operator_TYPE;
	signal calc_start:	STD_LOGIC;
	signal calc_finished:	STD_LOGIC;
	signal calc_result:	CALCSIGNED;
	signal calc_status: 	alu_calc_error_TYPE;
		
    component parser_sm_ent is
      generic
      (
	    RESET_VALUE : std_logic := '0'
      );  
      port
      (	sys_clk, sys_res_n       : in    std_logic;
		    
	    calc_data:	OUT CALCSIGNED;
	    calc_data2:	OUT CALCSIGNED;
	    calc_operator: 	OUT alu_operator_TYPE;
	    calc_start:	OUT STD_LOGIC := '0';
	    calc_finished:	IN STD_LOGIC;
	    calc_result:	IN CALCSIGNED;
	    calc_status: 	IN alu_calc_error_TYPE;
	    
	    parse_start:	IN STD_LOGIC;
	    parse_new_data: 	out STD_LOGIC;	--pars new data out 1 Vom Parser kann ein neuer ASCII Code gelesenwerden.
	    parse_data:	out ASCII_CHAR; 		--Der neue ASCII Code.
	    
	    charUnit_en:		OUT STD_LOGIC :='0';
	    charUnit_get_next: 	OUT STD_LOGIC :='0';
	    charUnit_next_valid:	IN  STD_LOGIC;
	    charUnit_digit: 	IN ONEDIGIT;
	    charUnit_op:		IN alu_operator_TYPE;
	    charUnit_lastChar_type :IN PARSER_CHAR_TYPE;
	    charUnit_char_type: 	IN PARSER_CHAR_TYPE
	    
      );
    end component parser_sm_ent;



-- 		signal en:		STD_LOGIC;
-- 		signal get_next: 	STD_LOGIC;
-- 		signal next_valid:	STD_LOGIC;
-- 		signal digit: 		ONEDIGIT;
-- 		signal op:		alu_operator_TYPE;
-- 		signal lastChar_type : PARSER_CHAR_TYPE;
-- 		signal char_type: 	PARSER_CHAR_TYPE;

-- 	component char_unit is
-- 	generic
-- 	(
-- 		RESET_VALUE : std_logic := '0'
-- 	);  
-- 	port
-- 	(	sys_clk, sys_res_n       : in    std_logic;
-- 		
-- 		rb_busy:	in  STD_LOGIC;
-- 		rb_read_en:	out STD_LOGIC; 	--Eine neue Zeile wird angefordert.
-- 		rb_read_lineNr:	out LINE_NUM;	--Die neue Zeile die gelesen werden soll.
-- 		rb_read_data_rdy:in STD_LOGIC;	--Die neue Zeile kann gelesen werden.
-- 		rb_read_data:	in  RAM_LINE
-- 		
-- 		en:		IN STD_LOGIC;
-- 		get_next: 	IN STD_LOGIC;
-- 		next_valid:	OUT STD_LOGIC := '0';
-- 		digit: 		OUT ONEDIGIT;
-- 		op:		OUT alu_operator_TYPE := NOP;
-- 		lastChar_type : OUT PARSER_CHAR_TYPE  := RESET;
-- 		char_type: 	OUT PARSER_CHAR_TYPE  := RESET;
-- 		
-- 	);
-- 	end component char_unit;

BEGIN
     ---parser_logic_instance
     
     alu_top_inst : alu_top
	generic map
	(
	    RESET_VALUE => RESET_VALUEE
	);
	port map
	(
		sys_clkk 	=>  sys_clkk,
		sys_res_n	=>  sys_res_n,
		
		calc_data	=> calc_data,
		calc_data2	=> calc_data2,
		calc_operator	=> calc_operator,
		calc_start	=> calc_start,
		calc_finished	=> calc_finished,
		calc_result	=> calc_result,
		calc_status	=> calc_status
		

	)
	
	parser_sm_inst: parser_sm_ent
	generic map
      (
	    RESET_VALUE => RESET_VALUE
      );  
      port map
      (	
		sys_clk 	=>  sys_clk,
		sys_res_n	=>  sys_res_n,
		
		calc_data	=> calc_data,
		calc_data2	=> calc_data2,
		calc_operator	=> calc_operator,
		calc_start	=> calc_start,
		calc_finished	=> calc_finished,
		calc_result	=> calc_result,
		calc_status	=> calc_status,
		
	    parse_start	=> ps_start,
	    parse_new_data	=> parse_new_data,
	    parse_data	=> parse_data,
	    
		---- ERSETZEN DURCH INTERNE SIGNALE
	    charUnit_en	=> en,
	    charUnit_get_next	=> get_next,
	    charUnit_next_valid	=> next_valid,
	    charUnit_digit	=> 	digit,
	    charUnit_op		=>	op,
	    charUnit_lastChar_type	=> lastChar_type,
	    charUnit_char_type		=> char_type
      );
    end component parser_sm_ent;
	
	
	
-- 	char_unit_inst: char_unit
-- 	generic map
-- 	(
-- 		RESET_VALUE => RESET_VALUE
-- 	);  
-- 	port map
-- 	(	sys_clk 	=>  sys_clk,
-- 		sys_res_n	=>  sys_res_n,
-- 		
-- 		rb_busy	=> rb_busy,
-- 		rb_read_en	=> rb_read_en,
-- 		rb_read_lineNr	=> rb_read_lineNr,
-- 		rb_read_data_rdy=> rb_read_data_rdy,
-- 		rb_read_data	=> rb_read_data,
-- 		
-- 		en	=> en,
-- 		get_next	=> get_next,
-- 		next_valid	=> next_valid,
-- 		digit	=> digit,
-- 		op	=> op,
-- 		lastChar_type	=> lastChar_type,
-- 		char_type	=> char_type
-- 		
-- 	);
-- 	end component char_unit;
	
end architecture struct;
