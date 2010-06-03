LIBRARY ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.big_pkg.all;

package ringbuffer2_pkg is
    component ringbuffer2_ent IS
	port(
		sys_clk		: in std_logic;	
		sys_res_n	: in std_logic;
		rb_busy		: out std_logic;
		pars_new_data	: in std_logic;
		pars_data	: RESULT_LINE;
		pars_state	: in parser_status_TYPE;
		inp_new_data	: in std_logic;
		inp_data	: in std_logic_vector(7 downto 0);
		inp_del		: in std_logic;
		rb_char_newline	: in std_logic;
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
    END component ringbuffer2_ent;
end package ringbuffer2_pkg;
