currDir=pwd;
cd([mltRoot, '/private']);

vec1=[0 1 2 3 3 2 1 0 0 1 2 1 0];
vec2=[0 0 1 2 3 2 1 0 0 0 1 3 2 0];
[minDist1, dtwPath1, dtwTable1] = dtw2m(vec1, vec2);
[minDist2, dtwPath2, dtwTable2] = dtw2mex(vec1, vec2);
fprintf('minDist1=%g, minDist2=%g, error=%g\n', minDist1, minDist2, abs(minDist1-minDist2));
dtwPathPlot(vec1, vec2, {dtwPath1, dtwPath2});

cd(currDir);