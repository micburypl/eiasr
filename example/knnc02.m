% Get the data set
[trainSet, testSet]=prData('iris');
trainNum=size(trainSet.input, 2);
testNum  =size(testSet.input, 2);
trainSet.k=1;
computed=knncEval(testSet, trainSet);
confMat=confMatGet(testSet.output, computed);
opt=confMatPlot('defaultOpt');
opt.className=trainSet.outputName;
confMatPlot(confMat, opt);