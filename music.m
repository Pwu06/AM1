%assumptions: M and array geometry are known.
%signal as column vector
function K = music(array,Rxx,numofsources)
[a,b] = size(array);
[M,S] = eig(Rxx);
Eva = diag(S)';
[Eva,I] = sort(Eva);
M = fliplr(M(:,I));

for i = 1:1:181
    Smu = spv(array,[i,0]);
    En = M(:,(numofsources+1):a);
    ES(i) =  1/(Smu'*En*En'*Smu);
end
ES = abs(ES);
K = 10*log10(ES);

