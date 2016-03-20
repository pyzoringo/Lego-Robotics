function pos = rOrigin()
%rOrigin Summary of this function goes here
%   return to Origin()
a=NXTMotor('A');
c=NXTMotor('C');
da=a.ReadFromNXT();
dc=c.ReadFromNXT();
Pa=da.Position;
Pc=dc.Position;
move('A',-Pa);
move('C',-Pc);

end

