%ket hop 2 thuat toan ste va zcr
function [vu]= QuyetDinh(ste,zcr)
    for i=1:length(ste)
         if ste(i) < -0.95 vu(i)=0;
         else if(ste(i)-zcr(i)<0)
            vu(i)=0;
         else vu(i)=1;
         end
    end
end