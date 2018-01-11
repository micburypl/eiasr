load faceData.mat
pcaDim=60;				% Only use this dimension after PCA
maxUsedDim4lda=30;		% Max dim. after LDA
frMethod='pca+lda';
% ====== Create DS
fprintf('Creating DS... ===> '); tic
DS=faceData2ds(faceData);
fprintf('%.2f sec\n', toc);

myTic=tic;
looRecogRate=zeros(1, maxUsedDim4lda);
time=zeros(1, maxUsedDim4lda);
for i=1:maxUsedDim4lda
	opt=faceRecogPerfLoo('defaultOpt');
	opt.pcaDim=pcaDim;
	opt.method=frMethod;
	opt.ldaDim=i;
	fprintf('%d/%d: opt.ldaDim=%d\n', opt.ldaDim, maxUsedDim4lda, i);
	[looRecogRate(i), computedClass, correct, timeVec]=faceRecogPerfLoo(DS, opt);
	time(i)=sum(timeVec);
	fprintf('\trr=%.2f%%\n', looRecogRate(i)*100);
end

plot(1:maxUsedDim4lda, looRecogRate*100, '.-');
[maxRr, index]=max(looRecogRate);
line(index, maxRr*100, 'color', 'r', 'marker', 'o');
fprintf('Max RR=%.2f%% at dim=%d\n', maxRr*100, index);
xlabel('LDA feature dimension'); ylabel('LOO recog. rate');
grid on
toc(myTic)