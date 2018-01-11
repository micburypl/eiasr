DS=prData('iris');
inputNum=size(DS.input, 1);
DS.inputName=cellstr(int2str((1:inputNum)'));
inputSelectSequential(DS);