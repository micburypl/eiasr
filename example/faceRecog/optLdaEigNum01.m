load faceData.mat
load eigenFaceResult.mat	% Load A2, eigVec, rowDim, colDim, etc

% ====== Create DS
DS=faceData2ds(faceData);
DS.input=A2;
% ====== RR w.r.t. no. of eigenvectors
myTic=tic;
opt.maxDim=60;
opt.mode='approximate';
DS.input=DS.input(1:opt.maxDim, :);
recogRate=ldaPerfViaKnncLoo(DS, opt, 1);
[maxRr, index]=max(recogRate);
line(index, maxRr*100, 'color', 'r', 'marker', 'o');
fprintf('Max RR=%.2f%% at dim=%d\n', maxRr*100, index);
toc(myTic)