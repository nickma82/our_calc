-- @module : alu_div_arc
-- @author : s0726179
-- @date   : Apr 26, 2010
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.big_pkg.all;
use work.parser_pkg.all;


ARCHITECTURE b2bcd OF b2bcd_ent IS
constant BSIZE	: INTEGER := 32;

type B2BCD_FSM_STATE_TYPE is (IDLE0, WAIT_RB, INIT, DOIT, SAVE_RESULT, PREFIX, DONE);
signal b2bcd_fsm_state, b2bcd_fsm_state_next : B2BCD_FSM_STATE_TYPE;
signal count, count_next:	INTEGER range 0 to 35 := 0;
 	
signal sign_next : std_logic := '0';
signal scratch, scratch_next : std_logic_vector(75 downto 0) := (others =>'0');
signal prs_dat_var, prs_dat_var_next	: RESULT_LINE;

signal intern_isneg, intern_isneg_next:	BOOLEAN;

begin

next_state : process(b2bcd_fsm_state, b2bcd_en, rb_busy, count, b2bcd_data)
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
			if (b2bcd_data = 0) then
				--result = 0
				b2bcd_fsm_state_next<= PREFIX;
			else
				b2bcd_fsm_state_next<= DOIT;
			end if;
		when DOIT=>
			if count = 31 then
				b2bcd_fsm_state_next<= SAVE_RESULT;
			end if;
		when SAVE_RESULT=>
			b2bcd_fsm_state_next<= PREFIX;
		when PREFIX=>
			b2bcd_fsm_state_next<= DONE;
		when DONE =>
			if b2bcd_en = '0' then
				b2bcd_fsm_state_next<=IDLE0;
			end if;
	end case;
end process next_state;


calc : process(b2bcd_fsm_state, count, scratch, b2bcd_data, b2bcd_data_neg, prs_dat_var, intern_isneg)
	variable scratch_tmp	: std_logic_vector(75 downto 0) := (others =>'0');
	variable move_reg	: integer range 0 to SIZEI_BCD_CHARS := 0;
	variable move_lock	: boolean:= false;
	begin	
	b2bcd_data_rdy <= '0';
	count_next <= count;
	scratch_tmp := scratch;

	prs_dat_var_next <= prs_dat_var;

	scratch_next <= scratch;
	intern_isneg_next <= intern_isneg;
	
	case b2bcd_fsm_state is
	when IDLE0 =>
		intern_isneg_next<= False;
		prs_dat_var_next <= (others => x"00");
		scratch_next <= (others=> '0');
	when WAIT_RB =>
		-- wait until RB RDY
		null;
	when INIT =>
		if b2bcd_data < 0 then
			if b2bcd_data= MINTOP then
				--- TWEAK for MINTOP
				scratch_tmp((BSIZE-1) downto 0) := (others=>'1');
			else
				scratch_tmp((BSIZE-1) downto 0) := std_logic_vector(resize(not(b2bcd_data), BSIZE )+1  );
			end if;
			intern_isneg_next<= True;
			
		else
			scratch_tmp((BSIZE-1) downto 0) := std_logic_vector(b2bcd_data);
		end if;
		scratch_tmp(75 downto 32) := (others=>'0');
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
			prs_dat_var_next(9+move_reg)(3 downto 0) <= scratch_tmp(71 downto 68);
			prs_dat_var_next(9+move_reg)(5 downto 4) <= "11"; 
		end if;
		
		if unsigned(scratch_tmp(67 downto 64))/=0 then move_lock:= true;
			elsif not(move_lock) then move_reg:=move_reg+1; end if; 
		if move_lock then 
			prs_dat_var_next(8+move_reg)(3 downto 0) <= scratch_tmp(67 downto 64);	
			prs_dat_var_next(8+move_reg)(5 downto 4) <= "11"; 
		end if;
		
		if unsigned(scratch_tmp(63 downto 60))/=0 then move_lock:= true;
			elsif not(move_lock) then move_reg:=move_reg+1; end if; 
		if move_lock then 
			prs_dat_var_next(7+move_reg)(3 downto 0) <= scratch_tmp(63 downto 60);
			prs_dat_var_next(7+move_reg)(5 downto 4) <= "11"; 
		end if;
		
		if unsigned(scratch_tmp(59 downto 56))/=0 then move_lock:= true;
			elsif not(move_lock) then move_reg:=move_reg+1; end if; 
		if move_lock then 
			prs_dat_var_next(6+move_reg)(3 downto 0) <= scratch_tmp(59 downto 56);
			prs_dat_var_next(6+move_reg)(5 downto 4) <= "11"; 
		end if;
		
		if unsigned(scratch_tmp(55 downto 52))/=0 then move_lock:= true;
			elsif not(move_lock) then move_reg:=move_reg+1; end if; 
		if move_lock then 
			prs_dat_var_next(5+move_reg)(3 downto 0) <= scratch_tmp(55 downto 52);
			prs_dat_var_next(5+move_reg)(5 downto 4) <= "11"; 
		end if;
		
		if unsigned(scratch_tmp(51 downto 48))/=0 then move_lock:= true;
			elsif not(move_lock) then move_reg:=move_reg+1; end if; 
		if move_lock then 
			prs_dat_var_next(4+move_reg)(3 downto 0) <= scratch_tmp(51 downto 48);
			prs_dat_var_next(4+move_reg)(5 downto 4) <= "11"; 
		end if;
		
		if unsigned(scratch_tmp(47 downto 44))/=0 then move_lock:= true;
			elsif not(move_lock) then move_reg:=move_reg+1; end if; 
		if move_lock then 
			prs_dat_var_next(3+move_reg)(3 downto 0) <= scratch_tmp(47 downto 44);
			prs_dat_var_next(3+move_reg)(5 downto 4) <= "11"; 
		end if;
		
		if unsigned(scratch_tmp(43 downto 40))/=0 then move_lock:= true;
			elsif not(move_lock) then move_reg:=move_reg+1; end if; 
		if move_lock then 
			prs_dat_var_next(2+move_reg)(3 downto 0) <= scratch_tmp(43 downto 40);
			prs_dat_var_next(2+move_reg)(5 downto 4) <= "11"; 
		end if;
		
		if unsigned(scratch_tmp(39 downto 36))/=0 then move_lock:= true;
			elsif not(move_lock) then move_reg:=move_reg+1; end if; 
		if move_lock then 
			prs_dat_var_next(1+move_reg)(3 downto 0) <= scratch_tmp(39 downto 36);
			prs_dat_var_next(1+move_reg)(5 downto 4) <= "11"; 
		end if;
		
		if unsigned(scratch_tmp(35 downto 32))/=0 then move_lock:= true;
			elsif not(move_lock) then move_reg:=move_reg+1; end if; 
		if move_lock then 
			prs_dat_var_next(0+move_reg)(3 downto 0) <= scratch_tmp(35 downto 32);
			prs_dat_var_next(0+move_reg)(5 downto 4) <= "11"; 
		end if;
		
	when PREFIX=>
		if b2bcd_data = 0 then
			prs_dat_var_next(9)<= x"30";
		end if;
		
		-- insert negative
		--if b2bcd_data_neg = '1' then
		if intern_isneg then
			if b2bcd_data= MINTOP then --MINTOP Tweak
				prs_dat_var_next(0)<= X"38";	
			end if; 
			prs_dat_var_next(10)<= X"2D";
		else
			prs_dat_var_next(10)<= X"2B";
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
	
	intern_isneg<= intern_isneg_next;
	parse_data  <= prs_dat_var_next;
	prs_dat_var <= prs_dat_var_next;
    end if;
 end process sync;

END b2bcd;
