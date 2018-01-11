DS=prData('iris');
rangeVec=dsRangePlot(DS);
rangeRatio=max(rangeVec)/min(rangeVec);
fprintf('range ratio = %g\n', rangeRatio);