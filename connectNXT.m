function h = connectNXT()
% connect NXT via bluetooth
%
% close all NXT connection
COM_CloseNXT all
% connect to the NXT thru bluetooth
h = COM_OpenNXT('bluetooth.ini');
% set global default handle
COM_SetDefaultNXT(h);
% connection message
NXT_PlayTone(400,500,h);
% pause for 0.5s
pause(0.5);
% play tone 2 at 800Hz for 500ms
NXT_PlayTone(800,500,h);
% display connected message
disp('Connected! ');

end

