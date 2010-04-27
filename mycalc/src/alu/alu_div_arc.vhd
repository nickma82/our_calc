

-- @module : alu_div_arc
-- @author : s0726179
-- @date   : Apr 26, 2010
 LIBRARY ieee;
 USE ieee.std_logic_1164.all;

ARCHITECTURE alu_div OF alu_div_ent IS

  type DIV_FSM_STATE_TYPE is
    (IDLE0, TIMEOUT0, TIMEOUT1);
  signal div_fsm_state, div_fsm_state_next : DIV_FSM_STATE_TYPE;
	--SIGNAL sub_wire0	: STD_LOGIC ;
	--SIGNAL sub_wire3	: STD_LOGIC_VECTOR (31 DOWNTO 0);

BEGIN
	
	
	
	
	
	

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