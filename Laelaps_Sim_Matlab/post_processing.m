%-------------------------------------------------------------------------%
% Post Processing
%-------------------------------------------------------------------------%

global tfinal

n = size(tout); % data size


%-------------------------------------------------------------------------%
% Initialization of new vectors
%-------------------------------------------------------------------------%
NForces = [];
FForces = [];
Slip_events = [];
Torques = [];
Toe_coords = [];
Toe_coords_des = [];


for i_p = 1 : n

%-------------------------------------------------------------------------%
% Read the output vector element by element
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
xb = x(i_p,1);
xbdot = x(i_p,2); 
yb = x(i_p,3);
ybdot = x(i_p,4);
thb = x(i_p,5);
thbdot = x(i_p,6);
thFR1 = x(i_p,7);
thFR1dot = x(i_p,8);
thFR2 = x(i_p,9);
thFR2dot = x(i_p,10);
lFR = x(i_p,11);
lFRdot = x(i_p,12);
thHR1 = x(i_p,13);
thHR1dot = x(i_p,14);
thHR2 = x(i_p,15);
thHR2dot = x(i_p,16);
lHR = x(i_p,17);
lHRdot = x(i_p,18);
thFL1 = x(i_p,19);
thFL1dot = x(i_p,20);
thFL2 = x(i_p,21);
thFL2dot = x(i_p,22);
lFL = x(i_p,23);
lFLdot = x(i_p,24);
thHL1 = x(i_p,25);
thHL1dot = x(i_p,26);
thHL2 = x(i_p,27);
thHL2dot = x(i_p,28);
lHL = x(i_p,29);
lHLdot = x(i_p,30);


%-------------------------------------------------------------------------%
% Read the time vector element by element
%-------------------------------------------------------------------------%  
t_i = tout(i_p);


%-------------------------------------------------------------------------%
% Coordinates and velocities of feet
%-------------------------------------------------------------------------%
xFRf=xb+db.*cos(thb)+2.*dF1.*sin(thFR1)+dF2.*sin(thFR2)+dF3.*sin( ...
  thFR2)+lFR.*sin(thFR2);
yFRf=yb+(-2).*dF1.*cos(thFR1)+(-1).*dF2.*cos(thFR2)+(-1).*dF3.* ...
  cos(thFR2)+(-1).*lFR.*cos(thFR2)+db.*sin(thb);
xFRfdot=xbdot+2.*dF1.*thFR1dot.*cos(thFR1)+dF2.*thFR2dot.*cos(thFR2) ...
  +dF3.*thFR2dot.*cos(thFR2)+lFR.*thFR2dot.*cos(thFR2)+(-1).* ...
  db.*thbdot.*sin(thb)+lFRdot.*sin(thFR2);
yFRfdot=ybdot+db.*thbdot.*cos(thb)+(-1).*lFRdot.*cos(thFR2)+2.*dF1.* ...
  thFR1dot.*sin(thFR1)+dF2.*thFR2dot.*sin(thFR2)+dF3.* ...
  thFR2dot.*sin(thFR2)+lFR.*thFR2dot.*sin(thFR2);

xHRf=xb+(-1).*db.*cos(thb)+2.*dH1.*sin(thHR1)+dH2.*sin(thHR2)+ ...
  dH3.*sin(thHR2)+lHR.*sin(thHR2);
yHRf=yb+(-2).*dH1.*cos(thHR1)+(-1).*dH2.*cos(thHR2)+(-1).*dH3.* ...
  cos(thHR2)+(-1).*lHR.*cos(thHR2)+(-1).*db.*sin(thb);
xHRfdot=xbdot+2.*dH1.*thHR1dot.*cos(thHR1)+dH2.*thHR2dot.*cos(thHR2) ...
  +dH3.*thHR2dot.*cos(thHR2)+lHR.*thHR2dot.*cos(thHR2)+db.* ...
  thbdot.*sin(thb)+lHRdot.*sin(thHR2);
yHRfdot=ybdot+(-1).*db.*thbdot.*cos(thb)+(-1).*lHRdot.*cos(thHR2)+ ...
  2.*dH1.*thHR1dot.*sin(thHR1)+dH2.*thHR2dot.*sin(thHR2)+dH3.* ...
  thHR2dot.*sin(thHR2)+lHR.*thHR2dot.*sin(thHR2);

xFLf=xb+db.*cos(thb)+2.*dF1.*sin(thFL1)+dF2.*sin(thFL2)+dF3.*sin( ...
  thFL2)+lFL.*sin(thFL2);
yFLf=yb+(-2).*dF1.*cos(thFL1)+(-1).*dF2.*cos(thFL2)+(-1).*dF3.* ...
  cos(thFL2)+(-1).*lFL.*cos(thFL2)+db.*sin(thb);
xFLfdot=xbdot+2.*dF1.*thFL1dot.*cos(thFL1)+dF2.*thFL2dot.*cos(thFL2) ...
  +dF3.*thFL2dot.*cos(thFL2)+lFL.*thFL2dot.*cos(thFL2)+(-1).* ...
  db.*thbdot.*sin(thb)+lFLdot.*sin(thFL2);
yFLfdot=ybdot+db.*thbdot.*cos(thb)+(-1).*lFLdot.*cos(thFL2)+2.*dF1.* ...
  thFL1dot.*sin(thFL1)+dF2.*thFL2dot.*sin(thFL2)+dF3.* ...
  thFL2dot.*sin(thFL2)+lFL.*thFL2dot.*sin(thFL2);

xHLf=xb+(-1).*db.*cos(thb)+2.*dH1.*sin(thHL1)+dH2.*sin(thHL2)+ ...
  dH3.*sin(thHL2)+lHL.*sin(thHL2);
yHLf=yb+(-2).*dH1.*cos(thHL1)+(-1).*dH2.*cos(thHL2)+(-1).*dH3.* ...
  cos(thHL2)+(-1).*lHL.*cos(thHL2)+(-1).*db.*sin(thb);
xHLfdot=xbdot+2.*dH1.*thHL1dot.*cos(thHL1)+dH2.*thHL2dot.*cos(thHL2) ...
  +dH3.*thHL2dot.*cos(thHL2)+lHL.*thHL2dot.*cos(thHL2)+db.* ...
  thbdot.*sin(thb)+lHLdot.*sin(thHL2);
yHLfdot=ybdot+(-1).*db.*thbdot.*cos(thb)+(-1).*lHLdot.*cos(thHL2)+ ...
  2.*dH1.*thHL1dot.*sin(thHL1)+dH2.*thHL2dot.*sin(thHL2)+dH3.* ...
  thHL2dot.*sin(thHL2)+lHL.*thHL2dot.*sin(thHL2);


%-------------------------------------------------------------------------%
% Ground Forces - Recalculating the forces by calling the function
%-------------------------------------------------------------------------%
[NFR, FFR, NHR, FHR, NFL, FFL, NHL, FHL, slipFR, slipHR, slipFL, slipHL]...
    = ground_forces(yFRf, yHRf, yFLf, yHLf, xFRfdot, yFRfdot, xHRfdot,...
    yHRfdot, xFLfdot, yFLfdot, xHLfdot, yHLfdot);


%-------------------------------------------------------------------------%
% Save to new vectors
%-------------------------------------------------------------------------%
% Normal ground force
Ni = [NFR, NHR, NFL, NHL];
NForces = [NForces; Ni];
% Frictional force
Fi = [FFR, FHR, FFL, FHL];
FForces = [FForces; Fi];
% Slipping vector
slipi = [slipFR, slipHR, slipFL, slipHL];
Slip_events = [Slip_events; slipi];
% Stance phase events
Stance_events = Slip_events ~= -1;


%-------------------------------------------------------------------------%
% Control Torques - Recalculating torques by calling the function
%-------------------------------------------------------------------------%
[tauFR1, tauFR2, tauHR1, tauHR2, tauFL1, tauFL2, tauHL1,...
    tauHL2, xdesFR, ydesFR, xdesFL, ydesFL, xdesHR, ydesHR, xdesHL,... 
    ydesHL] = controller_high_level(t_i, xb, xbdot, yb, ybdot, thb,...
    thbdot, thFR1, thFR1dot, thFR2, thFR2dot, thHR1, thHR1dot, thHR2,...
    thHR2dot, thFL1, thFL1dot, thFL2, thFL2dot, thHL1,...
    thHL1dot, thHL2, thHL2dot);


%-------------------------------------------------------------------------%
% Save torques to vectors
%-------------------------------------------------------------------------%
tau_i = [tauFR1, tauFR2, tauHR1, tauHR2, tauFL1, tauFL2, tauHL1, tauHL2];
Torques = [Torques; tau_i];


%-------------------------------------------------------------------------%
% Save toe desired coordinates to new vectors
%-------------------------------------------------------------------------%
des_coords_i = [xdesFR, ydesFR, xdesHR, ydesHR, xdesFL, ydesFL, xdesHL,... 
    ydesHL];
Toe_coords_des = [Toe_coords_des; des_coords_i];


%-------------------------------------------------------------------------%
% Save toe coordinates to new vectors (w.r.t. the hip frames)
%-------------------------------------------------------------------------%
xFRf=+2.*dF1.*sin(thFR1-thb)+dF2.*sin(thFR2-thb)+dF3.*sin( ...
  thFR2-thb)+lFR.*sin(thFR2-thb);
yFRf=(-2).*dF1.*cos(thFR1-thb)+(-1).*dF2.*cos(thFR2-thb)+(-1).*dF3.* ...
  cos(thFR2-thb)+(-1).*lFR.*cos(thFR2-thb);
xHRf=2.*dH1.*sin(thHR1-thb)+dH2.*sin(thHR2-thb)+ ...
  dH3.*sin(thHR2-thb)+lHR.*sin(thHR2-thb);
yHRf=(-2).*dH1.*cos(thHR1-thb)+(-1).*dH2.*cos(thHR2-thb)+(-1).*dH3.* ...
  cos(thHR2-thb)+(-1).*lHR.*cos(thHR2-thb);
xFLf=+2.*dF1.*sin(thFL1-thb)+dF2.*sin(thFL2-thb)+dF3.*sin( ...
  thFL2-thb)+lFL.*sin(thFL2-thb);
yFLf=(-2).*dF1.*cos(thFL1-thb)+(-1).*dF2.*cos(thFL2-thb)+(-1).*dF3.* ...
  cos(thFL2-thb)+(-1).*lFL.*cos(thFL2-thb);
xHLf=2.*dH1.*sin(thHL1-thb)+dH2.*sin(thHL2-thb)+ ...
  dH3.*sin(thHL2-thb)+lHL.*sin(thHL2-thb);
yHLf=(-2).*dH1.*cos(thHL1-thb)+(-1).*dH2.*cos(thHL2-thb)+(-1).*dH3.* ...
  cos(thHL2-thb)+(-1).*lHL.*cos(thHL2-thb);

Toe_coords_i = [xFRf yFRf xHRf yHRf xFLf yFLf xHLf yHLf];
Toe_coords = [Toe_coords; Toe_coords_i];
 

%-------------------------------------------------------------------------%
% Printing
%-------------------------------------------------------------------------%
if ~mod(i_p,200)
    clc
    message2 = ['Post processing time: ',num2str(t_i),'s /',num2str(tfinal),'s'];
    disp(message2)
end

end