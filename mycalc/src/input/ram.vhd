

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity sp_ram is
	generic
	(
		ADDR_WIDTH : integer range1 to integer‘high;
		DATA_WIDTH : integer range1 to integer‘high
	);
	port
	(
		clk 		: in std_logic;
		address 	: in std_logic_vector(ADDR_WIDTH -1 downto 0);
		data_out 	: out std_logic_vector(DATA_WIDTH -1 downto 0);
		wr 		: in std_logic;
		data_in 	: in std_logic_vector(DATA_WIDTH -1 downto 0)
	);
end entity sp_ram;


architecture beh of sp_ram is
	type RAM_TYPE is array(0 to(2 ** ADDR_WIDTH) –1) of ASCII_CHAR;
	signal ram : RAM_TYPE := (others=> x”00”);

begin

process(clk)
	begin
	if rising_edge(clk) then
		data_out <= ram(to_integer(unsigned(address)));
		if wr= ‘1’ then
			ram(to_integer(unsigned(address))) <= data_in;
		end if;
	end if;
	end process;
end architecture beh;
