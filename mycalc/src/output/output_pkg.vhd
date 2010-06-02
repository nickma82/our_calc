LIBRARY ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.big_pkg.all;

package output_pkg is
    component output_ent IS
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
		pars_data		: in RESULT_LINE;
		pars_state		: in parser_status_TYPE
	);
    END component output_ent;
end package output_pkg;
