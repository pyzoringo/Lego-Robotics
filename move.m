function movement = move(motor,angle)
% Basic movement of motor.
% motor: MotorPort;
m=NXTMotor(motor);
if angle<=0
    m.Power=-50;
else
    m.Power=50;
end
m.TachoLimit=abs(angle);
m.ActionAtTachoLimit='brake';
m.SendToNXT();
movement=m.ReadFromNXT();
movement=movement.Position;
end

