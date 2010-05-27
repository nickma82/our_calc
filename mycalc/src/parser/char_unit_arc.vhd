-- @module : alu_div_arc
-- @author : s0726179
-- @date   : May 27, 2010
 LIBRARY ieee;
 USE ieee.std_logic_1164.all;
use work.big_pkg.all;
use work.parser_pkg.all;
use ieee.numeric_std.all;

ARCHITECTURE char_unit OF char_unit_ent IS
	
	signal next_ok: STD_LOGIC := '0';
	
  type CHAR_UNIT_STATE_TYPE is
    (RESET, INIT, IDLE0, SEND_CHAR, CHAR_VALID);
  signal charunit_fsm_state, charunit_fsm_state_next : CHAR_UNIT_STATE_TYPE;


BEGIN

next_state : process(charunit_fsm_state, charUnit_en, rb_read_data_rdy, charUnit_get_next, next_ok)
  begin
    charunit_fsm_state_next <= charunit_fsm_state;
    case charunit_fsm_state is
	when RESET =>
		if charUnit_en= '1' then
			charunit_fsm_state_next <= INIT;
		end if;
	when INIT =>
		if rb_read_data_rdy = '1' then
			charunit_fsm_state_next <= IDLE0;
		end if;
	when IDLE0 =>
		if charUnit_en = '0' then
			charunit_fsm_state_next <= RESET;
		elsif charUnit_get_next = '1' then
			charunit_fsm_state_next <= SEND_CHAR;
		end if;
	
	when SEND_CHAR =>
		if next_ok = '1' then
			charunit_fsm_state_next <= CHAR_VALID;
		end if;
	when CHAR_VALID =>
		charunit_fsm_state_next <= IDLE0;
      
    end case;
end process next_state;
  
  
  
  
 output : process(charunit_fsm_state)
  begin
    case charunit_fsm_state is
	when RESET =>
		rb_read_en <= 'L'; --weak low
      		rb_read_lineNr <= 0; 
      		charUnit_next_valid <= '0';
      		next_ok <= '0';
      		
	when INIT =>
		-- ENABLE => Dann RB-Zeile einlesen
		rb_read_en <= '1';
	when IDLE0 =>
		-- warte auf charUnit_get_next
		next_ok <= '0';
		charUnit_next_valid <= '0';
		
	
	when SEND_CHAR =>
		--parsen der einzelnen Chars
		--next_ok <= '1';
		null;
		
	when CHAR_VALID =>
		-- warte auf charUnit_get_next = '0'
		charUnit_next_valid <= '1';

    end case;
  end process output;
  




 sync : process(sys_clk, sys_res_n)
  begin
    if sys_res_n = '0' then
      charunit_fsm_state <= RESET;
    elsif rising_edge(sys_clk) then
      charunit_fsm_state <= charunit_fsm_state_next;
    end if;
 end process sync;

END architecture char_unit;