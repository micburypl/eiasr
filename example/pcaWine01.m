DS=prData('wine');
DS2=pca(DS);
DS3=DS2; DS3.input=DS3.input(1:2, :);	% Keep the first two dimensions
subplot(2,1,1); dsScatterPlot(DS3); axis image
xlabel('Input 1'); ylabel('Input 2');
title('WINE projected onto the first two dim of PCA');
DS3=DS2; DS3.input=DS3.input(end-1:end, :);	% Keep the last two dimensions
subplot(2,1,2); dsScatterPlot(DS3); axis image
xlabel('Input 12'); ylabel('Input 13');
title('WINE projected onto the last two dim of PCA');
