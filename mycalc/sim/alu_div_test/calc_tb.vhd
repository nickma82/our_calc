library ieee;
use ieee.std_logic_1164.all;

entity alu_tb is
	
end entity alu_tb;

architecture behav of alu_tb is
  component alu_div_ent is
	PORT (
			 sys_clk, sys_res_n       : in    std_logic;
			 div_en	:	IN  STD_LOGIC := '0';
    		 num	:	IN  STD_LOGIC_VECTOR (31 DOWNTO 0);
    		 didend	:	IN  STD_LOGIC_VECTOR (31 DOWNTO 0);
    		 result	:	OUT  STD_LOGIC_VECTOR (31 DOWNTO 0);
    		 
    		 division_by_zero	:	OUT  STD_LOGIC;
    		 overflow	:	OUT  STD_LOGIC;
    		 calc_finished: OUT STD_LOGIC 
	);
  end component alu_div_ent;
  
  signal sys_clk, sys_res_n: std_logic;
  signal div_en, division_by_zero, overflow, calc_finished: std_logic;
  signal num, didend, result: STD_LOGIC_VECTOR (31 DOWNTO 0);
  
  signal stop : boolean := false;
  signal btn_a: std_logic;

begin --behave
  uut : alu_div_ent
    port map
    (
      sys_clk=>sys_clk,
      sys_res_n=>sys_res_n,
      div_en=>div_en,
      num=> num,
      didend=> didend,
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
    div_en<= '0';
    num <= (others => '0');
    didend <= (others => '0'); 
    wait for 100 ns;
    sys_res_n <= '1';
    -- BEGIN TESTS
    
    wait for 500 ns;
    num(3 downto 0) <= "1010";
    didend(1 downto 0) <= "10";
    wait for 10 ns;
    div_en <= '1';
    wait for 10 us;
    div_en <= '0';
    -- coverage off
    assert result(3 downto 0) = "0101"
    	 report "case fail"
    	 severity failure;
    -- coverage on
    

    
	
    wait for 20 ms;
    stop <= true;
    wait;
  end process;
end architecture behav;
