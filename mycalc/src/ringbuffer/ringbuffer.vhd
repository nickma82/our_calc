library ieee ;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.std_logic_arith.all;

use ieee.numeric_std.all;

-- ENTITY
entity ringbuffer_ent is
	--generic(
	
	--);
	port(
		sys_clk		: in std_logic;	
		sys_res_n	: in std_logic;
		rb busy		: out std_logic;
		pars_new_data	: in std_logic;
		pars_data	: in std_logic_vector(7 downto 0);
		inp_new_data	: in std_logic;
		inp_data	: in std_logic_vector(7 downto 0);
		inp_del		: in std_logic;
		rb_char_newline	: in std_logic;
		rb_read_en	: in std_logic;
		rb_read_lineNr	: in std_logic;
		rb_read_data_rdy: out std_logic;
		rb_read_data	: out RAM_LINE;			--out std_logic_vector(647 downto 0);
		
	);
end entity ringbuffer_ent;

-- ARCHITECTURE
architecture ringbuffer_arc of ringbuffer_ent is

--type
signal ram : RAM_ARRAY;

type RINGBUFFER_FSM_STATE_TYPE is
    (READY, WRITE_CHAR, DELETE_CHAR, LINE_REQ, LINE_RDY);

--signals
signal ringbuffer_fsm_state, ringbuffer_fsm_state_next : RINGBUFFER_FSM_STATE_TYPE;
signal linePointer : std_logic_vector(6 downto 0) := (others => 0);				--zeigt auf die derzeitige Zeile


begin

sync : process(sys_clk, sys_res_n)
begin
	if sys_res_n = '0' then
		ringbuffer_fsm_state <= READY;
		linePointer <= 0;
		
	elsif rising_edge(sys_clk) then
		ringbuffer_fsm_state <= ringbuffer_fsm_state_next;
	end if;

end process sync;

next_state : process(ringbuffer_fsm_state)
begin
	ringbuffer_fsm_state_next <= ringbuffer_fsm_state;
	
	case ringbuffer_fsm_state is
		when READY =>
			if inp_new_data = '1' or pars_new_data = '1' then ringbuffer_fsm_state_next <= WRITE_CHAR;
			elsif rb_read_en = '1' then ringbuffer_fsm_state_next <= LINE_REQ;
			elsif inp_del = '1' then ringbuffer_fsm_state_next <= DELETE_CHAR;
			end if;
      		when WRITE_CHAR =>
			ringbuffer_fsm_state_next <= READY;
		when DELETE_CHAR =>
			ringbuffer_fsm_state_next <= READY;
		when LINE_REQ =>
			ringbuffer_fsm_state_next <= LINE_RDY;
		when LINE_RDY =>
			ringbuffer_fsm_state_next <= READY;
	end case;
end process next_state;

output : process(ringbuffer_fsm_state)
begin
	case ringbuffer_fsm_state is
		when READY =>
			rb_busy <= 1;
		when WRITE_CHAR =>			rb_busy <= 0;
			
		when others => null;
	end case;
end process output;

end ringbuffer_arc;
