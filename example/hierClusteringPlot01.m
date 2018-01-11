data=rand(2, 50);			% 50 data instances of dim 2
distMat=distPairwise(data);		% Distance matrix of 50 by 50
hcOutput=hierClustering(distMat);
hierClusteringPlot(hcOutput);		% Plot the dendrogram