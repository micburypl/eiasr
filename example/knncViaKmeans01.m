% ====== Get the data set
[trainSet, testSet]=prData('iris');	% Get the data set
fprintf('Use of KNNC for Iris data:\n');
fprintf('\tSize of design set (odd-indexed data)= %d\n', size(trainSet.input, 2));
fprintf('\tSize of test set (even-indexed data) = %d\n', size(testSet.input, 2));
uniqueClass=unique(trainSet.output);
centerNum4eachClass=4;
% ====== Perform k-means
trainSet2=trainSet;				% trainSet2 is the reduced design set after k-means
trainSet2.input=[];
trainSet2.output=[];
for i=1:length(uniqueClass)			% Compute trainSet2 using k-means
	index=find(trainSet.output==uniqueClass(i));
	thisData=trainSet.input(:, index);
	center = kMeansClustering(thisData, centerNum4eachClass);
	trainSet2.input=[trainSet2.input, center];
	trainSet2.output=[trainSet2.output, uniqueClass(i)*ones(1, centerNum4eachClass)];
end
fprintf('After k-means clustering, size of design set = %d\n', size(trainSet2.input, 2));
% ====== Compute the recognition rate
trainSet2.k=1;
computed=knncEval(testSet, trainSet2);
correctCount=sum(testSet.output==computed);
recogRate=correctCount/length(testSet.output);
fprintf('Recognition rate = %g%%\n', recogRate*100);
% ====== Plot the confusion matrix
confMat=confMatGet(testSet.output, computed);
opt=confMatPlot('defaultOpt');
opt.className=trainSet.outputName;
confMatPlot(confMat, opt);