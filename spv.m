function S=spv(array,direction,mainlobe);
%....................................................
% S=spv(array,direction,mainlobe);
% Source Position Vectors:
% NB:if f and c are given then use array*2*f/c;
% written by Dr A.Manikas
%....................................................
if nargin<=2, mainlobe=[]; end;

SOURCES=frad(direction);
N=length(array(:,1)); %5
M=length(SOURCES(:,1)); %3

if nargin<=2 | isempty(mainlobe)
   U0=zeros(N,M);
else
   saz=frad(mainlobe(1));sel=frad(mainlobe(2));
   k0 = fki(saz,sel); %KI = pi*[cos(az).*cos(el)   sin(az).*cos(el)    sin(el)]';
   U0=  repc(array*k0,M);
end;

KI = fki(SOURCES(:,1),SOURCES(:,2));

S = exp(-j*(array*KI -U0));