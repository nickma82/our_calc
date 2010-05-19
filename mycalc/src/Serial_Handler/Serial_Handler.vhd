library ieee ;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.std_logic_arith.all;

use ieee.numeric_std.all;

-- ENTITY
entity Serial_Handler_ent is
	--generic(
		
	--);
	port(
		sys_clk		: in std_logic;	
		sys_res_n	: in std_logic;
		inp_sendRS232	
		rb busy		: in std_logic;
		rb_read_en	: in std_logic;
		rb_read_lineNr	: out std_logic;
		rb_read_data_rdy: out std_logic;
		rb_read_data	: in std_logic_vector(647 downto 0);	

		tx_rdy		: in std_logic;
		tx_go		: out std_logic;
		tx_data		: out std_logic_vector(7 downto 0);
		rx_recv		: in std_logic;
		rx_data		: in std_logic_vector(7 downto 0);
		
	);
end entity Serial_Handler_ent;

-- ARCHITECTURE
architecture Serial_Handler_arc of Serial_Handler_ent is

--type
type Serial_Handler_FSM_STATE_TYPE is
    (READY, CHECK_BYTE, SEND_HISTORY, LINE_READ, WRITE_CHAR, DONE);

--constants

--signals
signal Serial_Handler_fsm_state, Serial_Handler_fsm_state_next : Serial_Handler_FSM_STATE_TYPE;
signal counter : std_logic_vector(5 downto 0);

begin

sync : process(sys_clk, sys_res_n)
begin
	if sys_res_n = '0' then
		Serial_Handler_fsm_state <= READY;
		counter => (others => 0);
	elsif rising_edge(sys_clk) then
		Serial_Handler_fsm_state <= Serial_Handler_fsm_state_next;
	end if;

end process sync;

next_state : process(Serial_Handler_fsm_state)
begin
	Serial_Handler_fsm_state_next <= Serial_Handler_fsm_state;
	
	case Serial_Handler_fsm_state is
		when READY =>
			if rx_recv = '1' then Serial_Handler_fsm_state_next <= CHECK_BYTE;
			elsif inp_sendRS232 = '1' then Serial_Handler_fsm_state_next <= SEND_HISTORY;
			end if;
      		when CHECK_BYTE =>
			--TODO richtiges Byte checken, derzeit 'S' für send
			if rx_data = x"53" then Serial_Handler_fsm_state_next <= SEND_HISTORY;
			else Serial_Handler_fsm_state_next <= READY;
			end if;
		when SEND_HISTORY =>
			if rb_read_data_rdy then Serial_Handler_fsm_state_next <= LINE_READ;
			end if;
		when LINE_READ =>
			if rb_read_data_rdy then Serial_Handler_fsm_state_next <= LINE_READ;
			end if;
		when WRITE_CHAR =>

		when DONE =>

			
	end case;
end process next_state;

output : process(Serial_Handler_fsm_state)
begin
	case Serial_Handler_fsm_state is
		when SEND_HISTORY =>
			rb_read_lineNr <= counter;
			rb_read_en <= '1';
		when LINE_READ =>
			rb_read_lineNr <= counter;
			rb_read_en <= '1';
		when WRITE_CHAR =>

		when DONE =>
			
		when others => null;
	end case;
end process output;

end Serial_Handler_arc;
