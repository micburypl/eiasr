load DS1.mat
trainPrm.prior=[1 1];
[qcPrm, logProb, recogRate]=qcTrain(DS, trainPrm);
fprintf('ฟ๋รัฒv = %f%%\n', recogRate*100);
qcPlot(DS, qcPrm, '2dPdf');
