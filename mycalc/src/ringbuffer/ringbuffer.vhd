library ieee ;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.std_logic_arith.all;

use ieee.numeric_std.all;

use work.big_pkg.all;

-- ENTITY
entity ringbuffer_ent is
	--generic(
	
	--);
	port(
		sys_clk		: in std_logic;	
		sys_res_n	: in std_logic;
		rb_busy		: out std_logic;
		pars_new_data	: in std_logic;
		pars_data	: in std_logic_vector(7 downto 0);
		inp_new_data	: in std_logic;
		inp_data	: in std_logic_vector(7 downto 0);
		inp_del		: in std_logic;
		rb_char_newline	: in std_logic;
		rb_read_en	: in std_logic;
		rb_read_lineNr	: in std_logic_vector(7 downto 0);
		rb_read_data_rdy: out std_logic;
		rb_read_data	: out RAM_LINE					--std_logic_vector((LINE_LENGTH*CHAR_LENGTH) -1 downto 0)
	);
end entity ringbuffer_ent;

-- ARCHITECTURE
architecture ringbuffer_arc of ringbuffer_ent is

--type
signal ram : RAM_ARRAY;

type RINGBUFFER_FSM_STATE_TYPE is (INIT, READY, WRITE_CHAR, DELETE_CHAR, LINE_REQ, LINE_RDY, NEW_LINE);

--signals
signal ringbuffer_fsm_state, ringbuffer_fsm_state_next : RINGBUFFER_FSM_STATE_TYPE;
signal linePointer : integer range 0 to LINE_NUMB -1;				--zeigt auf die derzeitige Zeile, Zeile 0
signal charPointer : integer range 0 to LINE_LENGTH -1;				--zeigt auf derzeitigen Char in Zeile 0
signal byte_buffer : std_logic_vector(7 downto 0);				--speichert zu schreibendes Byte zwischen

begin

sync : process(sys_clk, sys_res_n)
begin
	if sys_res_n = '0' then
		ringbuffer_fsm_state <= INIT;
	elsif rising_edge(sys_clk) then
		ringbuffer_fsm_state <= ringbuffer_fsm_state_next;
	end if;

end process sync;

next_state : process(ringbuffer_fsm_state,inp_new_data, pars_new_data, rb_read_en, inp_del, rb_char_newline, inp_data, pars_data)
begin
	ringbuffer_fsm_state_next <= ringbuffer_fsm_state;
	
	case ringbuffer_fsm_state is
		when INIT =>
			ringbuffer_fsm_state_next <= READY;
		when READY =>
			if inp_new_data = '1' and charPointer < 70 then 
				byte_buffer <= inp_data;
				ringbuffer_fsm_state_next <= WRITE_CHAR;
			elsif pars_new_data = '1' then 
				byte_buffer <= pars_data;
				ringbuffer_fsm_state_next <= WRITE_CHAR;
			elsif rb_read_en = '1' then ringbuffer_fsm_state_next <= LINE_REQ;
			elsif inp_del = '1' then ringbuffer_fsm_state_next <= DELETE_CHAR;
			elsif rb_char_newline = '1' then ringbuffer_fsm_state_next <= NEW_LINE;
			end if;
      		when WRITE_CHAR =>
			ringbuffer_fsm_state_next <= READY;
		when DELETE_CHAR =>
			ringbuffer_fsm_state_next <= READY;
		when LINE_REQ =>
			ringbuffer_fsm_state_next <= LINE_RDY;
		when LINE_RDY =>
			ringbuffer_fsm_state_next <= READY;
		when NEW_LINE =>
			ringbuffer_fsm_state_next <= READY;
		when others => null;
	end case;
end process next_state;

output : process(ringbuffer_fsm_state)
begin
	case ringbuffer_fsm_state is
		when INIT =>
			linePointer <= 0;
			charPointer <= 0;
			--byte_buffer <= x"00";
			for j in 0 to LINE_NUMB -1 loop
				for i in 0 to LINE_LENGTH -1 loop
					ram(j, i) <= x"00";
				end loop;
			end loop;
			for i in 0 to LINE_LENGTH -1 loop
				rb_read_data(i) <= x"00";
			end loop;
		when READY =>
			rb_busy <= '1';
			rb_read_data_rdy <= '0';
		when WRITE_CHAR =>
			rb_busy <= '0';
			if charPointer < LINE_LENGTH - 1 then
				ram(linePointer, charPointer) <= byte_buffer;
				charPointer <= charPointer + 1;
			end if;
		when DELETE_CHAR =>
			rb_busy <= '0';
			if charPointer >= 0 then
				ram(linePointer, charPointer - 1) <= x"00";
				charPointer <= charPointer - 1;
			end if;
		when LINE_REQ =>
			rb_busy <= '0';
			for i in 0 to LINE_LENGTH -1 loop
				rb_read_data(i) <= ram(conv_integer((rb_read_lineNr+linePointer)) mod LINE_NUMB, i);
			end loop;
		when LINE_RDY =>
			rb_read_data_rdy <= '1';
		when NEW_LINE =>
			--Der Zeiger auf die Zeile wird um eins erhöht und auf Überlauf kontrolliert
			if linePointer >= LINE_NUMB - 1 then
				linePointer <= 0;
				--Die neue Zeile wird gelöscht
				for i in 0 to LINE_LENGTH -1 loop
					ram(0,i) <= x"01";		--TODO nur zum testen, später wieder x"00"
				end loop;		
			else
				linePointer <= linePointer + 1;
				--Die neue Zeile wird gelöscht
				for i in 0 to LINE_LENGTH -1 loop
					ram(linePointer+1,i) <= x"01"; 	--TODO nur zum testen, später wieder x"00"
				end loop;
			end if;
			--Der Char Zeiger wird auf 0 zurückgesetzt
			charPointer <= 0;
		when others => null;
	end case;
end process output;

end ringbuffer_arc;
