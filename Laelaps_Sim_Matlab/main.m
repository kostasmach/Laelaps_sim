%-------------------------------------------------------------------------%
% 2D Simulation of a quadruped robot with 2-segmented springy legs
% Dynamics derived with Mathematica 
% Mathematica file: "Quadruped_model_2_segmented_springy_legs.nb"
% Created by Konstantinos Machairas (kmach@central.ntua.gr) - 9/2016
%-------------------------------------------------------------------------%

clear global;
clear all;
clc;

%-------------------------------------------------------------------------%
% Define physical parameters of the system
%-------------------------------------------------------------------------%
global mb Ib mF1 IF1 mF2 IF2 mF3 IF3 mH1 IH1 mH2 IH2 mH3 IH3
global db dF1 dF2 dF3 dH1 dH2 dH3
global kspringF kspringH bspringF bspringH l0F l0H
global k_ground b_ground g
global xout tout
global psiFR1_0 psiFR2_0 psiHR1_0 psiHR2_0
global psiFL1_0 psiFL2_0 psiHL1_0 psiHL2_0
global mu_d mu_s slip_error friction_velocity
global i2 tfinal


%-------------------------------------------------------------------------%
% Enable/ Disable EOM solving, amimation
%-------------------------------------------------------------------------%
solve_EOM = true; % enable ODE solving
anim = true; % enable animation


%-------------------------------------------------------------------------%
% Simulation duration
%-------------------------------------------------------------------------%
tstart = 0;
tfinal = 30;


%-------------------------------------------------------------------------%
% Gravity
%-------------------------------------------------------------------------%
g = 9.81;
%g = 0;


%-------------------------------------------------------------------------%
% Body 
%-------------------------------------------------------------------------%
% Body mass 
mb = 41;
% Distance from a hip joint to body's COM
db = 0.3;
% Body MoI
Ib = 3.97;


%-------------------------------------------------------------------------%
% Hind leg (right and left)
%-------------------------------------------------------------------------%
% Link 1
mH1 = 0.6; % link 1 mass
dH1 = 0.125; % distance from link's COM to link's joint
Ilink1 = mH1*(2*dH1)^2/3; % link 1 moment of inertia
Irotor1 = 0.0000542; % rotor's MoI
ngear1 = 53; % gear ratio
IH1 = Ilink1 + Irotor1 * ngear1 ^ 2; % total MoI that motor 1 has to drive
% Link 2
mH2 = 0.5; % link 2 mass
dH2 = 0.075; % distance from link's COM to link's joint
Ilink2 = mH2*(2*dH2)^2/3; % link 2 moment of inertia
Irotor2 = 0.0000542; % rotor's MoI
ngear2 = 53; % gear ratio
IH2 = Ilink2 + Irotor2 * ngear2 ^ 2; % total MoI that motor 2 has to drive
% Link 3
mH3 = 0.23; % link 3 mass
dH3 = 0.075; % distance from link's COM to link's joint
IH3 = mH3*(2*dH3)^2/3; % link 3 moment of inertia


%-------------------------------------------------------------------------%
% Fore leg (right and left)
%-------------------------------------------------------------------------%
% Link 1
mF1 = 0.6; % link 1 mass
dF1 = 0.125*cos(deg2rad(10)); % distance from link's COM to link's joint 
% Ilink1 = mF1*(2*dF1)^2/3; % link 1 moment of inertia
% Irotor1 = 0.0000542; % rotor's MoI
% ngear1 = 53; % gear ratio
% IF1 = Ilink1 + Irotor1 * ngear1 ^ 2; % total MoI that motor1 has to drive
IF1 = IH1; % Set it equal to this of the hind legs
% Link 2
mF2 = 0.5; % link 2 mass
dF2 = 0.075*cos(deg2rad(10)); % distance from link's COM to link's joint
% Ilink2 = mF2*(2*dF2)^2/3; % link 2 moment of inertia
% Irotor2 = 0.0000542; % rotor's MoI
% ngear2 = 53; % gear ratio
% IF2 = Ilink2 + Irotor2 * ngear2 ^ 2; % total MoI that motor2 has to drive
IF2 = IH2; % Set it equal to this of the hind legs
% Link 3
mF3 = 0.23; % link 3 mass
dF3 = 0.075*cos(deg2rad(10)); % distance from link's COM to link's joint
IF3 = mF3*(2*dF3)^2/3; % link 3 moment of inertia


%-------------------------------------------------------------------------%
% Compliance between the 2nd and the 3rd segment
%-------------------------------------------------------------------------%
% Stiffness
kspringF = 12250;
kspringH = 12250;
% Energy losses at springts
bspringF = 0.3; % link 1 (fore leg)
bspringH = 0.3; % link 2 (fore leg)
% Free length
l0F = 0.3169*cos(deg2rad(10))-(dF2+dF3);
l0H = 0.3169-(dH2+dH3);


%-------------------------------------------------------------------------%
% Hunt - Crossley model for ground contact
%-------------------------------------------------------------------------%
k_ground = 400000;
b_ground = 0.3*k_ground;


%-------------------------------------------------------------------------%
% Friction Model
%-------------------------------------------------------------------------%
mu_s = 1.2;
mu_d = 1.1;
slip_error = 0.001;            % velocity transition to stick
friction_velocity = 0.01;      % Stiction velocity


%-------------------------------------------------------------------------%
% Solve the Equations of Motion
%-------------------------------------------------------------------------%
if solve_EOM == true
   
    
%-------------------------------------------------------------------------%
% Matrix form: M(x,x') * x' = F(x,x')
%-------------------------------------------------------------------------%
% x(1) = xb 
% x(2) = xb' 
% x(3) = yb
% x(4) = yb'
% x(5) = thb
% x(6) = thb'
% x(7) = thFR1
% x(8) = thFR1'
% x(9) = thFR2
% x(10) = thFR2'
% x(11) = lFR
% x(12) = lFR'
% x(13) = thHR1
% x(14) = thHR1'
% x(15) = thHR2
% x(16) = thHR2'
% x(17) = lHR
% x(18) = lHR'
% x(19) = thFL1
% x(20) = thFL1'
% x(21) = thFL2
% x(22) = thFL2'
% x(23) = lFL
% x(24) = lFL'
% x(25) = thHL1
% x(26) = thHL1'
% x(27) = thHL2
% x(28) = thHL2'
% x(29) = lHL
% x(30) = lHL'


%-------------------------------------------------------------------------%
% Set initial conditions in terms of relative angles
%-------------------------------------------------------------------------%
xb_0 = 0;
xbdot_0 = 0; 
yb_0 = 0.48;
ybdot_0 = 0;
thb_0 = deg2rad(0);
thbdot_0 = 0;

psiFR1_0 = deg2rad(40);
psiFR1dot_0 = 0;
psiFR2_0 = deg2rad(-80);
psiFR2dot_0 = 0;

psiHR1_0 = deg2rad(40);
psiHR1dot_0 = 0;
psiHR2_0 = deg2rad(-80);
psiHR2dot_0 = 0;

psiFL1_0 = deg2rad(40);
psiFL1dot_0 = 0;
psiFL2_0 = deg2rad(-80);
psiFL2dot_0 = 0;

psiHL1_0 = deg2rad(40);
psiHL1dot_0 = 0;
psiHL2_0 = deg2rad(-80);
psiHL2dot_0 = 0;


%-------------------------------------------------------------------------%
% Set initial conditions in terms of absolute angles
%-------------------------------------------------------------------------%
thFR1_0 = psiFR1_0 + thb_0;
thFR1dot_0 = psiFR1dot_0 + thbdot_0;
thFR2_0 = psiFR2_0 + thFR1_0;
thFR2dot_0 = psiFR2dot_0 + thFR1dot_0;
lFR_0 = l0F;
lFRdot_0 = 0;
thHR1_0 = psiHR1_0 + thb_0;
thHR1dot_0 = psiHR1dot_0 + thbdot_0;
thHR2_0 = psiHR2_0 + thHR1_0;
thHR2dot_0 = psiHR2dot_0 + thHR1dot_0;
lHR_0 = l0H;
lHRdot_0 = 0;

thFL1_0 = psiFL1_0 + thb_0;
thFL1dot_0 = psiFL1dot_0 + thbdot_0;
thFL2_0 = psiFL2_0 + thFL1_0;
thFL2dot_0 = psiFL2dot_0 + thFL1dot_0;
lFL_0 = l0F;
lFLdot_0 = 0;
thHL1_0 = psiHL1_0 + thb_0;
thHL1dot_0 = psiHL1dot_0 + thbdot_0;
thHL2_0 = psiHL2_0 + thHL1_0;
thHL2dot_0 = psiHL2dot_0 + thHL1dot_0;
lHL_0 = l0H;
lHLdot_0 = 0;


%-------------------------------------------------------------------------%
% Vector of initial conditions
%-------------------------------------------------------------------------%
x0 = [xb_0, xbdot_0, yb_0, ybdot_0, thb_0, thbdot_0, thFR1_0, ... 
    thFR1dot_0, thFR2_0, thFR2dot_0, lFR_0, lFRdot_0, thHR1_0, ...
    thHR1dot_0, thHR2_0, thHR2dot_0, lHR_0, lHRdot_0, thFL1_0, ...
    thFL1dot_0, thFL2_0, thFL2dot_0, lFL_0, lFLdot_0, thHL1_0, ...
    thHL1dot_0, thHL2_0, thHL2dot_0, lHL_0, lHLdot_0];


%-------------------------------------------------------------------------%
% Initializations
%-------------------------------------------------------------------------%
i2 = 0; % counter used in dynamics function


%-------------------------------------------------------------------------%
% Solve
%-------------------------------------------------------------------------%
options = odeset('MaxStep',1e-3,'AbsTol',1e-4,'RelTol',1e-4,'Mass',@mass);
% options = odeset('AbsTol',1e-5,'RelTol',1e-5,'Mass',@mass);
tspan = [tstart tfinal]; % Set the time interval
[t,x] = ode15s(@dynamics,tspan,x0,options); % Solve ODE
%[t,x] = ode23t(@dynamics,tspan,x0,options); % Solve ODE

% Save the results
xout = x; 
tout = t;

end


%-------------------------------------------------------------------------%
% Animation
%-------------------------------------------------------------------------%
% Check if it is enabled
if anim == true 

    % Check if there are data for animation
    if ~exist('x') 
        disp('no data for animation')
    else
        % run animation script
        animation
    end   
end


%-------------------------------------------------------------------------%
% Post processing
%-------------------------------------------------------------------------%
post_processing


%-------------------------------------------------------------------------%
% Animation with more info
%-------------------------------------------------------------------------%
%animation_postproc
animation_postproc_3


%-------------------------------------------------------------------------%
% Plot Results
%-------------------------------------------------------------------------%
plot_data
 
 
 
