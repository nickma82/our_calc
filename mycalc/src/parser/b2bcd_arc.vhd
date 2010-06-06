-- @module : alu_div_arc
-- @author : s0726179
-- @date   : Apr 26, 2010
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.big_pkg.all;
use work.parser_pkg.all;


ARCHITECTURE b2bcd OF b2bcd_ent IS


--   function to_bcd4(i: integer, j: integer, bin : std_logic_vector((SIZEI-1+4) downto 0) ) return std_logic_vector is
-- 	variable lower_bound, upper_bound : integer:=0;
-- 	variable bcd  : std_logic_vector((SIZEI_BCD_CHARS*4-1) downto 0) := (others => '0');
-- 	variable bint : std_logic_vector((SIZEI-1+4) downto 0) := bin;
-- 	
-- 	begin
-- 	for i in 0 to bint'HIGH loop  -- repeating 8 times.
-- 		bcd(bcd'HIGH downto 1) := bcd((bcd'HIGH-1) downto 0);  --shifting the bits.
-- 		bcd(0) := bint(bint'HIGH);
-- 		bint(bint'HIGH downto 1) := bint((bint'HIGH-1) downto 0);
-- 		bint(0) :='0';
-- 		
-- 		--for j in 1 to SIZEI_BCD_CHARS loop --10 NIPPEL
-- 			lower_bound:= j*4-4;
-- 			upper_bound:= j*4-1;
-- 			if(i < 7 and bcd(upper_bound downto lower_bound) > "0100") then --add 3 if BCD digit is greater than 4.
-- 			bcd(upper_bound downto lower_bound) := std_logic_vector( unsigned(bcd(upper_bound downto lower_bound)) + to_unsigned(3, 4) );
-- 			end if;
-- 		--end loop;
-- -- 		if(i < 7 and bcd(7 downto 4) > "0100") then --add 3 if BCD digit is greater than 4.
-- -- 		bcd(7 downto 4) := std_logic_vector( unsigned(bcd(7 downto 4)) + to_unsigned(3, 4) );
-- -- 		end if;
-- 	
-- 	end loop;
-- 	return bcd;
--   end to_bcd4;
-- 
--   function bcd4_to_bcd8_wrapper( bcd4: std_logic_vector((SIZEI_BCD_CHARS*4-1) downto 0); add: std_logic_vector(5 downto 0) ) return std_logic_vector is
-- 	variable i,j: integer:=0;
-- 	variable lower4_bound, upper4_bound, lower8_bound, upper8_bound: integer:=0;
-- 	variable bcd8  : std_logic_vector((SIZEI_BCD_CHARS*8-1) downto 0) := (others => '0');
-- 	
-- 	begin
-- 	for i in 1 to SIZEI_BCD_CHARS loop
-- 		lower4_bound:= i*4-4;
-- 		upper4_bound:= i*4-1;
-- 		lower8_bound:= i*8-8;
-- 		upper8_bound:= i*8-1;
-- 		bcd8(upper8_bound downto lower8_bound):= std_logic_vector( resize(unsigned(bcd4(upper4_bound downto lower4_bound) )+ unsigned(add), 8) );
-- 	end loop;
-- 	return bcd8;
--   end bcd4_to_bcd8_wrapper;




type B2BCD_FSM_STATE_TYPE is (IDLE0, WAIT_RB, INIT, DOIT, SAVE_RESULT, DONE);
signal b2bcd_fsm_state, b2bcd_fsm_state_next : B2BCD_FSM_STATE_TYPE;
signal count, count_next:	INTEGER range 0 to 35 := 0; 	
signal sign_next : std_logic := '0';
--signal enable : std_logic := '0';
--signal enable_next : std_logic := '0';
--signal start : std_logic := '0';
--signal start_next : std_logic := '0';
signal scratch, scratch_next : std_logic_vector(75 downto 0) := (others =>'0');
signal parsBuff, parsBuff_next	: RESULT_LINE;

begin

next_state : process(b2bcd_fsm_state, b2bcd_en, rb_busy, count)
	begin
  		b2bcd_fsm_state_next <= b2bcd_fsm_state;
	case b2bcd_fsm_state is
		when IDLE0 =>
			if b2bcd_en = '1' then
				b2bcd_fsm_state_next<= WAIT_RB;
			end if;
		when WAIT_RB =>
			if rb_busy = '1' then
				b2bcd_fsm_state_next<= INIT;
			end if;
			
		when INIT=>
			b2bcd_fsm_state_next<= DOIT;
		when DOIT=>
			if count = 31 then
				b2bcd_fsm_state_next<= SAVE_RESULT;
			end if;
		when SAVE_RESULT=>
			b2bcd_fsm_state_next<= DONE;
		when DONE =>
			if b2bcd_en = '0' then
				b2bcd_fsm_state_next<=IDLE0;
			end if;
	end case;
end process next_state;


calc : process(b2bcd_fsm_state, count, scratch, b2bcd_data, b2bcd_data_neg, parsBuff)
	variable scratch_tmp	: std_logic_vector(75 downto 0) := (others =>'0');
	variable move_reg	: integer range 0 to SIZEI_BCD_CHARS := 0;
	variable move_lock	: boolean:= false;
	begin	
	b2bcd_data_rdy <= '0';
	--start_next <= start_decode;
	count_next <= count;
	scratch_tmp := scratch;
	--enable_next <= enable;
	--sign_next <= sign;

	--parse_data(0) <= X"00";
	--parse_data(1) <= X"00";
	--parse_data(2) <= X"00";
	--parse_data(3) <= X"00";
	--parse_data(4) <= X"00";
	--parse_data(5) <= X"00";
	--parse_data(6) <= X"00";
	--parse_data(7) <= X"00";
	--parse_data(8) <= X"00";
	--parse_data(9) <= X"00";
	--parse_data(10) <= X"00";

	parse_data <= parsBuff;
	parsBuff_next <= parsBuff;

	scratch_next <= scratch;

	
	case b2bcd_fsm_state is
	when IDLE0 =>
		--parse_data(0) <= X"00";
		--parse_data(1) <= X"00";
		--parse_data(2) <= X"00";
		--parse_data(3) <= X"00";
		--parse_data(4) <= X"00";
		--parse_data(5) <= X"00";
		--parse_data(6) <= X"00";
		--parse_data(7) <= X"00";
		--parse_data(8) <= X"00";
		--parse_data(9) <= X"00";
		--parse_data(10) <= X"00";
		parsBuff_next <= (others => x"00");
	when WAIT_RB =>
		null;
	when INIT =>
		scratch_tmp(31 downto 0) := std_logic_vector(b2bcd_data);
		scratch_tmp(75 downto 32) := "00000000000000000000000000000000000000000000";
		scratch_tmp(31) := '0';
		b2bcd_data_rdy <= '0';
		count_next <= 0;
		scratch_next <= scratch_tmp;
	when DOIT =>
		count_next <= count + 1;
		
		if count/= 0 then
			scratch_tmp(75 downto 1) := scratch_tmp(74 downto 0); --rll
			scratch_tmp(0) := '0';
		end if;
		
		
		
		if(scratch_tmp(35 downto 32) > "0100") then
			scratch_tmp(35 downto 32) := std_logic_vector(unsigned(scratch_tmp(35 downto 32)) + 3);
		end if;
		if(scratch_tmp(39 downto 36) > "0100") then
			scratch_tmp(39 downto 36) := std_logic_vector(unsigned(scratch_tmp(39 downto 36)) + 3);
		end if;
		if(scratch_tmp(43 downto 40) > "0100") then
			scratch_tmp(43 downto 40) := std_logic_vector(unsigned(scratch_tmp(43 downto 40)) + 3);
		end if;
		if(scratch_tmp(47 downto 44) > "0100") then
			scratch_tmp(47 downto 44) := std_logic_vector(unsigned(scratch_tmp(47 downto 44)) + 3);
		end if;
		if(scratch_tmp(51 downto 48) > "0100") then
			scratch_tmp(51 downto 48) := std_logic_vector(unsigned(scratch_tmp(51 downto 48)) + 3);
		end if;
		if(scratch_tmp(55 downto 52) > "0100") then
			scratch_tmp(55 downto 52) := std_logic_vector(unsigned(scratch_tmp(55 downto 52)) + 3);
		end if;
		if(scratch_tmp(59 downto 56) > "0100") then
			scratch_tmp(59 downto 56) := std_logic_vector(unsigned(scratch_tmp(59 downto 56)) + 3);
		end if;
		if(scratch_tmp(63 downto 60) > "0100") then
			scratch_tmp(63 downto 60) := std_logic_vector(unsigned(scratch_tmp(63 downto 60)) + 3);
		end if;
		if(scratch_tmp(67 downto 64) > "0100") then
			scratch_tmp(67 downto 64) := std_logic_vector(unsigned(scratch_tmp(67 downto 64)) + 3);
		end if;
		if(scratch_tmp(71 downto 68) > "0100") then
			scratch_tmp(71 downto 68) := std_logic_vector(unsigned(scratch_tmp(71 downto 68)) + 3);
		end if;
		if(scratch_tmp(75 downto 72) > "0100") then
			scratch_tmp(75 downto 72) := std_logic_vector(unsigned(scratch_tmp(75 downto 72)) + 3);
		end if;
		
		
		
		scratch_next <= scratch_tmp;
		
	when SAVE_RESULT =>
		scratch_tmp(75 downto 1) := scratch_tmp(74 downto 0);
		scratch_tmp(0) := '0';
		move_reg:=0;
		move_lock:=false;
		
		
		---KANN DURCH FUNKTION ERSETZT WERDEN
		if unsigned(scratch_tmp(71 downto 68))/=0 then move_lock:= true;
			elsif not(move_lock) then move_reg:=move_reg+1; end if; 
		if move_lock then 
			parse_data(9+move_reg)(3 downto 0) <= scratch_tmp(71 downto 68);
			parse_data(9+move_reg)(5 downto 4) <= "11";
			parsBuff_next(9+move_reg)(3 downto 0) <= scratch_tmp(71 downto 68);
			parsBuff_next(9+move_reg)(5 downto 4) <= "11"; 
		end if;
		
		if unsigned(scratch_tmp(67 downto 64))/=0 then move_lock:= true;
			elsif not(move_lock) then move_reg:=move_reg+1; end if; 
		if move_lock then 
			parse_data(8+move_reg)(3 downto 0) <= scratch_tmp(67 downto 64);	
			parse_data(8+move_reg)(5 downto 4) <= "11";
			parsBuff_next(8+move_reg)(3 downto 0) <= scratch_tmp(67 downto 64);	
			parsBuff_next(8+move_reg)(5 downto 4) <= "11"; 
		end if;
		
		if unsigned(scratch_tmp(63 downto 60))/=0 then move_lock:= true;
			elsif not(move_lock) then move_reg:=move_reg+1; end if; 
		if move_lock then 
			parse_data(7+move_reg)(3 downto 0) <= scratch_tmp(63 downto 60);
			parse_data(7+move_reg)(5 downto 4) <= "11";
			parsBuff_next(7+move_reg)(3 downto 0) <= scratch_tmp(63 downto 60);
			parsBuff_next(7+move_reg)(5 downto 4) <= "11"; 
		end if;
		
		if unsigned(scratch_tmp(59 downto 56))/=0 then move_lock:= true;
			elsif not(move_lock) then move_reg:=move_reg+1; end if; 
		if move_lock then 
			parse_data(6+move_reg)(3 downto 0) <= scratch_tmp(59 downto 56);
			parse_data(6+move_reg)(5 downto 4) <= "11";
			parsBuff_next(6+move_reg)(3 downto 0) <= scratch_tmp(59 downto 56);
			parsBuff_next(6+move_reg)(5 downto 4) <= "11"; 
		end if;
		
		if unsigned(scratch_tmp(55 downto 52))/=0 then move_lock:= true;
			elsif not(move_lock) then move_reg:=move_reg+1; end if; 
		if move_lock then 
			parse_data(5+move_reg)(3 downto 0) <= scratch_tmp(55 downto 52);
			parse_data(5+move_reg)(5 downto 4) <= "11";
			parsBuff_next(5+move_reg)(3 downto 0) <= scratch_tmp(55 downto 52);
			parsBuff_next(5+move_reg)(5 downto 4) <= "11"; 
		end if;
		
		if unsigned(scratch_tmp(51 downto 48))/=0 then move_lock:= true;
			elsif not(move_lock) then move_reg:=move_reg+1; end if; 
		if move_lock then 
			parse_data(4+move_reg)(3 downto 0) <= scratch_tmp(51 downto 48);
			parse_data(4+move_reg)(5 downto 4) <= "11";
			parsBuff_next(4+move_reg)(3 downto 0) <= scratch_tmp(51 downto 48);
			parsBuff_next(4+move_reg)(5 downto 4) <= "11"; 
		end if;
		
		if unsigned(scratch_tmp(47 downto 44))/=0 then move_lock:= true;
			elsif not(move_lock) then move_reg:=move_reg+1; end if; 
		if move_lock then 
			parse_data(3+move_reg)(3 downto 0) <= scratch_tmp(47 downto 44);
			parse_data(3+move_reg)(5 downto 4) <= "11";
			parsBuff_next(3+move_reg)(3 downto 0) <= scratch_tmp(47 downto 44);
			parsBuff_next(3+move_reg)(5 downto 4) <= "11"; 
		end if;
		
		if unsigned(scratch_tmp(43 downto 40))/=0 then move_lock:= true;
			elsif not(move_lock) then move_reg:=move_reg+1; end if; 
		if move_lock then 
			parse_data(2+move_reg)(3 downto 0) <= scratch_tmp(43 downto 40);
			parse_data(2+move_reg)(5 downto 4) <= "11";
			parsBuff_next(2+move_reg)(3 downto 0) <= scratch_tmp(43 downto 40);
			parsBuff_next(2+move_reg)(5 downto 4) <= "11"; 
		end if;
		
		if unsigned(scratch_tmp(39 downto 36))/=0 then move_lock:= true;
			elsif not(move_lock) then move_reg:=move_reg+1; end if; 
		if move_lock then 
			parse_data(1+move_reg)(3 downto 0) <= scratch_tmp(39 downto 36);
			parse_data(1+move_reg)(5 downto 4) <= "11";
			parsBuff_next(1+move_reg)(3 downto 0) <= scratch_tmp(39 downto 36);
			parsBuff_next(1+move_reg)(5 downto 4) <= "11"; 
		end if;
		
		if unsigned(scratch_tmp(35 downto 32))/=0 then move_lock:= true;
			elsif not(move_lock) then move_reg:=move_reg+1; end if; 
		if move_lock then 
			parse_data(0+move_reg)(3 downto 0) <= scratch_tmp(35 downto 32);
			parse_data(0+move_reg)(5 downto 4) <= "11";
			parsBuff_next(0+move_reg)(3 downto 0) <= scratch_tmp(35 downto 32);
			parsBuff_next(0+move_reg)(5 downto 4) <= "11"; 
		end if;
		
		-- insert negative
		if b2bcd_data_neg = '1' then
			parse_data(10)<= X"2D";
			parsBuff_next(10)<= X"2D";
		else
			parse_data(10)<= X"2B";
			parsBuff_next(10)<= X"2B";
		end if;
	
	when DONE=>
		
		count_next <= 0;
		b2bcd_data_rdy <= '1';
    end case;
  end process calc;
  
  
  
  

  
	
 sync : process(sys_clk, sys_res_n)
  begin
    if sys_res_n = '0' then
	b2bcd_fsm_state <= IDLE0;
	count<= 0;
	--enable <= '0';
    elsif rising_edge(sys_clk) then
	b2bcd_fsm_state <= b2bcd_fsm_state_next;
	--start <= start_next;
	count <= count_next;
	scratch <= scratch_next;
	parsBuff <= parsBuff_next;
    end if;
 end process sync;

END b2bcd;
