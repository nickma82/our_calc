library ieee ;
use ieee.std_logic_1164.all ;
use ieee.numeric_std.all ;

-- ENTITY
entity input_ent is
	--generic(
		
	--);
	port(
		clk	: in std_logic;	
		rst	: in std_logic;
		ps2_new_data	: in std_logic;
		ps2_data	: in std_logic_vektor(7 downto 0);
		inp_new_data	: out std_logic;
		inp_data	: out std_logic_vektor(7 downto 0);
		inp_del		: out std_logic;
		inp_sendRS232	: out std_logic;
		pars_start	: out std_logic;
	);
end entity;

-- ARCHITECTURE
architecture input_arc of input_ent is

--type
type INPUT_FSM_STATE_TYPE is
    (READY, VALID, SPECIAL, RELEASE, ENTER, BACKSPACE);

--constants

--signals
signal input_fsm_state, input_fsm_state_next : INPUT_FSM_STATE_TYPE;


begin

process(ps2_new_data)
begin

if ps2_new_data='1' then
	if ps2_data(7 downto 0) = '00001001' then

	end if;
end if;

end process

output : process(div_fsm_state)
begin
	case input_fsm_state is
		when VALID =>			inp_data <= ;
			inp_new_data <= '1';
		when ENTER =>
			pars_start <= '1';
		when BACKSPACE =>
			inp_del <= '1';
	end case;
end process output;

end input_arc;
