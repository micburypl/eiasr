DS=prData('wine');
recogRate1=pcaPerfViaKnncLoo(DS);
DS2=DS; DS2.input=inputNormalize(DS2.input);	% data normalization
recogRate2=pcaPerfViaKnncLoo(DS2);
[featureNum, dataNum] = size(DS.input);
plot(1:featureNum, 100*recogRate1, 'o-', 1:featureNum, 100*recogRate2, '^-'); grid on
legend('Raw data', 'Normalized data');
xlabel('No. of projected features based on LDA');
ylabel('LOO recognition rates using KNNC (%)');