function [output] = zonalyzer(pts, zoneCosts, zoneMap)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

firstZone = zoneMap(130-pts(1,2), 120+pts(1,1));
secondZone = zoneMap(130-pts(2,2), 120+pts(2,1));
thirdZone = zoneMap(130-pts(3,2), 120+pts(3,1));

if firstZone > 0 && secondZone > 0 && thirdZone > 0
    firstZoneData = zoneCosts(firstZone, :);
    secondZoneData = zoneCosts(secondZone, :);
    thirdZoneData = zoneCosts(thirdZone, :);
    output = [firstZoneData; secondZoneData; thirdZoneData];
else
    output = zeros(3);
end

end