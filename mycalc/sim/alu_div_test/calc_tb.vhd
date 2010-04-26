library ieee;
use ieee.std_logic_1164.all;

entity alu_tb is
	
end entity alu_tb;

architecture behav of alu_tb is
  component alu_div_ent is
	PORT (
			 sys_clk, sys_res_n       : in    std_logic;
			 aclr	:	IN  STD_LOGIC := '0';
    		 dataa	:	IN  STD_LOGIC_VECTOR (31 DOWNTO 0);
    		 datab	:	IN  STD_LOGIC_VECTOR (31 DOWNTO 0);
    		 division_by_zero	:	OUT  STD_LOGIC;
    		 overflow	:	OUT  STD_LOGIC;
    		 result	:	OUT  STD_LOGIC_VECTOR (31 DOWNTO 0);
    		 calc_finished: OUT STD_LOGIC 
	);
  end component alu_div_ent;
  
  signal sys_clk, sys_res_n: std_logic;
  signal aclr, division_by_zero, overflow, calc_finished: std_logic;
  signal dataa, datab, result: STD_LOGIC_VECTOR (31 DOWNTO 0);
  
  signal stop : boolean := false;
  signal btn_a: std_logic;

begin --behave
  uut : alu_div_ent
    port map
    (
      aclr=>aclr,
      clk_en=>clk_en,
      clock=> sys_clk,
      dataa=> dataa,
      datab=> datab,
      division_by_zero=>division_by_zero,
      overflow=>overflow, 
      result=>result, 
      calc_finished=>calc_finished
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
    aclr<= '0';
    clk_en<='1';
    dataa <= (others => '0');
    datab <= (others => '0'); 
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
