% close all NXT connection
COM_CloseNXT all;
% connect to NXT thru bluetooth
handle = COM_OpenNXT('bluetooth.ini');
% set global default handle
COM_SetDefaultNXT(handle);
% connection message
disp('Connected! Playing tones...');
% play tone 1 at 400Hz for 500ms
NXT_PlayTone(400,500,handle);
% pause for 0.5s
pause(0.5);
% play tone 2 at 800Hz for 500ms
NXT_PlayTone(800,500,handle);
% close the open connection
COM_CloseNXT(handle);
% disconnection message
disp('Disconnected.');