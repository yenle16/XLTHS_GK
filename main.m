clear all;close all;
%Tim nguong chung

%Tin Hieu Kiem Thu
%  studio_F1_U= [1:68 71:110 114:122 128:165 171:176 180:186 193:215];
% studio_F1_V= [69:70 111:113 123:127 166:170 177:179 187:192 216:286];
% 
% studio_M1_U= [1:87 95:126 134:159 167:178 183:206];
% studio_M1_V= [88:94 127:133 160:166 179:182 207:273];
% 
% phone_M1_U = [1:46 140:150 170:179 279:286 294:310 330:345 353:415];
% phone_M1_V = [47:139 151:169 180:278 287:293 311:329 346:352];
% 
% phone_F1_U= [ 1:53 115:121 136:145 161:183 221:228 236:240 253:266 274:275];
% phone_F1_V= [ 54:114 122:135 146:160 184:220 229:235 241:252 267:273 276:323];


%Tin Hieu Huan Luyen
phone_F2_U= [1:102 189:195 217:225 261:275 335:338 346:362 381:391 401:404];
phone_F2_V= [103:188 196:216 226:260 276:334 339:345 363:380 392:400 405:480];

phone_M2_U = [1:53 106:112 125:131 147:168 198:206 213:217 231:243 251:252];
phone_M2_V = [54:105 113:124 132:146 169:197 207:212 218:230 244:250 253:280];

studio_F2_U= [1:77 126:127 136:141 177:183 199:206 238:314];
studio_F2_V= [78:125 128:135 142:176 184:198 207:237];

studio_M2_U= [46:48 78:79 89:92 133:137 154:159 194:238];
studio_M2_V= [1:45 49:77 80:88 93:132 138:153 160:193];

fd=0.01;
T_ste=0;
T_zcr=0;
for i=1:4
    if i==1
        [data,fs] = audioread('studio_F2.wav');
        frames=chiaFrame(data,fs,fd);
        ste = tinhSTE(frames);
        zcr = tinhZCR(frames);
        T_ste = T_ste + threshold(ste(studio_F2_V),ste(studio_F2_U));
        T_zcr = T_zcr +threshold(zcr(studio_F2_V),zcr(studio_F2_U));      
    end
    
    if i==2
        [data,fs] = audioread('studio_M2.wav');
        frames=chiaFrame(data,fs,fd);
        ste = tinhSTE(frames);
        zcr = tinhZCR(frames);
        T_ste = T_ste +threshold(ste(studio_M2_V),ste(studio_M2_U));
        T_zcr = T_zcr +threshold(zcr(studio_M2_V),zcr(studio_M2_U));
    end
    
    if i==3
        [data,fs] = audioread('phone_F2.wav');
        frames=chiaFrame(data,fs,fd);
        ste = tinhSTE(frames);
        zcr = tinhZCR(frames);
        T_ste = T_ste+threshold(ste(phone_F2_V),ste(phone_F2_U));
        T_zcr = T_zcr +threshold(zcr(phone_F2_V),zcr(phone_F2_U));
    end
    
    if i==4
        [data,fs] = audioread('phone_M2.wav');
        frames=chiaFrame(data,fs,fd);
        ste = tinhSTE(frames);
        zcr = tinhZCR(frames);
        T_ste = T_ste+threshold(ste(phone_M2_V),ste(phone_M2_U));
        T_zcr = T_zcr +threshold(zcr(phone_M2_V),zcr(phone_M2_U));
    end
end
T_zcr = T_zcr/4;
T_ste = T_ste/4;
%Ket thuc tinh nguong chung


%Bat dau giai quyet bai toan
for i=1:4
    if i==1
        show_Figure=figure('Name','File studio_F1') ;
        [data,fs] = audioread('studio_F1.wav');
        bound=[0.0 0.68 0.70 1.1 1.13 1.22 1.27 1.65 1.7 1.76 1.79 1.86 1.92 2.15 2.86];
        % bound2= [0.00 0.77 1.25 1.27 1.35 1.41 1.76 1.83 1.98 2.06 2.37 3.14];                  
    end
    
    if i==2
        show_Figure=figure('Name','File studio_M1') ;
        [data,fs] = audioread('studio_M1.wav');
        bound=[0.0 0.87 0.94 1.26 1.33 1.59 1.66 1.78 1.82 2.06 2.73];
        %bound2 = [0.00 0.45 0.48 0.77 0.88 0.92 1.32 1.37 1.53 1.59 1.93 2.38];
    end
    
    if i==3
        show_Figure=figure('Name','File phone_F1') ;
        [data,fs] = audioread('phone_F1.wav');
         bound=[0.0 0.53 1.14 1.21 1.35 1.45 1.60 1.83 2.2 2.28 2.35 2.40 2.52 2.66 2.73 2.75 3.23];
         % bound2 = [0.00 1.02 1.88 1.95 2.16 2.25 2.6 2.75 3.34 3.38 3.45 3.62 3.8 3.91 4.0 4.04 4.48];
    end
    
    if i==4
        show_Figure=figure('Name','File phone_M1') ;
        [data,fs] = audioread('phone_M1.wav');
        bound=[0.0 0.46 1.39 1.50 1.69 1.79 2.78 2.86 2.93 3.10 3.29 3.45 3.52 4.15];
         %bound2 = [0.00 0.53 1.05 1.12 1.24 1.31 1.46 1.68 1.97 2.06 2.12 2.17 2.3 2.43 2.5 2.52 2.8];
    end
    
    frames=chiaFrame(data,fs,fd);
    ste = tinhSTE(frames);
    zcr = tinhZCR(frames);
    
    %tim nguong cua ste,zcr
    ste_norm = normalise(ste,T_ste);
    zcr_norm = normalise(zcr,T_zcr);
    vu =QuyetDinh(ste_norm,zcr_norm);
    ylim([-1 1]);

    %Ve do thi STE,ZCR
    subplot(3,1,1);
    time = length(data)/fs;
    t=linspace(0,time,length(data));
    plot(t, data);
    title('DO THI STE VA ZCR');
    hold on;
    time1 = length(Wave(ste_norm,fs,fd))/fs;
    t1 = linspace(0, time1 ,length(Wave(ste_norm,fs,fd)));
    hold on;
    plot(t1,Wave(ste_norm,fs,fd),'r','LineWidth',1);
    hold on;
    plot(t1,Wave(zcr_norm,fs,fd),'-b','LineWidth',1);
    legend('ZCR','STE');

      %Ve ket qua chuan
    subplot (3,1,2);
    time=length(data)/fs;
   
    plot(t,data);
    title('DO THI KET QUA CHUAN');
     for i=1:length(bound)  
        xline(bound(i),'Color','r','LineStyle','-');
     end
   

    
    
    vu= LocDL(vu);
    line_vu=[]; %danh dau nhung diem chuyen tu voice sang unvoice
    index=1;
    for i=1:length(vu)-1
        if(vu(i)==0 && vu(i+1)==1 || vu(i)==1 && vu(i+1)==0)
            line_vu(index)=i*fd; %luu hoanh do cua nhung diem chuyen tiep
            index=index+1;
        end
    end
       
    %Do thi ket qua thuc hien
    subplot(3,1,3);
    time = length(data)/fs;
    t = linspace(0, time ,length(data));
    plot(t,data); 
    title('DO THI KET QUA THUC HIEN');
    hold on;
    for i=1:length(line_vu)
        xline(line_vu(i),'-b','LineWidth',1);
    end
    for i=1:2:length(line_vu)-1
        text((line_vu(i+1)-line_vu(i))/2+line_vu(i),0.8,'v');
    end
    ylim([-1 1]);
    
 
end

















