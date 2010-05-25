library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;



architecture struct of parser_top is 

begin
    
    component parser_sm_top is
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
    end component parser_sm_top;


     ---parser_logic_instance
     
     alu_top_inst : alu_top
	generic
	(
	    RESET_VALUE =>
	);
	port
	(
		sys_clk	=> 
		sys_res_n	=> 
		
		calc_data	=> 
		calc_data2	=> 
		calc_operator	=> 
		calc_start	=> 
		calc_finished	=> 
		calc_result	=> 
		calc_status	=> 
		

	)
	
end architecture struct;
