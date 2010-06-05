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
	
	signal b2bcd_en:	STD_LOGIC;
	signal b2bcd_data:	CALCSIGNED;
	signal b2bcd_data_neg: STD_LOGIC;
	
	signal b2bcd_data_rdy: STD_LOGIC;
    
    component parser_sm_ent is
      generic
      (
	    RESET_VALUE : std_logic := '0'
      );  
      port
      (	sys_clk		: in 	std_logic;
	    sys_res_n       : in    std_logic;
		    
	    calc_data:	OUT CALCSIGNED;
	    calc_data2:	OUT CALCSIGNED;
	    calc_operator: 	OUT alu_operator_TYPE;
	    calc_start:	OUT STD_LOGIC := '0';
	    calc_finished:	IN STD_LOGIC;
	    calc_result:	IN CALCSIGNED;
	    calc_status: 	IN alu_calc_error_TYPE;
	    
	    parse_start:	IN STD_LOGIC;
	    parse_new_data: 	out STD_LOGIC;	--pars new data out 1 Vom Parser kann ein neuer ASCII Code gelesenwerden.
	    parse_state: 	out parser_status_TYPE;	
	    
	    charUnit_en:		OUT STD_LOGIC :='0';
	    charUnit_get_next: 	OUT STD_LOGIC :='0';
	    charUnit_next_valid:	IN  STD_LOGIC;
	    charUnit_digit: 	IN ONEDIGIT;
	    charUnit_op:		IN alu_operator_TYPE;
	    charUnit_lastChar_type :IN PARSER_CHAR_TYPE;
	    charUnit_char_type: 	IN PARSER_CHAR_TYPE;
	    
	    b2bcd_en:	OUT STD_LOGIC :='0';
	    b2bcd_data:	OUT CALCSIGNED;
	    b2bcd_data_neg: OUT STD_LOGIC :='0';
	    b2bcd_data_rdy: IN STD_LOGIC :='0'
	    
      );
    end component parser_sm_ent;



	signal charUnit_en:		STD_LOGIC;
	signal charUnit_get_next: 	STD_LOGIC;
	signal charUnit_next_valid:	STD_LOGIC;
	signal charUnit_digit: 		ONEDIGIT;
	signal charUnit_op:		alu_operator_TYPE;
	signal charUnit_lastChar_type : PARSER_CHAR_TYPE;
	signal charUnit_char_type: 	PARSER_CHAR_TYPE;

	component char_unit_ent is
	generic
	(
		RESET_VALUE : std_logic := '0'
	);  
	port
	(	sys_clk, sys_res_n       : in    std_logic;
		
		rb_busy:	in  STD_LOGIC;
		rb_read_en:	out STD_LOGIC; 	--Eine neue Zeile wird angefordert.
		rb_read_lineNr:	out std_logic_vector(7 downto 0);	--Die neue Zeile die gelesen werden soll.
		rb_read_data_rdy:in STD_LOGIC;	--Die neue Zeile kann gelesen werden.
		rb_read_data:	in  RAM_LINE;
		
		charUnit_en:		IN STD_LOGIC;
		charUnit_get_next: 	IN STD_LOGIC;
		charUnit_next_valid:	OUT STD_LOGIC := '0';
		charUnit_digit: 		OUT ONEDIGIT;
		charUnit_op:		OUT alu_operator_TYPE := NOP;
		charUnit_lastChar_type : OUT PARSER_CHAR_TYPE  := CRESET;
		charUnit_char_type: 	OUT PARSER_CHAR_TYPE  := CRESET
		
	);
	end component char_unit_ent;

	component b2bcd_ent is
	generic
	(
		RESET_VALUE : std_logic := '0'
	);
	port
	(	sys_clk, sys_res_n       : in    std_logic;
		
		rb_busy:	in  STD_LOGIC;
		
		b2bcd_en:	IN STD_LOGIC;
		b2bcd_data:	IN CALCSIGNED; --SIGNED((SIZEI-1) downto 0);
		b2bcd_data_neg: IN STD_LOGIC;
		b2bcd_data_rdy: OUT STD_LOGIC;
		
		parse_data:	out RESULT_LINE --Der neue ASCII Code *10 Zellen
		--parse_data(index:INTEGER)
	);
	end component b2bcd_ent;
BEGIN
     ---parser_logic_instance
     
     alu_top_inst : alu_top
	generic map
	(
	    RESET_VALUE => RESET_VALUE
	)
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
		calc_status	=> calc_status
		

	);
	
      parser_sm_inst: parser_sm_ent
      generic map
      (
	    RESET_VALUE => RESET_VALUE
      )
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
	    parse_state => parse_state,
	    
		---- ERSETZEN DURCH INTERNE SIGNALE
	    charUnit_en	=> charUnit_en,
	    charUnit_get_next	=> charUnit_get_next,
	    charUnit_next_valid	=> charUnit_next_valid,
	    charUnit_digit	=> 	charUnit_digit,
	    charUnit_op		=>	charUnit_op,
	    charUnit_lastChar_type	=> charUnit_lastChar_type,
	    charUnit_char_type		=> charUnit_char_type,
	    
	    b2bcd_en 	=> b2bcd_en,
	    b2bcd_data	=> b2bcd_data,
	    b2bcd_data_neg=> b2bcd_data_neg,
	    b2bcd_data_rdy=>b2bcd_data_rdy
      );
	
	
	
	char_unit_inst: char_unit_ent
	generic map
	(
		RESET_VALUE => RESET_VALUE
	)
	port map
	(	sys_clk 	=>  sys_clk,
		sys_res_n	=>  sys_res_n,
		
		rb_busy	=> rb_busy,
		rb_read_en	=> rb_read_en,
		rb_read_lineNr	=> rb_read_lineNr,
		rb_read_data_rdy=> rb_read_data_rdy,
		rb_read_data	=> rb_read_data,
		
		charUnit_en	=> charUnit_en,
		charUnit_get_next	=> charUnit_get_next,
		charUnit_next_valid	=> charUnit_next_valid,
		charUnit_digit	=> charUnit_digit,
		charUnit_op	=> charUnit_op,
		charUnit_lastChar_type	=> charUnit_lastChar_type,
		charUnit_char_type	=> charUnit_char_type
		
	);


	
	b2bcd_ent_inst: b2bcd_ent
	generic map
	(
		RESET_VALUE =>  RESET_VALUE
	)
	port map
	(	sys_clk  => sys_clk,
		sys_res_n => sys_res_n,
		
		rb_busy => rb_busy,
		
		b2bcd_en => b2bcd_en,
		b2bcd_data => b2bcd_data,
		b2bcd_data_neg => b2bcd_data_neg,
		b2bcd_data_rdy => b2bcd_data_rdy,
		
		parse_data => parse_data
	);
	
	
end architecture struct;
