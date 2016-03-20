function pos = resetP()
%ressetP Summary of this function goes here
%   reset Position of motor A and C
a=NXTMotor('A');
c=NXTMotor('C');
a.ResetPosition();
c.ResetPosition();
da=a.ReadFromNXT();
dc=c.ReadFromNXT();
pos=[da dc];
end

