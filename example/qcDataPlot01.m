DS = prData('iris');
DS.input=DS.input(3:4, :);		% Only take dimensions 3 and 4 for 2d visualization
dsScatterPlot(DS);			% Scatter plot of the dataset
