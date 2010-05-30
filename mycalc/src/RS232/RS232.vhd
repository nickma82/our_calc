library ieee ;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.std_logic_arith.all;

use ieee.numeric_std.all;

-- ENTITY
entity RS232_ent is
	port(
		sys_clk		: in std_logic;	
		sys_res_n	: in std_logic;
		uart_rx		: in std_logic;
		uart_tx		: out std_logic;
		tx_rdy		: out std_logic;
		tx_go		: in std_logic;
		tx_data		: in std_logic_vector(7 downto 0);
		rx_recv		: out std_logic;
		rx_data		: out std_logic_vector(7 downto 0)
	);
end entity RS232_ent;

-- ARCHITECTURE
architecture RS232_arc of RS232_ent is

--type
type RS232_FSM_STATE_TYPE is
    (READY, SEND_INIT, SEND_BIT, SEND_DONE, RECV_INIT, RECV_WAIT, RECV_BIT, RECV_DONE, SEND_BYTE, RECV_CHECK);

--constants
constant baudValue : integer := 290;

--signals
signal RS232_fsm_state, RS232_fsm_state_next : RS232_FSM_STATE_TYPE;
signal countBaud, countBaud_next : integer range 0 to 581 := 0;
signal countBit, countBit_next : integer range 0 to 9 := 0;
signal recvBuffer, recvBuffer_next : std_logic_vector(7 downto 0);
signal sendBuffer, sendBuffer_next : std_logic_vector(7 downto 0);

begin

sync : process(sys_clk, sys_res_n)
begin
	if sys_res_n = '0' then
		RS232_fsm_state <= READY;
		countBit <= 0;
		recvBuffer <= x"00";
		sendBuffer <= x"00";
	elsif rising_edge(sys_clk) then
		RS232_fsm_state <= RS232_fsm_state_next;
		countBaud <= countBaud_next;
		countBit <= countBit_next;
		recvBuffer <= recvBuffer_next;
		sendBuffer <= sendBuffer_next;
	end if;

end process sync;

next_state : process(RS232_fsm_state, uart_rx, countBaud, countBit, sendBuffer, tx_go, tx_data)
begin
	RS232_fsm_state_next <= RS232_fsm_state;
	sendBuffer_next <= sendBuffer;
	
	case RS232_fsm_state is
		when READY =>
			if tx_go = '1' then
				RS232_fsm_state_next <= SEND_INIT;
				sendBuffer_next <= tx_data;
			elsif uart_rx = '0' then
				RS232_fsm_state_next <= RECV_INIT;
			end if;
      		when SEND_INIT =>
			if countBaud >= 289 then
				RS232_fsm_state_next <= SEND_BIT;
			end if;
		when SEND_BIT =>
			if countBit >= 9 then
				RS232_fsm_state_next <= SEND_DONE;
			end if;
		when SEND_DONE =>
			if countBaud >= 434 then			--1,5 mal die Bitzeit
				RS232_fsm_state_next <= READY;
			end if;
		when RECV_INIT =>
			if countBaud >= 434 then			-- 1,5 mal die Bitzeit
				RS232_fsm_state_next <= RECV_BIT;
			end if;
		when RECV_WAIT =>
			if countBaud >= 289 then
				RS232_fsm_state_next <= READY;
			end if;
		when RECV_BIT =>
			if countBit >= 8 then
				RS232_fsm_state_next <= RECV_CHECK;
			end if;
		when RECV_CHECK =>
			if countBaud >= 289 then
				if uart_rx = '0' then			--Stoppbit ist fehlerhaft
					RS232_fsm_state_next <= RECV_WAIT;
				else					--Daten sind gültig
					RS232_fsm_state_next <= RECV_DONE;
				end if;
			end if;
		when RECV_DONE =>
			if countBaud >= 289 then			-- 1 mal die Bitzeit
				RS232_fsm_state_next <= SEND_BYTE;
				--sendBuffer_next <= x"36";
				--RS232_fsm_state_next <= SEND_INIT;
			end if;
		when SEND_BYTE =>
			--if tx_rdy = '1' then
				RS232_fsm_state_next <= READY;
			--end if;
	end case;
end process next_state;

output : process(RS232_fsm_state, countBaud, countBit, sendBuffer, uart_rx, recvBuffer)
begin
	countBaud_next <= 0;
	rx_recv <= '0';
	rx_data <= x"00";
	uart_tx <= '1';
	tx_rdy <= '0';
	uart_tx <= '1';
	countBit_next <= countBit;
	recvBuffer_next <= recvBuffer;

	case RS232_fsm_state is
		when READY =>
			tx_rdy <= '1';
      		when SEND_INIT =>
			countBaud_next <= countBaud + 1;
			countBit_next <= 0;
			uart_tx <= '0';
			if countBaud >= 289 then
				countBaud_next <= 0;
			end if;
		when SEND_BIT =>
			if countBit < 8 then 
				uart_tx <= sendBuffer(countBit);
			end if;
				
			if countBaud >= 289 then
				countBit_next <= countBit + 1;
				countBaud_next <= 0;
			else
				countBaud_next <= countBaud + 1;
			end if;			
		when SEND_DONE =>
			countBaud_next <= countBaud + 1;
		when RECV_INIT =>
			countBaud_next <= countBaud + 1;
			countBit_next <= 0;
			recvBuffer_next <= x"00";
		when RECV_BIT =>
			if countBaud >= 289 then
				recvBuffer_next(countBit) <= uart_rx;
				countBit_next <= countBit + 1;
				countBaud_next <= 0;
			else
				countBaud_next <= countBaud + 1;
			end if;
		when RECV_CHECK =>
			if countBaud >= 289 then
				countBaud_next <= 0;
			else
				countBaud_next <= countBaud + 1;
			end if;
		when RECV_DONE =>
			countBaud_next <= countBaud + 1;
		when SEND_BYTE =>
			rx_recv <= '1';
			rx_data <= x"68";--recvBuffer;
		when RECV_WAIT =>
			if countBaud >= 289 then
				countBaud_next <= 0;
			else
				countBaud_next <= countBaud + 1;
			end if;
		when others => null;
	end case;
end process output;

end RS232_arc;
