str1 = '你我共同的文件與網路世界';
str2 = '我的文件放在網路硬碟中';
substituteCost=1;
plotOpt = 2;
[minDist, edPath, edTable] = editDistance(str1, str2, substituteCost, plotOpt);