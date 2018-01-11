DS=prData('wine');
dsDistPlot(DS);
DS.input=inputNormalize(DS.input);
figure; dsDistPlot(DS);
