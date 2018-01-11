dataNum=1000;
x=5*randn(dataNum, 1)+2;
y=2*randn(dataNum, 1)+1;
data=x+sqrt(-1)*y;
data=data*exp(-sqrt(-1)*pi/6);	% Тр30Ћз
data=[real(data)'; imag(data)'];
plotOpt=1;
[mu, variance]=gaussianMle(data, plotOpt)
plot(data(1,:), data(2,:), '.'); axis image

pointNum=20;
x=linspace(min(data(1,:)), max(data(1,:)), pointNum);
y=linspace(min(data(2,:)), max(data(2,:)), pointNum);
[xx, yy] = meshgrid(x, y);
data2 = [xx(:), yy(:)]';
out = gaussian(data2, mu, variance);
figure;
mesh(xx, yy, reshape(out, pointNum, pointNum));
axis tight