
function [tauFR1, tauFR2, tauHR1, tauHR2, tauFL1, tauFL2, tauHL1,...
    tauHL2, xdesFR, ydesFR, xdesFL, ydesFL, xdesHR, ydesHR, xdesHL,... 
    ydesHL] = controller_high_level(t, xb, xbdot, yb, ybdot, thb,...
    thbdot, thFR1, thFR1dot, thFR2, thFR2dot, thHR1, thHR1dot, thHR2,...
    thHR2dot, thFL1, thFL1dot, thFL2, thFL2dot, thHL1,...
    thHL1dot, thHL2, thHL2dot)


if t < 2

%-------------------------------------------------------------------------%
% Position Legs at initial positions
%-------------------------------------------------------------------------%
xdesFR = 0.0;
ydesFR = -0.55;
xdesFL = 0.0;
ydesFL = -0.55;
xdesHR = -0.00;
ydesHR = -0.55;
xdesHL = -0.00; 
ydesHL = -0.55;

% PD gains
kp = 250;
kv = 30;

[tauFR1, tauFR2, tauHR1, tauHR2, tauFL1, tauFL2, tauHL1,...
    tauHL2, xdesFR, ydesFR, xdesFL, ydesFL, xdesHR, ydesHR, xdesHL,...
    ydesHL] = controller_toe_pos(xdesFR, ydesFR, xdesFL, ydesFL, xdesHR,...
    ydesHR, xdesHL, ydesHL, xb, xbdot, yb, ybdot, thb, thbdot, thFR1,...
    thFR1dot, thFR2, thFR2dot, thHR1, thHR1dot, thHR2, thHR2dot, thFL1,...
    thFL1dot, thFL2, thFL2dot, thHL1, thHL1dot,thHL2, thHL2dot, kp, kv);


elseif t < 4.5
% Call various controllers

%% Call the controller for toe ellipses (Trotting)
%-------------------------------------------------------------------------%
% Give ellipse parameters
% Trajectory parameters for fore legs
y_ellipse_cntr_F = - 0.55;
x_ellipse_cntr_F = 0;
% Ellipse geometry
a_ellipse_F = 0;
b_ellipse_F = 0.05;
% frequency
traj_vel_F = -2;

% Trajectory parameters for hind legs
y_ellipse_cntr_H = - 0.55;
x_ellipse_cntr_H = 0;
% Ellipse geometry
a_ellipse_H = 0;
b_ellipse_H = 0.05;
% frequency
traj_vel_H = -2; 

% Control Gains
kp = 250;
kv = 30;
    
% Legs' phase
phaseFR = 0*pi/2;
phaseFL = 0*pi/2;
phaseHR = 0*pi/2;
phaseHL = 0*pi/2;


[tauFR1, tauFR2, tauHR1, tauHR2, tauFL1, tauFL2, tauHL1,...
    tauHL2, xdesFR, ydesFR, xdesFL, ydesFL, xdesHR, ydesHR, xdesHL,...
    ydesHL] = controller_toe_traj(t, xb, xbdot, yb, ybdot, thb, thbdot, ...
    thFR1, thFR1dot, thFR2, thFR2dot, thHR1, thHR1dot, thHR2, thHR2dot,...
    thFL1, thFL1dot, thFL2, thFL2dot, thHL1, thHL1dot,thHL2, thHL2dot, ...
    x_ellipse_cntr_F, y_ellipse_cntr_F, a_ellipse_F, b_ellipse_F, ...
    traj_vel_F, x_ellipse_cntr_H, y_ellipse_cntr_H, a_ellipse_H, ...
    b_ellipse_H, traj_vel_H, phaseFR, phaseFL, phaseHR, phaseHL, kp, kv);



elseif t < 8
% Call various controllers

%% Call the controller for toe ellipses (Trotting)
%-------------------------------------------------------------------------%
% Give ellipse parameters
% Trajectory parameters for fore legs
y_ellipse_cntr_F = - 0.55;
x_ellipse_cntr_F = 0;
% Ellipse geometry
a_ellipse_F = 0;
b_ellipse_F = 0.05;
% frequency
traj_vel_F = -2;

% Trajectory parameters for hind legs
y_ellipse_cntr_H = - 0.55;
x_ellipse_cntr_H = 0;
% Ellipse geometry
a_ellipse_H = 0;
b_ellipse_H = 0.05;
% frequency
traj_vel_H = -2; 

% Control Gains
kp = 250;
kv = 30;
    
% Legs' phase
phaseFR = 2*pi/2;
phaseFL = 0*pi/2;
phaseHR = 0*pi/2;
phaseHL = 2*pi/2;


[tauFR1, tauFR2, tauHR1, tauHR2, tauFL1, tauFL2, tauHL1,...
    tauHL2, xdesFR, ydesFR, xdesFL, ydesFL, xdesHR, ydesHR, xdesHL,...
    ydesHL] = controller_toe_traj(t, xb, xbdot, yb, ybdot, thb, thbdot, ...
    thFR1, thFR1dot, thFR2, thFR2dot, thHR1, thHR1dot, thHR2, thHR2dot,...
    thFL1, thFL1dot, thFL2, thFL2dot, thHL1, thHL1dot,thHL2, thHL2dot, ...
    x_ellipse_cntr_F, y_ellipse_cntr_F, a_ellipse_F, b_ellipse_F, ...
    traj_vel_F, x_ellipse_cntr_H, y_ellipse_cntr_H, a_ellipse_H, ...
    b_ellipse_H, traj_vel_H, phaseFR, phaseFL, phaseHR, phaseHL, kp, kv);


elseif t < 35

% Give ellipse parameters
% Trajectory parameters for fore legs
y_ellipse_cntr_F = - 0.55;
x_ellipse_cntr_F = -0.00;
% Ellipse geometry
a_ellipse_F = 0.05;
b_ellipse_F = 0.05;
% frequency
traj_vel_F = -2;

% Trajectory parameters for hind legs
y_ellipse_cntr_H = - 0.55;
x_ellipse_cntr_H = -0.00;
% Ellipse geometry
a_ellipse_H = 0.05;
b_ellipse_H = 0.05;
% frequency
traj_vel_H = -2; 

% Control Gains
kp = 1000;
kv = 250;
    
% Legs' phase
phaseFR = 2*pi/2;
phaseFL = 0*pi/2;
phaseHR = 0*pi/2;
phaseHL = 2*pi/2;


[tauFR1, tauFR2, tauHR1, tauHR2, tauFL1, tauFL2, tauHL1,...
    tauHL2, xdesFR, ydesFR, xdesFL, ydesFL, xdesHR, ydesHR, xdesHL,...
    ydesHL] = controller_toe_traj(t, xb, xbdot, yb, ybdot, thb, thbdot, ...
    thFR1, thFR1dot, thFR2, thFR2dot, thHR1, thHR1dot, thHR2, thHR2dot,...
    thFL1, thFL1dot, thFL2, thFL2dot, thHL1, thHL1dot,thHL2, thHL2dot, ...
    x_ellipse_cntr_F, y_ellipse_cntr_F, a_ellipse_F, b_ellipse_F, ...
    traj_vel_F, x_ellipse_cntr_H, y_ellipse_cntr_H, a_ellipse_H, ...
    b_ellipse_H, traj_vel_H, phaseFR, phaseFL, phaseHR, phaseHL, kp, kv);



end


%-------------------------------------------------------------------------%
% Enable Actuators Limits - Uncomment to enable
%-------------------------------------------------------------------------%
[tauFR1, tauFR2, tauHR1, tauHR2, tauFL1, ... 
        tauFL2, tauHL1, tauHL2] = motor_limits_enable...
        (tauFR1, tauFR2, tauHR1, tauHR2, tauFL1, ... 
        tauFL2, tauHL1, tauHL2);


end