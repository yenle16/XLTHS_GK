%tinh ti le bang qua bien 0 moi khung
function [zcr]= tinhZCR(frames)
    [numberFrame,numberSample_f] = size(frames);
    for i=1:numberFrame
        x=frames(i,:);  % Ma tran 1 chieu luu gia tri cua 1 khung
        count(i)=0 ; % luu so lan bang qua 0 cua khung thu i
        for j=1:numberSample_f-1
            if(x(j)*x(j+1) <0) 
                count(i) = count(i)+1;
            end
        end
    end
    zcr= count/ numberSample_f; % zcr = tong so lan bang qua 0 cua khung / so mau cua khung
    zcr = zcr ./ max(zcr);
end