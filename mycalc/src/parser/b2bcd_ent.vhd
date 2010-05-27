library ieee;
use ieee.std_logic_1164.all;
use work.big_pkg.all;
use work.parser_pkg.all;


--double dabble
entity b2bcd_ent is
  generic
  (
	RESET_VALUE : std_logic := '0'
  );
  port
  (	sys_clk, sys_res_n       : in    std_logic;
	
	b2bcd_en:	IN STD_LOGIC;
	b2bcd_data:	IN CALCSIGNED;
	b2bcd_data_neg: IN STD_LOGIC;
	b2bcd_data_rdy: OUT STD_LOGIC;
	
	parse_data:	out RESULT_LINE --Der neue ASCII Code *10 Zellen
  );
end b2bcd_ent;

