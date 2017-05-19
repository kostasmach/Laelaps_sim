function [ tauFR1, tauFR2, tauHR1, tauHR2, tauFL1, ... 
        tauFL2, tauHL1, tauHL2] = motor_limits_enable...
        ( tauFR1, tauFR2, tauHR1, tauHR2, tauFL1, ... 
        tauFL2, tauHL1, tauHL2)

limit_1 = 22;
limit_2 = 25;
    
% Fore Right Leg - Hip
if tauFR1 > limit_1
    tauFR1 = limit_1;
elseif tauFR1 < -limit_1
    tauFR1 = -limit_1;
end

% Fore Right Leg - Knee
if tauFR2 > limit_2
    tauFR2 = limit_2;
elseif tauFR2 < -limit_2
    tauFR2 = -limit_2;
end

% Hind Right Leg - Hip
if tauHR1 > limit_1
    tauHR1 = limit_1;
elseif tauHR1 < -limit_1
    tauHR1 = -limit_1;
end

% Hind Right Leg - Knee
if tauHR2 > limit_2
    tauHR2 = limit_2;
elseif tauHR2 < -limit_2
    tauHR2 = -limit_2;
end

% Fore Left Leg - Hip
if tauFL1 > limit_1
    tauFL1 = limit_1;
elseif tauFL1 < -limit_1
    tauFL1 = -limit_1;
end

% Fore Left Leg - Knee
if tauFL2 > limit_2
    tauFL2 = limit_2;
elseif tauFL2 < -limit_2
    tauFL2 = -limit_2;
end

% Hind Left Leg - Hip
if tauHL1 > limit_1
    tauHL1 = limit_1;
elseif tauHL1 < -limit_1
    tauHL1 = -limit_1;
end

% Hind Left Leg - Knee
if tauHL2 > limit_2
    tauHL2 = limit_2;
elseif tauHL2 < -limit_2
    tauHL2 = -limit_2;
end


end

