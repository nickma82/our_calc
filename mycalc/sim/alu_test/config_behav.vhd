configuration conf of alu_tb is
  for behav 			--TB Arc
    for uut : alu_ent 	--TB unit beh name
    	use entity work.alu_top(struct); --ent name(arc name)
    end for;
  end for;
end conf;
