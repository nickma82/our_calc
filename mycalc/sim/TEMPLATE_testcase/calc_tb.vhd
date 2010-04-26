library ieee;
use ieee.std_logic_1164.all;

entity calc_tb is

end entity calc_tb;

architecture behav of calc_tb is
  component calc_top is
    port
    (
    sys_clk : in std_logic;
    sys_res_n : in std_logic;
    btn_a : in std_logic;
	led_a: out std_logic;
	led_b: out std_logic
    );
  end component calc_top;
  
  signal sys_clk, sys_res_n : std_logic;
  signal btn_a : std_logic;
  signal led_a, led_b : std_logic;
  --signal seg_a, seg_b : std_logic_vector(6 downto 0);
  signal stop : boolean := false;

begin --behave
  uut : calc_top
    port map
    (
      sys_clk => sys_clk,
      sys_res_n => sys_res_n,
      btn_a => btn_a,
      led_a => led_a,
      led_b => led_b
    );
    
  process
  begin
    sys_clk <= '0';
    wait for 15 ns;
    sys_clk <= '1';
    if stop = true then
      wait;
    end if;
    wait for 15 ns;
  end process;
  
  process
  begin
    sys_res_n <= '0';
    btn_a <= '1';
    --RESET Pins
    wait for 100 ns;
    sys_res_n <= '1';
    wait for 2 ms;
    btn_a <= '0';
    wait for 100 us;
    btn_a <= '1';
    wait for 50 us;
    btn_a <= '0';
    wait for 150 us;
    btn_a <= '1';
    wait for 25 us;
    btn_a <= '0';
    wait for 175 us;
    btn_a <= '1';
    wait for 1 us;
    btn_a <= '0';
    wait for 2 ms;
    btn_a <= '1';
    wait for 100 us;
    btn_a <= '0';
    wait for 50 us;
    btn_a <= '1';
    wait for 150 us;
    btn_a <= '0';
    wait for 25 us;
    btn_a <= '1';
    wait for 175 us;
    btn_a <= '0';
    wait for 1 us;
    btn_a <= '1';
    wait for 2 ms;
    btn_a <= '0';
    wait for 100 us;
    btn_a <= '1';
    wait for 50 us;
    btn_a <= '0';
    wait for 150 us;
    btn_a <= '1';
    wait for 25 us;
    btn_a <= '0';
    wait for 175 us;
    btn_a <= '1';
    wait for 1 us;
    btn_a <= '0';
    wait for 2 ms;
    stop <= true;
    wait;
  end process;
end architecture behav;
