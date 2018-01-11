[trainSet, testSet]=prData('3classes');
knncTrainPrm.method='kMeans';
knncTrainPrm.centerNum4eachClass=4;
knncPrm=knncTrain(trainSet, knncTrainPrm);
knncPrm.k=1;
computed=knncEval(testSet, knncPrm);
testSet.hitIndex=find(computed==testSet.output);
knncPlot(testSet, knncPrm, 'decBoundary');
