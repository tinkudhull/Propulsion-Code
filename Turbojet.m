clc; clear all;
Ma = 0.75; Tt4byTa = 6; PIc = [5:2.5:25]; Heat = 150;
gamma = 1.4; Ta = 288; TtabyTa = (1+ ((gamma-1)*Ma^2)/2);
Tta = TtabyTa*Ta; k = length(PIc);
for i = 1:k
    Towc(i) = (PIc(i)).^((gamma-1)/gamma);
    Towb(i) = (Tt4byTa)*(1/TtabyTa)*(1/Towc(i));
    Towt(i) = 1-(TtabyTa)*(1/Tt4byTa)*(Towc(i)-1);
    Thrust(i) = Ma*(sqrt(Towb(i)*((TtabyTa*Towc(i)*Towt(i)-1)/(TtabyTa-1)))-1);
    TSFC(i) = ((Tt4byTa-(TtabyTa*Towc(i)))*(1/(Heat*Ma)))/(sqrt((TtabyTa/(TtabyTa-1))*(Towb(i)-1)*(Towc(i)-1) + Towb(i))-1);
end
[ax,h1,h2] = plotyy(PIc,Thrust,PIc,TSFC); grid on ;
set(ax(1), 'YLim' , [1,3]); set(ax(2), 'YLim' , [0,0.02]);
set(ax, 'XLim' , [5,25]); set(ax(1),'YTick',[1:.5:3]);
set(ax(2),'YTick',[0:.005:0.02]);
set(get(ax(1),'Ylabel'),'string','Non-Dimensional Thrust')
set(get(ax(2),'Ylabel'),'string','TSFCa_a')
xlabel('Compressor Total Pressure Ratio')
title('Effect of compressor total pressure ratio on performance of Ideal Turbojet') 
