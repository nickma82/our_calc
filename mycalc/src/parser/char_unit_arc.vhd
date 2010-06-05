-- @module : alu_div_arc
-- @author : s0726179
-- @date   : May 27, 2010
library ieee ;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.std_logic_arith.all;


use work.big_pkg.all;
use work.parser_pkg.all;
use ieee.numeric_std.all;

ARCHITECTURE char_unit OF char_unit_ent IS
type CHAR_UNIT_STATE_TYPE is (RESET, LINE_WAIT, LINE_REQ, LINE_READY, CHAR_WAIT, CHAR_SEND, CHAR_VALID, CHAR_EOL);
signal charunit_fsm_state, charunit_fsm_state_next : CHAR_UNIT_STATE_TYPE;

signal currentLine, currentLine_next : RAM_LINE;
signal charPointer, charPointer_next : integer range 0 to LINE_LENGTH - 1;

signal digit, digit_next 		: ONEDIGIT := 0;
signal op, op_next			: alu_operator_TYPE := NOP;
signal lastChar, lastChar_next		: PARSER_CHAR_TYPE  := CRESET;
signal char, char_next			: PARSER_CHAR_TYPE  := CRESET;

begin

next_state : process(charunit_fsm_state, charUnit_en, rb_read_data_rdy, rb_read_data, rb_busy, charUnit_get_next, charPointer, currentLine)
begin
	charunit_fsm_state_next <= charunit_fsm_state;
	currentLine_next <= currentLine;

	case charunit_fsm_state is
	when RESET =>		--Warten bis Zeile angefordert wird
		if charUnit_en= '1' then
			charunit_fsm_state_next <= LINE_WAIT;
		end if;
	when LINE_WAIT =>	--Warten bis Ringbuffer frei ist
		if rb_busy = '1' then
			charunit_fsm_state_next <= LINE_REQ;
		end if;	
	when LINE_REQ =>	--Zeile 0 anfordern und warten bis sie da is
		if rb_read_data_rdy = '1' then
			charunit_fsm_state_next <= LINE_READY;
		end if;
	when LINE_READY =>	--Zeile speichern
		currentLine_next <= rb_read_data;
		charunit_fsm_state_next <= CHAR_WAIT;
	when CHAR_WAIT =>	--Warten bis nächstes Zeichen angefordert wird
		if charunit_en = '1' then		
			if charUnit_get_next = '1' then
				charunit_fsm_state_next <= CHAR_SEND;
			end if;
		else
			charunit_fsm_state_next <= RESET;
		end if;
	when CHAR_SEND =>	--Daten anlegen
		charunit_fsm_state_next <= CHAR_VALID;
	when CHAR_VALID =>	--Daten zum lesen freigeben
		if charunit_get_next = '0' then
			if charPointer > 0 then
				if currentLine(charPointer - 1) = x"00" then
					charunit_fsm_state_next <= CHAR_WAIT;
				else
					charunit_fsm_state_next <= CHAR_WAIT;
				end if;
			else
				charunit_fsm_state_next <= CHAR_WAIT;
			end if;
		end if;
	when CHAR_EOL =>
		if charunit_en = '0' then
			charunit_fsm_state_next <= CHAR_WAIT;
		end if;
			
	end case;
end process next_state;
  

output : process(charunit_fsm_state, charPointer, currentLine, op, char, lastChar, digit)
begin
	charUnit_next_valid <= '0';
	rb_read_en <= '0';
	rb_read_lineNr <= x"00";

	--Operator setzen
	op_next <= op;
	charUnit_op <= op;

	--Zeichen setzen
	char_next <= char;
	charUnit_char_type <= char;

	--letztes Zeichen setzen
	lastChar_next <= lastChar;
	charUnit_lastChar_type <= lastChar;

	--Zahl setzen
	digit_next <= digit;
	charUnit_digit <= digit;

	charPointer_next <= charPointer;
	case charunit_fsm_state is
	when RESET =>
		rb_read_en <= '0'; --weak low
	 	rb_read_lineNr <= x"00"; 
      		charUnit_next_valid <= '0';
      		--next_ok <= '0';     
		charPointer_next <= 0;
	when LINE_REQ =>			--Zeile 0 anfordern
		rb_read_lineNr <= x"00"; 
		--check if RB is busy
		rb_read_en <= '1';
	when LINE_READY =>			
		
	when CHAR_WAIT =>
		charUnit_next_valid <= '0';
	when CHAR_SEND =>
		--parsen der einzelnen Chars
		--next_ok <= '1';
		charUnit_next_valid <= '0';

		--lastChar setzen
		charUnit_lastChar_type <= char;
		lastChar_next <= char;

		case currentLine(charPointer) is
			when x"00" =>		--EOL
				charUnit_digit <= 0;
				digit_next <= 0;
				charUnit_op <= NOP;
				op_next <= NOP;
				charUnit_char_type <= CEOL;
				char_next <= CEOL;
			when x"30" =>		-- 0
				charUnit_digit <= 0;
				digit_next <= 0;
				charUnit_op <= NOP;
				op_next <= NOP;
				charUnit_char_type <= CDIGIT;
				char_next <= CDIGIT;
			when x"31" =>		-- 1
				charUnit_digit <= 1;
				digit_next <= 1;
				charUnit_op <= NOP;
				op_next <= NOP;
				charUnit_char_type <= CDIGIT;
				char_next <= CDIGIT;
			when x"32" =>		-- 2
				charUnit_digit <= 2;
				digit_next <= 2;
				charUnit_op <= NOP;
				op_next <= NOP;
				charUnit_char_type <= CDIGIT;
				char_next <= CDIGIT;
			when x"33" =>		-- 3
				charUnit_digit <= 3;
				digit_next <= 3;
				charUnit_op <= NOP;
				op_next <= NOP;
				charUnit_char_type <= CDIGIT;
				char_next <= CDIGIT;
			when x"34" =>		-- 4
				charUnit_digit <= 4;
				digit_next <= 4;
				charUnit_op <= NOP;
				op_next <= NOP;
				charUnit_char_type <= CDIGIT;
				char_next <= CDIGIT;
			when x"35" =>		-- 5
				charUnit_digit <= 5;
				digit_next <= 5;
				charUnit_op <= NOP;
				op_next <= NOP;
				charUnit_char_type <= CDIGIT;
				char_next <= CDIGIT;
			when x"36" =>		-- 6
				charUnit_digit <= 6;
				digit_next <= 6;
				charUnit_op <= NOP;
				op_next <= NOP;
				charUnit_char_type <= CDIGIT;
				char_next <= CDIGIT;
			when x"37" =>		-- 7
				charUnit_digit <= 7;
				digit_next <= 7;
				charUnit_op <= NOP;
				op_next <= NOP;
				charUnit_char_type <= CDIGIT;
				char_next <= CDIGIT;
			when x"38" =>		-- 8
				charUnit_digit <= 8;
				digit_next <= 8;
				charUnit_op <= NOP;
				op_next <= NOP;
				charUnit_char_type <= CDIGIT;
				char_next <= CDIGIT;
			when x"39" =>		-- 9
				charUnit_digit <= 9;
				digit_next <= 9;
				charUnit_op <= NOP;
				op_next <= NOP;
				charUnit_char_type <= CDIGIT;
				char_next <= CDIGIT;
			when x"2B" =>		-- +
				charUnit_digit <= 0;
				digit_next <= 0;
				charUnit_op <= ADDITION;
				op_next <= ADDITION;
				charUnit_char_type <= COP;
				char_next <= COP;
			when x"2D" =>		-- -
				charUnit_digit <= 0;
				digit_next <= 0;
				charUnit_op <= SUBTRAKTION;
				op_next <= SUBTRAKTION;
				charUnit_char_type <= COP;
				char_next <= COP;
			when x"2A" =>		-- *
				charUnit_digit <= 0;
				digit_next <= 0;
				charUnit_op <= MULTIPLIKATION;
				op_next <= MULTIPLIKATION;
				charUnit_char_type <= COP;
				char_next <= COP;
			when x"2F" =>		-- /
				charUnit_digit <= 0;
				digit_next <= 0;
				charUnit_op <= DIVISION;
				op_next <= DIVISION;
				charUnit_char_type <= COP;
				char_next <= COP;
			when others => null;
		end case;
		charPointer_next <= charPointer + 1;
	when CHAR_VALID =>
		charUnit_next_valid <= '1';
		--charUnit_lastChar_type <= CEOL;
	when others => null;
	end case;
end process output;


sync : process(sys_clk, sys_res_n)
	begin
		if sys_res_n = '0' then
			charunit_fsm_state <= RESET;
		elsif rising_edge(sys_clk) then
			charunit_fsm_state <= charunit_fsm_state_next;
			currentLine <= currentLine_next;
			charPointer <= charPointer_next;

			op <= op_next;
			char <= char_next;
			lastChar <= lastChar_next;
			digit <= digit_next;
 		end if;
end process sync;

end architecture char_unit;
