dataSet=prData('iris');
m=5;
cvOpt=cvDataGen('defaultOpt');
cvOpt.foldNum=m;
cvOpt.cvDataType='full';
cvData=cvDataGen(dataSet, cvOpt);
foldNum=length(cvData);	% Actual no. of folds
for i=1:foldNum
	[qcPrm, logProb1, tRr(i)]=qcTrain(cvData(i).TS);
	tSize(i)=length(cvData(i).TS.output);
	[computedClass, logProb2, vRr(i)]=qcEval(cvData(i).VS, qcPrm);
	vSize(i)=length(cvData(i).VS.output);
end
tRrAll=dot(tRr, tSize)/sum(tSize);
vRrAll=dot(vRr, vSize)/sum(vSize);
plot(1:foldNum, tRr, '.-', 1:foldNum, vRr, '.-');
xlabel('Folds'); ylabel('Recog. rate (%)');
legend('Training RR', 'Validating RR', 'location', 'northOutside', 'orientation', 'horizontal');
fprintf('Training RR=%.2f%%, Validating RR=%.2f%%\n', tRrAll*100, vRrAll*100);
