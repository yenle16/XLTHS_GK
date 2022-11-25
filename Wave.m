function Wave = Wave(INPUT_WAVE,f_s,f_d)
%STE_WAVE la ma tran nang luong moi voi gia tri cua moi mau la gia tri
% nang luong cua frame chua mau do
% f_s la tan so lay mau
% f_d la do dai cua frame
numberSample_f = floor(f_d * f_s); %so luong phan tu moi khung
Wave = 0; %khoi tao khung
for i = 1 : length(INPUT_WAVE)
    vitri = length(Wave); %luu vi tri hien tai cua make_wave
    Wave(vitri : vitri + numberSample_f) = INPUT_WAVE(i); %cap du lieu cho khung o vi tri hien tai
end