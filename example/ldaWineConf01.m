DS=prData('wine');
DS2 = lda(DS);
DS3=DS2; DS3.input=DS3.input(1:6, :);
[recogRate, computedOutput] = knncLoo(DS3);
confMat=confMatGet(DS3.output, computedOutput);
confMatPlot(confMat);