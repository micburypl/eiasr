ds=prData('iris');
ds.input=ds.input(3:4, :);
for i=1:length(ds.output)
	ds.annotation{i}=sprintf('Data index=%d\nPosition=%s\nClass=%s', i, mat2str(ds.input(:,i)), ds.outputName{ds.output(i)});
end
opt.showAnnotation=1;
opt.showLegend=1;
dsScatterPlot(ds, opt);