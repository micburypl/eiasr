% Use GMM for the classification of iris dataset.
% We vary the number of mixtures to get the relationship between recognition rate and number of mixtures of GMM.
% ====== Get the dataset
[DS, TS]=prData('iris');
classNum=length(unique(DS.output));
gaussianNum=1:16;
gmmOpt=gmmTrain('defaultOpt');
trialNum=length(gaussianNum);
% ====== Perform training and compute recognition rates
recogRate1=[];
recogRate2=[];
for j=1:trialNum
	fprintf('%d/%d: ', j, trialNum);
	% ====== Training GMM model for each class
	for i=1:classNum
	%	fprintf('Training class %d: ', i);
		index=find(DS.output==i);
		data{i}=DS.input(:, index);
		gmmOpt.config.gaussianNum=gaussianNum(j);
		[class(i).gmmPrm, logLike{i}]=gmmTrain(data{i}, gmmOpt);
	end
	gmmcPrm.class=class;
	gmmcPrm.prior=dsClassSize(DS);
	gmmcPrm.task='Iris Classification';
	% ====== Compute inside-test recognition rate
	computedOutput=gmmcEval(DS, gmmcPrm);
	recogRate1(j)=sum(DS.output==computedOutput)/length(DS.output);
	% ====== Compute outside-test recognition rate
	computedOutput=gmmcEval(TS, gmmcPrm);
	recogRate2(j)=sum(TS.output==computedOutput)/length(TS.output);
	fprintf('Recog. rate: inside test = %g%%, outside test = %g%%\n', recogRate1(j)*100, recogRate2(j)*100);
end
% ====== Plot the result
plot(gaussianNum, recogRate1*100, 'o-', gaussianNum, recogRate2*100, 'square-'); grid on
legend('Inside test', 'Outside test', 4);
xlabel('No. of Gaussian mixtures'); ylabel('Recognition Rates (%)');