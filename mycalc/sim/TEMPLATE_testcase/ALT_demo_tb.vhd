library ieee;
use ieee.std_logic_1164.all;
use work.demo_pkg.all;

entity demo_tb is

end demo_tb;

architecture behav of demo_tb is

  component demo_top is

    port (
      clk   : in  std_logic;
      reset : in  std_logic;
      leds  : out std_logic_vector(7 downto 0));

  end component demo_top;


  signal clk : std_logic;
  signal reset : std_logic;
  signal leds : std_logic_vector(7 downto 0);

  constant QUARTZ_PERIOD : time := 40 ns;

begin  -- behav

  uut: demo_top
    port map (
      clk   => clk,
      reset => reset,
      leds  => leds);

  process
  begin  -- process
    clk <= '0';
    wait for QUARTZ_PERIOD / 2;
    clk <= '1';
    wait for QUARTZ_PERIOD / 2;
  end process;

  process
  begin  -- process
    reset <= RESETVALUE;
    wait for 10 * QUARTZ_PERIOD;
    reset <= not RESETVALUE;

    wait; -- infinite wait

    -- wait for 50 us;
    -- assert false report "Simulation done" severity failure;
  end process;

end behav;

