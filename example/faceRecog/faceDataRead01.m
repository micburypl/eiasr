mltRoot = 'C:/Users/Misiek/Desktop/eiasr/example/faceRecog';
imageDir=[mltRoot, '/dataSet'];
faceData=recursiveFileList(imageDir, 'jpg');
fprintf('Reading %d face images from %s...', length(faceData), imageDir);
tic
for i=1:length(faceData)
% 	fprintf('%d/%d: file=%s\n', i, length(faceData), faceData(i).path);
	
    X = imread(faceData(i).path);
    
    imwrite(X,'test.pgm');
    faceData(i).image=X;
end
fprintf(' ===> %.2f sec\n', toc);
fprintf('Saving faceData.mat...\n');
save faceData faceData