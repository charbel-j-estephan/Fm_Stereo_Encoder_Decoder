% Runs FM_Stereo_System.slx and exports what the report needs.
%   simulink_model.png  picture of the block diagram
%   simulink_mpx.csv    time and MPX signal (output of Add1, the Audio Signal scope)
% The model file is not changed or saved.

here = fileparts(mfilename('fullpath'));
cd(here);

Ts  = 3e-7;                 % sample time used by every source block
mdl = 'FM_Stereo_System';

load_system(mdl);
print(['-s' mdl], '-dpng', '-r200', fullfile(here, 'simulink_model.png'));

blk = [mdl '/Audio Signal'];
set_param(blk, 'DataLogging', 'on', ...
               'DataLoggingVariableName', 'mpxData', ...
               'DataLoggingSaveFormat', 'Array', ...
               'DataLoggingLimitDataPoints', 'off');

out = sim(mdl, 'StopTime', '0.02');
d   = out.get('mpxData');
writematrix(d, fullfile(here, 'simulink_mpx.csv'));

close_system(mdl, 0);
disp('Simulink export done');
