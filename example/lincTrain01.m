DS=prData('linSeparable');
trainPrm=lincOptSet('method', 'sequentialLearning', 'maxIter', 2000, 'animation', 'yes');
[coef, recogRate]=lincTrain(DS, trainPrm);
fprintf('Recog. rate = %.2f%%\n', 100*recogRate);