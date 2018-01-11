load faceData.mat
load eigenFaceResult.mat	% Load A2, eigVec, cumVarPercent, rowDim, colDim

% ====== Create DS
DS.input=A2;
DS.outputName=unique({faceData.parentDir});
DS.output=zeros(1, size(DS.input,2));
for i=1:length(DS.output)
	DS.output(i)=find(strcmp(DS.outputName, faceData(i).parentDir));
 	DS.annotation{i}=faceData(i).path;
end

% ====== RR w.r.t. no. of eigenvectors
myTic=tic;
maxDim=100;
rr=pcaPerfViaKnncLoo(DS, maxDim, 1);
plot(1:maxDim, cumVarPercent(1:maxDim), '.-', 1:maxDim, rr*100, '.-'); grid on
xlabel('No. of eigenfaces');
ylabel('LOO recog. rate & cumulated variance percentage');
[maxValue, maxIndex]=max(rr);
line(maxIndex, maxValue*100, 'marker', 'o', 'color', 'r');
legend('Cumulated variance percentage', 'LOO recog. rate', 'location', 'southeast');
fprintf('Optimum number of eigenvectors = %d, with recog. rate = %.2f%%\n', maxIndex, maxValue*100);
toc(myTic)