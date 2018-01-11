data=rand(2, 50);			% 50 data instances of dim 2
distMat=distPairwise(data);		% Distance matrix of 50 by 50
method='single';
hcOutput=hierClustering(distMat, method);
subplot(1,2,1); hierClusteringPlot(hcOutput); title(['method=', method]);
method='complete';
hcOutput=hierClustering(distMat, method);
subplot(1,2,2); hierClusteringPlot(hcOutput); title(['method=', method]);