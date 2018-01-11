DS=dcData(7);
gPrm=gaussianMle(DS.input);
xMax=max(abs(DS.input(1,:)));
yMax=max(abs(DS.input(1,:)));
pointNum = 101;
x = linspace(-xMax, xMax, pointNum);
y = linspace(-yMax, yMax, pointNum);
[xx, yy] = meshgrid(x, y);
data = [xx(:), yy(:)]';
out = gaussian(data, gPrm);
zz = reshape(out, pointNum, pointNum);
subplot(1,2,1);
contour(xx, yy, zz, 15);
for i=1:size(DS.input,2)
	line(DS.input(1,i), DS.input(2,i), 'color', 'k', 'marker', '.');
end
axis image; title('Scattered data and contours of PDF');
subplot(1,2,2);
meshc(xx, yy, zz);
axis([-inf inf -inf inf -inf inf]);
set(gca, 'box', 'on');
title('2D Gaussian PDF identified by MLE');