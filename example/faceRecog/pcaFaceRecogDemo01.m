load faceData.mat
frOpt.method='pca';
frOpt.pcaDim=28;
frOpt.plot=1;
faceRecogDemo(faceData, frOpt);