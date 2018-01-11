DS=prData('iris');
DS.input=DS.input(3:4, :);
[qcPrm, logProb, recogRate, hitIndex]=qcTrain(DS);
qcPlot(DS, qcPrm, '2dPdf');
