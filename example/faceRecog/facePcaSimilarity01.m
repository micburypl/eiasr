load faceData.mat
load eigenFaceResult.mat	% Load A2, eigVec, cumVarPercent, rowDim, colDim

A2=A2(1:28, :);
target=A2(:,1);
allDistance=distPairwise(target, A2);
personNum=length(faceData)/10;
for i=1:personNum
	mask=inf*ones(length(allDistance), 1);
	index=(i-1)*10+1:i*10;
	mask(index)=allDistance(index);
	[distance(i), nearest(i)]=min(mask);
end
[minDistance, minIndex]=sort(distance);
nearest=nearest(minIndex);
nearest=reshape(nearest, personNum/4, 4)';
clear temp
for i=1:4
	temp(i).imageVec=[faceData(nearest(i,:)).image];
end
imageMat=cat(1, temp.imageVec);
subplot(2,1,1);
imagesc(imageMat); axis image; colormap(gray);
set(gca, 'xtick', []); set(gca, 'ytick', []);
subplot(2,1,2);
plot(minDistance, 'o-');
title('Distance (after projection) to the first image');
ylabel('Distance'); xlabel('Index of the sorted distance');
