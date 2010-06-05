LIBRARY ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.big_pkg.all;

package input_pkg is
    component input_ent IS
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
    END component input_ent;
end package input_pkg;
