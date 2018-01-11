DS=prData('random3');
DS2=lda(DS); DS2.input=DS2.input(1:2, :);
DS3=lda(DS); DS3.input=DS3.input(end-1:end, :);
subplot(2,1,1); dsScatterPlot(DS2); axis image
xlabel('Input 1'); ylabel('Input 2');
title('Projected to the first two dim of LDA');
subplot(2,1,2); dsScatterPlot(DS3); axis image
xlabel('Input 3'); ylabel('Input 4');
title('Projected to the last two dim of LDA');