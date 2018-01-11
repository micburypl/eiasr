load faceData.mat
filePaths={faceData.path};
montage(filePaths(1:40), 'Size', [nan, 10]);
