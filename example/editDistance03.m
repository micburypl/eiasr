str1 = '�A�ڦ@�P�����P�����@��';
str2 = '�ڪ�����b�����w�Ф�';
substituteCost=1;
plotOpt = 2;
[minDist, edPath, edTable] = editDistance(str1, str2, substituteCost, plotOpt);