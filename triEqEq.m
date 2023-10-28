function [output] = triEqEq(pts, B, goal)
% sets up 3 3D equilibrium equations (eq eq) given three base coordinates
% and the force of a balloon in MAE 206 Project 1
%   INPUTs
%       - pts: 3x3 array of doubles and sym variables representing a
%       trinity of position vectors in 3D Cartesian space
%       - B: balloon force
%   RETURNs
%       - equi: set of equilibrium equations

% position vectors for cable tensions
p = [pts(1,:) - B; pts(2,:) - B; pts(3,:) - B];

% unit vectors for cable tensions
u = [p(1,:)./(sqrt(p(1,1)^2 + p(1,2)^2 + p(1,3)^2)); p(2,:)./(sqrt(p(2,1)^2 + p(2,2)^2 + p(2,3)^2)); p(3,:)./(sqrt(p(3,1)^2 + p(3,2)^2 + p(3,3)^2))];

% cable tensions
if strcmpi(goal, 'equilibrium equations')
    Tmags = [1250-100; 2000-100; 2000-100]; % constant, change if needed;
elseif strcmpi(goal, 'tensions')
    syms tension1 tension2 tension3
    Tmags = [tension1 tension2 tension3];
end
F = [Tmags(1).*u(1,:); Tmags(2).*u(2,:); Tmags(3).*u(3,:); 75 220 2.5*B(3)];
% magF = sqrt(F(4,1)^2 + F(4,2)^2 + F(4,3)^2);

% equilibrium equations
equi = [F(1,1) + F(2,1) + F(3,1) + F(4,1) == 0; F(1,2) + F(2,2) + F(3,2) + F(4,2) == 0; F(1,3) + F(2,3) + F(3,3) + F(4,3) == 0];

if strcmpi(goal, 'equilibrium equations')
    output = equi;
elseif strcmpi(goal, 'tensions')
    solvedTensions = solve(equi, [tension1 tension2 tension3]);
    output = [double(solvedTensions.tension1) double(solvedTensions.tension2) double(solvedTensions.tension3)];
end


end