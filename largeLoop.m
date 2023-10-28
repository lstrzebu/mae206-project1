function largeLoop(altitude, pts, fid, zoneCosts, zoneMap)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

        for k = 1:length(altitude)
%             pts = [d1 d1 0; d2 0 0; 0 d3 0];
            B = [0 0 altitude(k)];
%             equi = triEqEq(pts, B, 'equilibrium equations'); % generate equilibrium equations
%             solved = solve(equi, [d1 d2 d3]);
% 
%             [d1_refined, d2_refined, d3_refined] = solutionSorter(solved); % sort solutions
% 
%             % user diagnostics
%             numTries = summarizeSolutions(d1_refined, d2_refined, d3_refined, altitude(k));
%             displaySolutions(["d1", "d2", "d3"], [d1_refined, d2_refined, d3_refined]); % display solutions to user

            % Small Loop Begin
            smallLoop(pts, B, fid, zoneCosts, zoneMap);

        end
end