% Get the data set
[trainSet, testSet]=prData('iris');
designNum=size(trainSet.input, 2);
testNum  =size(testSet.input, 2);
fprintf('Use of KNNC for Iris data:\n');
fprintf('\tSize of design set (odd-indexed data)= %d\n', designNum);
fprintf('\tSize of test set (even-indexed data) = %d\n', testNum);
fprintf('\tRecognition rates as K varies:\n');
kMax=15;
for k=1:kMax
	trainSet.k=k;
	computed=knncEval(testSet, trainSet);
	correctCount=sum(testSet.output==computed);
	recog(k)=correctCount/testNum;
	fprintf('\t%d-NNC ===> RR = 1-%d/%d = %.2f%%.\n', k, testNum-correctCount, testNum, recog(k)*100);
end
plot(1:kMax, recog*100, 'b-o'); grid on;
title('Recognition rates of Iris data using K-NNR');
xlabel('K'); ylabel('Recognition rates (%)');