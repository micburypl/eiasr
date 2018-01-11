DS=prData('iris');
DS.input=DS.input(3:4, :);
[nbcPrm, logLike, recogRate, hitIndex]=nbcTrain(DS);
nbcPlot(DS, nbcPrm, '1dPdf');
