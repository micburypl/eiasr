[DS, TS]=prData('wine');
[DS.input, mu, sigma]=inputNormalize(DS.input);		% Input normalization for DS
TS.input=inputNormalize(TS.input, mu, sigma);	% Input normalization for TS
count1=dsClassSize(DS); count2=dsClassSize(TS);
gmmcOpt=gmmcTrain('defaultOpt');
gmmcOpt.config.gaussianNum=1:min([count1, count2]);
plotOpt=1;
[gmmData, recogRate1, recogRate2]=gmmcGaussianNumEstimate(DS, TS, gmmcOpt, plotOpt);
