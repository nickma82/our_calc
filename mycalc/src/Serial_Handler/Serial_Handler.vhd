library ieee ;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.std_logic_arith.all;

use ieee.numeric_std.all;

use work.big_pkg.all;

-- ENTITY
entity Serial_Handler_ent is
	--generic(
		
	--);
	port(
		sys_clk		: in std_logic;	
		sys_res_n	: in std_logic;
		inp_sendRS232	: in std_logic;
		rb_busy		: in std_logic;
		rb_read_en	: out std_logic;
		rb_read_lineNr	: out std_logic_vector(7 downto 0);
		rb_read_data_rdy: in std_logic;
		rb_read_data	: in RAM_LINE;	
		tx_rdy		: in std_logic;
		tx_go		: out std_logic;
		tx_data		: out std_logic_vector(7 downto 0);
		rx_recv		: in std_logic;
		rx_data		: in std_logic_vector(7 downto 0)
	);
end entity Serial_Handler_ent;

-- ARCHITECTURE
architecture Serial_Handler_arc of Serial_Handler_ent is

--type
type Serial_Handler_FSM_STATE_TYPE is
    (READY, CHECK_BYTE, SEND_HISTORY, REQ_LINE, WAIT_LINE, READ_LINE, WRITE_CHAR, WAIT_CHAR, PRE_DONE, DONE);

--constants

--signals
signal Serial_Handler_fsm_state, Serial_Handler_fsm_state_next : Serial_Handler_FSM_STATE_TYPE;
signal linePointer, linePointer_next : integer range 0 to LINE_NUMB - 1;				
signal charPointer, charPointer_next : integer range 0 to LINE_LENGTH + 2;
signal currentLine, currentLine_next : RAM_LINE;


begin

sync : process(sys_clk, sys_res_n)
begin
	if sys_res_n = '0' then
		Serial_Handler_fsm_state <= READY;
	elsif rising_edge(sys_clk) then
		Serial_Handler_fsm_state <= Serial_Handler_fsm_state_next;
		charPointer <= charPointer_next;
		linePointer <= linePointer_next;
		currentLine <= currentLine_next;
	end if;

end process sync;

next_state : process(Serial_Handler_fsm_state, rx_recv, rx_data, tx_rdy, inp_sendRS232, rb_busy, rb_read_data_rdy, rb_read_data, linePointer, charPointer, currentLine)
begin
	Serial_Handler_fsm_state_next <= Serial_Handler_fsm_state;
	
	case Serial_Handler_fsm_state is
		when READY =>
			if rx_recv = '1' then Serial_Handler_fsm_state_next <= CHECK_BYTE;
			elsif inp_sendRS232 = '1' then Serial_Handler_fsm_state_next <= SEND_HISTORY;
			end if;
      		when CHECK_BYTE =>
			--TODO richtiges Byte checken, derzeit 'h' für history
			if rx_data = x"68" then Serial_Handler_fsm_state_next <= SEND_HISTORY;
			else Serial_Handler_fsm_state_next <= READY;
			end if;
			Serial_Handler_fsm_state_next <= SEND_HISTORY;
		when SEND_HISTORY =>
			if rb_busy = '1' then 
				Serial_Handler_fsm_state_next <= REQ_LINE;
			end if;
		when REQ_LINE =>
			--if rb_busy = '0' then 
				Serial_Handler_fsm_state_next <= WAIT_LINE;
			--end if;
		when WAIT_LINE =>
			if rb_read_data_rdy = '1' then Serial_Handler_fsm_state_next <= READ_LINE;
			end if;
			--NUR ZUM TESTEN
			--TODO LÖSCHEN
			--Serial_Handler_fsm_state_next <= READ_LINE;
		when READ_LINE =>
			--if linePointer <= 0 then
			--	Serial_Handler_fsm_state_next <= DONE;
			--elsif rb_read_data(0) = x"00" then
			--	Serial_Handler_fsm_state_next <= REQ_LINE;
			--else
				Serial_Handler_fsm_state_next <= WAIT_CHAR;
			--end if;
		when WRITE_CHAR =>
			Serial_Handler_fsm_state_next <= WAIT_CHAR;
		when WAIT_CHAR =>
			if currentLine(0) = x"00" then
				Serial_Handler_fsm_state_next <= DONE;
			elsif linePointer <= 0 and charPointer >= 84 then
				Serial_Handler_fsm_state_next <= DONE;
			elsif charPointer >= 84 then
				Serial_Handler_fsm_state_next <= REQ_LINE;
			elsif tx_rdy = '1' then Serial_Handler_fsm_state_next <= WRITE_CHAR;
			end if;
		when PRE_DONE =>
			if tx_rdy = '1' then Serial_Handler_fsm_state_next <= DONE;
			end if;
		when DONE =>
			Serial_Handler_fsm_state_next <= READY;
			
	end case;
end process next_state;

output : process(Serial_Handler_fsm_state, charPointer, linePointer, tx_rdy, rb_read_data, rb_busy, currentLine)
begin
	linePointer_next <= linePointer;
	charPointer_next <= charPointer;
	currentLine_next <= currentLine;
	
	tx_go <= '0';
	rb_read_en <= '0';
	rb_read_lineNr <= x"00";
	tx_data <= x"00";
	
	case Serial_Handler_fsm_state is
		when SEND_HISTORY =>
			--Werte zurück setzen
			--TODO wieder einfügen	linePointer_next <= 50;
			linePointer_next <= 50;
			charPointer_next <= 0;
		when REQ_LINE =>
			rb_read_lineNr <= conv_std_logic_vector(linePointer, 8);
			rb_read_en <= '1';
		when WAIT_LINE =>
			rb_read_lineNr <= conv_std_logic_vector(linePointer, 8);
			rb_read_en <= '1';
		when READ_LINE =>
			rb_read_en <= '1';
			currentLine_next <= rb_read_data;
			charPointer_next <= 0;
			if linePointer > 0 then linePointer_next <= linePointer - 1;
			end if;
		when WRITE_CHAR =>
			if charPointer = 83 then
				tx_data <= x"0D";
				tx_go <= '1';
				charPointer_next <= 84;
			elsif charPointer = 82 or currentLine(charPointer) = x"00" then
				tx_data <= x"0A";
				tx_go <= '1';
				charPointer_next <= 83; --79
			elsif rb_busy = '1' then
				tx_data <= currentLine(charPointer);
				tx_go <= '1';
				charPointer_next <= charPointer + 1;
			end if;
		when PRE_DONE =>
			tx_data <= x"0D";
			tx_go <= '1';
		when others => null;
	end case;
end process output;

end Serial_Handler_arc;
