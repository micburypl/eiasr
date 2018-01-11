load faceData.mat
subplot(1,2,1);
imagesc(faceData(1).image); colormap(gray)
axis image;
subplot(1,2,2);
surf(double(faceData(1).image)); colormap(gray)
axis image; shading interp; view(140, 80);
