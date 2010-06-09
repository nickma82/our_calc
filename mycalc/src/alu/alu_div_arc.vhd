-- @module : alu_div_arc
-- @author : s0726179
-- @date   : Apr 26, 2010
-- 			Divisionsmodul für UINTs

LIBRARY ieee;
USE ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;
use IEEE.STD_LOGIC_ARITH.all;


ARCHITECTURE alu_div OF alu_div_ent IS

    type DIV_FSM_STATE_TYPE is
      (RESET, PRE_INIT, INIT, CALC_NEXT, HANDLE_OUT);
    signal div_fsm_state, div_fsm_state_next : DIV_FSM_STATE_TYPE;
  
    signal buf, buf_next: STD_LOGIC_VECTOR((2 * SIZE - 1) downto 0);
    signal dbuf, dbuf_next: STD_LOGIC_VECTOR((SIZE - 1) downto 0);
    signal sm, sm_next: INTEGER range 0 to SIZE;
    signal rm_var, rm_var_next: STD_LOGIC_VECTOR((SIZE - 1) downto 0);
    
    alias buf1 is buf((2 * SIZE - 1) downto SIZE);
    alias buf2 is buf((SIZE - 1) downto 0);
    alias buf1_next is buf_next((2 * SIZE - 1) downto SIZE);
    alias buf2_next is buf_next((SIZE - 1) downto 0);
    
    signal internal_calc_done, internal_calc_done_next: std_logic := '0';
    
    --signal result_var_next: STD_LOGIC_VECTOR((SIZE - 1) downto 0);
    signal calc_finished_var_next, calc_finished_var: STD_LOGIC ;
    signal calc_status_var_next, calc_status_var: alu_calc_error_TYPE;
    signal result_var, result_var_next: STD_LOGIC_VECTOR((SIZE - 1) downto 0);
BEGIN

next_state : process(div_fsm_state, div_en, internal_calc_done, sys_clk)
  begin
    div_fsm_state_next <= div_fsm_state;
    case div_fsm_state is
      when RESET =>
      	if div_en = '1' then
		    div_fsm_state_next <=PRE_INIT; 
		end if; 
      when PRE_INIT =>
      		div_fsm_state_next <=INIT;
      when INIT =>
		--elsif to_integer(unsigned(cnt)) = CNT_MAX then
		if internal_calc_done = '1' then
		div_fsm_state_next <=HANDLE_OUT;
		else 
		div_fsm_state_next <=CALC_NEXT;
		end if;
		
      when CALC_NEXT =>
        if internal_calc_done = '1' then
            div_fsm_state_next <=HANDLE_OUT;
        end if;
        
      when HANDLE_OUT =>
      	--if div_en
      	if div_en = '0' then
      	    div_fsm_state_next <= RESET;
      	end if;
      
    end case;
  end process next_state;
  

  --result, sm, calc_finished, internal_calc_done, calc_status, calc_status_var_next, buf, dbuf
output : process(div_fsm_state, sys_clk, number, dividend, internal_calc_done, buf, dbuf, sm, rm_var, calc_finished_var, calc_status_var, result_var)
  begin
   	sm_next <= sm;
   	internal_calc_done_next <= internal_calc_done;
   	buf_next <= buf;
   	dbuf_next <= dbuf;
   	rm_var_next <= rm_var;
   	calc_finished_var_next <= calc_finished_var; 
   	calc_status_var_next <= calc_status_var;
   	result_var_next<= result_var;
    case div_fsm_state is
      when RESET =>
      	--result_var_next <= (others => '0');
        rm_var_next <= (others => '0');
        sm_next <= 0;
        
        
      	calc_finished_var_next <= '0';
        internal_calc_done_next <= '0';
        calc_status_var_next <= RESET;
        result_var_next<= (others => '0');
      when PRE_INIT =>
      		buf1_next <= (others => '0'); --buf1 = 0
		dbuf_next <= dividend;	 --dbuf = dividend
		calc_status_var_next <= GOOD;
	if dividend > number then
      	    --Dividend > Nummer handling 
      	    buf2_next <= (others => '0');
      	    internal_calc_done_next <='1';
      	elsif unsigned(dividend) = 0 then
      	    --Division / 0 exception
      	    calc_status_var_next <= DIV_ZERO;
      	    buf2_next <= (others => '0');
      	    internal_calc_done_next <= '1';
	else 
	    buf2_next <= number;		 --buf2 = number
      	end if;
      	
      when INIT =>
      	 null;
      		
      when CALC_NEXT =>
      	if internal_calc_done = '0' then
            if buf((2 * SIZE - 2) downto (SIZE - 1)) >= dbuf then
                buf1_next <= '0' & (buf((2 * SIZE - 3) downto (SIZE - 1)) - dbuf((SIZE - 2) downto 0));
                buf2_next <= buf2((SIZE - 2) downto 0) & '1';
            else
            	buf_next <= buf((2 * SIZE - 2) downto 0) & '0'; --left shift
            end if;
            
            if sm /= SIZE-1 then --set back sm
                sm_next <= sm + 1;
            else
                sm_next <= 0;
                internal_calc_done_next <= '1';
            end if;
        end if;
       
      when HANDLE_OUT =>
        rm_var_next <= buf1;
        result_var_next <= buf2;
        
       -- calc_status_var_next  <=  calc_status_var_next;
        calc_finished_var_next <= internal_calc_done;
    end case;
  end process output;
  
	
 sync : process(sys_clk, sys_res_n)
  begin
    if sys_res_n = '0' then
      div_fsm_state <= RESET;
    elsif rising_edge(sys_clk) then
      div_fsm_state <= div_fsm_state_next;
	
	result<= result_var_next;
	result_var<= result_var_next;
	sm <= sm_next;
	calc_finished <= calc_finished_var_next;
	calc_finished_var <= calc_finished_var_next;
	internal_calc_done <= internal_calc_done_next;
	calc_status <= calc_status_var_next;
	calc_status_var <= calc_status_var_next;
	buf <= buf_next;
	dbuf <= dbuf_next;
	rm_var <= rm_var_next;
	
    end if;
 end process sync;

END alu_div;
