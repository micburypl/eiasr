load faceData.mat
maxDim=30;		% Max dim. after PCA
frMethod='pca';
% ====== Create DS
fprintf('Creating DS... ===> '); tic
DS=faceData2ds(faceData);
fprintf('%.2f sec\n', toc);

myTic=tic;
looRecogRate=zeros(1, maxDim);
time=zeros(1, maxDim);
for i=1:maxDim
	opt=faceRecogPerfLoo('defaultOpt');
	opt.pcaDim=i;
	opt.method=frMethod;
	fprintf('%d/%d: opt.pcaDim=%d\n', opt.pcaDim, maxDim, i);
	[looRecogRate(i), computedClass, correct, timeVec]=faceRecogPerfLoo(DS, opt);
	time(i)=sum(timeVec);
	fprintf('\trr=%.2f%%\n', looRecogRate(i)*100);
end
toc(myTic)

plot(1:maxDim, looRecogRate*100, '.-');
[maxRr, index]=max(looRecogRate);
line(index, maxRr*100, 'color', 'r', 'marker', 'o');
fprintf('Max RR=%.2f%% at dim=%d\n', maxRr*100, index);
xlabel('PCA feature dimension'); ylabel('LOO recog. rate');
grid on
