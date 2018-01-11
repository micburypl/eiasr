% On the use of different cluster distance for dendrogram
% This script requires Statistics Toolbox

load clusterData.mat	% load X
Y = pdist(X);

clusterDist={'single', 'complete', 'average', 'centroid', 'ward'};

for i=1:5
	subplot(2,3,i) 
	Z = linkage(Y, clusterDist{i}); 
	[H, T] = dendrogram(Z);
	title(['Cluster distance = ', clusterDist{i}]);
	box on
end
