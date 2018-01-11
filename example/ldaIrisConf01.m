DS=prData('iris');
DS2 = lda(DS);
DS3=DS2; DS3.input=DS3.input(1:2, :);
[recogRate, computedOutput] = knncLoo(DS3);
confMat=confMatGet(DS3.output, computedOutput);
opt=confMatPlot('defaultOpt');
opt.className=DS.outputName;
confMatPlot(confMat, opt);