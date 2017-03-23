clc; clear all;
Ma = 0.75;
Tt4byTstp = 6;
Piic = 15;
gamma = 1.4;
Tstp = 288 ;
TabyTstp = [0.6:0.2:1.2];
Ta = TabyTstp.*Tstp;
Heat = 150 * 288;
TtabyTa = (1+ ((gamma-1)*Ma^2)/2);
Tta = TtabyTa*Ta;
kk = length(Ta);
Towc = (Piic^((gamma-1)/gamma));

for j = 1:4
    Towb(j) = (6/TabyTstp(j))*(1/TtabyTa)*(1/Towc);
    Towt(j) = 1-(TtabyTa)*(1/(6/TabyTstp(j))*(Towc-1));
    Thrust2(j) = Ma*(sqrt(Towb(j)*((TtabyTa*Towc*Towt(j)-1)/(TtabyTa-1)))-1);
    TSFC2(j) = (((6/TabyTstp(j)-(TtabyTa*Towc))*(Ta(j)/(Heat*Ma)))/(sqrt((TtabyTa/(TtabyTa-1))*(Towb(j)-1)*(Towc-1) + Towb(j))-1));
end


[ax,h1,h2] = plotyy(TabyTstp,Thrust2,TabyTstp,TSFC2);
set(ax(1), 'YLim' , [2,4])
set(ax(2), 'YLim' , [0.008,0.01])
set(ax, 'XLim' , [0.6,1.2])
set(ax(1),'YTick',[2:.5:4])
set(ax(2),'YTick',[0.008:.001:0.01])
set(get(ax(1),'Ylabel'),'string','Non-Dimensional Thrust')
set(get(ax(2),'Ylabel'),'string','TSFCaa')
xlabel('Ta/Tstp')
title('Effect of inlet static temperature on performance of Ideal Turbojet') 
%set(ax(1),'Box','off')
