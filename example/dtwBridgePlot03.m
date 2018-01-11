vec1=[71 73 75 80 80 80 78 76 75 73 71 71 71 73 75 76 76 68 76 76 75 73 71 70 70 69 68 68 72 74 78 79 80 80 78];
vec2=[69 69 73 75 79 80 79 78 76 73 72 71 70 70 69 69 69 71 73 75 76 76 76 76 76 75 73 71 70 70 71 73 75 80 80 80 78];
dtwOpt=dtwOptSet;
dtwOpt.type=1; [minDist1, dtwPath1, dtwTable1] = dtw(vec1, vec2, dtwOpt);
dtwOpt.type=2; [minDist2, dtwPath2, dtwTable2] = dtw(vec1, vec2, dtwOpt);
subplot(2,1,1); dtwBridgePlot(vec1, vec2, dtwPath1, '3d'); title('DTW alignment by type-1 DTW'); view(-10, 70);
subplot(2,1,2); dtwBridgePlot(vec1, vec2, dtwPath2, '3d'); title('DTW alignment by type-2 DTW'); view(-10, 70);

