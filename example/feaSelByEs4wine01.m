DS=prData('wine');
inputNum=size(DS.input, 1);
DS.inputName=cellstr(int2str((1:inputNum)'));
inputSelectExhaustive(DS);