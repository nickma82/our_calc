library ieee ;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.std_logic_arith.all;

use ieee.numeric_std.all;

use work.big_pkg.all;

-- ENTITY
entity input_ent is
	--generic(
		
	--);
	port(
		sys_clk		: in std_logic;	
		sys_res_n	: in std_logic;
		ps2_new_data	: in std_logic;
		ps2_data	: in std_logic_vector(7 downto 0);
		inp_new_data	: out std_logic;
		inp_data	: out std_logic_vector(7 downto 0);
		inp_del		: out std_logic;
		inp_sendRS232	: out std_logic;
		pars_start	: out std_logic;
		btn_a_sync	: in std_logic
		--pars_new_data	: out std_logic;
		--pars_data	: out RESULT_LINE;
		--pars_state	: out parser_status_TYPE
	);
end entity input_ent;

-- ARCHITECTURE
architecture input_arc of input_ent is

--type
type INPUT_FSM_STATE_TYPE is
    (READY, VALID, SPECIAL, RELEASE, ENTER, BACKSPACE, HISTORY, WAIT_BUTTON, TEST);

--constants

--signals
signal input_fsm_state, input_fsm_state_next : INPUT_FSM_STATE_TYPE;
signal ascii, ascii_next		: std_logic_vector(7 downto 0):= x"00";
signal btn_a_sync_last, btn_a_sync_last_next : std_logic := '0';

begin

sync : process(sys_clk, sys_res_n)
begin
	if sys_res_n = '0' then
		input_fsm_state <= READY;
	elsif rising_edge(sys_clk) then
		input_fsm_state <= input_fsm_state_next;
		ascii <= ascii_next;
		btn_a_sync_last <= btn_a_sync_last_next;
	end if;

end process sync;

next_state : process(input_fsm_state, ps2_data, ps2_new_data, ascii, btn_a_sync, btn_a_sync_last)
begin
	input_fsm_state_next <= input_fsm_state;
	ascii_next <= ascii;
	btn_a_sync_last_next <= btn_a_sync_last;
	
	
	case input_fsm_state is
		when READY =>
			if ps2_new_data = '1' then
			case ps2_data is
				when x"70" =>   -- '0'
					ascii_next <= x"30";
					input_fsm_state_next <= VALID;
				when x"69" =>   -- '1'
					ascii_next <= x"31";
					input_fsm_state_next <= VALID;
				when x"72" =>   -- '2'
					ascii_next <= x"32";
					input_fsm_state_next <= VALID;
				when x"7A" =>   -- '3'
					ascii_next <= x"33";
					input_fsm_state_next <= VALID;
				when x"6B" =>   -- '4'
					ascii_next <= x"34";
					input_fsm_state_next <= VALID;
				when x"73" =>   -- '5'
					ascii_next <= x"35";
					input_fsm_state_next <= VALID;
				when x"74" =>   -- '6'
					ascii_next <= x"36";
					input_fsm_state_next <= VALID;
				when x"6C" =>   -- '7'
					ascii_next <= x"37";
					input_fsm_state_next <= VALID;
				when x"75" =>   -- '8'
					ascii_next <= x"38";
					input_fsm_state_next <= VALID;
				when x"7D" =>   -- '9'
					ascii_next <= x"39";
					input_fsm_state_next <= VALID;	
				when x"79" =>   -- '+'
					ascii_next <= x"2B";
					input_fsm_state_next <= VALID;		
				when x"7B" =>   -- '-'
					ascii_next <= x"2D";
					input_fsm_state_next <= VALID;
				when x"7C" =>   -- '*'
					ascii_next <= x"2A";
					input_fsm_state_next <= VALID;
				when x"66" =>   -- Backspace
					input_fsm_state_next <= BACKSPACE;
				when x"5A" =>   -- Enter
					input_fsm_state_next <= ENTER;
				when x"29" =>   -- Space
					ascii_next <= x"20";
					input_fsm_state_next <= VALID;
				when x"F0" => input_fsm_state_next <= RELEASE;
				when x"E0" => input_fsm_state_next <= SPECIAL;
				when x"49" =>	-- '.' zum RS232 senden
					input_fsm_state_next <= HISTORY;
				when x"41" => -- ',' zum Pars Test
					input_fsm_state_next <= TEST;
				when others => null;
			end case;
			elsif btn_a_sync = '0' then
				input_fsm_state_next <= HISTORY;
			end if;
      		when VALID =>
			input_fsm_state_next <= READY;
		when SPECIAL =>
			case ps2_data is
				when x"4A" => -- '/'
					if ps2_new_data = '1' then 
						ascii_next <= x"2F";
						input_fsm_state_next <= Valid; 
					end if;
				when others => 
					if ps2_new_data = '1' then 
						ascii_next <= x"00";
						input_fsm_state_next <= READY; 
					end if;				
			end case;
		when RELEASE =>
			if ps2_new_data = '1' then input_fsm_state_next <= READY; end if;
		when ENTER =>
			input_fsm_state_next <= READY;
		when BACKSPACE =>
			input_fsm_state_next <= READY;
		when HISTORY =>
			input_fsm_state_next <= WAIT_BUTTON;
		when WAIT_BUTTON =>
			if btn_a_sync = '1' then
				input_fsm_state_next <= READY;
			end if;
		when TEST =>
			input_fsm_state_next <= READY;
	end case;
end process next_state;

output : process(input_fsm_state, ascii)
begin
	inp_new_data <= '0';
	pars_start <= '0';
	inp_del <= '0';
	inp_sendRS232 <= '0';
	inp_data <= ascii;

	--pars_new_data <= '0';
	--pars_data <= (others => (others => '0'));
	--pars_state <= PRESET;
	
	case input_fsm_state is
		when READY =>
			inp_new_data <= '0';
			pars_start <= '0';
			inp_del <= '0';
			inp_sendRS232 <= '0';
		when VALID =>
			inp_data <= ascii;
			inp_new_data <= '1';
		when ENTER =>
			pars_start <= '1';
		when BACKSPACE =>
			inp_del <= '1';
		when HISTORY =>
			inp_sendRS232 <= '1';
		when WAIT_BUTTON =>
			inp_sendRS232 <= '0';
		when TEST =>
			--pars_new_data <= '1';
			--pars_data <= (10 => x"2B", 9 => x"31", 8 => x"32", 7 => x"33", 6 => x"34", 5 => x"35", 4 => x"00", 3 => x"00", 2 => x"00", 1 => x"00", 0 => x"00");
			--pars_state <= PGOOD;
		when others => null;
	end case;
end process output;

end input_arc;
