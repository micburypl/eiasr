clear j
dataNum = 1000;
data = randn(1,dataNum)+j*randn(1,dataNum)/3;
data = data*exp(j*pi/6);	% Rotate 30 degree
data = data-mean(data);		% Mean subtraction
plot(real(data), imag(data), '.'); axis image;
DS.input=[real(data); imag(data)];
[DS2, v, eigValue] = pca(DS);
v1 = v(:, 1);
v2 = v(:, 2);
arrow = [-1 0 nan -0.1 0 -0.1]+1+j*[0 0 nan 0.1 0 -0.1];
arrow1 = 2*arrow*(v1(1)+j*v1(2))*eigValue(1)/dataNum;
arrow2 = 2*arrow*(v2(1)+j*v2(2))*eigValue(2)/dataNum;
line(real(arrow1), imag(arrow1), 'color', 'r', 'linewidth', 4);
line(real(arrow2), imag(arrow2), 'color', 'k', 'linewidth', 4);
title('Axes for PCA');