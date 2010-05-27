LIBRARY ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package rs232_pkg is
    component rs232_ent IS
	port(
		sys_clk		: in std_logic;	
		sys_res_n	: in std_logic;
		uart_rx		: in std_logic;
		uart_tx		: out std_logic;
		tx_rdy		: out std_logic;
		tx_go		: in std_logic;
		tx_data		: in std_logic_vector(7 downto 0);
		rx_recv		: out std_logic;
		rx_data		: out std_logic_vector(7 downto 0)
	);
    END component rs232_ent;
end package rs232_pkg;
