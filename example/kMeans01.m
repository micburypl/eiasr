% ====== Get the data set
DS = dcData(5);
subplot(2,2,1);
plot(DS.input(1,:), DS.input(2,:), '.');
axis tight, axis image
% ====== Run kmeans
centerNum=4;
[center, U, distortion, allCenters] = kMeansClustering(DS.input, centerNum);
% ====== Plot the result
subplot(2,2,2);
vqDataPlot(DS.input, center);
subplot(2,1,2);
plot(distortion, 'o-');
xlabel('No. of iterations'); ylabel('Distortion'); grid on
