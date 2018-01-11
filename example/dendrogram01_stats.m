% This example requires Statistics Toolbox
addpath([matlabroot, '/toolbox/stats']);    % Add the path
rand('seed',12); 
X = rand(100,2); 
Y = pdist(X,'cityblock'); 
Z = linkage(Y,'average'); 
[H, T] = dendrogram(Z);
box on