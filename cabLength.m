function [L] = cabLength(head, tail)
% calculates length of a cable (or any vector) given start and stop points
%   INPUTs
%       - head: a row vector of cartesian coords
%       - tail: a row vector of cartesian coords
%   RETURNs
%       - L: length of vector or cable

L = sqrt((head(1)-tail(1))^2 + (head(2)-tail(2))^2 + (head(3)-tail(3))^2);

end