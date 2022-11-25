% thuat toan tim nguong 
function T = threshold(f,g)
T_min = max(min(f),min(g)); %thu hep khoang tim nghiem
T_max = min(max(f),max(g));
T = 0.5*(T_min+T_max);
nf = length(find(f<T)); % so luong phan tu nho hon T cua f
ng = length(find(g>T)); % so luong phan tu lon hon T cua g
j = -1; % so luong phan tu nf cu
q = -1; % so luong phan tu ng cu
N_f = length(f);
N_g = length(g);
while ~( nf==j && ng==q)
    if sum(f(f>T)-T)/N_f - sum(T-g(g<T))/N_g > 0 % so sanh ti le phan tu bi mat voi nguong T cua f() va g()
        T_min = T;
    else T_max = T;
    end
    T = 0.5*(T_min+T_max);
    j = nf; q = ng;
    nf = sum(f<T);
    ng = sum(g>T);
end
end
