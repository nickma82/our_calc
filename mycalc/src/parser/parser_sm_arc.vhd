-- @module : alu_div_arc
-- @author : s0726179
-- @date   : Apr 26, 2010

LIBRARY ieee;
USE ieee.std_logic_1164.all;
use work.big_pkg.all;
use work.parser_pkg.all;
use ieee.numeric_std.all;

ARCHITECTURE parser_sm OF parser_sm_ent IS
  signal char_firstOne, digit_firstOne: std_logic;
  
  type PARSER_FSM_STATE_TYPE is
    (IDLE0, PARSE_INIT, DIGIT, DIGIT_CALC, DIGIT_GETNEXT, PARSE_ERROR, OP, CALC, WAIT_CALC_RESULT, SAVE_CALC_RESULT, WRITE_RESULT);
  signal parse_fsm_state, parse_fsm_state_next : PARSER_FSM_STATE_TYPE;
  
  type PARSER_CHAR_STATE_TYPE is
     (IDLE0, CALC_DIGIT, ANALYZE_NEXT, PROCESS_NEXT, CALC_THIS);
  signal char_state: PARSER_CHAR_STATE_TYPE;
  
  type PARSER_INTERNAL_STATE_TYPE is 
	  (RESET, RUNNING, GOOD, TOO_MUCH_OPS, INVALID_OP_SEQUENCE);
  signal parser_internal_status: PARSER_INTERNAL_STATE_TYPE;
  
BEGIN

next_state : process(parse_fsm_state, parse_start, charUnit_next_valid, char_state, calc_finished, parser_internal_status)
  -- charUnit_lastChar_type, charUnit_char_type: (RESET, DIGIT, OP, EOL)
  begin
    parse_fsm_state_next <= parse_fsm_state;
    case parse_fsm_state is
      when IDLE0 =>
      	if parse_start = '1' then
			parse_fsm_state_next <= PARSE_INIT;
      	end if;
            
      when PARSE_INIT =>
		char_firstOne	<= '1';
		digit_firstOne<= '1';
		if parser_internal_status = RUNNING then
			parse_fsm_state_next <= DIGIT_GETNEXT;
		end if;
			
		
      when DIGIT =>
	  if char_state = ANALYZE_NEXT then
		parse_fsm_state_next <= DIGIT_GETNEXT;
	  elsif char_state = CALC_DIGIT then
		parse_fsm_state_next <= DIGIT_CALC;
	  end if;
	  
	  when DIGIT_CALC =>
		if calc_finished = '1' then
		  -- Error Handling
		  if calc_status /= GOOD then
			  parse_fsm_state_next <= PARSE_ERROR;
		  else
			  parse_fsm_state_next <= DIGIT_GETNEXT;
		  end if;
		  
		end if;
      
      when DIGIT_GETNEXT =>
		if charUnit_next_valid = '1' then 
				--Error handling beginnt
			if (charUnit_lastChar_type=OP and charUnit_char_type= EOL) then
				parse_fsm_state_next <= PARSE_ERROR; --E: EOL after operator
			else 	
				char_firstOne <= '0';
				case charUnit_char_type is
					when DIGIT=>  
						digit_firstOne	<= '0';
						parse_fsm_state_next<= DIGIT;
					when OP =>    parse_fsm_state_next<= OP;
					when EOL =>   parse_fsm_state_next<= CALC;
					when others => assert false report "NEXTDIGIT State not supported" severity error;
				end case;
			end if; --Error if end
		end if;
      
      when OP =>		
	      --Error Handling
	      if (char_firstOne='1' and charUnit_op/= SUBTRAKTION) then
		      parse_fsm_state_next <= PARSE_ERROR; --E: first char is not digit and no minus
	      elsif (charUnit_lastChar_type=OP and charUnit_op/= SUBTRAKTION) then
		      --parser_internal_status <= INVALID_OP_SEQUENCE;
		      parse_fsm_state_next   <= PARSE_ERROR; --E: Second op in series isn't a minus
	      end if;
	      
	      --Process Handling
	      if char_state = ANALYZE_NEXT then
		    parse_fsm_state_next <= DIGIT_GETNEXT;
	      elsif char_state = CALC_THIS then
		    parse_fsm_state_next <= CALC;
	      end if;
    
      when CALC =>
		parse_fsm_state_next <= WAIT_CALC_RESULT;
	
      when PARSE_ERROR =>
		parse_fsm_state_next <= WRITE_RESULT;
      
      when WAIT_CALC_RESULT =>
		if calc_finished = '1' then
			-- Error Handling
			if calc_status /= GOOD then
				parse_fsm_state_next <= PARSE_ERROR;
			else
				parse_fsm_state_next <= OP;
			end if;
			
		end if;
	  
	  when SAVE_CALC_RESULT =>
		null;
	
      when WRITE_RESULT =>
	  if parse_start= '0' then
	      parse_fsm_state_next <= IDLE0;
	  end if;
      
      when others => 
		--coverage off
		assert false report "NEXT State logic- State not supported" severity error;
		--coverage on
    end case;
  end process next_state;
  
  
  
  
 output : process(parse_fsm_state)
	subtype STAGE_POS_TYPE is INTEGER range 0 TO (STAGES_TOP-1);
	
	variable calc_buff: calc_buffs_TYPE;
	variable op_buff:		alu_ops_buff_TYPE;
	
	variable operator_cnt, calc_stage, operators_serial:	INTEGER := 0;
	variable intern_op_pos, intern_digit_pos: 	STAGE_POS_TYPE;
	variable intern_digit_neg:	STD_LOGIC;
	variable intern_alu_op:		alu_operator_TYPE;
  begin
    case parse_fsm_state is
      when IDLE0 =>
		-- RESET STATE
		charUnit_en <='0'; --Disable next digit unit
		charUnit_get_next <='0';
			
		operator_cnt	 := 0;
		calc_stage	   	 := 0;
		operators_serial := 0;
		intern_op_pos  := 0;
		intern_digit_pos := 0;
		intern_digit_neg :='0';
		intern_alu_op 	:= NOP; 
		
		char_state		<= IDLE0;
		parser_internal_status<= RESET;
		
      
      when PARSE_INIT =>
		-- PARSER INIT
		charUnit_en	<= '1' ;
		for i in (STAGES_TOP-1) downto 0 loop
			calc_buff(i) := to_signed(0, SIZEI);
			op_buff(i)		:= NOP;
		end loop;
		
		parser_internal_status<= RUNNING;
		char_state		<= ANALYZE_NEXT;
		
	  
	  
      when DIGIT =>
		charUnit_get_next <= '0';
		-- catch information about next char and save them to char_info* std_logic!!!!!!!!!!!!!
		calc_data <= calc_buff(intern_digit_pos);
		calc_data2<= to_signed(10, SIZEI);
		calc_operator<= MULTIPLIKATION;
		char_state <= CALC_DIGIT;
		
	 
	  when DIGIT_CALC =>
		calc_start <= '1';
		
      
      when DIGIT_GETNEXT =>
		-- --Moved to next_state logic
		--if parse_fsm_state'LAST_ACTIVE /= PARSE_INIT then
		--	  char_firstOne	<= '0';
		--end if;
		charUnit_get_next <= '1';
		char_state <= PROCESS_NEXT;
	  
      when OP =>
		charUnit_get_next <= '0';
		operator_cnt := operator_cnt+1;
		if operator_cnt>3 then
			parser_internal_status <= TOO_MUCH_OPS;
		end if;
	  
	  
      when CALC =>
		operator_cnt := operator_cnt-1;
		assert (operator_cnt>=0 and operator_cnt<3)
			--coverage off
			report "invalid operator_cnt" severity error;
			--coverage on
		assert calc_stage<2
			--coverage off
			report "calc stage size exceeded" severity error;
			--coverage on
	  
      when PARSE_ERROR =>
		null;
      
      when WAIT_CALC_RESULT =>
		null;
	  
	  when SAVE_CALC_RESULT =>
		null;
      
      when WRITE_RESULT =>
		null;
		
	  when others => 
		--coverage off
		assert false report "OUTPUT logic- State not supported" severity error;
		--coverage on
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

END parser_sm;