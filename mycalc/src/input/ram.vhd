

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity sp_ram is
	generic
	(
		LINE_COUNT : 50;
		CHAR_COUNT : 81;
		ADDR_WIDTH : std_logic_vector( log2c(CHAR_COUNT * (LINE_COUNT +1) ) -1 downto 0); --13 Bit breit
		DATA_WIDTH : 8;
	);
	port
	(
		clk 		: in std_logic;
		--address 	: in std_logic_vector(ADDR_WIDTH -1 downto 0);
		line_address 	: in std_logic_vector(0 to LINE_COUNT -1);	
		byte_address 	: in std_logic_vector(0 to CHAR_COUNT -1);
		data_out 	: out std_logic_vector(DATA_WIDTH -1 downto 0);
		wr 		: in std_logic;
		data_in 	: in std_logic_vector(DATA_WIDTH -1 downto 0)
	);
end entity sp_ram;


architecture beh of sp_ram is
	subtype RAM_ENTRY_TYPE is std_logic_vector(DATA_WIDTH - 1 downto 0);
	type RAM_TYPE is array(0 to(2 ** ADDR_WIDTH) – 1) of RAM_ENTRY_TYPE;--ASCII_CHAR;
	signal ram : RAM_TYPE := (others=> x”00”);

begin

process(clk)
	begin
	if rising_edge(clk) then
		data_out <= ram(to_integer(unsigned(line_address * CHAR_COUNT + byte_address)));
		if wr= ‘1’ then
			ram(to_integer(unsigned(line_address * CHAR_COUNT + byte_address))) <= data_in;
		end if;
	end if;
	end process;
end architecture beh;
