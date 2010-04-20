configuration conf of calc_tb is
  for behav
    for uut : calc_top 
    	use entity work.calc_tb(behav);
    end for;
  end for;
end conf;
