DS=prData('iris');
foldNum=inf;	% For leave-one-out cross validation
classifier='knnc';
knncTrainPrm.method='kMeans';
maxC=30;
for i=1:maxC
	tic
	knncTrainPrm.centerNum4eachClass=i;
	fprintf('%d/%d\n', i, maxC);
	[vRr(i), tRr(i)]=perfCv(DS, classifier, knncTrainPrm, foldNum);
	fprintf('\ttime=%g sec\n', toc);
	fprintf('\tTraining RR=%.2f%%, Validating RR=%.2f%%\n', tRr(i)*100, vRr(i)*100);
end
plot(1:maxC, tRr*100, '.-', 1:maxC, vRr*100, '.-');
xlabel('No. of clusters for each class');
ylabel('RR (%)');
[maxValue, maxIndex]=max(vRr);
line(maxIndex, maxValue*100, 'color', 'r', 'marker', 'o');
legend('Training RR', 'Validation RR', 'Max. Validation RR', 'location', 'northOutside', 'orientation', 'horizontal');