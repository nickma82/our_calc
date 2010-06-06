-- @module : alu_div_arc
-- @author : s0726179
-- @date   : May 06, 2010

LIBRARY ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; --Enthält auch +,-, ..
use work.big_pkg.all;

ARCHITECTURE alu_fsm OF alu_fsm_ent IS

    type alu_fsm_state_TYPE is
      (RESET, INIT0, PRE_CALC, CALC, DIV_WAIT, HANDLE_OUT);
    signal alu_fsm_state, alu_fsm_state_next : alu_fsm_state_TYPE;
    --INTERNE Signale
-- 	signal internal_out: CALCSIGNED;
	signal intern_calc_finished, intern_calc_finished_next: std_logic;
	signal intern_wait_div, intern_wait_div_next: std_logic;
	
	signal calc_status_var, calc_status_var_next: 	alu_calc_error_TYPE;
	signal calc_finished_var, calc_finished_var_next: STD_LOGIC;
	
	signal intern_div_neg_sig_next, intern_div_neg_sig: boolean;
	signal div_en_var, div_en_var_next: STD_LOGIC;
	signal calc_result_var, calc_result_var_next: CALCSIGNED;
	signal div_number_var, div_number_var_next:	STD_LOGIC_VECTOR((SIZE - 1) downto 0);
	signal div_dividend_var, div_dividend_var_next: STD_LOGIC_VECTOR((SIZE - 1) downto 0);
begin


  next_state : process(alu_fsm_state, calc_start, intern_wait_div, intern_calc_finished, div_calc_finished)
  begin
    alu_fsm_state_next <= alu_fsm_state;
    case alu_fsm_state is
      when RESET =>
      		if calc_start = '1' then
		    alu_fsm_state_next <=INIT0; 
		end if; 
      when INIT0 =>
        alu_fsm_state_next <= PRE_CALC;
        
      when PRE_CALC=>
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
  
  
  
  
 output : process(alu_fsm_state, div_calc_finished, calc_operator, calc_data, calc_data2, div_calc_status,div_dividend_var, div_number_var, calc_result_var, div_en_var, intern_div_neg_sig, intern_calc_finished, calc_status_var, calc_finished_var, div_result, intern_wait_div, intern_div_neg_sig_next)
 	variable tmp_data1, tmp_data2, double_calcsigned: SIGNED((SIZEI*2-1) downto 0);
 	
  begin
  	
  	intern_wait_div_next <= intern_wait_div;
  	div_dividend_var_next<= div_dividend_var; 
  	div_number_var_next<= div_number_var;
  	calc_result_var_next<= calc_result_var; 
  	tmp_data1:= (others=>'0');
  	tmp_data2:= (others=>'0');
  	double_calcsigned:= (others=>'0');
  	div_en_var_next<= div_en_var; 
  	intern_div_neg_sig_next<= intern_div_neg_sig;
  	intern_calc_finished_next<= intern_calc_finished;
  	calc_status_var_next<= calc_status_var;
  	calc_finished_var_next <= calc_finished_var;
    case alu_fsm_state is
      when RESET =>
		calc_status_var_next <= RESET;
		calc_finished_var_next <='0';
		intern_calc_finished_next <= '0';
		intern_wait_div_next <= '0';
		intern_div_neg_sig_next <= false;
		
		--port resets
		div_en_var_next <= '0';
      when INIT0 =>
	      null;
      
      when PRE_CALC =>
	if calc_operator= DIVISION then
		-- Setze negativ flag
		if (calc_data<0 and calc_data2<0) then
			--intern_div_neg_sig_next <= resize( intern_div_neg_sig*to_signed(-1, 2), intern_div_neg_sig'LENGTH );
			intern_div_neg_sig_next<= false;
		elsif calc_data<0 then
			intern_div_neg_sig_next<= true;
		elsif calc_data2<0 then
			intern_div_neg_sig_next<= true;
		end if;
		
		--Invertiere
		if calc_data<0 then
			--calc_data: SIGNED((SIZEI-1) downto 0);
			div_number_var_next <= std_logic_vector( resize(calc_data* to_signed(-1 , calc_data'LENGTH ), calc_data'LENGTH ) );
		else
			div_number_var_next<= std_logic_vector( calc_data);
		end if;
		
		if calc_data2<0 then
			--intern_div_neg_sig_next <= resize(intern_div_neg_sig*to_signed(-1, 2), intern_div_neg_sig'LENGTH );
			div_dividend_var_next<= std_logic_vector( resize(calc_data2*to_signed(-1 , calc_data2'LENGTH ), calc_data2'LENGTH ));
		else
			div_dividend_var_next<= std_logic_vector(calc_data2);
		end if;
	end if;
      		
      		
      		
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
					
					--Checks ob Range VALID
					if (double_calcsigned > CALCMAX) or
						(double_calcsigned < CALCMIN ) then
						calc_status_var_next <= OVERFLOW;
						--assert false report "overflow" severity error;
					else
						calc_result_var_next <= resize(double_calcsigned, calc_result'LENGTH);
						calc_status_var_next <= GOOD;
					end if;
					intern_calc_finished_next <= '1';
        			
			when DIVISION =>
				--------------------------------------------------------------------------------------------
				-- Speichert Vorzeichen, wandelt in positive Zahlen und wandelt danach in std_logic_vector's
				--------------------------------------------------------------------------------------------
				
				
				
-- 				if calc_data2>=0 then
-- 					div_dividend_var_next<= std_logic_vector(calc_data2);
-- 				end if;
				intern_wait_div_next <= '1';
			-- coverage off
			when NOP =>
				double_calcsigned := tmp_data1;
				calc_status_var_next <= GOOD;
				intern_calc_finished_next <= '1';
			when others =>
				assert false report
    					"Case not supported" severity error;
    			-- coverage on
		end case;
		
		
		
      when DIV_WAIT =>
		div_en_var_next <= '1';
		if div_calc_finished = '1' then
			----------------------------------------
			-- Restore Vorzeichen, wandeln in signed
			----------------------------------------
			calc_status_var_next <= div_calc_status;
			if intern_div_neg_sig_next then
				--std_logic_vector( resize(calc_data* to_signed(-1 , calc_data'LENGTH ), calc_data'LENGTH ) )
				calc_result_var_next <= resize( signed(div_result)* to_signed(-1 , div_result'LENGTH ), calc_result'LENGTH);
			else
				calc_result_var_next<= signed(div_result);
			end if;
			
			intern_calc_finished_next <= '1';
		end if;
		
      when HANDLE_OUT =>
		calc_finished_var_next <= '1';
    end case;
  end process output;
  
	
 sync : process(sys_clk, sys_res_n)
  begin
    if sys_res_n = '0' then
      alu_fsm_state <= RESET;
    elsif rising_edge(sys_clk) then
      alu_fsm_state <= alu_fsm_state_next;
      
      div_dividend<= div_dividend_var_next;
      div_dividend_var<= div_dividend_var_next;
      div_number<= div_number_var_next;
      div_number_var<= div_number_var_next;
      calc_result<= calc_result_var_next;
      calc_result_var<= calc_result_var_next;
      div_en<=  div_en_var_next;
      div_en_var<=  div_en_var_next;
      intern_div_neg_sig <= intern_div_neg_sig_next;
      intern_wait_div <= intern_wait_div_next;
      intern_calc_finished <= intern_calc_finished_next;
      calc_finished    <= calc_finished_var_next;
      calc_finished_var<= calc_finished_var_next;
      calc_status    <=calc_status_var_next;
      calc_status_var<= calc_status_var_next;
    end if;
 end process sync;

end architecture alu_fsm;
