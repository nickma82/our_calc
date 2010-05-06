library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity alu_tb is
	
end entity alu_tb;

architecture behav of alu_tb is




  
  
  signal sys_clk, sys_res_n: std_logic;
  signal stop : boolean := false;
  	
  	constant RESET_VALUE: std_logic := '0';
	constant SIZE: INTEGER := 32;
	--signal sys_clk, sys_res_n:    std_logic;
	--Division Module Signals
	--signal div_en, division_by_zero, div_calc_finished: std_logic;
	--signal div_number, div_dividend, div_result: STD_LOGIC_VECTOR((SIZE - 1) downto 0);
	----ALU fsm = controlling logic
	signal calc_data, calc_data2, calc_result: SIGNED((SIZE-1) downto 0);
	signal calc_operator, calc_status: STD_LOGIC_VECTOR(1 downto 0);
	signal calc_start, calc_finished: STD_LOGIC :='0';
	
begin --behave
  uut : entity work.alu_top
    generic map (
    	RESET_VALUE => RESET_VALUE
    )
    port map
    (
	    sys_clk	=> sys_clk,
	    sys_res_n	=> sys_res_n,

		calc_data	=> calc_data,
		calc_data2	=> calc_data2,
		calc_operator	=> calc_operator,
		calc_start	=> calc_start,
		calc_finished	=> calc_finished,
		calc_result	=> calc_result,
		calc_status	=> calc_status
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
    --RESET Pins
    wait for 100 ns;
    sys_res_n <= '1';
    -- BEGIN TESTS
    
    
    --wait for 500 ns;
    --num(3 downto 0) <= "1010";
    --didend(1 downto 0) <= "10";
    --wait for 10 ns;
    --div_en <= '1';
    --wait for 2 us;
    ---- coverage off
    -- assert result(3 downto 0) = "0101"
    --	 report "case fail"
    --	 severity failure;
    ---- coverage on
    --div_en <= '0';
    


	
    wait for 200 us;
    stop <= true;
    wait;
  end process;
end architecture behav;
