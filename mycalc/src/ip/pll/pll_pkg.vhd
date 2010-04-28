

-- @module : pll_pkg
-- @author : s0726179
-- @date   : Apr 26, 2010


library ieee;
use ieee.std_logic_1164.all;


package pll_pkg is
  component pll is
	PORT
	(
		inclk0		: IN STD_LOGIC  := '0';
		c0		: OUT STD_LOGIC 
	);
  end component pll;
end package pll_pkg;  
 







