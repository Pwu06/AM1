clear
clc;
%setting the postions of arrays and its directions.
M = 5; %array number
array = [-2 0 0; -1 0 0; 0 0 0; 1 0 0; 2 0 0];
directions = [120,0];
N = 1e4; %iteration number
f0 = 1200; %signal frequency

for n = 0:N-1
S(n+1) = sin(2*pi*n/8); %generate signal sources
end

V = spv(array,directions);
St = V*S + randn(M,N); %receive the signal at array input
%LMS algorithm
Exs = S(1,:); %expected signal as the first row
u = 7e-5;
w_lms = zeros(M,1); %initialise weight
c = zeros(M,N);

for i = 1:N
    y(i) = w_lms'*St(:,i);
    e(i) = Exs(i) - y(i);
    w_lms = w_lms + u*St(:,i)*conj(e(i));
    c(:,i) = w_lms;
end

Z = patter(array,w_lms);
plot2d3d(Z,[0:180],0,'gain in dB','array pattern (30 degrees)');
figure(2);
plot([1:N],c)
title('LMS Weights (90 degrees)');
xlabel('Iteration Number'),
ylabel('Weights')


