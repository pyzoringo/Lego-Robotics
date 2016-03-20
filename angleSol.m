function angles = angleSol(x,y)
%angleSol 
%   solve for angle base on coordinate
%   (x,y) coordinate
%   alpha: base angle(to x-axis); beta: arm angle (to x-axis)
x=x-200; y=y-200;
alpha=0:1:360;
beta=0:1:360;
% a*cos(alpha)+b*cos(beta)
% a*sin(alpha)+b*sin(beta)
a=123;b=112; % arm1:12.3cm; arm2:11.2cm
ca=cosd(alpha);sa=sind(alpha);
cb=cosd(beta);sb=sind(beta);
aca=repmat(a*ca',[1,length(beta)]);
bcb=repmat(b*cb,[length(alpha),1]);
asa=repmat(a*sa',[1,length(beta)]);
bsb=repmat(b*sb,[length(alpha),1]);
xx=aca+bcb;xx=abs(xx-x);
yy=asa+bsb;yy=abs(yy-y);
buff=xx+yy;
buf=buff-min(min(buff));
[r1,c1]=find(buf==0);
buff(r1-3:r1+3,c1-3:c1+3)=buff(r1-3:r1+3,c1-3:c1+3)+max(max(buff));
r1=r1(1);c1=c1(1);
buf=buff-min(min(buff));
[r2,c2]=find(buf==0);
r2=r2(1);c2=c2(1);
if sqrt(x^2+y^2)<(123+112)
    angle1=[r1,r2]-1;
    angle2=[c1,c2]-1;
    disp('      Angle1  Angle2');
    disp(['COM1: ' num2str(angle1(1)) '     ' num2str(angle2(1))]);
    disp(['COM2: ' num2str(angle1(2)) '     ' num2str(angle2(2))]);
    angles=[angle1;angle2];
else
    disp('out of range')
    disp('      Angle1  Angle2');
    disp(['COM: ' num2str(r1-1) '   ' num2str(c1-1)]);
    angles=[r1-1 r1-1;c1-1 c1-1];
end

