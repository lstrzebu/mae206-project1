% Project 1 - Wind Balloon Turbine
% MAE 206 Team 63
% 1/20/23
% Liam Trzebunia-Niebies, Cole Spillman, George Wilz

clear;clc;close all;

% read zones data

fid = fopen('MAE_206_Project1_Results.csv', 'w');
fprintf(fid, 'alt, x1, y1, x2, y2, x3, y3, payback time, social impact score, first zone, second zone, third zone, first cable tension, second cable tensions, third cable tension\n');

zoneCosts = readmatrix("MAE_206_proj1_zonesData.xlsx");
zoneMap = readmatrix('BalloonMap.csv');

% pts = [-110 0 0; 0 50 0; 40 40 0];

%%
n = 0; % for solution storage
altitude = 600; % altDiagnostics();
% syms d1 d2 d3

% zones (2,) 4, 6, 7
% zone 2 x: 0 to 110
% zone 2 y: 10 to 120
% zone 4 x: 20 to 110
% zone 4 y: -90 to 10
% zone 6 x: -130 to -50
% zone 6 y: -110 to 20
% zone 7 x: -20 to 10
% zone 7 y: -150 to -70



for f = -100:25:125
    for e = -100:25:125
        for d = -115:round(105/10):-10
            for c = -75:round(95/10):20
                for b = -115:round(105/10):-10
                    for a = -75:round(95/10):20
pts = [a b 0; c d 0; e f 0];

largeLoop(altitude, pts, fid, zoneCosts, zoneMap); % run large loop
% smallLoop(numTries, pts, B, fid, zoneCosts, zoneMap);

% for z = 1:length(metrics)
%     metrics(z).paybackTime = double(metrics(z).paybackTime);
% end
% fprintf('The minimum payback time was %d,' min(metrics(l).paybackTime));

                    end
                end
            end
        end
    end
end

fclose(fid);

%% Plotting
% coord1 = [30 50];
% figure(1);
% xlim([-130 120]); ylim([-150 120]); grid on; hold on;