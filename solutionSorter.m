function [d1_refinedAgain, d2_refinedAgain, d3_refinedAgain] = solutionSorter(solved)
%UNTITLED3 Summary of this function goes here
%   INPUTs
%       - solved: structure array containing solutions for 3 sym variables,
%       d1, d2 & d3
%   RETURNs
%       - d1_refined: first symbolic variable solutions, processed
%       - d2_refined
%       - d3_refined
% Sort Solutions

d1_raw = vpa(solved.d1);
d1_refined = refineVPASol(d1_raw, 'round'); % process solutions
d1_refinedAgain = d1_refined(d1_refined < 120 & d1_refined > -130); % ensure all candidate x values are between -130 and 120

d2_raw = vpa(solved.d2);
d2_refined = refineVPASol(d2_raw, 'round'); % process solutions
d2_refinedAgain = d2_refined(d2_refined < 120 & d2_refined > -130); % ensure all candidate x values are between -130 and 120

d3_raw = vpa(solved.d3);
d3_refined = refineVPASol(d3_raw, 'round'); % process solutions
d3_refinedAgain = d3_refined(d3_refined < 120 & d3_refined > -150); % ensure all candidate y values are between -150 and 120

end