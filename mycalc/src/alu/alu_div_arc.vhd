

-- @module : alu_div_arc
-- @author : s0726179
-- @date   : Apr 26, 2010
LIBRARY ieee;
USE ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;
use IEEE.STD_LOGIC_ARITH.all;

ARCHITECTURE alu_div OF alu_div_ent IS

  type DIV_FSM_STATE_TYPE is
    (IDLE0, TIMEOUT0, TIMEOUT1);
  signal div_fsm_state, div_fsm_state_next : DIV_FSM_STATE_TYPE;
	--SIGNAL sub_wire0	: STD_LOGIC ;
	--SIGNAL sub_wire3	: STD_LOGIC_VECTOR (31 DOWNTO 0);

    signal buf: STD_LOGIC_VECTOR((2 * SIZE - 1) downto 0);
    signal dbuf: STD_LOGIC_VECTOR((SIZE - 1) downto 0);
    signal sm: INTEGER range 0 to SIZE;
    signal rm: STD_LOGIC_VECTOR((SIZE - 1) downto 0);
    
    alias buf1 is buf((2 * SIZE - 1) downto SIZE);
    alias buf2 is buf((SIZE - 1) downto 0);
    
    signal internal_calc_done: std_logic := '0';

BEGIN


--port(reset: in STD_LOGIC;
--en: in STD_LOGIC;
--clk: in STD_LOGIC;

--num: in STD_LOGIC_VECTOR((SIZE - 1) downto 0);
--didend: in STD_LOGIC_VECTOR((SIZE - 1) downto 0);
--result: out STD_LOGIC_VECTOR((SIZE - 1) downto 0);
--rm: out STD_LOGIC_VECTOR((SIZE - 1) downto 0)
--);

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
                    if sm = SIZE then
                        internal_calc_done <='1';
                    end if;
                else
                	buf <= buf((2 * SIZE - 2) downto 0) & '0';
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

	
	
	

  next_state : process(div_fsm_state)
  begin
    div_fsm_state_next <= div_fsm_state;
    case div_fsm_state is
      when IDLE0 =>
        --if i = '1' then
        --  div_fsm_state_next <= TIMEOUT0;
        --elsif to_integer(unsigned(cnt)) = CNT_MAX then
        --end if;
        
        div_fsm_state_next <= TIMEOUT0;
      
      when TIMEOUT0 =>
        div_fsm_state_next <= TIMEOUT1;
        
      when TIMEOUT1 =>
      	div_fsm_state_next <= TIMEOUT0;
      
    end case;
  end process next_state;
  
  
  
  
 output : process(div_fsm_state)
  begin
    case div_fsm_state is
      when IDLE0 =>
        division_by_zero <= '0';
      when TIMEOUT0 =>
        division_by_zero <= '1';
      when TIMEOUT1 =>
        division_by_zero <= '1';
    end case;
  end process output;
  
	
 sync : process(sys_clk, sys_res_n)
  begin
    if sys_res_n = '0' then
      div_fsm_state <= IDLE0;
    elsif rising_edge(sys_clk) then
      div_fsm_state <= div_fsm_state_next;
    end if;
 end process sync;

END alu_div;