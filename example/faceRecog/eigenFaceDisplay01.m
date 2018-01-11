load eigenFaceResult.mat	% load A2, eigVec, rowDim, colDim, etc
reducedDim=16;			% Display the first 16 eigenfaces
eigenfaces = reshape(eigVec, rowDim, colDim, size(A2,2));
side=ceil(sqrt(reducedDim));
for i=1:reducedDim
	subplot(side,side,i);
	imagesc(eigenfaces(:,:,i)); axis image; colormap(gray);
	set(gca, 'xticklabel', ''); set(gca, 'yticklabel', '');
end
