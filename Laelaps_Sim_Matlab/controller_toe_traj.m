function [tauFR1, tauFR2, tauHR1, tauHR2, tauFL1, tauFL2, tauHL1,...
    tauHL2, xdesFR, ydesFR, xdesFL, ydesFL, xdesHR, ydesHR, xdesHL,...
    ydesHL] = controller_toe_traj(t, xb, xbdot, yb, ybdot, thb, thbdot, ...
    thFR1, thFR1dot, thFR2, thFR2dot, thHR1, thHR1dot, thHR2, thHR2dot,...
    thFL1, thFL1dot, thFL2, thFL2dot, thHL1, thHL1dot,thHL2, thHL2dot, ...
    x_ellipse_cntr_F, y_ellipse_cntr_F, a_ellipse_F, b_ellipse_F, ...
    traj_vel_F, x_ellipse_cntr_H, y_ellipse_cntr_H, a_ellipse_H, ...
    b_ellipse_H, traj_vel_H, phaseFR, phaseFL, phaseHR, phaseHL, kp, kv)


global dF1 dF2 dF3 dH1 dH2 dH3 
global l0F l0H


%-------------------------------------------------------------------------%
% Move toes along elliptical (or semi-elliptical) trajectories
%-------------------------------------------------------------------------%
angleFR = traj_vel_F * t + phaseFR;
angleHR = traj_vel_H * t + phaseHR;
angleFL = traj_vel_F * t + phaseFL;
angleHL = traj_vel_H * t + phaseHL;

%-------------------------------------------------------------------------%
% Filters to make the trajectories semi-elliptical
% Comment out to make them elliptical
param1 = 0; % flatness of the toe trajectory in stance phase
if abs(mod(angleFR,2*pi))>pi
    b_ellipse_FR = param1*b_ellipse_F; 
else
    b_ellipse_FR = b_ellipse_F;
end

if abs(mod(angleHR,2*pi))>pi
    b_ellipse_HR = param1*b_ellipse_F; 
else
    b_ellipse_HR = b_ellipse_H;
end

if abs(mod(angleFL,2*pi))>pi
    b_ellipse_FL = param1*b_ellipse_F; 
else
    b_ellipse_FL = b_ellipse_F;
end

if abs(mod(angleHL,2*pi))>pi 
    b_ellipse_HL = param1*b_ellipse_F; 
else
    b_ellipse_HL = b_ellipse_H;
end
%-------------------------------------------------------------------------%

% Fore Right Leg
xdesFR = x_ellipse_cntr_F + a_ellipse_F * cos(angleFR);
ydesFR = y_ellipse_cntr_F + b_ellipse_FR * sin(angleFR);

% Hind Right Leg
xdesHR = x_ellipse_cntr_H + a_ellipse_H * cos(angleHR);
ydesHR = y_ellipse_cntr_H + b_ellipse_HR * sin(angleHR);

% Fore Left Leg
xdesFL = x_ellipse_cntr_F + a_ellipse_F * cos(angleFL);
ydesFL = y_ellipse_cntr_F + b_ellipse_FL * sin(angleFL);

% Hind Left Leg
xdesHL = x_ellipse_cntr_H + a_ellipse_H * cos(angleHL);
ydesHL = y_ellipse_cntr_H + b_ellipse_HL * sin(angleHL);

%-------------------------------------------------------------------------%
% Inverse Kinematics 
% Connecting leg angles to leg's edge coords relative to Body Frame
%-------------------------------------------------------------------------%
% Fore Right Leg
l1_temp = 2 * dF1;
l2_temp = dF2+l0F+dF3;
c_invk = (ydesFR^2 + xdesFR^2 - l1_temp^2 - l2_temp^2)/(2*l1_temp*l2_temp);
s_invk =  -sqrt(1 - c_invk^2);
theta2_temp = atan2(s_invk, c_invk);
k1_invk = l1_temp + l2_temp * c_invk;
k2_invk = l2_temp * s_invk;
theta1_temp = atan2(ydesFR, xdesFR) - atan2(k2_invk, k1_invk);
psiFR1_des = pi/2 + theta1_temp - thb;
psiFR2_des = theta2_temp;

% Fore Left Leg
l1_temp = 2 * dF1;
l2_temp = dF2+l0F+dF3;
c_invk = (ydesFL^2 + xdesFL^2 - l1_temp^2 - l2_temp^2)/(2*l1_temp*l2_temp);
s_invk =  -sqrt(1 - c_invk^2);
theta2_temp = atan2(s_invk, c_invk);
k1_invk = l1_temp + l2_temp * c_invk;
k2_invk = l2_temp * s_invk;
theta1_temp = atan2(ydesFL, xdesFL) - atan2(k2_invk, k1_invk);
psiFL1_des = pi/2 + theta1_temp - thb;
psiFL2_des = theta2_temp;

% Hind Right Leg
l1_temp = 2 * dH1;
l2_temp = dH2+l0H+dH3;
c_invk = (ydesHR^2 + xdesHR^2 - l1_temp^2 - l2_temp^2)/(2*l1_temp*l2_temp);
s_invk =  - sqrt(1 - c_invk^2);
theta2_temp = atan2(s_invk, c_invk);
k1_invk = l1_temp + l2_temp * c_invk;
k2_invk = l2_temp * s_invk;
theta1_temp = atan2(ydesHR, xdesHR) - atan2(k2_invk, k1_invk);
psiHR1_des = pi/2 + theta1_temp - thb;
psiHR2_des = theta2_temp;

% Hind Left Leg
l1_temp = 2 * dH1;
l2_temp = dH2+l0H+dH3;
c_invk = (ydesHL^2 + xdesHL^2 - l1_temp^2 - l2_temp^2)/(2*l1_temp*l2_temp);
s_invk =  - sqrt(1 - c_invk^2);
theta2_temp = atan2(s_invk, c_invk);
k1_invk = l1_temp + l2_temp * c_invk;
k2_invk = l2_temp * s_invk;
theta1_temp = atan2(ydesHL, xdesHL) - atan2(k2_invk, k1_invk);
psiHL1_des = pi/2 + theta1_temp - thb;
psiHL2_des = theta2_temp;



%-------------------------------------------------------------------------%
% Torques at Joints
%-------------------------------------------------------------------------%
% Fore Right Leg
tauFR1 = -kp * (thFR1-thb - psiFR1_des) - kv * (thFR1dot-thbdot);
tauFR2 = -kp * (thFR2-thFR1 - psiFR2_des) - kv * (thFR2dot-thFR1dot);

% Hind Right Leg
tauHR1 = -kp * (thHR1-thb - psiHR1_des) - kv * (thHR1dot-thbdot);
tauHR2 = -kp * (thHR2-thHR1 - psiHR2_des) - kv * (thHR2dot-thHR1dot);

% Fore Left Leg
tauFL1 = -kp * (thFL1-thb - psiFL1_des) - kv * (thFL1dot-thbdot);
tauFL2 = -kp * (thFL2-thFL1 - psiFL2_des) - kv * (thFL2dot-thFL1dot);

% Hind Left Leg
tauHL1 = -kp * (thHL1-thb - psiHL1_des) - kv * (thHL1dot-thbdot);
tauHL2 = -kp * (thHL2-thHL1 - psiHL2_des) - kv * (thHL2dot-thHL1dot);



end