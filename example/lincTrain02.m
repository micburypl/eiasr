DS=prData('linSeparable');
trainPrm=lincOptSet('method', 'batchLearning', 'animation', 'yes', 'printInterval', 30);
[coef, recogRate]=lincTrain(DS, trainPrm);
fprintf('Recog. rate = %.2f%%\n', 100*recogRate);
