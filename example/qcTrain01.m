DS = prData('iris');
DS.input=DS.input(3:4, :);		% Only take dimensions 3 and 4 for 2d visualization
[qcPrm, logProb, recogRate, hitIndex]=qcTrain(DS);
fprintf('Recog. rate = %f%%\n', recogRate*100);