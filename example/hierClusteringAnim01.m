data=dcData(6);
data=data.input;
dataNum=size(data,2);
distMat=distPairwise(data, data);
distMat(1:dataNum+1:dataNum^2)=inf;	% Diagonal elements should always be inf.
method='single';			% 'single' or 'complete'
level=hierClustering(distMat, method);
hierClusteringAnim(data, distMat, level);