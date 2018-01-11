load faceData.mat
[rowDim, colDim]=size(faceData(1).image);
% ====== Compute mean face
meanFace=mean(double(cat(3, faceData.image)), 3);
% ====== Put all face into a big matrix
fprintf('Put all images into a big matrix... '); tic
for i=1:length(faceData)
	A(:,i)=double(faceData(i).image(:))-meanFace(:);
end
fprintf(' ===> %.2f sec\n', toc);
% ====== Perform PCA
fprintf('Perform PCA... '); tic
[A2, eigVec, eigValue]=pca(A);
fprintf(' ===> %.2f sec\n', toc);
% ====== Plot variance percentage vs. no. of eigenvalues
cumVar=cumsum(eigValue);
cumVarPercent=cumVar/cumVar(end)*100;
plot(cumVarPercent, '.-');
xlabel('No. of eigenvalues');
ylabel('Cumulated variance percentage (%)');
title('Variance percentage vs. no. of eigenvalues');
fprintf('Saving results into eigenFaceResult.mat...\n');
save eigenFaceResult A2 eigVec cumVarPercent rowDim colDim
