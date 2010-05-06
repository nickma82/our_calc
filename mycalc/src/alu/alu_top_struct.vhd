library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.alu_pkg.all;

architecture struct of alu_top is 
	constant SIZE: INTEGER := 32;
	--signal sys_clk, sys_res_n:    std_logic;
	--Division Module Signals
	signal div_en, division_by_zero, div_calc_finished: std_logic;
	signal div_number, div_dividend, div_result: STD_LOGIC_VECTOR((SIZE - 1) downto 0);
	--ALU fsm = controlling logic
	--signal calc_data, calc_data2, calc_result: SIGNED((SIZE-1) downto 0);
	--signal calc_operator, calc_status: STD_LOGIC_VECTOR(1 downto 0);
	--signal calc_start, calc_ﬁnished:	STD_LOGIC := '0';
begin
    
    alu_div_inst: alu_div_ent
	 generic map(
	 	SIZE => SIZE
	 )
	 port map
	 ( 
		 sys_clk	=> sys_clk,
		 sys_res_n => sys_res_n,
		 div_en	=> div_en,
		 number  => div_number,
		 dividend => div_dividend,
		 result	=> div_result,
		 division_by_zero 	=> division_by_zero,
		 calc_finished 		=> div_calc_finished
	 ); 


     alu_logic_inst : alu_fsm
	  generic map
	  (
	    RESET_VALUE => RESET_VALUE,
	    SIZE 	=> SIZE
	  )
	  port map
	  (
	    sys_clk	=> sys_clk,
	    sys_res_n	=> sys_res_n,

		calc_data	=> calc_data,
		calc_data2	=> calc_data2,
		calc_operator	=> calc_operator,
		calc_start	=> calc_start,
		calc_finished	=> calc_finished,
		calc_result	=> calc_result,
		calc_status	=> calc_status,
		
		--Communication to DIV_Module
		div_en	=> div_en,
		division_by_zero	=> division_by_zero,
		div_calc_finished	=> div_calc_finished,
		div_number		=> div_number,
		div_dividend		=> div_dividend,
		div_result		=> div_result
    	);


end architecture struct;
