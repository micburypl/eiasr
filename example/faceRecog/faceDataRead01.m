mltRoot = 'C:/Users/Misiek/Desktop/eiasr/example/faceRecog';
imageDir=[mltRoot, '/dataSet/att_faces'];
faceData=recursiveFileList(imageDir, 'pgm');
fprintf('Reading %d face images from %s...', length(faceData), imageDir);
tic
for i=1:length(faceData)
% 	fprintf('%d/%d: file=%s\n', i, length(faceData), faceData(i).path);
	faceData(i).image=imread(faceData(i).path);
end
fprintf(' ===> %.2f sec\n', toc);
fprintf('Saving faceData.mat...\n');
save faceData faceData