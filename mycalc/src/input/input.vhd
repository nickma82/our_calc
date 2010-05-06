library ieee ;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.std_logic_arith.all;

use ieee.numeric_std.all;

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
		pars_start	: out std_logic
	);
end entity input_ent;

-- ARCHITECTURE
architecture input_arc of input_ent is

--type
type INPUT_FSM_STATE_TYPE is
    (READY, VALID, SPECIAL, RELEASE, ENTER, BACKSPACE);

--constants

--signals
signal input_fsm_state, input_fsm_state_next : INPUT_FSM_STATE_TYPE;
signal ascii : std_logic_vector(7 downto 0);


begin

sync : process(sys_clk, sys_res_n)
begin
	if sys_res_n = '0' then
		input_fsm_state <= READY;
	elsif rising_edge(sys_clk) then
		input_fsm_state <= input_fsm_state_next;
	end if;

end process sync;

next_state : process(input_fsm_state, ps2_data, ps2_new_data)
begin
	input_fsm_state_next <= input_fsm_state;
	
	case input_fsm_state is
		when READY =>
			if ps2_new_data = '1' then
			case ps2_data is
				when x"70" =>   -- '0'
					ascii <= x"30";
					input_fsm_state_next <= VALID;
				when x"69" =>   -- '1'
					ascii <= x"31";
					input_fsm_state_next <= VALID;
				when x"72" =>   -- '2'
					ascii <= x"32";
					input_fsm_state_next <= VALID;
				when x"7A" =>   -- '3'
					ascii <= x"33";
					input_fsm_state_next <= VALID;
				when x"6B" =>   -- '4'
					ascii <= x"34";
					input_fsm_state_next <= VALID;
				when x"73" =>   -- '5'
					ascii <= x"35";
					input_fsm_state_next <= VALID;
				when x"74" =>   -- '6'
					ascii <= x"36";
					input_fsm_state_next <= VALID;
				when x"6C" =>   -- '7'
					ascii <= x"37";
					input_fsm_state_next <= VALID;
				when x"75" =>   -- '8'
					ascii <= x"38";
					input_fsm_state_next <= VALID;
				when x"7D" =>   -- '9'
					ascii <= x"39";
					input_fsm_state_next <= VALID;	
				when x"79" =>   -- '+'
					ascii <= x"2B";
					input_fsm_state_next <= VALID;		
				when x"7B" =>   -- '-'
					ascii <= x"2D";
					input_fsm_state_next <= VALID;
				when x"7C" =>   -- '*'
					ascii <= x"2A";
					input_fsm_state_next <= VALID;
				when x"66" =>   -- Backspace
					input_fsm_state_next <= BACKSPACE;
				when x"5A" =>   -- Enter
					input_fsm_state_next <= ENTER;
				when x"29" =>   -- Space
					ascii <= x"20";
					input_fsm_state_next <= VALID;
				when x"F0" => input_fsm_state_next <= RELEASE;
				when x"E0" => input_fsm_state_next <= SPECIAL;
				when others => null;
			end case;
			end if;
      		when VALID =>
			input_fsm_state_next <= READY;
		when SPECIAL =>
			case ps2_data is
				when x"4A" => -- '/'
					if ps2_new_data = '1' then 
						input_fsm_state_next <= Valid; 
					end if;
				when others => null;
				
			end case;
		when RELEASE =>
			if ps2_new_data = '1' then input_fsm_state_next <= READY; end if;
		when ENTER =>
			input_fsm_state_next <= READY;
		when BACKSPACE =>
			input_fsm_state_next <= READY;
	end case;
end process next_state;

output : process(input_fsm_state)
begin
	case input_fsm_state is
		when READY =>
			inp_new_data <= '0';
			pars_start <= '0';
			inp_del <= '0';
		when VALID =>			inp_data <= ascii;
			inp_new_data <= '1';
		when ENTER =>
			pars_start <= '1';
		when BACKSPACE =>
			inp_del <= '1';
		when others => null;
	end case;
end process output;

end input_arc;
