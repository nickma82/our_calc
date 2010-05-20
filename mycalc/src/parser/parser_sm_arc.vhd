-- @module : alu_div_arc
-- @author : s0726179
-- @date   : Apr 26, 2010

LIBRARY ieee;
USE ieee.std_logic_1164.all;
use work.big_pkg.all;
use work.parser_pkg.all;

ARCHITECTURE parser_sm OF parser_sm_ent IS

  type PARSER_FSM_STATE_TYPE is
    (IDLE0, REQ_DATA, PARSE_INIT, DIGIT, DIGIT_GETNEXT, PARSE_ERROR, OP, CALC, WAIT_CALC_RESULT, WRITE_RESULT);
  
  --Parser states
  signal parse_fsm_state, parse_fsm_state_next : PARSER_FSM_STATE_TYPE;
  
  --Parser Buffer
  signal inBuff, calc1Buff, calc0Buff: CALCSIGNED;
  signal op0, op1: alu_operator_TYPE;
  
  --Parser logic
  signal char_analyze_next, char_process_next: std_logic;
  --Character information Signals
  signal charNfo_noDigitYet: std_logic; 
  signal charNfo_firstOp: std_logic;
  signal digit_isNegative, digit_noneYet: std_logic
  
  

BEGIN

next_state : process(parse_fsm_state, ps_start, rb_read_data_rdy, char_process_next, digit_next_valid)
  -- lastChar_type, char_type: (RESET, ISDIGIT, ISOP, ISEOL)
  begin
    parse_fsm_state_next <= parse_fsm_state;
    case parse_fsm_state is
      when IDLE0 =>
      	if ps_start = '1' then
		parse_fsm_state_next <= REQ_DATA;
      	end if;
      
      when REQ_DATA =>
      	if rb_read_data_rdy = '1' then
      	 	parse_fsm_state_next <= PARSE_INIT; 
      	end if;
      	
      
      when PARSE_INIT =>
      	parse_fsm_state_next <= DIGIT;
      
      when DIGIT =>
      	if char_process_next = '1' then
      		-- Error in case of first digit == Operator
		if char_firstChar='1' and charNfo_isOp ='0' then
			parse_fsm_state_next <= PARSE_ERROR;
		end if;
	end if;
      
      when DIGIT_GETNEXT =>
      	if digit_next_valid = '1' then 
      		parse_fsm_state_next <= DIGIT
      	end if;
      
      when PARSE_ERROR =>
	null;
      
      when OP =>
	null;
      
      when CALC =>
	null;
      
      when WAIT_CALC_RESUL =>
	null;
      
      when WRITE_RESULT =>
	null;
      
      
    end case;
  end process next_state;
  
  
  
  
 output : process(parse_fsm_state)
  begin
      when IDLE0 =>
      	-- RESET STATE
      	digit_en <= '0'; --Disable next digit unit
      	digit_get_next <='0';
      	
      when REQ_DATA =>
      	-- REQUESTING DATA FROM RB
      	null;
      
      when PARSE_INIT =>
      	-- PARSER INIT
      	char_firstChar <= '1';
      
      when DIGIT =>
      	digit_get_next <= '0';
      	-- catch information about next char and save them to char_info* std_logic!!!!!!!!!!!!!
      	null;
      
      when DIGIT_GETNEXT =>
      	digit_get_next <= '1';
	null;
	
      when PARSE_ERROR =>
	null;
      
      when OP =>
	null;
      
      when CALC =>
	null;
      
      when WAIT_CALC_RESUL =>
	null;
      
      when WRITE_RESULT =>
	null;
	
    end case;
  end process output;
  
	
 sync : process(sys_clk, sys_res_n)
  begin
    if sys_res_n = '0' then
      parse_fsm_state <= IDLE0;
    elsif rising_edge(sys_clk) then
      parse_fsm_state <= parse_fsm_state_next;
    end if;
 end process sync;

END alu_div;