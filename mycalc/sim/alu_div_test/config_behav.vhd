configuration conf of alu_tb is
  for behav 			--TB Arc
    for uut : alu_div_ent 	--TB unit beh name
    	use entity work.alu_div_ent(alu_div); --ent name(arc name)
    end for;
  end for;
end conf;
