clear all;
close all;
%setting the postions of arrays and its directions.
array=[-2 0 0; -1 0 0; 0 0 0; 1 0 0; 2 0 0];
directions = [30,0;35,0;90,0];
Z=patter(array);
%Task 1
plot2d3d(Z,[0:180],0,'gain in dB','initial pattern');
[Z(30),Z(35),Z(90)]