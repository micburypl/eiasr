% Use GMM for the classification of iris dataset
[DS, TS]=prData('iris');
gmmOpt=gmmTrain('defaultOpt');
gmmcPrm=gmmcTrain(DS, gmmOpt);
computedOutput=gmmcEval(DS, gmmcPrm);
recogRate1=sum(DS.output==computedOutput)/length(DS.output);
fprintf('Inside-test recog. rate = %g%%\n', recogRate1*100);
computedOutput=gmmcEval(TS, gmmcPrm);
recogRate2=sum(TS.output==computedOutput)/length(TS.output);
fprintf('Outside-test recog. rate = %g%%\n', recogRate2*100);