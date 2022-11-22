clear all;
close all;
%setting the postions of arrays and its directions.
array=[-2 0 0; -1 0 0; 0 0 0; 1 0 0; 2 0 0];
% Three audio signals and three images are transmitted at the same frequency band
load Xaudio\Xaudio.mat;
load Ximage\Ximage.mat;
%The audio signal associated with the 2nd antenna
soundsc(real(X_au(2,:)), 11025);
%oObserve the image at the output of the second antenna
%displayimage(X_im(2,:),image_size, 201,'The received signal at the 2nd antenna');
%Form the covariance matrix of the received signal
Rxx_au= X_au*X_au'/length(X_au(1,:));
Rxx_im= X_im*X_im'/length(X_im(1,:));
numofsources = 3;
K = music(array,Rxx_au,numofsources);
figure;
plot2d3d(K, [1:181],0,'dB','MuSIC spectrum (audio)');

%K = music(array,Rxx_im,numofsources);
%figure;
%plot2d3d(K, [1:181],0,'dB','MuSIC spectrum (image)');