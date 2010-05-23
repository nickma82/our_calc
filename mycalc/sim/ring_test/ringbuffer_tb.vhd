library ieee ;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.std_logic_arith.all;

use ieee.numeric_std.all;

use work.big_pkg.all;

--ENTITY
entity ringbuffer_tb is

end ringbuffer_tb;


--ARCHITECTURE
architecture behav of ringbuffer_tb is

--Variablen und Konstanten
constant clock_period:time := 30 ns;

signal sys_clk, sys_res_n: std_logic;
signal rb_busy		: std_logic := '0';
signal pars_new_data	: std_logic := '0';
signal pars_data	: std_logic_vector(7 downto 0) := x"00";
signal inp_new_data	: std_logic := '0';
signal inp_data		: std_logic_vector(7 downto 0) := x"00";
signal inp_del		: std_logic := '0';
signal rb_char_newline	: std_logic := '0';
signal rb_read_en	: std_logic := '0';
signal rb_read_lineNr	: std_logic_vector(7 downto 0) := x"00";
signal rb_read_data_rdy	: std_logic := '0';
signal rb_read_data	: RAM_LINE;		

begin --behave

uut : entity work.ringbuffer_ent

port map
	(
		sys_clk	=> sys_clk,
		sys_res_n => sys_res_n,
		rb_busy => rb_busy,
		pars_new_data => pars_new_data,
		pars_data => pars_data,
		inp_new_data => inp_new_data,
		inp_data => inp_data,
		inp_del => inp_del,
		rb_char_newline => rb_char_newline,
		rb_read_en => rb_read_en,
		rb_read_lineNr => rb_read_lineNr,
		rb_read_data_rdy => rb_read_data_rdy,
		rb_read_data => rb_read_data
	);

clkgenerator : process
begin
	sys_clk <= '0';
	wait for clock_period/2;
	sys_clk <= '1';
	wait for clock_period/2;
end process clkgenerator;


process
begin
	sys_res_n <= '0';
	wait for 30 ns;
	sys_res_n <= '1';
	wait for 30 ns;

	-- BEGIN TESTS
	-- erste Zeile voll schreiben
	for i in 0 to 72 loop
		inp_data <= x"AF";
		wait for 30 ns;
		inp_new_data <= '1';
		wait for 30 ns;
		inp_new_data <= '0';
		wait for 30 ns;
		--assert ps2_data(7 downto 0) = "00110000";
		wait for 30 ns;
	end loop;
	
	inp_data <= x"20";
	wait for 30 ns;
	inp_new_data <= '1';
	wait for 30 ns;
	inp_new_data <= '0';
	wait for 30 ns;
	--assert ps2_data(7 downto 0) = "00110000";
	wait for 30 ns;
	
	inp_data <= x"01";
	wait for 30 ns;
	inp_new_data <= '1';
	wait for 30 ns;
	inp_new_data <= '0';
	wait for 30 ns;
	--assert ps2_data(7 downto 0) = "00110000";
	wait for 30 ns;
	
	--Zeichen löschen
	inp_del <= '1';
	wait for 30 ns;
	inp_del <= '0';
	wait for 30 ns;

	--Zeile abfragen
	rb_read_lineNr <= x"00";
	wait for 30 ns;
	rb_read_en <= '1';
	wait for 30 ns;
	rb_read_en <= '0';
	wait for 30 ns;
	--assert ps2_data(7 downto 0) = "00110000";
	wait for 30 ns;
	
	--neue Zeile
	rb_char_newline <= '1';
	wait for 30 ns;
	rb_char_newline <= '0';
	wait for 30 ns;

	--Zeile erneut abfragen
	rb_read_lineNr <= x"00";
	wait for 30 ns;
	rb_read_en <= '1';
	wait for 30 ns;
	rb_read_en <= '0';
	wait for 30 ns;
	--assert ps2_data(7 downto 0) = "00110000";
	wait for 30 ns;

	--testen ob überlauf der Zeilen funktioniert
	for i in 0 to 52 loop
		rb_char_newline <= '1';
		wait for 30 ns;
		rb_char_newline <= '0';
		wait for 30 ns;
	end loop;

end process;

end architecture behav;
