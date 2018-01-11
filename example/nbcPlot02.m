DS=prData('iris');
DS.input=DS.input(3:4, :);
[nbcPrm, logLike, recogRate, hitIndex]=nbcTrain(DS);
DS.hitIndex=hitIndex;		% Attach hitIndex to DS for plotting
nbcPlot(DS, nbcPrm, 'decBoundary');
