DS=prData('nonlinearSeparable');
gmmcOpt=gmmcTrain('defaultOpt');
gmmcOpt.config.gaussianNum=3;
gmmcPrm=gmmcTrain(DS, gmmcOpt);
computed=gmmcEval(DS, gmmcPrm);
DS.hitIndex=find(computed==DS.output);	% This is used in gmmcPlot.
gmmcPlot(DS, gmmcPrm, 'decBoundary');
