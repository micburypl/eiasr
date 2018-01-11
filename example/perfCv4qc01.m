DS=prData('iris');
showPlot=1;
foldNum=10;
classifier='qc';
[vRrAll, tRrAll]=perfCv(DS, classifier, [], foldNum, showPlot);
fprintf('Training RR=%.2f%%, Validating RR=%.2f%%\n', tRrAll*100, vRrAll*100);
