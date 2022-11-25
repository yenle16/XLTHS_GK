%tinh nang luong moi khung
function [ste]= tinhSTE(frames)
    [numberFrame,numberSample_f]= size(frames);
    ste=0;
    for i=1: numberFrame
        ste(i)= sum(frames(i,:).^2);
    end
    ste = ste ./ max(ste);
end