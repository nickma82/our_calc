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
    END component ringbuffer2_ent;

    component ram_ent IS
	port(
		sys_clk		: in std_logic;	
		sys_res_n	: in std_logic;
		wr		: in std_logic;
		address		: in integer range 0 to 4090;
		data_in		: in std_logic_vector(7 downto 0);
		data_out	: out std_logic_vector(7 downto 0)
	);
    END component ram_ent;

begin

	ram_inst: ram_ent
	port map
	( 
		sys_clk		=> sys_clk,
		sys_res_n	=> sys_res_n,
		rb_busy		=> rb_busy,
		pars_new_data	=> pars_new_data,
		pars_data	=> pars_data,
		inp_new_data	=> inp_new_data,
		inp_data	=> inp_data,
		inp_del		=> inp_del,
		rb_char_newline	=> rb_char_newline,
		rb_read_en	=> rb_read_en,
		rb_read_lineNr	=> rb_read_lineNr,
		rb_read_data_rdy=> rb_read_data_rdy,
		rb_read_data	=> rb_read_data
	); 

end package ringbuffer2_pkg;
