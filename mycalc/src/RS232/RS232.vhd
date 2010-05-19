library ieee ;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.std_logic_arith.all;

use ieee.numeric_std.all;

-- ENTITY
entity RS232_ent is
	--generic(
		
	--);
	port(
		sys_clk		: in std_logic;	
		sys_res_n	: in std_logic;
		uart_rx		: in std_logic;
		uart_tx		: out std_logic;
		tx_rdy		: out std_logic;
		tx_go		: in std_logic;
		tx_data		: in std_logic_vector(7 downto 0);
		rx_recv		: out std_logic;
		rx_data		: out std_logic_vector(7 downto 0);
	);
end entity RS232_ent;

-- ARCHITECTURE
architecture RS232_arc of RS232_ent is

--type
type RS232_FSM_STATE_TYPE is
    (READY, SEND_INIT, SEND_BIT, SEND_DONE, RECV_INIT, RECV_WAIT, RECV_BIT, RECV_DONE);

--constants

--signals
signal RS232_fsm_state, RS232_fsm_state_next : RS232_FSM_STATE_TYPE;


begin

sync : process(sys_clk, sys_res_n)
begin
	if sys_res_n = '0' then
		RS232_fsm_state <= READY;
	elsif rising_edge(sys_clk) then
		RS232_fsm_state <= RS232_fsm_state_next;
	end if;

end process sync;

next_state : process(RS232_fsm_state)
begin
	RS232_fsm_state_next <= RS232_fsm_state;
	
	case RS232_fsm_state is
		when READY =>
			
			
      		when SEND_INIT =>

		when SEND_BIT =>

		when SEND_DONE =>
		
		when RECV_INIT =>

		when RECV_WAIT =>

		when RECV_BIT =>
		
		when RECV_DONE =>
			
	end case;
end process next_state;

output : process(RS232_fsm_state)
begin
	case RS232_fsm_state is
		when READY =>
			
			
      		when SEND_INIT =>

		when SEND_BIT =>

		when SEND_DONE =>
		
		when RECV_INIT =>

		when RECV_WAIT =>

		when RECV_BIT =>
		
		when RECV_DONE =>			
		when others => null;
	end case;
end process output;

end RS232_arc;
