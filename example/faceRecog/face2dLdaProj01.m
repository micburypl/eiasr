load faceData.mat
load eigenFaceResult.mat	% Load A2, eigVec, rowDim, colDim, etc
% ====== Create DS
DS.input=A2;
DS.outputName=unique({faceData.parentDir});
DS.output=zeros(1, size(DS.input,2));
for i=1:length(DS.output)
	DS.output(i)=find(strcmp(DS.outputName, faceData(i).parentDir));
 	DS.annotation{i}=faceData(i).path;
end
% ====== LDA
maxDim=60;
DS.input=DS.input(1:maxDim, :);
DS2=lda(DS);
DS2.input=DS2.input(1:2, :);
dsScatterPlot(DS2);
[recogRate, computed, nearestIndex]=knncLoo(DS2);
fprintf('Recog. rate = %.2f%% after 2D proj. of PCA + LDA\n', 100*recogRate);
