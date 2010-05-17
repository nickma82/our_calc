library ieee ;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.std_logic_arith.all;

use ieee.numeric_std.all;

use work.textmode_vga_pkg.all;
use work.textmode_vga_component_pkg.all;
use work.textmode_vga_platform_dependent_pkg.all;

-- ENTITY
entity output_ent is
	--generic(
		
	--);
	port(
		sys_clk		: in std_logic;	
		sys_res_n	: in std_logic;
		vga_command	: out std_logic_vector(7 downto 0);
		vga_command_data	: out std_logic_vector(31 downto 0);
		vga_free		: in std_logic;
		inp_new_data		: in std_logic;
		inp_data		: in std_logic_vector(7 downto 0);
		inp_del			: in std_logic;
		pars_new_data		: in std_logic;
		pars_data		: in std_logic_vector(31 downto 0);
	);
end entity input_ent;


-- ARCHITECTURE
architecture output_arc of output_ent is

--type
type OUTPUT_FSM_STATE_TYPE is
    (INIT, READY, WRITE_CHAR, WRITE_RESULT, DELETE);

--constants
constant RED : std_logic_vector(23 downto 0) := x"0000FF";
constant GREEN : std_logic_vector(23 downto 0) := x"00FF00";
constant BLUE : std_logic_vector(23 downto 0) := x"FF0000";

--signals
signal output_fsm_state, output_fsm_state_next : INPUT_FSM_STATE_TYPE;
signal position : std_logic_vector(7 downto 0);

begin

sync : process(sys_clk, sys_res_n)
begin
	if sys_res_n = '0' then
		output_fsm_state <= INIT;
	elsif rising_edge(sys_clk) then
		output_fsm_state <= output_fsm_state_next;
	end if;

end process sync;

next_state : process(input_fsm_state, ps2_data, ps2_new_data)
begin
	output_fsm_state_next <= output_fsm_state;
	
	case output_fsm_state is
		when INIT => 
			output_fsm_state_next <= READY;
		when READY =>
			if inp_new_data = '1' then output_fsm_state_next <= WRITE_CHAR;
			elsif pars_new_data = '1' then output_fsm_state_next <= WRITE_RESULT;
			elsif inp_del = '1' then output_fsm_state_next <= DELETE;
			end if;
		when WRITE_CHAR =>
			if vga_free = '1' then
				output_fsm_state_next <= READY;
			end if;
		when WRITE_RESULT =>
			if vga_free = '1' then
				output_fsm_state_next <= READY;
			end if;
		when DELETE =>
			if vga_free = '1' then
				output_fsm_state_next <= READY;
			end if;
		when others => null;
	end case;
end process next_state;

output : process(output_fsm_state)
begin
	case output_fsm_state is
		when INIT =>
			vga_command <= COMMAND_SET_BACKGROUND;
			vga_command_data <= x"00FFFFFF";
			position => position + 1;
		when READY =>
		when WRITE_CHAR =>
			vga_command <= COMMAND_SET_CHAR;
			vga_command_data <= WHITE & inp_data;
			position => position + 1;
		when WRITE_RESULT =>
			vga_command <= COMMAND_SET_CHAR;
			vga_command_data <= WHITE & pars_data;
			position => 0;
		when DELETE =>
			vga_command <= COMMAND_SET_CURSOR_COLUMN;
			vga_command_data <= position - 1;
			position => position - 1;
		when others => null;
	end case;
end process output;

end input_arc;



