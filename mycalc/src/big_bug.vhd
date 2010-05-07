--GLOBAL PACKAGE


LIBRARY ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package big_pkg is
 constant SIZEI: INTEGER := 32;
 subtype CALCSIGNED is SIGNED((SIZEI-1) downto 0);

end package big_pkg;
