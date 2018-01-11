DS=prData('iris');
[featureNum, dataNum] = size(DS.input);
[recogRate, computed] = knncLoo(DS);
fprintf('All data ===> LOO recog. rate = %d/%d = %g%%\n', sum(DS.output==computed), dataNum, 100*recogRate);
DS2 = lda(DS);
recogRate=[];
for i = 1:featureNum
	DS3=DS2; DS3.input=DS3.input(1:i, :);
	[recogRate(i), computed] = knncLoo(DS3);
	fprintf('LDA dim = %d ===> LOO recog. rate = %d/%d = %g%%\n', i, sum(DS3.output==computed), dataNum, 100*recogRate(i));
end
plot(1:featureNum, 100*recogRate, 'o-'); grid on
xlabel('No. of projected features based on LDA');
ylabel('LOO recognition rates using KNNC (%)');