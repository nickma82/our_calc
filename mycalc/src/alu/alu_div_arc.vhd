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
      (RESET, INIT0, CALC_NEXT, HANDLE_OUT);
    signal div_fsm_state, div_fsm_state_next : DIV_FSM_STATE_TYPE;
  
    signal buf: STD_LOGIC_VECTOR((2 * SIZE - 1) downto 0);
    signal dbuf: STD_LOGIC_VECTOR((SIZE - 1) downto 0);
    signal sm: INTEGER range 0 to SIZE;
    signal rm: STD_LOGIC_VECTOR((SIZE - 1) downto 0);
    
    alias buf1 is buf((2 * SIZE - 1) downto SIZE);
    alias buf2 is buf((SIZE - 1) downto 0);
    
    signal internal_calc_done: std_logic := '0';

BEGIN

next_state : process(div_fsm_state, div_en, internal_calc_done, sys_clk)
  begin
    div_fsm_state_next <= div_fsm_state;
    case div_fsm_state is
      when RESET =>
      	if div_en = '1' then
		    div_fsm_state_next <=INIT0; 
		end if; 
      when INIT0 =>
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
  

  
output : process(div_fsm_state, sys_clk)
 	variable internal_calc_status: alu_calc_error_TYPE;
  begin
    case div_fsm_state is
      when RESET =>
      	result <= (others => '0');
        rm <= (others => '0');
        sm <= 0;
        
      	calc_finished <= '0';
        internal_calc_done <= '0';
        calc_status <= RESET;
        internal_calc_status :=RESET;
      when INIT0 =>
      		buf1 <= (others => '0'); --buf1 = 0
		buf2 <= number;		 --buf2 = number
		dbuf <= dividend;	 --dbuf = dividend
	if dividend > number then
      	    --Dividend > Nummer handling 
      	    buf2 <= (others => '0');
      	    internal_calc_done <='1';
      	elsif unsigned(dividend) = 0 then
      	    --Division / 0 exception
      	    internal_calc_status := DIV_ZERO;
      	    buf2 <= (others => '0');
      	    internal_calc_done <= '1';
      	end if;
      	
      		
      when CALC_NEXT =>
      	if internal_calc_done = '0' then
            if buf((2 * SIZE - 2) downto (SIZE - 1)) >= dbuf then
                buf1 <= '0' & (buf((2 * SIZE - 3) downto (SIZE - 1)) - dbuf((SIZE - 2) downto 0));
                buf2 <= buf2((SIZE - 2) downto 0) & '1';
            else
            	buf <= buf((2 * SIZE - 2) downto 0) & '0'; --left shift
            end if;
            if sm /= SIZE-1 then --set back sm
                sm <= sm + 1;
            else
                sm <= 0;
                internal_calc_done <= '1';
            end if;
        end if;
      when HANDLE_OUT =>
        rm <= buf1;
        result <= buf2;
        if internal_calc_status = RESET then
        	internal_calc_status := GOOD;
        end if;
        
        calc_status  <=  internal_calc_status;
        calc_finished <= internal_calc_done;
    end case;
  end process output;
  
	
 sync : process(sys_clk, sys_res_n)
  begin
    if sys_res_n = '0' then
      div_fsm_state <= RESET;
    elsif rising_edge(sys_clk) then
      div_fsm_state <= div_fsm_state_next;
    end if;
 end process sync;

END alu_div;
