% GMM (gaussian mixture model) for 2-D "uneven" data
% ====== Get data and train GMM
DS = dcData(4);
data=DS.input;
gmmOpt=gmmTrain('defaultOpt');
gmmOpt.config.covType=1;
gmmOpt.config.gaussianNum=3;
gmmOpt.train.showInfo=1;
gmmOpt.train.useKmeans=0;
gmmOpt.train.maxIteration=30;
close all;
[gmmPrm, logLike] = gmmTrain(data, gmmOpt);
% ====== Plot log prob.
figure;
subplot(2,2,1)
plot(logLike, 'o-');
xlabel('No. of iterations of GMM training');
ylabel('Log likelihood');
% ====== Plot scattered data and positions of the Gaussians
subplot(2,2,2);
plot(data(1,:), data(2,:),'.r'); axis image
theta=linspace(-pi, pi, 21);
for i=1:length(gmmPrm)
	r=sqrt(2*log(2)*gmmPrm(i).sigma);	% Gaussian reaches it's 50% height at this distance from the mean
	xData=r*cos(theta)+gmmPrm(i).mu(1);
	yData=r*sin(theta)+gmmPrm(i).mu(2);
	circleH(i)=line(xData, yData, 'color', 'k', 'linewidth', 3);
end
% ====== Surface/contour plots
pointNum = 40;
x = linspace(min(data(1,:)), max(data(1,:)), pointNum);
y = linspace(min(data(2,:)), max(data(2,:)), pointNum);
[xx, yy] = meshgrid(x, y);
data = [xx(:) yy(:)]';
z = gmmEval(data, gmmPrm);
zz = reshape(z, pointNum, pointNum);
subplot(2,2,3);
mesh(xx, yy, zz); axis tight; box on; rotate3d on
subplot(2,2,4);
contour(xx, yy, zz, 30); axis image