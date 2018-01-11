load faceData.mat
load eigenFaceResult.mat	% Load A2, eigVec, cumVarPercent, rowDim, colDim
groundTruth=ones(10,1)*(1:40); groundTruth=groundTruth(:)';	% Create the groundtruth
dim=28;		% Take the first 28 eigenvectors
A2=A2(1:dim, :);
eigVec2=eigVec(:, 1:dim);

% === Compute the nearest neighbors in the face space
imageNum=size(A2,2);
for i=1:imageNum
	query=A2(:,i);
	distance=distPairwise(query, A2);
	distance(i)=inf;
	[sortDistance, sortIndex]=sort(distance);
	misclassifiedData(i).nearestIndex=sortIndex;
	misclassifiedData(i).distance=sortDistance;
	misclassifiedData(i).miss=0;
	if groundTruth(i)~=groundTruth(sortIndex(1))
		misclassifiedData(i).miss=1;
	end
end
% === Create the projected face
meanFace=mean(double(cat(3, faceData.image)), 3);
meanFace=meanFace(:);
for i=1:imageNum
	origFace=double(faceData(i).image);
	origFace=origFace(:);
	projFace=eigVec2*(eigVec2'*(origFace-meanFace))+meanFace;
	faceData(i).image2=reshape(projFace, rowDim, colDim);
end
missIndex=find([misclassifiedData.miss]);
missNum=length(missIndex);
n=7;
% === Display the query and the nearest-neighbor faces
for i=1:missNum
	faceIndex=missIndex(i);
	subplot(missNum, n+1, 1+(i-1)*(n+1)); imagesc(faceData(faceIndex).image2); axis image
	title(sprintf('Query %d', i));
	for j=1:n
		subplot(missNum, n+1, 1+j+(i-1)*(n+1)); imagesc(faceData(misclassifiedData(faceIndex).nearestIndex(j)).image2); axis image
		title(sprintf('d=%.2f', misclassifiedData(faceIndex).distance(j)));
	end
end
colormap(gray);
h=findobj(0, 'type', 'axes'); set(h, 'xticklabel', ''); set(h, 'yticklabel', '');