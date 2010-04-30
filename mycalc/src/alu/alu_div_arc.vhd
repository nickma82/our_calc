

-- @module : alu_div_arc
-- @author : s0726179
-- @date   : Apr 26, 2010
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

div: process(sys_res_n, sys_clk)
    begin
    if sys_res_n = '0' then
        result <= (others => '0');
        rm <= (others => '0');
        sm <= 0;
    elsif rising_edge(sys_clk) then
        if div_en = '1' then
            case sm is
            when 0 =>
            	--initial state
                buf1 <= (others => '0');
                buf2 <= num;
                dbuf <= didend;
                result <= buf2;
                rm <= buf1;
                sm <= sm + 1;
                calc_finished <= internal_calc_done;
            when others =>
                if buf((2 * SIZE - 2) downto (SIZE - 1)) >= dbuf then
                    
                    buf1 <= '0' & (buf((2 * SIZE - 3) downto (SIZE - 1)) - dbuf((SIZE - 2) downto 0));
                    buf2 <= buf2((SIZE - 2) downto 0) & '1';
                    --if sm = SIZE then
                        internal_calc_done <='1';
                    --end if;
                else
                	buf <= buf((2 * SIZE - 2) downto 0) & '0'; --left shift
                end if;
                if sm /= SIZE then --set back sm
                	sm <= sm + 1;
                else
                	sm <= 0;
                	
                end if;
            end case;
        else
        	calc_finished <= '0';
        	internal_calc_done <= '0';
        	sm <=0;
        	rm <= (others => '0');
        end if;
    end if;
end process;

	
	
	

--   next_state : process(div_fsm_state, div_en, sm, internal_calc_done, sys_clk)
--   begin
--     div_fsm_state_next <= div_fsm_state;
--     case div_fsm_state is
--       when RESET =>
--       	if div_en = '1' then
-- 		    div_fsm_state_next <=INIT0; 
-- 		end if;
      
--       when INIT0 =>
--         --elsif to_integer(unsigned(cnt)) = CNT_MAX then
-- 		if sys_clk'EVENT then
-- 		    div_fsm_state_next <=CALC_NEXT;
-- 		end if; 
      
--       when CALC_NEXT =>
--         if internal_calc_done = '1' then
--             div_fsm_state_next <=HANDLE_OUT;
--         end if;
        
--       when HANDLE_OUT =>
--       	--if div_en
--       	if div_en = '0' then
--       	    div_fsm_state_next <= INIT0;
--       	end if;
      
--     end case;
--   end process next_state;
  

  
--  output : process(div_fsm_state, sys_clk)
--   begin
--     case div_fsm_state is
--       when RESET =>
--       	result <= (others => '0');
--         rm <= (others => '0');
--         sm <= 0;
        
--       	calc_finished <= '0';
--         internal_calc_done <= '0';
        
--       when INIT0 =>
--         buf1 <= (others => '0'); --buf1 = 0
-- 		buf2 <= num;			 --buf2 = number
-- 		dbuf <= didend;			 --dbuf = dividend
		
--       when CALC_NEXT =>
--         if buf((2 * SIZE - 2) downto (SIZE - 1)) >= dbuf then
--             buf1 <= '0' & (buf((2 * SIZE - 3) downto (SIZE - 1)) - dbuf((SIZE - 2) downto 0));
--             buf2 <= buf2((SIZE - 2) downto 0) & '1';
--             internal_calc_done <='1';
--         else
--         	buf <= buf((2 * SIZE - 2) downto 0) & '0'; --left shift
--         end if;
--         if sm /= SIZE then --set back sm
--                 	sm <= sm + 1;
--         end if;
        
--       when HANDLE_OUT =>
--         rm <= buf1;
--         result <= buf2;
--         calc_finished <= internal_calc_done;
--     end case;
--   end process output;
  
	
--  sync : process(sys_clk, sys_res_n)
--   begin
--     if sys_res_n = '0' then
--       div_fsm_state <= RESET;
--     elsif rising_edge(sys_clk) then
--       div_fsm_state <= div_fsm_state_next;
--     end if;
--  end process sync;

END alu_div;