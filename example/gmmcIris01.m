% Use GMM for the classification of iris dataset
% ====== Collect data
[DS, TS]=prData('iris');
classLabel=unique(DS.output);
classNum=length(classLabel);

gmmOpt=gmmTrain('defaultOpt');
% ====== Train a GMM for each class
clear data logLike
for i=1:classNum
	fprintf('Training GMM for class %d...\n', i);
	index=find(DS.output==classLabel(i));
	data{i}=DS.input(:, index);
	[class(i).gmmPrm, logLike{i}] = gmmTrain(data{i}, gmmOpt);
end
% ====== Compute inside-test recognition rate
clear outputLogLike;
for i=1:classNum
	outputLogLike(i,:)=gmmEval(DS.input, class(i).gmmPrm);
end
[maxValue, computedOutput]=max(outputLogLike);
recogRate1=sum(DS.output==computedOutput)/length(DS.output);
fprintf('Inside-test recog. rate = %g%%\n', recogRate1*100);
% ====== Compute outside-test recognition rate
clear outputLogLike
for i=1:classNum
	outputLogLike(i,:)=gmmEval(TS.input, class(i).gmmPrm);
end
[maxValue, computedOutput]=max(outputLogLike);
recogRate2=sum(TS.output==computedOutput)/length(TS.output);
fprintf('Outside-test recog. rate = %g%%\n', recogRate2*100);