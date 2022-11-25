%chuan hoa 
function f_norm = normalise(f,T)
    for i=1 : length(f)
        if(f(i) >=T)
            f_norm(i) = (f(i)-T)/(max(f)-T);
        else
            f_norm(i) = (f(i)-T)/(T-min(f));
        end
    end
end

