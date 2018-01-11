DS=prData('iris');
DS.input=DS.input(3:4, :);
[qcPrm, logProb, recogRate, hitIndex]=qcTrain(DS);
DS.hitIndex=hitIndex;		% Attach hitIndex to DS for plotting
qcPlot(DS, qcPrm, 'decBoundary');
