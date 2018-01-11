DS=prData('nonlinearSeparable');
gmmcOpt=gmmcTrain('defaultOpt');
gmmcOpt.config.gaussianNum=3;
gmmcPrm=gmmcTrain(DS, gmmcOpt);
gmmcPlot(DS, gmmcPrm, '2dPdf');
