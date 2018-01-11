% GMM (gaussian mixture model) for 1-D data
% ====== Plot the histogram
clf
DS = dcData(8); data = DS.input;
subplot(2,1,1);
binNum = 30;
hist(data, binNum);
xlabel('Data values'); ylabel('Counts'); title('Data histogram');
colormap(summer);
% ====== Perform GMM training
gmmOpt=gmmTrain('defaultOpt');
gmmOpt.config.gaussianNum = 3;
[gmmPrm, logLike]=gmmTrain(data, gmmOpt);
% ====== Plot the PDF
x = linspace(min(data), max(data));
subplot(2,1,2);
hold on
for i = 1:gmmOpt.config.gaussianNum,
	h1 = plot(x, gaussian(x, gmmPrm(i)), '--m');
	set(h1, 'linewidth', 2);
end
for i = 1:gmmOpt.config.gaussianNum,
	h2 = plot(x, gaussian(x, gmmPrm(i))*gmmPrm(i).w, ':b');
	set(h2, 'linewidth', 2);
end
total = zeros(size(x));
for i = 1:gmmOpt.config.gaussianNum,
	g(i,:)=gaussian(x, gmmPrm(i));
	total=total+g(i, :)*gmmPrm(i).w;
end
h3 = plot(x, total, 'r');
set(h3, 'linewidth', 2);
hold off
box on
legend([h1 h2 h3], 'g_i', 'w_ig_i', '\Sigma_i w_ig_i');
xlabel('Data values'); ylabel('Prob.'); title('Gaussian mixture model');
% Print texts of g1, g2, g3
for i=1:gmmOpt.config.gaussianNum
	[maxValue, index]=max(g(i, :));
	text(x(index), maxValue, ['g_', int2str(i)], 'vertical', 'bottom', 'horizon', 'center');
end
% ====== Plot the curve on top of the histogram
k = size(data,2)*(max(data)-min(data))/binNum;
subplot(2,1,1)
line(x, total*k, 'color', 'r', 'linewidth', 2);