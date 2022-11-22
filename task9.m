clear all;
close all;
%setting the postions of arrays and its directions.
array=[-2 0 0; -1 0 0; 0 0 0; 1 0 0; 2 0 0];
directions = [30,0;35,0;90,0];
S=spv(array, directions);
%Form the covariance matrix of the 3 sources (uncorrelated and of powers)
Rmm = [1 0 0;0 1 0;0 0 1];
%Rmm = [1 1 0;1 1 0;0 0 1];
%Additive isotropic noise, 40dB below the power of the signals
sigma2 = 0.1;
% Form the covariance matrix of the signals at the input of the array-Rxx_theoretical
Rxx_theoretical=S*Rmm*S'+sigma2*eye(5,5);
S = [];
directions = [];
sigma2 = [];
Rmm = [];
numofsources = 3;
K = music(array,Rxx_theoretical,numofsources);
figure;
plot2d3d(K, [1:181],0,'dB','MuSIC spectrum (theoretical)');