configuration conf of alu_tb is
  for behav 			--TB Arc name
    for uut : alu_ent 	--TB unit beh name
    	use entity work.alu_top(struct); --name of original entity(arc name)
    end for;
  end for;
end conf;
