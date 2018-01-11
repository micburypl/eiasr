DS=prData('abalone');
index=DS.output>8;
DS.input(:, index)=[];
DS.output(:, index)=[];
dsDistPlot(DS);
