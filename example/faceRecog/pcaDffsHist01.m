load faceData.mat
load eigenFaceResult.mat	% Load A2, eigVec, cumVarPercent, rowDim, colDim

meanFace=mean(double(cat(3, faceData.image)), 3);
meanFace=meanFace(:);
eigVec2=eigVec(:, 1:28);			% Take the first 28 eigenvectors

for i=1:length(faceData)
	temp=A2(29:end,i);
	dffs(i)=norm(temp);
end
subplot(3,1,1);
hist(dffs, 30);

[minValue, minIndex]=min(dffs);
origFace=double(faceData(minIndex).image);
origFace=origFace(:);
projFace=eigVec2*(eigVec2'*(origFace-meanFace))+meanFace;
subplot(3,3,4);
imagesc(reshape(origFace, rowDim, colDim));
axis image; colormap(gray); title('Original image');
subplot(3,3,5);
imagesc(reshape(projFace, rowDim, colDim));
axis image; colormap(gray); title('Projected image');
subplot(3,3,6);
imagesc(reshape(origFace-projFace, rowDim, colDim));
axis image; colormap(gray); title('Difference');
fprintf('Min DFFS = %g\n', norm(origFace-projFace));

[maxValue, maxIndex]=max(dffs);
origFace=double(faceData(maxIndex).image);
origFace=origFace(:);
projFace=eigVec2*(eigVec2'*(origFace-meanFace))+meanFace;
subplot(3,3,7);
imagesc(reshape(origFace, rowDim, colDim));
axis image; colormap(gray); title('Original image');
subplot(3,3,8);
imagesc(reshape(projFace, rowDim, colDim));
axis image; colormap(gray); title('Projected image');
subplot(3,3,9);
imagesc(reshape(origFace-projFace, rowDim, colDim));
axis image; colormap(gray); title('Difference');
fprintf('Max DFFS = %g\n', norm(origFace-projFace)); 