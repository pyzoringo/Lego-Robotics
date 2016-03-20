function play = playTone(handle)
%playTone Summary of this function goes here
%   Detailed explanation goes here
% play tone 1 at 400Hz for 500ms
NXT_PlayTone(400,500,handle);
% pause for 0.5s
pause(0.5);
% play tone 2 at 800Hz for 500ms
NXT_PlayTone(800,500,handle);

end

