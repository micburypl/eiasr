load faceData.mat
allFaces=double(cat(3, faceData.image));
meanFace=mean(allFaces, 3);
imagesc(meanFace); axis image; colormap(gray);
