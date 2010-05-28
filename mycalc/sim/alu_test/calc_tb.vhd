library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
--use work.alu_pkg.all;
use work.big_pkg.all;

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
	signal calc_data, calc_data2, calc_result: CALCSIGNED;
	signal calc_operator: alu_operator_TYPE;
	signal calc_status: alu_calc_error_TYPE;
	signal calc_start, calc_finished: STD_LOGIC;
	
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
    --######## RESET Pins #######
    calc_start <= '0';
    calc_data <= (others => '0');
    calc_data2 <= (others => '0');
    calc_operator <= NOP;
    wait for 100 ns;
    sys_res_n <= '1';
    -- BEGIN TESTS
    
    wait for 500 ns;
    calc_data <=  to_signed(10, SIZEI); --Integer to Signed
    calc_data2 <= to_signed(2, SIZEI);
    calc_operator <= ADDITION;
    wait for 10 ns;
    calc_start <= '1';
    wait for 2 us;
    -- coverage off
    assert calc_result(3 downto 0) = "1100"
		report "result failed" 	severity failure;
    -- coverage on
    calc_start <= '0';
    
    
    wait for 500 ns;
    calc_data <=  to_signed(10, SIZEI); --Integer to Signed
    calc_data2 <= to_signed(2, SIZEI);
    calc_operator <= ADDITION;
    wait for 10 ns;
    calc_start <= '1';
    wait for 2 us;
    -- coverage off
    assert calc_result(3 downto 0) = "1100"
		report "result failed" 	severity failure;
    -- coverage on
    calc_start <= '0';
    
    
    wait for 500 ns;
    calc_data <=  "01111111111111111111111111111111";
    calc_data2 <= "00000000000000000000000000000001";
    calc_operator <= ADDITION;
    --wait for 10 ns;
    calc_start <= '1';
    wait for 2 us;
    ---- coverage off
    -- assert calc_result(3 downto 0) = "0101"
    --	 report "result failed"	 severity failure;
    ---- coverage on
    calc_start <= '0';
	
	wait for 500 ns;
    calc_data <=  "10000000000000000000000000000000";
    calc_data2 <= "00000000000000000000000000000001";
    calc_operator <= ADDITION;
    --wait for 10 ns;
    calc_start <= '1';
    wait for 2 us;
    ---- coverage off
    -- assert calc_result(3 downto 0) = "0101"
    --	 report "result failed"	 severity failure;
    ---- coverage on
    calc_start <= '0';

    
    wait for 500 ns;
    calc_data <=  to_signed(-13, SIZEI); --Integer to Signed
    calc_data2 <= to_signed(11, SIZEI);
    calc_operator <= MULTIPLIKATION;
    wait for 10 ns;
    calc_start <= '1';
    wait for 2 us;
    -- coverage off
    assert calc_result= to_signed(-143, SIZEI)
		report "result failed" 	severity failure;
    -- coverage on
    calc_start <= '0';

    wait for 500 ns;
    calc_data <=  to_signed(-13, SIZEI); --Integer to Signed
    calc_data2 <= to_signed(0, SIZEI);
    calc_operator <= MULTIPLIKATION;
    wait for 10 ns;
    calc_start <= '1';
    wait for 2 us;
    -- coverage off
    assert calc_result= to_signed(0, SIZEI)
		report "result failed" 	severity failure;
    -- coverage on
    calc_start <= '0';

	---- DIVISIONEN
	wait for 5 us;
	calc_data <=  to_signed(-20, SIZEI); --Integer to Signed
	calc_data2 <= to_signed(2, SIZEI);
	calc_operator <= DIVISION;
	wait for 10 ns;
	calc_start <= '1';
	wait for 2 us;
	-- coverage off
	assert calc_result= to_signed(-10, SIZEI)
		report "result failed" 	severity failure;
	-- coverage on
	calc_start <= '0';
	
	wait for 500 ns;
	calc_data <=  to_signed(-133, SIZEI); --Integer to Signed
	calc_data2 <= to_signed(-12, SIZEI);
	calc_operator <= DIVISION;
	wait for 10 ns;
	calc_start <= '1';
	wait for 2 us;
	-- coverage off
	assert calc_result= to_signed(11, SIZEI)
		report "result failed" 	severity failure;
	-- coverage on
	calc_start <= '0';
	
	wait for 500 ns;
	calc_data <=  to_signed(-20, SIZEI); --Integer to Signed
	calc_data2 <= to_signed(0, SIZEI);
	calc_operator <= DIVISION;
	wait for 10 ns;
	calc_start <= '1';
	wait for 2 us;
	-- coverage off
	assert calc_status= DIV_ZERO
		report "calc status failed" 	severity failure;
	-- coverage on
	calc_start <= '0';

	wait for 500 ns;
	calc_data <=  to_signed(2147483647, SIZEI); --Integer to Signed
	calc_data2 <= to_signed(-2147483647, SIZEI);
	calc_operator <= DIVISION;
	wait for 10 ns;
	calc_start <= '1';
	wait for 2 us;
	-- coverage off
	assert calc_result= to_signed(-1, SIZEI)
		report "result failed" 	severity failure;
	-- coverage on
	calc_start <= '0';
	
    wait for 200 us;
    stop <= true;
    wait;
  end process;
end architecture behav;
