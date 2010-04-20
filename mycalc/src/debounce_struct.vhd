library ieee;
use ieee.std_logic_1164.all;
use work.sync_pkg.all;
use work.debounce_pkg.all;
use work.math_pkg.all;

architecture struct of debounce is
  constant CLK_PERIOD : time := 1E9 / CLK_FREQ * 1 ns;
  constant CNT_MAX : integer := TIMEOUT / CLK_PERIOD;
  signal data_sync : std_logic;
  signal clear_cnt : std_logic;
  signal cnt : std_logic_vector(log2c(CNT_MAX) - 1 downto 0);
begin
  sync_inst : sync
    generic map
    (
      SYNC_STAGES => SYNC_STAGES,
      RESET_VALUE => RESET_VALUE
    )
    port map
    (
      sys_clk => sys_clk,
      sys_res_n => sys_res_n,
      data_in => data_in,
      data_out => data_sync
    );

  fsm_inst : debounce_fsm
    generic map
    (
      RESET_VALUE => RESET_VALUE,
      CNT_MAX => CNT_MAX
    )
    port map
    (
      sys_clk => sys_clk,
      sys_res_n => sys_res_n,
      i => data_sync,
      o => data_out,
      clear_cnt => clear_cnt,
      cnt => cnt
    );

  counter_inst : counter
    generic map
    (
      CNT_MAX => CNT_MAX
    )
    port map
    (
      sys_clk => sys_clk,
      sys_res_n => sys_res_n,
      clear_cnt => clear_cnt,
      cnt => cnt
    );
end architecture struct;
