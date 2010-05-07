-- @module : alu_div_arc
-- @author : s0726179
-- @date   : May 06, 2010

LIBRARY ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; --Enthält auch +,-, ..
use work.big_pkg.all;

ARCHITECTURE alu_fsm OF alu_fsm_ent IS

    type alu_fsm_state_TYPE is
      (RESET, INIT0, CALC, DIV_WAIT, HANDLE_OUT);
    signal alu_fsm_state, alu_fsm_state_next : alu_fsm_state_TYPE;
    --INTERNE Signale
-- 	signal internal_out: CALCSIGNED;
	signal tmp_simulation: SIGNED((SIZEI*2-1) downto 0);
	signal intern_calc_finished: std_logic;
begin


  next_state : process(alu_fsm_state, calc_start, div_en, intern_calc_finished)
  begin
    alu_fsm_state_next <= alu_fsm_state;
    case alu_fsm_state is
      when RESET =>
      		if calc_start = '1' then
		    alu_fsm_state_next <=INIT0; 
		end if; 
      when INIT0 =>
        alu_fsm_state_next <= CALC;
      
      when CALC =>
        	if div_en = '1' then
        		alu_fsm_state_next <= DIV_WAIT;
        	elsif intern_calc_finished = '1' then
        		alu_fsm_state_next <= HANDLE_OUT;
        	end if;
        		
        
      when DIV_WAIT =>
      		if div_calc_finished = '1' then
      			alu_fsm_state_next <= HANDLE_OUT;
      		end if;
      when HANDLE_OUT =>
      		if calc_start = '0' then
      			alu_fsm_state_next <= RESET;
      		end if;
    end case;
    
    if calc_start = '0' then
    	alu_fsm_state_next <= RESET;
    end if;
  end process next_state;
  
  
  
  
 output : process(alu_fsm_state)
 	variable tmp_data1, tmp_data2, double_calcsigned: SIGNED((SIZEI*2-1) downto 0);
 	variable tmp_out_data: CALCSIGNED;
  begin
    case alu_fsm_state is
      when RESET =>
      		calc_result(0) <= '0';
		calc_status <= RESET;
		calc_finished <='0';
		tmp_out_data := (others => '0');
		intern_calc_finished <= '0';
      when INIT0 =>
	      null;
      when CALC =>
        	case calc_operator is
        		when ADDITION =>
        			tmp_data1 := resize(calc_data, SIZE*2);
        			tmp_data2 := resize(calc_data2, SIZE*2);
        			double_calcsigned := (tmp_data1 + tmp_data2);
        			tmp_simulation <= double_calcsigned;
        			
        			if (double_calcsigned > calc_data'high) or
        				(double_calcsigned < calc_data'low) then
        				calc_status <= OVERFLOW;
        				--assert false report "overflow" severity error;
        			else
        				calc_result <= resize(double_calcsigned, calc_result'LENGTH);
        			else if;
        			intern_calc_finished <= '1';
        			
			when SUBTRAKTION =>
				calc_result <= (calc_data - calc_data2);
			when MULTIPLIKATION =>	
				null;
			when DIVISION =>
				null;
				
			-- coverage off
			when others =>
				assert false report
    					"Unknown case" severity error;
    			-- coverage on
		end case;
      when DIV_WAIT =>
		
      when HANDLE_OUT =>
-- 		if calc_result = GOOD then
-- 			calc_result <= tmp_out_data;
	calc_finished <= '1';
    end case;
  end process output;
  
	
 sync : process(sys_clk, sys_res_n)
  begin
    if sys_res_n = '0' then
      alu_fsm_state <= RESET;
    elsif rising_edge(sys_clk) then
      alu_fsm_state <= alu_fsm_state_next;
    end if;
 end process sync;

end architecture alu_fsm;
