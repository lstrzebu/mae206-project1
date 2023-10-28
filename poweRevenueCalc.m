function [P_kW, R_yr] = poweRevenueCalc(altitude)
% Calculates power output (kW) and revenue ($/yr) for MAE 206 Project 1 
%   INPUTs
%       - altitude: height of balloon in meters
%   RETURNs
%       - P_kW: power output in kW
%       - R_yr: yearly revenue ($/yr)

% power calculation
P_W = 100*altitude; % units = Watts
P_kW = P_W/1000; % units = kW

% revenue calculation: $0.11/kWh for the first 50 kW, then $0.10/kWh for
% any additional power generation
if P_kW <= 50
    R_hr = 0.11 * P_kW;
elseif P_kW > 50
    R_hr = 0.11*50 + 0.10*(P_kW - 50);
end
R_yr = R_hr*(24)*(365); % units: /yr

end