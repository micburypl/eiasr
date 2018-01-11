% Get the data set
[trainSet, testSet]=prData('iris');
trainNum=size(trainSet.input, 2);
testNum  =size(testSet.input, 2);
fprintf('Use of KNNC for Iris data:\n');
fprintf('\tSize of design set (odd-indexed data)= %d\n', trainNum);
fprintf('\tSize of test set (even-indexed data) = %d\n', testNum);
trainSet.k=1;
computed=knncEval(testSet, trainSet);
correctCount=sum(testSet.output==computed);
recogRate=correctCount/testNum;
fprintf('Recognition rate = %g%%\n', recogRate*100);