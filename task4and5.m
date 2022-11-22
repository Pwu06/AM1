clear all;
close all;
%setting the postions of arrays and its directions.
array=[-2 0 0; -1 0 0; 0 0 0; 1 0 0; 2 0 0];
directions = [30,0;35,0;90,0];
Z=patter(array);
plot2d3d(Z,[0:180],0,'gain in dB','initial pattern');
S=spv(array, directions);
%Form the covariance matrix of the 3 sources (uncorrelated and of powers)
Rmm = [1 0 0;0 1 0;0 0 1];
%Additive isotropic noise, 40dB below the power of the signals
sigma2 = 0.0001;
% Form the covariance matrix of the signals at the input of the array-Rxx_theoretical
Rxx_theoretical=S*Rmm*S'+sigma2*eye(5,5);
% Three audio signals and three images are transmitted at the same frequency band
load Xaudio\Xaudio.mat;
load Ximage\Ximage.mat;
%The audio signal associated with the 2nd antenna
soundsc(real(X_au(2,:)), 11025);
%oObserve the image at the output of the second antenna
displayimage(X_im(2,:),image_size, 201,'The received signal at the 2nd antenna');
%Form the covariance matrix of the received signal
Rxx_au= X_au*X_au'/length(X_au(1,:));
Rxx_im= X_im*X_im'/length(X_im(1,:));
%clear the known conditions
S = [];
directions = [];
sigma2 = [];
Rmm = [];
Eig_value_theo = eig(Rxx_theoretical);
%Task 5.2
%Repeat instructions 5.1 & 5.2, use the practical covariance matrices and Rxx_au, Rxx_im
Eig_value_au = eig(Rxx_au);
Eig_value_im = eig(Rxx_im);