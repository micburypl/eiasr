load faceData.mat
load eigenFaceResult.mat	% Load A2, eigVec, rowDim, colDim, etc
DS.input=A2(1:2,:);
DS.outputName=unique({faceData.parentDir});
DS.output=zeros(1, size(DS.input,2));
for i=1:length(DS.output)
	DS.output(i)=find(strcmp(DS.outputName, faceData(i).parentDir));
 	DS.annotation{i}=faceData(i).path;
end
dsScatterPlot(DS);
[recogRate, computed, nearestIndex]=knncLoo(DS);
fprintf('Recog. rate = %.2f%%\n', 100*recogRate);
