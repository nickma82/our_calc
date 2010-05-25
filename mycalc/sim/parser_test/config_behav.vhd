configuration conf of parser_tb is
  for behav 			--TB Arc name
    for uut : alu_ent 	--TB unit beh name
    	use entity work.parser_top(struct); --name of original entity(arc name)
    end for;
  end for;
end conf;
