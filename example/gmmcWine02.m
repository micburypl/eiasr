[DS, TS]=prData('wine');
count1=dsClassSize(DS); count2=dsClassSize(TS);
gmmcOpt=gmmTrain('defaultOpt');
gmmcOpt.config.gaussianNum=1:min([count1, count2]);
plotOpt=1;
[gmmData, recogRate1, recogRate2]=gmmcGaussianNumEstimate(DS, TS, gmmcOpt, plotOpt);
