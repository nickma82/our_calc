library ieee;
use ieee.std_logic_1164.all;

entity calc_top is
  port
  (
	sys_clk : in std_logic;
	sys_res_n : in std_logic;
	btn_a : in std_logic;
	led_a: out std_logic;
	led_b: out std_logic
  );
end entity calc_top;