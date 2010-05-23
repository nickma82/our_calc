LIBRARY ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package serialhandler_pkg is
    component ringbuffer_entSerial_Handler_ent IS
	port(
		sys_clk		: in std_logic;	
		sys_res_n	: in std_logic;
		inp_sendRS232	: in std_logic;
		rb_busy		: in std_logic;
		rb_read_en	: out std_logic;
		rb_read_lineNr	: out std_logic_vector(7 downto 0);
		rb_read_data_rdy: in std_logic;
		rb_read_data	: in RAM_LINE;	
		tx_rdy		: in std_logic;
		tx_go		: out std_logic;
		tx_data		: out std_logic_vector(7 downto 0);
		rx_recv		: in std_logic;
		rx_data		: in std_logic_vector(7 downto 0)
	);
    END component Serial_Handler_ent;
end package serialhandler_pkg;
