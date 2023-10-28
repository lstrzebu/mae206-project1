function [output_refined] = refineVPASol(input_unrefined, varargin)
% processes solutions from the MAE 206 Wind Ballooon Turbine Coordinate
% Solver model
%   INPUT(s)
%       - input_unrefined: vector of solutions in double form
%       - varargin: expected to possibly include the char array / string
%       "round," case insensitive
%   RETURN(s)
%       - output_unrefined: processed and possibly rounded vector of
%       solutions in double form

output_refined = [];
for h = 1:length(input_unrefined)
    if isreal(input_unrefined(h))
        output_refined = [output_refined input_unrefined(h)];
    end
end

if strcmpi(varargin{1}, 'round')
    output_refined = round(output_refined); % round to integer values
end

end