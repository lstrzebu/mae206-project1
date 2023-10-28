function [altitude] = altDiagnostics()
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
        altMin = input('Enter a minimum altitude in (m): ');
        altMax = input('Enter a maximum altitude in (m): ');
        altStep = input('Enter an altitude step: ');
        altitude = altMin:altStep:altMax;
end