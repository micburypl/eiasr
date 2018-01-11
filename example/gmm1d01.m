% GMM (gaussian mixture model) for 1-D data
% ====== Plot data histogram
DS = dcData(8); data = DS.input;
subplot(2,1,1);
binNum = 30;
hist(data, binNum);
xlabel('Data values'); ylabel('Counts'); title('Data histogram');
colormap(summer);
% ====== Train GMM
gmmOpt=gmmTrain('defaultOpt');
gmmOpt.config.covType=1;
gmmOpt.config.gaussianNum = 3;
[gmmPrm, logLike]=gmmTrain(data, gmmOpt);
% ====== Plot the log likelihood
subplot(2,1,2);
plot(logLike, 'o-');
xlabel('No. of iterations of GMM training');
ylabel('Log likelihood');
% ====== Print the result
fprintf('w1=%g, mu1=%g, sigma1=%g\n', gmmPrm(1).w, gmmPrm(1).mu, gmmPrm(1).sigma);
fprintf('w2=%g, mu2=%g, sigma2=%g\n', gmmPrm(2).w, gmmPrm(2).mu, gmmPrm(2).sigma);
fprintf('w3=%g, mu3=%g, sigma3=%g\n', gmmPrm(3).w, gmmPrm(3).mu, gmmPrm(3).sigma);
fprintf('Overall logLike = %g\n', sum(log(gmmEval(data, gmmPrm))));