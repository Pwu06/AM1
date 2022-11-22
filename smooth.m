%assumptions: M and array geometry are known.
%signal as column vector
function Rxx_modify = smooth(Rxx,array)
[a,b] = size(Rxx);
[c,d] = size(array);
Desired = c-1;
M = a-Desired+1;
Rxx_modify = zeros(Desired,Desired);
for i = 1:1:M
    Rxx_modify = Rxx_modify + Rxx(i:i+Desired-1,i:i+Desired-1);
end
Rxx_modify = Rxx_modify/M;
