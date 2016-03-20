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
% precise movement
mA.TachoLimit = 360;
% action at limit (brake, coast, or hold brake)
mA.ActionAtTachoLimit = 'brake';
% start the motor movement
mA.SendToNXT();
% wait for movement to complete
mA.WaitFor();
% read motor A data
dataA = mA.ReadFromNXT();
% print the tacho on motor A
disp(['Motor A tacho: ' num2str(dataA.Position)]);
% close the open connection
COM_CloseNXT(handle);
% disconnect message
disp('Disconnected.');