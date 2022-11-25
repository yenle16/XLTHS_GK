function [frames] = chiaFrame(data,fs,d_f) % d_f = do dai thoi gian moi khung (s)
    numberSample_f = d_f * fs; %So phan tu tren moi khung
    numberFrame= floor(length(data)/ numberSample_f); %truong hop co phan le trong tin hieu thi se bo
    for i=1: numberFrame
        for j=1: numberSample_f
            frames(i,j)= data(numberSample_f*(i-1)+j);
        end
    end
end