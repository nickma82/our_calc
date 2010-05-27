library ieee;
use ieee.std_logic_1164.all;

use work.textmode_vga_platform_dependent_pkg.all;

entity calc_top is
  port
  (
	sys_clk : in std_logic;
	sys_res_n : in std_logic;
	btn_a : in std_logic;
	led_a: out std_logic;
	--led_b: out std_logic;
	ps2_data: inout std_logic;
	ps2_clk: inout std_logic;
	hsync_n: out std_logic;
	vsync_n: out std_logic;
	r: out std_logic_vector(RED_BITS-1 downto 0);
	g: out std_logic_vector(GREEN_BITS-1 downto 0);
	b: out std_logic_vector(BLUE_BITS-1 downto 0)
	uart_tx: out std_logic;
    	uart_rx: in std_logic
  );
end entity calc_top;
