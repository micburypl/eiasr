% ====== Get the data set
DS = dcData(5);
centerNum=4;
% ====== Get initial cluster centers
initCenter=myvqInitCenter(DS.input, centerNum);
clf;
subplot(2,2,1);
vqDataPlot(DS.input, initCenter);
% ====== Run k-means to get the final cluster centers
[center, U, distortion, allCenters] = kMeansClustering(DS.input, initCenter);
subplot(2,2,2);
vqDataPlot(DS.input, center);
% ====== Plot the distortion
subplot(2,2,3);
plot(1:length(distortion), distortion, 'o-');
xlabel('No. of iterations');
ylabel('Distortion');
grid on; axis tight
% ====== Plot the moving paths of the centers
subplot(2,2,4);
for i=1:centerNum
	xData=allCenters(1,i,:); xData=xData(:);
	yData=allCenters(2,i,:); yData=yData(:);
	line(xData, yData, 'color', getColor(i), 'lineWidth', 3);	
end
box on; axis image