clear all;
close all;
%setting the postions of arrays and its directions.
array=[-2 0 0; -1 0 0; 0 0 0; 1 0 0; 2 0 0];
directions = [30,0;35,0;90,0];
unwant_d = [35,0;30,0];
%S=spv(array, directions);
%Form the covariance matrix of the 3 sources (coherent)
Rmm = [1 1 0;1 1 0;0 0 1];
%Additive isotropic noise, 10dB below the power of the signals
sigma2 = 0.1;
% Form the covariance matrix of the signals at the input of the array-Rxx_theoretical
%Rxx_theoretical=S*Rmm*S'+sigma2*eye(5,5);
% Three audio signals and three images are transmitted at the same frequency band
load Xaudio\Xaudio.mat;
load Ximage\Ximage.mat;

%Form the covariance matrix of the received signal
Rxx_au= X_au*X_au'/length(X_au(1,:));
Rxx_im= X_im*X_im'/length(X_im(1,:));

%12.3 using the direction estimated by music algorithm
Sd = spv(array,[90,0]);
Sdun = spv(array,unwant_d);

Sjp = fpoc(Sdun);
Weight_super = Sjp*Sd;

yt = Weight_super'*X_im;
%displayimage(yt/max(yt)*255, image_size, 202,'The received signal at multi-beamformer (90 degrees)');
displayimage(yt, image_size, 202,'The received signal at multi-beamformer (90 degrees)');

Z = patter(array,Weight_super);
plot2d3d(Z,[0:180],0,'gain in dB','multi-beamformer desired 90 dergees');

%yt = Weight_super'*X_au; 
%soundsc(real(yt), 11025);
