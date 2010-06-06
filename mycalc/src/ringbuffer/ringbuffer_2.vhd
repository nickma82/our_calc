library ieee ;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.std_logic_arith.all;

use ieee.numeric_std.all;

use work.big_pkg.all;

-- ENTITY
entity ringbuffer2_ent is
	--generic(
	
	--);
	port(
		sys_clk		: in std_logic;	
		sys_res_n	: in std_logic;
		rb_busy		: out std_logic;
		pars_new_data	: in std_logic;
		pars_data	: in RESULT_LINE;
		pars_state	: in parser_status_TYPE;
		inp_new_data	: in std_logic;
		inp_data	: in std_logic_vector(7 downto 0);
		inp_del		: in std_logic;
		--rb_char_newline	: in std_logic;
		rb_read_en	: in std_logic;
		rb_read_lineNr	: in std_logic_vector(7 downto 0);
		rb_read_data_rdy: out std_logic;
		rb_pars_en	: in std_logic;
		rb_pars_lineNr	: in std_logic_vector(7 downto 0);
		rb_pars_data_rdy: out std_logic;
		rb_read_data	: out RAM_LINE;
		wr		: out std_logic;
		address		: out integer range 0 to 4200;
		data_in		: out std_logic_vector(7 downto 0);
		data_out	: in std_logic_vector(7 downto 0)
	);
end entity ringbuffer2_ent;

-- ARCHITECTURE
architecture ringbuffer2_arc of ringbuffer2_ent is

type RINGBUFFER_FSM_STATE_TYPE is (INIT, READY, DELETE_CHAR, LINE_REQ, LINE_RDY, NEW_LINE, WRITE_RAM, READ_RAM, WAIT_RAM, PARS_REQ, PARS_RDY, WRITE_RESULT);

--signals
signal ringbuffer_fsm_state, ringbuffer_fsm_state_next : RINGBUFFER_FSM_STATE_TYPE;
signal linePointer, linePointer_next 	: integer range 0 to LINE_NUMB -1;				--zeigt auf die derzeitige Zeile, Zeile 0
signal charPointer, charPointer_next	: integer range 0 to LINE_LENGTH -1;				--zeigt auf derzeitigen Char in Zeile 0
signal byte_buffer, byte_buffer_next	: std_logic_vector(7 downto 0) := x"00";			--speichert zu schreibendes Byte zwischen
signal ram_buffer, ram_buffer_next	: std_logic_vector(7 downto 0);					--speichert RAM Byte zwischen zum lesen/schreiben
signal lineBuffer, lineBuffer_next	: RAM_LINE;							--speichert Line zwischen um Byte für Byte rein zu speichern
signal lineCounter, lineCounter_next	: integer range 0 to LINE_LENGTH;				--speichert beim wievielten Byte er gerade ließt
signal lineRead, lineRead_next 		: integer range 0 to LINE_NUMB -1;				--Speichert die zu lesende Zeile (linePointer + lineNR)
signal writeNextState, writeNextState_next	: RINGBUFFER_FSM_STATE_TYPE;
signal resultLine, resultLine_next	: RESULT_LINE;
signal resultCounter, resultCounter_next	: integer range -1 to LINE_LENGTH;
signal reqPars, reqPars_next		: std_logic := '0';

begin

sync : process(sys_clk, sys_res_n)
begin
	if sys_res_n = '0' then
		ringbuffer_fsm_state <= INIT;
	elsif rising_edge(sys_clk) then
		ringbuffer_fsm_state <= ringbuffer_fsm_state_next;
		linePointer <= linePointer_next;
		charPointer <= charPointer_next;
		byte_buffer <= byte_buffer_next;
		ram_buffer <= ram_buffer_next;
		lineBuffer <= lineBuffer_next;
		lineCounter <= lineCounter_next;
		lineRead <= lineRead_next;
		writeNextState <= writeNextState_next;
		resultLine <= resultLine_next;
		resultCounter <= resultCounter_next;
		reqPars <= reqPars_next;
	end if;

end process sync;

next_state : process(ringbuffer_fsm_state, inp_new_data, pars_new_data, rb_read_en, inp_del, inp_data, pars_data, charPointer, byte_buffer, writeNextState, lineRead, linePointer, rb_read_lineNr, rb_pars_en, lineCounter, resultLine, pars_state, resultCounter, reqPars)
begin
	ringbuffer_fsm_state_next <= ringbuffer_fsm_state;
	byte_buffer_next <= byte_buffer;
	lineRead_next <= lineRead;
	writeNextState_next <= writeNextState;
	resultLine_next <= resultLine;
	reqPars_next <= reqPars;
	
	case ringbuffer_fsm_state is
		when INIT =>
			ringbuffer_fsm_state_next <= READY;
		when READY =>
			if inp_new_data = '1' and charPointer < 70 then
				byte_buffer_next <= inp_data;
				ringbuffer_fsm_state_next <= WRITE_RAM;
			elsif pars_new_data = '1' then
				case pars_state is
					when PGOOD =>
						resultLine_next <= pars_data;
						ringbuffer_fsm_state_next <= WRITE_RESULT;
					when PDIV_ZERO =>
						resultLine_next <= MSG_ZERO;
						ringbuffer_fsm_state_next <= WRITE_RESULT;
					when POVERFLOW =>
						resultLine_next <= MSG_OVERFLOW;
						ringbuffer_fsm_state_next <= WRITE_RESULT;
					when PTOO_MUCH_OPS =>
						resultLine_next <= MSG_SYNTAX;
						ringbuffer_fsm_state_next <= WRITE_RESULT;
					when PINVALID_OP_SEQUENCE =>
						resultLine_next <= MSG_SYNTAX;
						ringbuffer_fsm_state_next <= WRITE_RESULT;
					when others => null;
				end case;
			elsif rb_read_en = '1' then
				reqPars_next <= '0';
				ringbuffer_fsm_state_next <= READ_RAM;
				writeNextState_next <= LINE_REQ;
				if linePointer + rb_read_lineNr >= LINE_NUMB then
					lineRead_next <= conv_integer((rb_read_lineNr+linePointer)) - LINE_NUMB;
				else
					lineRead_next <= conv_integer((rb_read_lineNr+linePointer));
				end if;
			elsif rb_pars_en = '1' then
				reqPars_next <= '1';
				ringbuffer_fsm_state_next <= READ_RAM;
				writeNextState_next <= PARS_REQ;
				lineRead_next <= conv_integer((linePointer));
			elsif inp_del = '1' then ringbuffer_fsm_state_next <= DELETE_CHAR;
			--elsif rb_char_newline = '1' then ringbuffer_fsm_state_next <= NEW_LINE;
			end if;
		when DELETE_CHAR =>
			ringbuffer_fsm_state_next <= READY;
		when LINE_REQ =>
			if rb_read_en = '0' then ringbuffer_fsm_state_next <= LINE_RDY;
			end if;
		when LINE_RDY =>
			ringbuffer_fsm_state_next <= READY;
		when PARS_REQ =>
			if rb_pars_en = '0' then ringbuffer_fsm_state_next <= PARS_RDY;
			end if;
		when PARS_RDY =>
			ringbuffer_fsm_state_next <= READY;
		when NEW_LINE =>
			ringbuffer_fsm_state_next <= READY;
		when WRITE_RAM =>
			ringbuffer_fsm_state_next <= READY;
		when READ_RAM =>
			ringbuffer_fsm_state_next <= WAIT_RAM;
		when WAIT_RAM =>
			if lineCounter >= LINE_LENGTH - 1 then
				if reqPars = '0' then
					ringbuffer_fsm_state_next <= LINE_REQ;
				else
					ringbuffer_fsm_state_next <= PARS_REQ;
				end if;
			else
				ringbuffer_fsm_state_next <= READ_RAM;
			end if;
		when WRITE_RESULT =>
			if resultCounter = 0 then
				ringbuffer_fsm_state_next <= NEW_LINE;
			end if;
		when others => null;
	end case;
end process next_state;

output : process(ringbuffer_fsm_state, charPointer, byte_buffer, linePointer, rb_read_lineNr, lineCounter, lineRead, ram_buffer, lineBuffer, data_out, resultLine, resultCounter)
begin
	linePointer_next <= linePointer;
	charPointer_next <= charPointer;
	ram_buffer_next <= ram_buffer;
	lineCounter_next <= lineCounter;
	lineBuffer_next <= lineBuffer;
	resultCounter_next <= resultCounter;

	rb_busy <= '1';
	rb_read_data_rdy <= '0';
	wr <= '0';
	data_in <= x"00";
	address <= 0;
	rb_pars_data_rdy <= '0';

	for i in 0 to LINE_LENGTH -1 loop
		rb_read_data(i) <= x"00";
	end loop;

	case ringbuffer_fsm_state is
		when INIT =>
			rb_busy <= '0';
			linePointer_next <= 0;
			charPointer_next <= 0;
			rb_read_data <= (others => (others => '0'));
			ram_buffer_next <= x"00";
			lineCounter_next <= 0;
			--byte_Buffer_next <= x"00";
		when READY =>
			rb_busy <= '1';
			rb_read_data_rdy <= '0';
			lineCounter_next <= 0;
			resultCounter_next <= 11;
		when DELETE_CHAR =>
			rb_busy <= '0';
			if charPointer >= 0 then
				wr <= '1';
				data_in <= x"00";
				address <= charPointer-1+linePointer * LINE_LENGTH;
				charPointer_next <= charPointer - 1;
			end if;
		when LINE_REQ =>
			rb_busy <= '0';
			rb_read_data_rdy <= '1';
			rb_read_data <= lineBuffer;
		when LINE_RDY =>
			rb_busy <= '0';
			rb_read_data_rdy <= '1';
			rb_read_data <= lineBuffer;
		when PARS_REQ =>
			rb_busy <= '0';
			rb_pars_data_rdy <= '1';
			rb_read_data <= lineBuffer;
		when PARS_RDY =>
			rb_busy <= '0';
			rb_pars_data_rdy <= '1';
			rb_read_data <= lineBuffer;
		when NEW_LINE =>
			rb_busy <= '0';
			--Der Zeiger auf die Zeile wird um eins erhöht und auf Überlauf kontrolliert
			--TODO Die neue Zeile muss gelöscht werden
			if linePointer >= LINE_NUMB - 1 then
				linePointer_next <= 0;
			else
				linePointer_next <= linePointer + 1;
			end if;
			--Der Char Zeiger wird auf 0 zurückgesetzt
			charPointer_next <= 0;
		when WRITE_RAM =>
			rb_busy <= '0';
			if charPointer < LINE_LENGTH - 1 then
				wr <= '1';
				data_in <= byte_buffer;
				address <= charPointer+linePointer * LINE_LENGTH;
				charPointer_next <= charPointer + 1;
			end if;
		when READ_RAM =>
			rb_busy <= '0';
			address <= lineRead*LINE_LENGTH + lineCounter;
		when WAIT_RAM =>
			rb_busy <= '0';
			address <= lineRead*LINE_LENGTH + lineCounter;
			lineBuffer_next(lineCounter) <= data_out;			
			lineCounter_next <= lineCounter + 1;
		when WRITE_RESULT =>
			rb_busy <= '0';
			if resultCounter = 11 then
				wr <= '1';
				data_in <= x"3D";
				address <= charPointer+linePointer * LINE_LENGTH;
				charPointer_next <= charPointer + 1;
				resultCounter_next <= resultCounter - 1;
			elsif resultCounter >= 0 then
				wr <= '1';
				data_in <= resultLine(resultCounter);
				address <= charPointer+linePointer * LINE_LENGTH;
				charPointer_next <= charPointer + 1;
				resultCounter_next <= resultCounter - 1;	
			end if;
		when others => null;
	end case;
end process output;

end ringbuffer2_arc;
