DS = prData('iris');
dataNum = size(DS.input, 2);
DS2 = lda(DS);
% ====== Projection to the first two eigenvectors
DS3=DS2; DS3.input=DS2.input(1:2, :);
subplot(2,1,1);
[recogRate, computed] = knncLoo(DS3, [], 1);
title(sprintf('LDA projection of %s data onto the first 2 discriminant vectors', DS.dataName));
xlabel(sprintf('KNNC''s leave-one-out recog. rate = %d/%d = %g%%', sum(DS3.output==computed), dataNum, 100*recogRate));
% ====== Projection to the last two eigenvectors
DS3=DS2; DS3.input=DS2.input(end-1:end, :);
subplot(2,1,2);
[recogRate, computed] = knncLoo(DS3, [], 1);
title(sprintf('LDA projection of %s data onto the last 2 discriminant vectors', DS.dataName));
xlabel(sprintf('KNNC''s leave-one-out recog. rate = %d/%d = %g%%', sum(DS3.output==computed), dataNum, 100*recogRate));