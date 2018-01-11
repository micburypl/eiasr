load faceData.mat
load eigenFaceResult.mat	% Load A2, eigVec, cumVarPercent, rowDim, colDim

eigVec2=eigVec(:, 1:28);			% Take the first 28 eigenvectors
origFace=double(faceData(31).image);
origFace=origFace(:);
meanFace=mean(double(cat(3, faceData.image)), 3);
meanFace=meanFace(:);
projFace=eigVec2*(eigVec2'*(origFace-meanFace))+meanFace;

subplot(1,3,1);
imagesc(reshape(origFace, rowDim, colDim));
axis image; colormap(gray); title('Original image');
subplot(1,3,2);
imagesc(reshape(projFace, rowDim, colDim));
axis image; colormap(gray); title('Projected image');
subplot(1,3,3);
imagesc(reshape(origFace-projFace, rowDim, colDim));
axis image; colormap(gray); title('Difference');
fprintf('Difference between orig. and projected images = %g\n', norm(origFace-projFace)); 