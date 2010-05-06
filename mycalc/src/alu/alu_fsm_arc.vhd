-- @module : alu_div_arc
-- @author : s0726179
-- @date   : May 06, 2010

LIBRARY ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; --Enthält auch +,-, ..
use work.big_pkg.all;

ARCHITECTURE alu_fsm OF alu_fsm_ent IS

    type DIV_FSM_STATE_TYPE is
      (RESET, INIT0, CALC_NEXT, HANDLE_OUT);
    signal div_fsm_state, div_fsm_state_next : DIV_FSM_STATE_TYPE;
    
begin

	process(sys_clk)
	begin
		calc_status <= "11";
		calc_finished <= '1';
	end process;

end architecture alu_fsm;
