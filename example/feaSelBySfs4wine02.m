DS=prData('wine');
inputNum=size(DS.input, 1);
DS.inputName=cellstr(int2str((1:inputNum)'));
DS.input=inputNormalize(DS.input);		% Feature normalization
inputSelectSequential(DS, 6);