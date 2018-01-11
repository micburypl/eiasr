load faceData.mat
subplot(1,2,1);
imagesc(faceData(1).image); colormap(gray)
axis image;
subplot(1,2,2);
temp = double(faceData(1).image);
surf(temp); 
colormap(gray);
axis image; shading interp; view(140, 80);
