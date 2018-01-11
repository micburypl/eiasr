dataNum=1000;
x = randn(dataNum, 1);
plotOpt=1;
gPrm=gaussianMle(x, plotOpt);
title('1D Gaussian PDF identified by MLE');
