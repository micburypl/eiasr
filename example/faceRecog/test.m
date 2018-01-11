load faceData.mat
[rowDim, colDim]=size(faceData(1).image);

tic
A=zeros(rowDim*colDim, length(faceData));
for i=1:length(faceData)
	A(:,i)=double(faceData(i).image(:));
end
toc

tic
B=double(reshape(cat(2, faceData.image), rowDim*colDim, length(faceData)));
toc

isequal(A, B)