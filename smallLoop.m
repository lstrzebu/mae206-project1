function smallLoop(ptsTry, B, fid, zoneCosts, zoneMap)
% loop that tests possible coordinate solutions for MAE 206 Project 1
%   INPUTs
%       numTries: number of times for which the loop will run
%       d1_refined through d3_refined: double values
%       B: 1x3 vector representing balloon force
%       fid: file ID to which to write

% ptsTry = [d1_refined(l) d1_refined(l) 0; d2_refined(l) 0 0; 0 d3_refined(l) 0];
zoneData = zonalyzer(ptsTry, zoneCosts, zoneMap);
if zoneData(1,3) ~= 0 && zoneData(2,3) ~= 0 && zoneData(3,3) ~= 0
    [tensions] = triEqEq(ptsTry, B, 'tensions');
    if ~isempty(tensions) && tensions(1) > 0 && tensions(1) < 2000 && tensions(2) > 0 && tensions(2) < 2000 && tensions(3) > 0 && tensions(3) < 2000
        % cable length calculations, units = meters
        L = [cabLength(B, ptsTry(1,:)); cabLength(B, ptsTry(2,:)); cabLength(B, ptsTry(3,:))]; % cable lenths
        [P_kW, R_yr] = poweRevenueCalc(B(3)); % calculate power and revenue

        % payback time calculation
        %             zone1Cost = zoneData(1,2); % units: dollars
        %             zone2Cost = zoneData(2,2);
        %             zone3Cost = zoneData(3,2);
        if zoneData(2,1) == zoneData(1,1)
            buildCost = zoneData(2,2) + zoneData(3,2);
            socialCost = zoneData(2,3) + zoneData(3,3);
        elseif zoneData(3,1) == zoneData(1,1)
            buildCost = zoneData(3,2) + zoneData(2,2);
            socialCost = zoneData(3,3) + zoneData(2,3);
        elseif zoneData(2,1) == zoneData(3,1)
            buildCost = zoneData(2,2) + zoneData(1,2);
            socialCost = zoneData(2,3) + zoneData(1,3);
        else
            buildCost = zoneData(1,2) + zoneData(2,2) + zoneData(3,2);
            socialCost = zoneData(1,3) + zoneData(2,3) + zoneData(3,3);
        end
        totalCost = 175000 + 125*(L(1) + L(2) + L(3)) + buildCost;
        paybackTime = totalCost/(R_yr);
        % store final calculations
        %             n = n + 1;
        fprintf(fid, '%d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d\n', B(3), ptsTry(1,1), ptsTry(1,2), ptsTry(2,1), ptsTry(2,2), ptsTry(3,1), ptsTry(3,2), paybackTime, socialCost, zoneData(1,1), zoneData(2,1), zoneData(3,1), tensions(1), tensions(2), tensions(3));
        %             metrics(n).altitude = altitude(k);
        %             metrics(n).point1 = pt1Try;
        %             metrics(n).point2 = pt2Try;
        %             metrics(n).point3 = pt3Try;
        %             metrics(n).paybackTime = paybackTime;

    end

end

end