-- @module : alu_div_arc
-- @author : s0726179
-- @date   : Apr 26, 2010

LIBRARY ieee;
USE ieee.std_logic_1164.all;
use work.big_pkg.all;
use work.parser_pkg.all;

ARCHITECTURE parser_sm OF parser_sm_ent IS

  
  --Parser Buffer
  signal inBuff, calc1Buff, calc0Buff: CALCSIGNED;
  signal op0, op1: alu_operator_TYPE;
  
  signal char_firstOne, digit_firstOne: std_logic;
  signal intern_digit_neg:	std_logic := '0';
  
  signal intern_alu_op: 	alu_operator_TYPE;
  
  type PARSER_FSM_STATE_TYPE is
    (IDLE0, PARSE_INIT, DIGIT, DIGIT_GETNEXT, PARSE_ERROR, OP, CALC, WAIT_CALC_RESULT, WRITE_RESULT);
  signal parse_fsm_state, parse_fsm_state_next : PARSER_FSM_STATE_TYPE;
  
  type PARSER_CHAR_STATE_TYPE is
     (IDLE, ANALYZE_NEXT, PROCESS_NEXT);
  signal char_state: PARSER_CHAR_STATE_TYPE;
  
  type PARSER_INTERNAL_STATE_TYPE is 
	  (RESET, GOOD, TOO_MUCH_OPS);
  signal parser_internal_status: PARSER_INTERNAL_STATE_TYPE;
  
BEGIN

next_state : process(parse_fsm_state, parse_start, \
						charUni_next_valid, char_state)
  -- charUnit_lastChar_type, charUnit_char_type: (RESET, DIGIT, OP, EOL)
  begin
    parse_fsm_state_next <= parse_fsm_state;
    case parse_fsm_state is
      when IDLE0 =>
      	if parse_start = '1' then
			parse_fsm_state_next <= PARSE_INIT;
      	end if;
            
      when PARSE_INIT =>
      	parse_fsm_state_next <= DIGIT_GETNEXT;
        
		
      when DIGIT =>
      	if char_state = ANALYZE_NEXT then
			parse_fsm_state_next <= DIGIT_GETNEXT;
		elsif char_state = PROCESS_NEXT then
			
			
		end if;
      
      when DIGIT_GETNEXT =>
      	if charUni_next_valid = '1' then 
			--Error handling beginnt
      		if charUnit_lastChar_type=OP and charUnit_char_type= EOL then
				parse_fsm_state_next <= PARSE_ERROR; --E: EOL after operator
			else 
				case charUnit_char_type is
					when DIGIT=>  parse_fsm_state_next<= DIGIT;
					when OP =>    parse_fsm_state_next<= OP;
					when EOL =>   parse_fsm_state_next<= CALC;
					when others => assert false report "NEXTDIGIT State not supported" severity error;
				end case;
			end if; --Error if end
      	end if;
      
      when OP =>		
		--Error Handling
		-- Error in case of first char == (Operator!= minus)
		if char_firstOne='1' and charUnit_op != SUBTRAKTION then
			parse_fsm_state_next <= PARSE_ERROR; --E: first char is not digit and no minus
		elsif charUnit_lastChar_type=OP and charUnit_op!= SUBTRAKTION then
		    parse_fsm_state_next <= PARSE_ERROR; --E: Second op in series isn't a minus
		end if;
		
      
      when CALC =>
		-- Error Handling
		if calc_finished = '1' then
			if calc_status != GOOD then
				parse_fsm_state_next <= PARSE_ERROR;
			end if;
		end if;
	
	  when PARSE_ERROR =>
		null;
      
      when WAIT_CALC_RESUL =>
		null;
      
      when WRITE_RESULT =>
		null;
      
      when others => assert false report "NEXT State logic- State not supported" severity error;
    end case;
  end process next_state;
  
  
  
  
 output : process(parse_fsm_state)
	variable operator_cnt, calc_stage:		INTEGER := 0;
  begin
	case parse_fsm_state is
      when IDLE0 =>
      	-- RESET STATE
      	charUnit_en <='0'; --Disable next digit unit
      	charUnit_get_next <='0';
		--@TODO init op
		
		operator_cnt	:= 0;
		calc_stage		:= 0;
		char_firstOne	<= '1'
		digit_firstOne	<= '1'
		intern_digit_neg <= '0';
		
		char_state		<= IDLE;
		intern_alu_op 	<= NOP; 
		parser_internal_status <= RESET;
      
      when PARSE_INIT =>
      	-- PARSER INIT
      	char_firstOne <= '1';
		charUnit_en <= '1';
        parser_internal_status <= GOOD;
	  
	  
      when DIGIT =>
      	charUnit_get_next <= '0';
      	-- catch information about next char and save them to char_info* std_logic!!!!!!!!!!!!!
      	null;
      
      when DIGIT_GETNEXT =>
      	if parse_fsm_state'LAST_ACTIVE != PARSE_INIT then
			char_firstOne	<= '0';
		end if;
		charUnit_get_next <= '1';
		char_state = PROCESS_NEXT;
		
      when OP =>
		charUnit_get_next <= '0';
		operator_cnt := operator_cnt+1;
		if operator_cnt>2 then
			parser_internal_status <= TOO_MUCH_OPS;
		end if;
      when CALC =>
		operator_cnt := operator_cnt-1;
		assert operator_cnt>=0 and operator_cnt<2
			report "invalid operator_cnt" severity error;
		assert calc_stage<2
			report "calc stage size exceeded" severity error;
		
	
	  when PARSE_ERROR =>
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