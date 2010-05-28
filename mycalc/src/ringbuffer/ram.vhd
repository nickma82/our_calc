library ieee ;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.std_logic_arith.all;

use ieee.numeric_std.all;

use work.big_pkg.all;


entity ram_ent is
	port(
		sys_clk		: in std_logic;	
		sys_res_n	: in std_logic;
		wr		: in std_logic;
		address		: in integer range 0 to 4090;
		data_in		: in std_logic_vector(7 downto 0);
		data_out	: out std_logic_vector(7 downto 0)
	);
end entity ram_ent;

architecture ram_arc of ram_ent is
type RAM_ARRAY is array (0 to (2 ** 12) - 1) of RAM_CELL; -- 4096
signal ram : RAM_ARRAY := (others => (others => '0'));

begin

process(sys_clk, sys_res_n)
	begin
		if(sys_res_n = '0') then
			data_out <= x"00";
		elsif(rising_edge(sys_clk)) then
			data_out <= ram(ram_offset);

			if wr = '1' then
				if address = 0 then
					ram(address) <= data_in;
				else
					ram(address-1) <= data_in;
				end if;
			end if;
		end if;
	end process;

end architecture ram_arc;
