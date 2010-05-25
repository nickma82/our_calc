library ieee ;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.std_logic_arith.all;

use ieee.numeric_std.all;

use work.big_pkg.all;

use work.textmode_vga_pkg.all;
use work.textmode_vga_component_pkg.all;
use work.textmode_vga_platform_dependent_pkg.all;

-- ENTITY
entity output_ent is
	--generic(
		
	--);
	port(
		sys_clk			: in std_logic;	
		sys_res_n		: in std_logic;
		vga_command		: out std_logic_vector(7 downto 0);
		vga_command_data	: out std_logic_vector(31 downto 0);
		vga_free		: in std_logic;
		inp_new_data		: in std_logic;
		inp_data		: in std_logic_vector(7 downto 0);
		inp_del			: in std_logic;
		pars_new_data		: in std_logic;
		pars_data		: in std_logic_vector(7 downto 0)
	);
end entity output_ent;


-- ARCHITECTURE
architecture output_arc of output_ent is

--type
type OUTPUT_FSM_STATE_TYPE is
    (INIT, READY, WRITE_CHAR, WRITE_RESULT, DELETE, WAIT_STATE);

--constants
constant RED : std_logic_vector(23 downto 0) := x"0000FF";
constant GREEN : std_logic_vector(23 downto 0) := x"00FF00";
constant BLUE : std_logic_vector(23 downto 0) := x"FF0000";

--signals
signal output_fsm_state, output_fsm_state_next, state_after_wait, state_after_wait_next : OUTPUT_FSM_STATE_TYPE;
signal position, position_next		: std_logic_vector(7 downto 0);
signal vga_command_next			: std_logic_vector(7 downto 0);
signal vga_command_data_next		: std_logic_vector(31 downto 0);

begin

sync : process(sys_clk, sys_res_n)
begin
	if sys_res_n = '0' then
		output_fsm_state <= WAIT_STATE;
		state_after_wait <= INIT;
	elsif rising_edge(sys_clk) then
		output_fsm_state <= output_fsm_state_next;
		vga_command <= vga_command_next;
		vga_command_data <= vga_command_data_next;
		state_after_wait <= state_after_wait_next;
		position <= position_next;
	end if;

end process sync;

next_state : process(output_fsm_state, inp_new_data, pars_new_data, inp_del, vga_free, state_after_wait)
begin
	output_fsm_state_next <= output_fsm_state;
	state_after_wait_next <= state_after_wait;
	
	case output_fsm_state is
		when INIT => 
			if vga_free = '0' then
				output_fsm_state_next <= READY;
			end if;
		when READY =>
			if inp_new_data = '1' then 
				output_fsm_state_next <= WAIT_STATE;
				state_after_wait_next <= WRITE_CHAR;
			elsif pars_new_data = '1' then 
				output_fsm_state_next <= WAIT_STATE;
				state_after_wait_next <= WRITE_RESULT;
			elsif inp_del = '1' then 
				output_fsm_state_next <= WAIT_STATE;
				state_after_wait_next <= DELETE;
			end if;
		when WRITE_CHAR =>
			if vga_free = '0' then
				output_fsm_state_next <= READY;
			end if;
		when WRITE_RESULT =>
			if vga_free = '0' then
				output_fsm_state_next <= READY;
			end if;
		when DELETE =>
			if vga_free = '0' then
				output_fsm_state_next <= READY;
			end if;
		when WAIT_STATE =>
			if vga_free = '1' then
				output_fsm_state_next <= state_after_wait;
			end if;
			
		when others => null;
	end case;
end process next_state;

output : process(output_fsm_state, vga_free, position, inp_data, pars_data)
begin
	vga_command_next <= COMMAND_NOP;
	vga_command_data_next <= (others => '0');
	position_next <= position;

	if vga_free = '1' then
		case output_fsm_state is
			when INIT =>
				vga_command_next <= COMMAND_SET_BACKGROUND;
				vga_command_data_next <= x"00FFFFFF";
				position_next <= x"00";
			when WRITE_CHAR =>
				vga_command_next <= COMMAND_SET_CHAR;
				vga_command_data_next <= WHITE & inp_data;
				position_next <= position + 1;
			when WRITE_RESULT =>
				vga_command_next <= COMMAND_SET_CHAR;
				vga_command_data_next <= WHITE & pars_data;
				position_next <= x"00";
			when DELETE =>
				vga_command_next <= COMMAND_SET_CURSOR_COLUMN;
				vga_command_data_next <= x"000000"&(position - 1);
				position_next <= position - 1;
			when others => null;
		end case;
	end if;
end process output;

end output_arc;
