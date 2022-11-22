function MDL_M = MDL(Rxxp1,length_array,length_x)
[E,D] = eig(Rxxp1);
Eva = diag(D)';
[Eva,I] = sort(Eva);
Eva = fliplr(Eva(:,I));
a = zeros(1,length_array);
b = zeros(1,length_array);
geo_mean = ones(1,length_array);
arith_mean = zeros(1,length_array);
LF = zeros(1,length_array);
MDL_values = zeros(1,length_array);
geo_mean_value = 1;
arith_mean_value = 0;
for i = 1:1:length_array
    k = i-1;
    a(i) = 1/(length_array-k);
    b(i) = (length_array-k)*(length_x);
    for j = i:1:length_array
        geo_mean_value = geo_mean_value*Eva(j)^a(i);
        arith_mean_value = arith_mean_value+Eva(j);
    end
    geo_mean(i) = geo_mean_value;
    arith_mean(i) = a(i)*arith_mean_value;
    LF(i) = b(i)*log(geo_mean(i)/(arith_mean(i)));
    MDL_values(i) = -LF(i) + 0.5*k*(2*length_array-k)*log(length_x);
    geo_mean_value = 1;
    arith_mean_value = 0;
end

min_value = MDL_values(1);
MDL_M = 1;
for j = 1:1:length_array
    if (MDL_values(j) < min_value)
        MDL_M = j;
        min_value = MDL_values(j);
    end
end
MDL_M = MDL_M-1;
