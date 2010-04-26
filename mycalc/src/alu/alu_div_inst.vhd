

-- @module : alu_div_inst
-- @author : s0726179
-- @date   : Apr 26, 2010


alu_div_inst : alu_div PORT MAP (
		clock	 => clock_sig,
		dataa	 => dataa_sig,
		datab	 => datab_sig,
		division_by_zero	 => division_by_zero_sig,
		overflow	 => overflow_sig,
		result	 => result_sig,
		underflow	 => underflow_sig
	);






