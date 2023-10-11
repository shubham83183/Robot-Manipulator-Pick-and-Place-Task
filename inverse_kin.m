function [th1,th3] = inverse_kin( x, y ,z1)

L1 = 50; L2 = 95; L3 = 185; L4=110;
z= z1+L4;

th1 = atan2d( y,x);
%if  th1>=-180 & th1<=0
 %   th1 = th1 + 180;
%elseif th1>0 & th1<= 180
 %   th1 = th1 - 180;
%end



if z <=(L1+L2/sqrt(2))
    th45 = -asind(( L1 + L2/sqrt(2) -z)/L3) +45;
else
    th45 = asind((z - L1 - L2/sqrt(2))/L3) +45;
end
%b = (z1 - L1 - L2/sqrt(2));
%th45= acosd(b/L3);
%th3 = atan2d((-x/cosd(th1)-y/sind(th1))/2-L2, z-L1-L2/sqrt(2)) -45;

th3 = -180+th45 ;


x1 = -cosd(th1)*(L3*(cosd(th3) + sind(th3)) + L2)/sqrt(2);
y1 = -sind(th1)*(L3*(cosd(th3) + sind(th3)) + L2)/sqrt(2);
z1 = -(L3 * (-cosd(th3)+sind(th3)) -L2 -sqrt(2)*L1)/sqrt(2);
end