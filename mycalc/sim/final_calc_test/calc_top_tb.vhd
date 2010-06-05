library ieee ;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.std_logic_arith.all;

use ieee.numeric_std.all;

use work.big_pkg.all;

--ENTITY
entity calc_top_tb is

end calc_top_tb;


--ARCHITECTURE
architecture behav of calc_top_tb is

--Variablen und Konstanten
constant clock_period:time := 30 ns;

	
	signal sys_clk, sys_res_n: std_logic;
	signal uart_rx		: std_logic;
	signal uart_tx		: std_logic;

	--VGA
	signal vga_free:std_logic;
	signal vga_clk:std_logic;

	--Input
	signal ps2_new_data 	: std_logic := '0';
	signal inp_new_data 	: std_logic := '0';
	signal inp_del 		: std_logic := '0';
	signal inp_sendRS232 	: std_logic := '0';
	signal pars_start 	: std_logic := '0';
	signal inp_data 	: std_logic_vector(7 downto 0) := x"00";
	signal ps2_data		: std_logic_vector(7 downto 0) := x"00";
	signal btn_a_sync	: std_logic := '0';

	--Output
	signal vga_command	: std_logic_vector(7 downto 0) := x"00";
	signal vga_command_data	: std_logic_vector(31 downto 0) := x"00000000";
	signal pars_new_data	: std_logic := '0';
	signal pars_data	: RESULT_LINE;

	--Ringbuffer
	signal rb_busy		: std_logic := '0';
	signal rb_char_newline	: std_logic := '0';
	signal rb_read_en	: std_logic := '0';
	signal rb_read_lineNr	: std_logic_vector(7 downto 0) := x"00";
	signal rb_read_data_rdy	: std_logic := '0';
	signal rb_pars_en	: std_logic := '0';
	signal rb_pars_lineNr	: std_logic_vector(7 downto 0) := x"00";
	signal rb_pars_data_rdy	: std_logic := '0';
	signal rb_read_data	: RAM_LINE;	

	--SerialHandler und RS232
	signal tx_rdy		: std_logic := '0';
	signal tx_go		: std_logic := '0';
	signal tx_data		: std_logic_vector(7 downto 0) := x"00";
	signal rx_recv		: std_logic := '0';
	signal rx_data		: std_logic_vector(7 downto 0) := x"00";

	--Parser
	signal pars_state	: parser_status_TYPE;

	--RAM
	signal wr		: std_logic;
	signal address		: integer range 0 to 4200;
	signal data_in		: std_logic_vector(7 downto 0);
	signal data_out		: std_logic_vector(7 downto 0);	


begin --behave

InputX : entity work.input_ent
	port map
	(
		sys_clk	=> sys_clk,
		sys_res_n => sys_res_n,
		ps2_new_data => ps2_new_data,
		ps2_data => ps2_data,
		inp_new_data => inp_new_data,
		inp_data => inp_data,
		inp_del => inp_del,
		inp_sendRS232 => inp_sendRS232,
		pars_start => pars_start,
		btn_a_sync => btn_a_sync
	);

OutputX : entity work.output_ent
	port map
	(
		sys_clk	=> sys_clk,
		sys_res_n => sys_res_n,
		vga_command => vga_command,
		vga_command_data => vga_command_data,
		vga_free => vga_free,
		inp_new_data => inp_new_data,
		inp_data => inp_data,
		inp_del => inp_del,
		pars_new_data => pars_new_data,
		pars_data => pars_data,
		pars_state => pars_state
	);

RamX : entity work.ram_ent
	port map
	(
		sys_clk	=> sys_clk,
		sys_res_n => sys_res_n,
		wr => wr,
		address => address,
		data_in => data_in,
		data_out => data_out
	);

RingX : entity work.ringbuffer2_ent
	port map
	(
		sys_clk	=> sys_clk,
		sys_res_n => sys_res_n,
		rb_busy => rb_busy,
		pars_new_data => pars_new_data,
		pars_data => pars_data,
		pars_state => pars_state,
		inp_new_data => inp_new_data,
		inp_data => inp_data,
		inp_del => inp_del,
		rb_read_en => rb_read_en,
		rb_read_lineNr => rb_read_lineNr,
		rb_read_data_rdy => rb_read_data_rdy,
		rb_read_data => rb_read_data,
		rb_pars_en => rb_pars_en,
		rb_pars_lineNr => rb_pars_lineNr,
		rb_pars_data_rdy => rb_pars_data_rdy,
		wr => wr,
		address => address,
		data_in => data_in,
		data_out => data_out
	);

Serialx : entity work.Serial_Handler_ent
	port map
	(
		sys_clk	=> sys_clk,
		sys_res_n => sys_res_n,
		inp_sendRS232 => inp_sendRS232,
		rb_busy => rb_busy,
		rb_read_en => rb_read_en,
		rb_read_lineNr => rb_read_lineNr,
		rb_read_data_rdy => rb_read_data_rdy,
		rb_read_data => rb_read_data,
		tx_rdy => tx_rdy,
		tx_go => tx_go,
		tx_data => tx_data,
		rx_recv => rx_recv,
		rx_data => rx_data
	);

RS232X : entity work.rs232_ent
	port map
	(
		sys_clk	=> sys_clk,
		sys_res_n => sys_res_n,
		tx_rdy => tx_rdy,
		tx_go => tx_go,
		tx_data => tx_data,
		rx_recv => rx_recv,
		rx_data => rx_data,
		uart_rx => uart_rx,
		uart_tx => uart_tx
	);

PARSERX : entity work.parser_top
	port map
	(
		sys_clk	=> sys_clk,
		sys_res_n => sys_res_n,
		rb_busy => rb_busy,
		rb_read_en => rb_pars_en,
		rb_read_lineNr => rb_pars_lineNr,
		rb_read_data_rdy => rb_pars_data_rdy,
		rb_read_data => rb_read_data,
		ps_start => pars_start,
		parse_new_data => pars_new_data,
		parse_data => pars_data,
		parse_state => pars_state
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
	-- INIT
	uart_rx <= '1';
	ps2_data <= x"00";
	ps2_new_data <= '0';
	vga_free <= '1';
	vga_clk <= '0';
	inp_sendRS232 <= '0';
	btn_a_sync <= '1';
	--wr <= '0';
	
	sys_res_n <= '0';
	wait for 45 ns;
	sys_res_n <= '1';
	wait for 90 ns;

	-- BEGIN TESTS
	-- Eingabe '7'
	ps2_data <= x"6C";
	wait for 30 ns;
	ps2_new_data <= '1';
	wait for 30 ns;
	ps2_new_data <= '0';
	wait for 30 ns;
	assert inp_data(7 downto 0) = x"37";
	wait for 90 ns;

	-- Eingabe '0'
	ps2_data <= x"70";
	wait for 30 ns;
	ps2_new_data <= '1';
	wait for 30 ns;
	ps2_new_data <= '0';
	wait for 30 ns;
	assert inp_data(7 downto 0) = "00110000";
	wait for 90 ns;

	-- Eingabe '+'
	ps2_data <= x"79";
	wait for 30 ns;
	ps2_new_data <= '1';
	wait for 30 ns;
	ps2_new_data <= '0';
	wait for 30 ns;
	assert inp_data(7 downto 0) = "00110000";
	wait for 90 ns;

	-- Eingabe '1'
	ps2_data <= x"69";
	wait for 30 ns;
	ps2_new_data <= '1';
	wait for 30 ns;
	ps2_new_data <= '0';
	wait for 30 ns;
	assert inp_data(7 downto 0) = x"37";
	wait for 90 ns;

	-- Eingabe '0'
	ps2_data <= x"70";
	wait for 30 ns;
	ps2_new_data <= '1';
	wait for 30 ns;
	ps2_new_data <= '0';
	wait for 30 ns;
	assert inp_data(7 downto 0) = "00110000";
	wait for 90 ns;

	-- Eingabe ENTER
	ps2_data <= x"5A";
	wait for 30 ns;
	ps2_new_data <= '1';
	wait for 30 ns;
	ps2_new_data <= '0';
	wait for 30 ns;
	assert inp_data(7 downto 0) = "00110000";
	wait for 90 ns;

	wait for 900 us;
end process;

end architecture behav;
