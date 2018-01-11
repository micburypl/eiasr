[trainSet, testSet]=prData('3classes');
knncPrm=knncTrain(trainSet);
knncPrm.k=1;
computed=knncEval(testSet, knncPrm);
testSet.hitIndex=find(computed==testSet.output);
knncPlot(testSet, knncPrm, 'decBoundary');
