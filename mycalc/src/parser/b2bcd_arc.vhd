

-- @module : alu_div_arc
-- @author : s0726179
-- @date   : Apr 26, 2010
 LIBRARY ieee;
 USE ieee.std_logic_1164.all;


function to_bcd ( bin : std_logic_vector(7 downto 0) ) return std_logic_vector is
	variable i,j : integer:=0;
	variable bcd : std_logic_vector(11 downto 0) := (others => '0');
	variable bint : std_logic_vector(7 downto 0) := bin;
	
	begin
	for i in 0 to 7 loop  -- repeating 8 times.
	bcd(11 downto 1) := bcd(10 downto 0);  --shifting the bits.
	bcd(0) := bint(7);
	bint(7 downto 1) := bint(6 downto 0);
	bint(0) :='0';
	
	
	if(i < 7 and bcd(3 downto 0) > "0100") then --add 3 if BCD digit is greater than 4.
	bcd(3 downto 0) := bcd(3 downto 0) + "0011";
	end if;
	
	if(i < 7 and bcd(7 downto 4) > "0100") then --add 3 if BCD digit is greater than 4.
	bcd(7 downto 4) := bcd(7 downto 4) + "0011";
	end if;
	
	if(i < 7 and bcd(11 downto 8) > "0100") then  --add 3 if BCD digit is greater than 4.
	bcd(11 downto 8) := bcd(11 downto 8) + "0011";
	end if;
	
	
	end loop;
	return bcd;
end to_bcd;




ARCHITECTURE alu_div OF alu_div_ent IS

  type B2BCD_FSM_STATE_TYPE is
    (IDLE0, WAIT_RB, CONVERT_OUT, SEND);
  signal b2bcd_fsm_state, b2bcd_fsm_state_next : B2BCD_FSM_STATE_TYPE;
BEGIN
	

  next_state : process(b2bcd_fsm_state)
  begin
    b2bcd_fsm_state_next <= b2bcd_fsm_state;
    case b2bcd_fsm_state is
	when IDLE0 =>
		if b2bcd_en = '1' then
			b2bcd_fsm_state_next<= WAIT_RB;
		end if;
	
	when WAIT_RB =>
		--wait rb_busy
		null;
	when CONVERT_OUT =>
		null;
	when SEND =>
		null;

    end case;
  end process next_state;
  
  
  
  
 output : process(b2bcd_fsm_state)
  begin
    case b2bcd_fsm_state is
	when IDLE0 =>
		null;
	
	when WAIT_RB =>
		null;
	when CONVERT_OUT =>
		null;
	when SEND =>
		null;
    end case;
  end process output;
  
	
 sync : process(sys_clk, sys_res_n)
  begin
    if sys_res_n = '0' then
      b2bcd_fsm_state <= IDLE0;
    elsif rising_edge(sys_clk) then
      b2bcd_fsm_state <= b2bcd_fsm_state_next;
    end if;
 end process sync;

END alu_div;