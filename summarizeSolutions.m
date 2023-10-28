function [numTries] = summarizeSolutions(d1_refined, d2_refined, d3_refined, altitude)
% summarizes processed solutions of symbolic equilibrium equations for MAE
% 206 Project 1
%   INPUTs
%       - d1_refined: double
%       - d2_refined: double
%       - d3_refined: double
%       - altitude: double
%   RETURNs
%       - numTries: double

numSolutions = [length(d1_refined) length(d2_refined) length(d3_refined)];
fprintf('At an altitude of %d m, there are %d d1, %d d2 and %d d3 solutions.\n', altitude, numSolutions(1), numSolutions(2), numSolutions(3));
numTries = min(numSolutions);
%     if numTries < 1
%         numSolutions(I) = max(numSolutions);
%         numTries = min(numSolutions);
%     end

end