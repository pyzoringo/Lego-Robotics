function arm2rotation = m2a(A,B)
%m2p Summary of this function goes here
%   Move from angle A to angle B

% set angle (clockwise)
A=360-A;
B=360-B;
if B(1)-A(1)>180
    arm1rot=-(360-(B(1)-A(1)));
else if B(1)-A(1)<-180
    arm1rot=(360+(B(1)-A(1)));
    else
        arm1rot=(B(1)-A(1));
    end
end
if (B(2)-A(2)-(arm1rot))>180
    arm2rot=-(360-(B(2)-A(2)-(arm1rot)));
else if (B(2)-A(2)-(arm1rot))<-180
    arm2rot=(360+(B(2)-A(2)-(arm1rot)));
    else
        arm2rot=B(2)-A(2)-(arm1rot);
    end
end
arm1rot=7*arm1rot;
arm2rot=5*arm2rot;
% name motors
a1=NXTMotor('A');
a2=NXTMotor('C');
% set power
if abs(arm1rot)>=abs(arm2rot)
    a1power=50;
    a2power=abs(arm2rot/(arm1rot/a1power));
else
    a2power=50;
    a1power=abs(arm1rot/(arm2rot/a2power));
end
% set direction
if arm1rot==0
    a1.Power=0;
else
    a1.Power=round(a1power*(arm1rot/abs(arm1rot)));
end
if arm2rot==0
    a2.Power=0;
else
    a2.Power=round(a2power*(arm2rot/abs(arm2rot)));
end
% set TachoLimit
a1.TachoLimit=abs(arm1rot);
a2.TachoLimit=abs(arm2rot);
a1.ActionAtTachoLimit='HoldBrake';
a2.ActionAtTachoLimit='HoldBrake';
% send to NXT
a1.SendToNXT();
a2.SendToNXT();
a1.WaitFor();
a2.WaitFor();
arm2rotation=B(2)-A(2);
end

