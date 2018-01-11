DS = prData('iris');
DS.input=DS.input(3:4, :);		% Only take dimensions 3 and 4 for 2d visualization
plotOpt=1;				% Plotting
[nbcPrm, logLike, recogRate, hitIndex]=nbcTrain(DS, [], plotOpt);
fprintf('Recog. rate = %f%%\n', recogRate*100);
