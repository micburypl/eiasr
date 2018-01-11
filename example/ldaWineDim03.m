DS=prData('wine');
DS.input=inputNormalize(DS.input);	% input normalization
opt=ldaPerfViaKnncLoo('defaultOpt');
opt.mode='approximate';
tic; recogRate1=ldaPerfViaKnncLoo(DS, opt); time1=toc;
opt.mode='exact';
tic; recogRate2=ldaPerfViaKnncLoo(DS, opt); time2=toc;
[featureNum, dataNum] = size(DS.input);
plot(1:featureNum, 100*recogRate1, 'o-', 1:featureNum, 100*recogRate2, '^-'); grid on
legend('mode=''approximate''', 'mode=''exact''');
xlabel('No. of projected features based on LDA');
ylabel('LOO recognition rates using KNNC (%)');
fprintf('Time for ''approximate'' mode = %g sec, time for ''exact'' mode = %g sec\n', time1, time2);
