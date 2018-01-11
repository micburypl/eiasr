DS=prData('3classes');
knncPrm=knncTrain(DS);
knncPrm.k=1;
knncPlot(DS, knncPrm, '2dPosterior');
