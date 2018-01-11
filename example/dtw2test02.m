% Compare the speed/distance difference between various versions of type-1 DTW

currDir=pwd;
cd([mltRoot, '/private']);

% ====== Output test
beginCorner=1; endCorner=1;
testNum=100;
fprintf('%d runs of output tests:\n', testNum);
for i=1:testNum
	vec1=randn(1, 25);
	vec2=randn(1, 30);
	[minDist1, dtwPath1, dtwTable1] = dtw2m(vec1, vec2, beginCorner, endCorner);
	[minDist2, dtwPath2, dtwTable2] = dtw2mex(vec1, vec2, beginCorner, endCorner);
	if ~isequal(minDist1, minDist2) | ~isequal(dtwPath1, dtwPath2) | ~isequal(dtwTable1, dtwTable2)
		figure('name', 'dtw2m()');  dtwPathPlot(vec1, vec2, dtwPath1);
		figure('name', 'dtw1mex()'); dtwPathPlot(vec1, vec2, dtwPath2);
		fprintf('Press any key to continue...\n'); pause
	end
end
fprintf('\tDone!\n');

% ====== Speed test
testNum=200;
mat1=randn(testNum, 25);
mat2=randn(testNum, 30);
fprintf('%d runs of timing tests:\n', testNum);
tic
for i=1:testNum, dtw2m(mat1(i,:), mat2(i,:)); end
time1=toc;
tic
for i=1:testNum, dtw2mex(mat1(i,:), mat2(i,:)); end
time2=toc;
fprintf('\ttime1=%g, time2=%g, ratio=time1/time2=%g\n', time1, time2, time1/time2);

cd(currDir);