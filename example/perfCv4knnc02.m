DS=prData('iris');
showPlot=1;
foldNum=inf;	% For leave-one-out cross validation
classifier='knnc';
tic
[vRrAll, tRrAll]=perfCv(DS, classifier, [], foldNum, showPlot);
fprintf('time=%g sec\n', toc);
fprintf('Training RR=%.2f%%, Validating RR=%.2f%%\n', tRrAll*100, vRrAll*100);
