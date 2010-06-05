-- @module : alu_div_arc
-- @author : s0726179
-- @date   : Apr 26, 2010

LIBRARY ieee;
USE ieee.std_logic_1164.all;
use work.big_pkg.all;
use work.parser_pkg.all;
use ieee.numeric_std.all;

ARCHITECTURE parser_sm OF parser_sm_ent IS
signal char_firstOne, char_firstOne_next: std_logic;
signal global_digit_neg_next, global_digit_neg:	STD_LOGIC;
signal intern_b2bcd_data_neg, intern_b2bcd_data_neg_next: boolean:= false;
  
type PARSER_FSM_STATE_TYPE is
	(IDLE0, PARSE_INIT, DIGIT, DIGIT_CALC_STAGE1, DIGIT_PREPARE_STAGE2, DIGIT_CALC_STAGE2, DIGIT_SAVE_CALCED, DIGIT_GETNEXT, PARSE_ERROR, OP, OP_JMP, PRE_INVERT_SECOND_DATA, INVERT_SECOND_DATA, WAIT_INVERTATION_SECOND_DATA, HANDLE_INVERTATION, CALC, WAIT_CALC_RESULT, SAVE_CALC_RESULT, PRE_PREPARE_RESULT, PREPARE_RESULT, WAITFOR_INVERTED_RESULT, PUSH_INVERTED_RESULT, WAIT_RESULT, RESULT_STABLE);
signal parse_fsm_state, parse_fsm_state_next : PARSER_FSM_STATE_TYPE;
  
type PARSER_CHAR_STATE_TYPE is
	(IDLE0, CALC_DIGIT, ANALYZE_NEXT, PROCESS_NEXT, CALC_THIS);
signal char_state, char_state_next: PARSER_CHAR_STATE_TYPE;
  
type PARSER_INTERNAL_STATE_TYPE is 
	(RESET, RUNNING, GOOD, TOO_MUCH_OPS, INVALID_OP_SEQUENCE);
signal parser_internal_status, parser_internal_status_next: PARSER_INTERNAL_STATE_TYPE;
  
  
signal charUnit_en_var, charUnit_en_var_next, charUnit_get_next_var, charUnit_get_next_var_next: STD_LOGIC :='0';
signal operators_serial, operators_serial_next		: INTEGER := 0;
signal intern_buff_stage_pos, intern_buff_stage_pos_next: STAGE_POS_TYPE;
signal pars_state, pars_state_next			: parser_status_TYPE := PRESET;
signal calc_buff, calc_buff_next			: calc_buffs_TYPE;
signal op_buff, op_buff_next				: alu_ops_buff_TYPE;
signal data1, data1_next				: CALCSIGNED;
signal data2, data2_next				: CALCSIGNED;
signal operator, operator_next				: alu_operator_TYPE;
signal data_neg, data_neg_next				: std_logic;
signal b2_data, b2_data_next				: CALCSIGNED;

BEGIN

next_state : process(parse_fsm_state, parse_start, charUnit_next_valid, char_state, calc_finished, parser_internal_status, b2bcd_data_rdy, calc_status, charUnit_lastChar_type, charUnit_char_type, char_firstOne, charUnit_op,  global_digit_neg, intern_b2bcd_data_neg)
  -- charUnit_lastChar_type, charUnit_char_type: (RESET, DIGIT, OP, EOL)
  begin
    parse_fsm_state_next <= parse_fsm_state;
    
    char_firstOne_next <= char_firstOne;
    case parse_fsm_state is
      when IDLE0 =>
      	if parse_start = '1' then
			parse_fsm_state_next <= PARSE_INIT;
      	end if;
            
      when PARSE_INIT =>
		char_firstOne_next	<= '1';
		if parser_internal_status = RUNNING then
			parse_fsm_state_next <= DIGIT_GETNEXT;
		end if;
		
		
      when DIGIT =>
	  if char_state = ANALYZE_NEXT then
		parse_fsm_state_next <= DIGIT_GETNEXT;
	  elsif char_state = CALC_DIGIT then
		if calc_finished = '0' then 
			parse_fsm_state_next <= DIGIT_CALC_STAGE1;
		end if;
	  end if;
	  
	  
	when DIGIT_CALC_STAGE1 =>
		if calc_finished = '1' then
			-- Error Handling
			if calc_status /= GOOD then
				parse_fsm_state_next <= PARSE_ERROR;
			else
				parse_fsm_state_next <= DIGIT_PREPARE_STAGE2;
			end if;
		end if;
      
      when DIGIT_PREPARE_STAGE2 =>
      	  if calc_finished = '0' then 
      	  	parse_fsm_state_next <= DIGIT_CALC_STAGE2;
      	  end if;
      

      when DIGIT_CALC_STAGE2 =>
		if calc_finished = '1' then
			-- Error Handling
			if calc_status /= GOOD then
				parse_fsm_state_next <= PARSE_ERROR;
			else
				parse_fsm_state_next <= DIGIT_SAVE_CALCED;
			end if;
		end if;
		
		
      when DIGIT_SAVE_CALCED =>
	  parse_fsm_state_next <= DIGIT_GETNEXT;
	 
	 
      when DIGIT_GETNEXT =>
		if charUnit_next_valid = '1' then 
				--Error handling beginnt
			if (charUnit_lastChar_type=COP and charUnit_char_type= CEOL) then
				parse_fsm_state_next <= PARSE_ERROR; --E: EOL after operator
			else 	
				char_firstOne_next <= '0';
				case charUnit_char_type is
					when CDIGIT=>  
						parse_fsm_state_next<= DIGIT;
					when COP =>    parse_fsm_state_next<= OP;
					when CEOL =>   parse_fsm_state_next<= OP;  --STATE that processes EOL handling
					when others => assert false report "NEXTDIGIT TYPE not supported" severity error;
				end case;
			end if; --Error if end
		end if;
      
      when OP =>		
	      --Error Handling
		if (char_firstOne='1' and charUnit_op/= SUBTRAKTION) then
			parse_fsm_state_next <= PARSE_ERROR; --E: first char is not digit and no minus
			assert false report "OP Error Handling: first char is not digit and no minus" severity warning;
		elsif (charUnit_lastChar_type=COP and charUnit_op/= SUBTRAKTION) then
			parse_fsm_state_next   <= PARSE_ERROR; --E: Second op in series isn't a minus
			assert false report "OP Error Handling: Second op in series isn't a minus" severity warning;
		elsif parser_internal_status = TOO_MUCH_OPS then
			parse_fsm_state_next   <= PARSE_ERROR;
			assert false report "OP Error Handling: too much ops" severity warning;
		elsif parser_internal_status = INVALID_OP_SEQUENCE then
			parse_fsm_state_next   <= PARSE_ERROR;
			assert false report "OP Error Handling: invalid op sequence" severity warning;
		else
			parse_fsm_state_next<= OP_JMP;
		end if;
    	
    	when OP_JMP =>
		--Process Handling
		if char_state = ANALYZE_NEXT then
			if charUnit_next_valid = '0' then --warte bis charUnit disabeled
			parse_fsm_state_next <= DIGIT_GETNEXT;
			end if;
		elsif char_state = CALC_THIS then
			if global_digit_neg= '1' then
				--negative Handling
				parse_fsm_state_next <= PRE_INVERT_SECOND_DATA;
			else
				parse_fsm_state_next <= CALC;
			end if;
		end if;
    	
	when PRE_INVERT_SECOND_DATA=>
    		parse_fsm_state_next <= INVERT_SECOND_DATA;
    	
	when INVERT_SECOND_DATA=>
		if calc_finished = '0' then 
			parse_fsm_state_next <= WAIT_INVERTATION_SECOND_DATA;
		end if;
	
	  when WAIT_INVERTATION_SECOND_DATA =>
		if calc_finished = '1' then
			-- Error Handling
			if calc_status /= GOOD then
				parse_fsm_state_next <= PARSE_ERROR;
			else
				parse_fsm_state_next <= HANDLE_INVERTATION;
			end if;
		end if;
		
	  when HANDLE_INVERTATION =>
			parse_fsm_state_next <= CALC;
		
      when CALC =>
		if calc_finished = '0' then 
			parse_fsm_state_next <= WAIT_CALC_RESULT;
		end if;
	
	  
	  when WAIT_CALC_RESULT =>
		if calc_finished = '1' then
			-- Error Handling
			if calc_status /= GOOD then
				parse_fsm_state_next <= PARSE_ERROR;
			else
				parse_fsm_state_next <= SAVE_CALC_RESULT;
			end if;
		end if;
	  
	  
	  when SAVE_CALC_RESULT =>
		if char_state = CALC_THIS then 		--order essential
			parse_fsm_state_next <= CALC;	--order essential
		elsif charUnit_char_type= CEOL then
			parse_fsm_state_next <= PRE_PREPARE_RESULT;
		elsif char_state = ANALYZE_NEXT then
			parse_fsm_state_next <= DIGIT_GETNEXT;
		end if;
	
	when PRE_PREPARE_RESULT =>
		parse_fsm_state_next<= PREPARE_RESULT;
		
	
	when PREPARE_RESULT =>
		if intern_b2bcd_data_neg then
			if calc_finished = '0' then 
				parse_fsm_state_next<= WAITFOR_INVERTED_RESULT;
			end if;
		else 
			parse_fsm_state_next<= WAIT_RESULT;
		end if;
	
	when WAITFOR_INVERTED_RESULT =>
		if calc_finished = '1' then
			parse_fsm_state_next<= PUSH_INVERTED_RESULT;
		end if;
		
	when PUSH_INVERTED_RESULT =>
		parse_fsm_state_next<= WAIT_RESULT;
	
	when WAIT_RESULT =>
		if b2bcd_data_rdy='1' then
			parse_fsm_state_next<= RESULT_STABLE;
		end if;
	
	when PARSE_ERROR =>
		parse_fsm_state_next<= RESULT_STABLE;

	when RESULT_STABLE =>
		if parse_start= '0' then
			parse_fsm_state_next <= IDLE0;
		end if;
	
	when others => 
		--coverage off
		assert false report "NEXT State logic- State not supported" severity error;
		--coverage on
    end case;
  end process next_state;
  
  
  
  
 output : process(parse_fsm_state, calc_result, charUnit_digit, charUnit_char_type, charUnit_op, global_digit_neg, parser_internal_status, operators_serial, charUnit_get_next_var, charUnit_en_var, intern_buff_stage_pos, calc_status, char_state, pars_state, calc_buff, op_buff, data1, data2, operator, data_neg, intern_b2bcd_data_neg, b2_data)
	--variable calc_buff: calc_buffs_TYPE; --Stage BUFFER
	--variable op_buff:		alu_ops_buff_TYPE;
	
	variable calc_stage:	INTEGER := 0;
	variable intern_do_calc_stage: STAGE_POS_TYPE;
  begin
  	
  	intern_do_calc_stage:= (STAGES_TOP-1);
  	intern_buff_stage_pos_next<= intern_buff_stage_pos; 
  	operators_serial_next<= operators_serial; 
  	charUnit_get_next_var_next<= charUnit_get_next_var; 
  	charUnit_en_var_next<= charUnit_en_var; 
  	global_digit_neg_next<= global_digit_neg;

	char_state_next <= char_state;
	pars_state_next <= pars_state;
	parser_internal_status_next <= parser_internal_status;
	calc_buff_next <= calc_buff;
	op_buff_next <= op_buff;
	data1_next <= data1;
	data2_next <= data2;
	operator_next <= operator;
	data_neg_next <= data_neg;
	intern_b2bcd_data_neg_next <= intern_b2bcd_data_neg;
	b2_data_next <= b2_data;
	
	--Signale der Entity setzen
	calc_start <= '0';
	parse_new_data <= '0';
	b2bcd_en<= '0';
	parse_state <= pars_state;
	calc_data <= data1;
	calc_data2 <= data2;
	calc_operator <= operator;
	b2bcd_data_neg <= data_neg;
	b2bcd_data <= b2_data;

    case parse_fsm_state is
      when IDLE0 =>
		-- RESET STATE
		charUnit_en_var_next <='0'; --Disable next digit unit
		charUnit_get_next_var_next <='0';
			
		calc_stage	   	 := 0;
		operators_serial_next <= 1;
		intern_buff_stage_pos_next <= 0;
		global_digit_neg_next <='0';
		
		char_state_next		<= IDLE0;
		parser_internal_status_next <= RESET;
		pars_state_next <= PRESET;
		parse_state <= PRESET;
		parse_new_data <= '0';
		
		b2bcd_en<= '0';
		
      
      when PARSE_INIT =>
		-- PARSER INIT
		charUnit_en_var_next	<= '1' ;
		for i in (STAGES_TOP-1) downto 0 loop
			calc_buff_next(i) <= to_signed(0, SIZEI);
			op_buff_next(i)	<= NOP;
		end loop;
		
		parser_internal_status_next <= RUNNING;
		char_state_next		<= ANALYZE_NEXT;
		
	  
	  
      when DIGIT =>
		charUnit_get_next_var_next <= '0';
		
		if operators_serial>0 then --reset serial operators
			operators_serial_next<=1;
		end if;
		calc_data <= calc_buff(intern_buff_stage_pos);
		data1_next <= calc_buff(intern_buff_stage_pos);
		calc_data2<= to_signed(10, SIZEI);
		data2_next <= to_signed(10, SIZEI);
		calc_operator<= MULTIPLIKATION;
		operator_next <= MULTIPLIKATION;
		char_state_next <= CALC_DIGIT;
		
	 
	when DIGIT_CALC_STAGE1 =>
		calc_start <= '1';
	
	when DIGIT_PREPARE_STAGE2 =>
		calc_start <= '0';
		calc_data <= calc_result;
		data1_next <= calc_result;
		calc_data2<= to_signed(charUnit_digit, SIZEI);
		data2_next <= to_signed(charUnit_digit, SIZEI);
		calc_operator<= ADDITION;
		operator_next <= ADDITION;
		char_state_next <= CALC_DIGIT;
      

      	when DIGIT_CALC_STAGE2 =>
		calc_start <= '1';
		
	when DIGIT_SAVE_CALCED =>
		calc_start <= '0';
	  	calc_buff_next(intern_buff_stage_pos) <= calc_result;
      
	when DIGIT_GETNEXT =>
		-- --Moved to next_state logic
		--if parse_fsm_state'LAST_ACTIVE /= PARSE_INIT then
		--	  char_firstOne_next	<= '0';
		--end if;
		charUnit_get_next_var_next <= '1';
		char_state_next <= PROCESS_NEXT;
		

	when OP =>
		---calc_buff(intern_buff_stage_pos);
		charUnit_get_next_var_next <= '0'; 
		
		
		if charUnit_char_type= CEOL then
			intern_do_calc_stage:= 	0;
			char_state_next <= 	CALC_THIS;
		elsif (operators_serial>=2) then
			----------------------------------------------
			-- Handling of two or more operators in series
			----------------------------------------------
			if charUnit_op=SUBTRAKTION then
				global_digit_neg_next<= not(global_digit_neg);	--invert global_digit_neg if it's second op in series
			else
				parser_internal_status_next <= INVALID_OP_SEQUENCE; --second op isn't a minus
				--double checked in next_state logic @ OP
			end if;
			if operators_serial>2 then
				parser_internal_status_next <= TOO_MUCH_OPS; -- More than two ops in a row
			end if;
			char_state_next <= ANALYZE_NEXT;
		else
			----------------------------------------------
			-- When to calc decision logic
			----------------------------------------------
			case intern_buff_stage_pos is
				when 0=> char_state_next <= ANALYZE_NEXT;
				when 1=>
					if charUnit_op = ADDITION or charUnit_op = SUBTRAKTION then
						char_state_next <= 	CALC_THIS;
						intern_do_calc_stage:= 	1;
					else
						char_state_next <= ANALYZE_NEXT;
						intern_do_calc_stage:= (STAGES_TOP-1);
					end if;
				when 2=>
					if charUnit_op = ADDITION or charUnit_op = SUBTRAKTION then
						char_state_next <= 	CALC_THIS;
						intern_do_calc_stage:= 0;
					elsif charUnit_op = MULTIPLIKATION or charUnit_op = DIVISION then
						char_state_next <= 	CALC_THIS;
						intern_do_calc_stage:= 1;
					else
						char_state_next <= ANALYZE_NEXT;
						intern_do_calc_stage:= (STAGES_TOP-1);
					end if;
				when others => 
					--coverage off
					assert false report "intern_buff_stage_pos- State not supported" severity error;
					--coverage on
			end case;
			op_buff_next(intern_buff_stage_pos) <= charUnit_op;
			operators_serial_next<= operators_serial+1;
			intern_buff_stage_pos_next <= intern_buff_stage_pos+1;
		end if;
			
			
-- 		-- WHEN TO CALC decisions
-- 		char_state := 	CALC_THIS WHEN intern_buff_stage_pos=1 AND charUnit_op = (ADDITION | SUBTRAKTION) ELSE
-- 	  			CALC_THIS WHEN intern_buff_stage_pos=2 AND charUnit_op = (ADDITION | SUBTRAKTION) ELSE
-- 	  			CALC_THIS WHEN intern_buff_stage_pos=2 AND charUnit_op = (MULTIPLIKATION | DIVISION) ELSE
-- 	  			ANALYZE_NEXT;
-- 	  	
-- 	  	-- CALC STAGE decisions
-- 	  	intern_do_calc_stage:= 	1 WHEN intern_buff_stage_pos=1 AND charUnit_op = (ADDITION | SUBTRAKTION) ELSE
-- 	  				0 WHEN intern_buff_stage_pos=2 AND charUnit_op = (ADDITION | SUBTRAKTION) ELSE
-- 	  				1 WHEN intern_buff_stage_pos=2 AND charUnit_op = (MULTIPLIKATION | DIVISION) ELSE
-- 	  				(STAGES_TOP-1);
	  
	when OP_JMP =>
	  	null;
	  
	when PRE_INVERT_SECOND_DATA=>
	  	intern_buff_stage_pos_next<= intern_buff_stage_pos-1;
	  
	when INVERT_SECOND_DATA=>
		----------------------------------------------
		-- Inverting of the second SIGNED
		----------------------------------------------
		
		calc_start <= '0';
		global_digit_neg_next<= '0';
		calc_data <= calc_buff(intern_buff_stage_pos);
		data1_next <= calc_buff(intern_buff_stage_pos);
		calc_data2<= to_signed(-1, SIZEI);
		data2_next <= to_signed(-1, SIZEI);
		calc_operator<= MULTIPLIKATION;
		operator_next <= MULTIPLIKATION;
		
	when WAIT_INVERTATION_SECOND_DATA =>
		calc_start <= '1';
	  
	when HANDLE_INVERTATION =>
		calc_start <='0';
		calc_buff_next(intern_buff_stage_pos) <= calc_result;
		intern_buff_stage_pos_next<= intern_buff_stage_pos+1;
			
	  
	when CALC =>
		if intern_buff_stage_pos >1 then --EOL Handling
			intern_buff_stage_pos_next<= intern_buff_stage_pos-1;
			-- give data to ALU
			calc_data <=  calc_buff(intern_buff_stage_pos-1-1);
			data1_next <= calc_buff(intern_buff_stage_pos-1-1);
			calc_data2 <= calc_buff(intern_buff_stage_pos-1);
			data2_next <= calc_buff(intern_buff_stage_pos-1);
			calc_operator <= op_buff(intern_buff_stage_pos-1-1);
			operator_next <= op_buff(intern_buff_stage_pos-1-1);
		else
			-- give data to ALU
			calc_data <=  	calc_buff(intern_buff_stage_pos-1);
			data1_next <= calc_buff(intern_buff_stage_pos-1);
			calc_data2 <= 	calc_buff(intern_buff_stage_pos);
			data2_next <= calc_buff(intern_buff_stage_pos);
			calc_operator <= op_buff(intern_buff_stage_pos-1);
			operator_next <= op_buff(intern_buff_stage_pos-1);
			assert charUnit_char_type= CEOL
				report "buff stage invalid" severity error;
		end if;
		
		
		
		assert calc_stage<2
			--coverage off
			report "calc stage size exceeded" severity error;
			--coverage on
	  
	  
	when WAIT_CALC_RESULT =>
		calc_start <= '1';
      
	when SAVE_CALC_RESULT =>
		calc_start <= '0';
		
		---Move results back, move op back, clean buffer
		calc_buff_next(intern_buff_stage_pos) <= to_signed(0, SIZEI);
		calc_buff_next(intern_buff_stage_pos-1) <= calc_result;
		op_buff_next(intern_buff_stage_pos-1) <= op_buff(intern_buff_stage_pos);
		op_buff_next(intern_buff_stage_pos) <= NOP;
		
		--Another stage to calc?
		if intern_do_calc_stage< intern_buff_stage_pos-1 then
			char_state_next <= 	CALC_THIS;
		else
			char_state_next <= ANALYZE_NEXT;
		end if;
		
		
		
		
	when PRE_PREPARE_RESULT =>
		pars_state_next <= PGOOD;
		parse_state <= PGOOD;
		if calc_buff(intern_buff_stage_pos-1)< to_signed(0, SIZEI) then
			--set Flag and Prepare inverted Result if result negative
			b2bcd_data_neg<= '1';
			data_neg_next <= '1';
			intern_b2bcd_data_neg_next <= true;
			calc_data <= calc_buff(intern_buff_stage_pos-1);
			data1_next <= calc_buff(intern_buff_stage_pos-1);
			calc_data2 <= to_signed(-1, SIZEI);
			data2_next <= to_signed(-1, SIZEI);
			calc_operator <= MULTIPLIKATION;
			operator_next <= MULTIPLIKATION;
		else
			b2bcd_data_neg<= '0';
			data_neg_next <= '0';
			intern_b2bcd_data_neg_next <= false;
		end if;
		b2bcd_data <= calc_buff(intern_buff_stage_pos-1);
		b2_data_next <= calc_buff(intern_buff_stage_pos-1);
	
	when PREPARE_RESULT =>
		null;
		
	
	when WAITFOR_INVERTED_RESULT =>
		calc_start <= '1';
		
	when PUSH_INVERTED_RESULT =>
		calc_start <= '0';
		b2bcd_data<= calc_result;
		b2_data_next <= calc_result;
	when WAIT_RESULT =>
		b2bcd_en<= '1';
	
	when PARSE_ERROR =>
		--convert to
		--(PRESET, PGOOD, PDIV_ZERO, POVERFLOW, PTOO_MUCH_OPS, PINVALID_OP_SEQUENCE);
		if calc_status/=GOOD then --(GOOD, RESET, DIV_ZERO, OVERFLOW)
			case calc_status is
				when DIV_ZERO=>
					pars_state_next <= PDIV_ZERO;
					parse_state <= PDIV_ZERO;
				when OVERFLOW=>
					pars_state_next <= POVERFLOW;
					parse_state <= POVERFLOW;
				when others=> assert false report "calc_status error state- not supported" severity error;
			end case;
		elsif parser_internal_status/=GOOD then --(RESET, RUNNING, GOOD, TOO_MUCH_OPS, INVALID_OP_SEQUENCE);
			case parser_internal_status is
				when TOO_MUCH_OPS =>
					pars_state_next <= PTOO_MUCH_OPS;
					parse_state <= PTOO_MUCH_OPS;
				when INVALID_OP_SEQUENCE =>
					pars_state_next <= PINVALID_OP_SEQUENCE;
					parse_state <= PINVALID_OP_SEQUENCE;
				when others=> assert false report "parser_internal_status error state- not supported" severity error;
			end case;
		else
			assert false report "PARSE Error CASE - not supported" severity error;
		end if;
		
	when RESULT_STABLE =>
		parse_new_data<='1';
	
	
    end case;
  end process output;
  
	
 sync : process(sys_clk, sys_res_n)
  begin
    if sys_res_n = '0' then
      parse_fsm_state <= IDLE0;
    elsif rising_edge(sys_clk) then
      parse_fsm_state <= parse_fsm_state_next;
      
      
      intern_buff_stage_pos<= intern_buff_stage_pos_next;
      operators_serial<= operators_serial_next;
      charUnit_get_next<= charUnit_get_next_var_next;
      charUnit_get_next_var<= charUnit_get_next_var_next;
      charUnit_en<= charUnit_en_var_next;
      charUnit_en_var<= charUnit_en_var_next;
      global_digit_neg<= global_digit_neg_next;
      char_firstOne<= char_firstOne_next;

	char_state <= char_state_next;
	pars_state <= pars_state_next;
	parser_internal_status <= parser_internal_status_next;
	calc_buff <= calc_buff_next;
	op_buff <= op_buff_next;
	data1 <= data1_next;
	data2 <= data2_next;
	operator <= operator_next;
	data_neg <= data_neg_next;
	intern_b2bcd_data_neg <= intern_b2bcd_data_neg_next;
	b2_data <= b2_data_next;
    end if;
 end process sync;

END parser_sm;
