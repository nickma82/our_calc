LIBRARY ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.big_pkg.all;

package ringbuffer2_pkg is
    component ringbuffer2_ent IS
	port(
		sys_clk		: in std_logic;	
		sys_res_n	: in std_logic;
		wr		: in std_logic;
		address		: in integer range 0 to 4090;
		data_in		: in std_logic_vector(7 downto 0);
		data_out	: out std_logic_vector(7 downto 0)
	);
    END component ringbuffer2_ent;
end package ringbuffer2_pkg;
