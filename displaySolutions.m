function displaySolutions(varLabels, varValues)
% displays variable names and values to user
%   INPUTs
%       - varValues: double value(s) of variable(s) to be printed
%       - varLabels: string (array) labeling the name of variable(s)
%   RETURNs
%       - prints update notice to command window detailing the variables'
%       labels and values

n = length(varValues)/length(varLabels);
printIndx = 1;

for k = 1:length(varLabels)
    fprintf('%s: ', varLabels(k));
    for l = 1:n
        fprintf('%d ', varValues(printIndx));
        printIndx = printIndx + 1;
    end
    fprintf('\n');
end

end