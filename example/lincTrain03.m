DS=prData('linSeparable');
trainPrm=lincOptSet('method', 'minRegressionError', 'animation', 'yes');
[coef, recogRate]=lincTrain(DS, trainPrm);
fprintf('Recog. rate = %.2f%%\n', 100*recogRate);