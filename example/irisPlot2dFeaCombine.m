ds=prData('iris');
ds.input=[ds.input(1,:).*ds.input(2,:); ds.input(3,:).*ds.input(4,:)];
ds.inputName='';
ds.inputName{1}='Area of sepal';
ds.inputName{2}='Area of petal';
dsScatterPlot(ds);