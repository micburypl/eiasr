load DS1.mat
weight=0.1:0.1:20;
for i=1:length(weight)
	trainPrm.prior=[weight(i) 1];
	[qcPrm, logProb, recogRate(i)]=qcTrain(DS, trainPrm);
end
plot(weight, recogRate, '.-');
xlabel('Weight'); ylabel('Recogition rate');
title('辨識率對 prior 權重的關係圖');