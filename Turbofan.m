clc; clear all;
Tt4byta = 5.78; Ma = 0.75; alpha = 4; Piff = [0.7:0.04:3.35];
Picc = [5:0.4:30]; gamma = 1.4;
Ttabyta = (1+(gamma-1)/2 * Ma^2);
lc =length(Piff); lf = length(Picc);
Towf = (Piff).^((gamma-1)/gamma);
Towc = (Picc).^((gamma-1)/gamma);
for ii = 1:lf
    for jj = 1:lc
         Thrust(jj,ii) = Ma*(sqrt((Tt4byta*1/(Ttabyta*Towc(ii)))*(Ttabyta*Towc(ii)*(1-(Ttabyta*1/Tt4byta)*((Towc(ii)-1)+alpha*(Towf(jj)-1)))-1)/(Ttabyta-1))-1) + alpha*Ma*(sqrt((Ttabyta*Towf(jj)-1)/(Ttabyta-1))-1);
    end
end
surf(Picc,Piff,Thrust);
xlabel('Compressor Pressure ratio');
ylabel('Fan Pressure ratio');
zlabel('F/(m_ta_a)');
