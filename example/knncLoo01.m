DS=prData('random2');
dsScatterPlot(DS);
knncPrm.k=1;
plotOpt=1;
[recogRate, computed, nearestIndex]=knncLoo(DS, knncPrm, plotOpt);