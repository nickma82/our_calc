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
	signal intern_calc_finished, intern_wait_div: std_logic;
begin


  next_state : process(alu_fsm_state, calc_start, intern_wait_div, intern_calc_finished)
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
        	if intern_wait_div = '1' then
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
  
  
  
  
 output : process(alu_fsm_state, div_calc_finished)
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
		div_en <= '0';
		intern_wait_div <= '0';
      when INIT0 =>
	      null;
      when CALC =>
        	case calc_operator is
        		when ADDITION | SUBTRAKTION | MULTIPLIKATION =>
        			tmp_data1 := resize(calc_data, SIZE*2);
        			tmp_data2 := resize(calc_data2, SIZE*2);
        			
					if calc_operator = ADDITION then
						double_calcsigned := (tmp_data1 + tmp_data2);
					elsif calc_operator = SUBTRAKTION then
						double_calcsigned := (tmp_data1 - tmp_data2);
					elsif calc_operator = MULTIPLIKATION then
						double_calcsigned := (calc_data * calc_data2);
					end if;
        			tmp_simulation <= double_calcsigned;
					
					--Checks
					if (double_calcsigned > calc_data'high) or
						(double_calcsigned < calc_data'low) then  --######################UNTERGRENZE stimmt nicht
						calc_status <= OVERFLOW;
						--assert false report "overflow" severity error;
					else
						calc_result <= resize(double_calcsigned, calc_result'LENGTH);
						calc_status <= GOOD;
					end if;
					intern_calc_finished <= '1';
        			
				when DIVISION =>
					div_number <= std_logic_vector(calc_data);
					div_dividend<= std_logic_vector(calc_data2);
					intern_wait_div <= '1';
			-- coverage off
			when others =>
				assert false report
    					"Case not supported" severity error;
    			-- coverage on
		end case;
		
      when DIV_WAIT =>
		div_en <= '1';
		if div_calc_finished = '1' then
			---@todo CHECKS ob erg. valid ist gehören hier rein, 
			---			negativität wieder ändern
			calc_result <= signed(div_result);
			intern_calc_finished <= '1';
		end if;
		
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
