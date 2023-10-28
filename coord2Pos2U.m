function [unitVector] = coord2Pos2U(to,from)
% transforms two points into a unit vector
%   INPUTs
%       - to: row vector signifying cartesian coords of point to which the vector goes; head
%       - from: tail
%   RETURNs: 

posV = to - from;
unitVector = posV./(sqrt(posV(1)^2 + posV(2)^2 + posV(3)^2));
         
end