load DS1.mat
trainPrm.prior=dsClassSize(DS);
[qcPrm, logProb, recogRate]=qcTrain(DS, trainPrm);
fprintf('���Ѳv = %f%%\n', recogRate*100);
qcPlot(DS, qcPrm, '2dPdf');
