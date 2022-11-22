clear all;
close all;
%setting the postions of arrays and its directions.
array=[-2 0 0; -1 0 0; 0 0 0; 1 0 0; 2 0 0];
directions = [30,0;35,0;90,0];
S=spv(array, directions);
numofsources = 3;
%Form the covariance matrix of the 3 sources (coherent)
Rmm = [1 1 0;1 1 0;0 0 1];
%Additive isotropic noise, 10dB below the power of the signals
sigma2 = 0.1;
% Form the covariance matrix of the signals at the input of the array-Rxx_theoretical
Rxx_theoretical=S*Rmm*S'+sigma2*eye(5,5);
S = [];
directions = [];
sigma2 = [];
Rmm = [];
Rxx_modi = smooth(Rxx_theoretical,array);
array=[array(1:4,:)];
K = music(array,Rxx_modi,numofsources);
plot2d3d(K, [1:181],0,'dB','MuSIC spectrum (smoothing)');