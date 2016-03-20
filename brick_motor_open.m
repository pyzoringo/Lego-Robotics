% close all NXT connection
COM_CloseNXT all
% connect to the NXT thru bluetooth
handle = COM_OpenNXT('bluetooth.ini');
% set global default handle
COM_SetDefaultNXT(handle);
% connection message
disp('Connected! Moving motor A...');
% motor object connect to port A
mA = NXTMotor('A');
% set the maximum power to 50, range is -100 to 100
mA.Power=50;
% start the motor movement
mA.SendToNXT();
% pause for 2 second
pause(2);
% brake
mA.Stop('brake');
% read motor A data
dataA = mA.ReadFromNXT();
% print the tacho on motor A
disp(['Motor A tacho: ' num2str(dataA.Position)]);
% close the open connection
COM_CloseNXT(handle);
% disconnect message
disp('Disconnected.');