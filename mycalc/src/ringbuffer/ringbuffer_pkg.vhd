LIBRARY ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.big_pkg.all;

package ringbuffer_pkg is
    component ringbuffer_ent IS
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
		rb_read_data	: out RAM_LINE
	);
    END component ringbuffer_ent;
end package ringbuffer_pkg;
