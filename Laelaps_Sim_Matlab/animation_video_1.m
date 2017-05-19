%-------------------------------------------------------------------------%
% Animation Script
%-------------------------------------------------------------------------%

global db dF1 dF2 dF3 dH1 dH2 dH3

%-------------------------------------------------------------------------%
% Animation Speed
%-------------------------------------------------------------------------%
step = 200;


f1 = figure(1);
clf(f1);
set(f1, 'Position', [50, 70, 1200, 600]);

% Size of data
n = size(xout,1);

% Limits for plotting torques
y_limit_up = max(max(Torques));
y_limit_down = min(min(Torques));

color_l = [0.7 0.7 0.7];

%-------------------------------------------------------------------------%
% Put data in vectors
%-------------------------------------------------------------------------%
xb = xout(:,1);
yb = xout(:,3);
thb = xout(:,5);
thFR1 = xout(:,7);
thFR2 = xout(:,9);
lFR = xout(:,11);
thHR1 = xout(:,13);
thHR2 = xout(:,15);
lHR = xout(:,17);
thFL1 = xout(:,19);
thFL2 = xout(:,21);
lFL = xout(:,23);
thHL1 = xout(:,25);
thHL2 = xout(:,27);
lHL = xout(:,29);


%-------------------------------------------------------------------------%
% Coordinates and velocities of legs joints
%-------------------------------------------------------------------------%
xForeRightHip=xb+db.*cos(thb);
yForeRightHip=yb+db.*sin(thb);
xForeRightKnee=xb+db.*cos(thb)+2.*dF1.*sin(thFR1);
yForeRightKnee=yb+(-2).*dF1.*cos(thFR1)+db.*sin(thb);
xForeRightFoot=xb+db.*cos(thb)+2.*dF1.*sin(thFR1)+dF2.*sin(thFR2)+dF3.*sin( ...
  thFR2)+lFR.*sin(thFR2);
yForeRightFoot=yb+(-2).*dF1.*cos(thFR1)+(-1).*dF2.*cos(thFR2)+(-1).*dF3.* ...
  cos(thFR2)+(-1).*lFR.*cos(thFR2)+db.*sin(thb);

xHindRightHip=xb+(-1).*db.*cos(thb);
yHindRightHip=yb+(-1).*db.*sin(thb);
xHindRightKnee=xb+(-1).*db.*cos(thb)+2.*dH1.*sin(thHR1);
yHindRightKnee=yb+(-2).*dH1.*cos(thHR1)+(-1).*db.*sin(thb);
xHindRightFoot=xb+(-1).*db.*cos(thb)+2.*dH1.*sin(thHR1)+dH2.*sin(thHR2)+ ...
  dH3.*sin(thHR2)+lHR.*sin(thHR2);
yHindRightFoot=yb+(-2).*dH1.*cos(thHR1)+(-1).*dH2.*cos(thHR2)+(-1).*dH3.* ...
  cos(thHR2)+(-1).*lHR.*cos(thHR2)+(-1).*db.*sin(thb);

xForeLeftHip=xb+db.*cos(thb);
yForeLeftHip=yb+db.*sin(thb);
xForeLeftKnee=xb+db.*cos(thb)+2.*dF1.*sin(thFL1);
yForeLeftKnee=yb+(-2).*dF1.*cos(thFL1)+db.*sin(thb);
xForeLeftFoot=xb+db.*cos(thb)+2.*dF1.*sin(thFL1)+dF2.*sin(thFL2)+dF3.*sin( ...
  thFL2)+lFL.*sin(thFL2);
yForeLeftFoot=yb+(-2).*dF1.*cos(thFL1)+(-1).*dF2.*cos(thFL2)+(-1).*dF3.* ...
  cos(thFL2)+(-1).*lFL.*cos(thFL2)+db.*sin(thb);

xHindLeftHip=xb+(-1).*db.*cos(thb);
yHindLeftHip=yb+(-1).*db.*sin(thb);
xHindLeftKnee=xb+(-1).*db.*cos(thb)+2.*dH1.*sin(thHL1);
yHindLeftKnee=yb+(-2).*dH1.*cos(thHL1)+(-1).*db.*sin(thb);
xHindLeftFoot=xb+(-1).*db.*cos(thb)+2.*dH1.*sin(thHL1)+dH2.*sin(thHL2)+ ...
  dH3.*sin(thHL2)+lHL.*sin(thHL2);
yHindLeftFoot=yb+(-2).*dH1.*cos(thHL1)+(-1).*dH2.*cos(thHL2)+(-1).*dH3.* ...
  cos(thHL2)+(-1).*lHL.*cos(thHL2)+(-1).*db.*sin(thb);


%-------------------------------------------------------------------------%
% Leg parameters
%-------------------------------------------------------------------------%
d2 = 0.035;
d3 = 0.04;
d4 = 0.03;
d10 = 0.35;


%-------------------------------------------------------------------------%
% Fore Right Leg Coordinates
%-------------------------------------------------------------------------%
% leg parameters
lFR1 = 2*dF1; %0.25; 
lFR2 = (dF2+dF3+lFR); 
dFR2 = d2;
dFR3 = d3;
dFR4 = d4;
dFR6 = sqrt(dFR4^2+dFR3^2);
dFR1 = sqrt(lFR2.^2-dFR2^2)-dFR4;
dFR10 = d10;
th2_offsetFR = atan2(dFR2,dFR4+dFR1);

x_knee1 = lFR1 * cos(thFR1);
y_knee1 = lFR1 * sin(thFR1);
x_foot1 = lFR1 * cos(thFR1) + lFR2 .* cos(thFR2);
y_foot1 = lFR1 * sin(thFR1) + lFR2 .* sin(thFR2);
x_1_temp = x_knee1 + dFR4 .* cos(thFR2-th2_offsetFR);
y_1_temp = y_knee1 + dFR4 .* sin(thFR2-th2_offsetFR);
x_2_temp = x_1_temp + dFR2 .* cos(thFR2-th2_offsetFR + pi/2);
y_2_temp = y_1_temp + dFR2 .* sin(thFR2-th2_offsetFR + pi/2);
x_3_temp = x_1_temp + dFR3 .* cos(thFR2-th2_offsetFR - pi/2);
y_3_temp = y_1_temp + dFR3 .* sin(thFR2-th2_offsetFR - pi/2);
x_4_temp = x_foot1 + dFR10 .* cos(thFR2-th2_offsetFR + pi);
y_4_temp = y_foot1 + dFR10 .* sin(thFR2-th2_offsetFR + pi);
x_5_temp = dFR6 * cos(thFR2-th2_offsetFR-atan2(dFR3,dFR4));
y_5_temp = dFR6 * sin(thFR2-th2_offsetFR-atan2(dFR3,dFR4));
% Convert to the classic CS
x_FR1 = xForeRightHip + y_1_temp;
y_FR1 = yForeRightHip  -x_1_temp;
x_FR2 = xForeRightHip + y_2_temp;
y_FR2 = yForeRightHip  -x_2_temp;
x_FR3 = xForeRightHip + y_3_temp;
y_FR3 = yForeRightHip  -x_3_temp;
x_FR4 = xForeRightHip + y_4_temp;
y_FR4 = yForeRightHip  -x_4_temp;
x_FR5 = xForeRightHip + y_5_temp;
y_FR5 = yForeRightHip  -x_5_temp;
x_FRknee = xForeRightHip + y_knee1;
y_FRknee = yForeRightHip  -x_knee1;
x_FRfoot = xForeRightHip + y_foot1;
y_FRfoot = yForeRightHip  -x_foot1;


%-------------------------------------------------------------------------%
% Hind Right Leg Coordinates
%-------------------------------------------------------------------------%
% leg parameters
lHR1 = 2*dH1; %0.25; 
lHR2 = (dH2+dH3+lHR); 
dHR2 = d2;
dHR3 = d3;
dHR4 = d4;
dHR6 = sqrt(dHR4^2+dHR3^2);
dHR1 = sqrt(lHR2.^2-dHR2^2)-dHR4;
dHR10 = d10;
th2_offsetHR = atan2(dHR2,dHR4+dHR1);

x_knee1 = lHR1 * cos(thHR1);
y_knee1 = lHR1 * sin(thHR1);
x_foot1 = lHR1 * cos(thHR1) + lHR2 .* cos(thHR2);
y_foot1 = lHR1 * sin(thHR1) + lHR2 .* sin(thHR2);
x_1_temp = x_knee1 + dHR4 .* cos(thHR2-th2_offsetHR);
y_1_temp = y_knee1 + dHR4 .* sin(thHR2-th2_offsetHR);
x_2_temp = x_1_temp + dHR2 .* cos(thHR2-th2_offsetHR + pi/2);
y_2_temp = y_1_temp + dHR2 .* sin(thHR2-th2_offsetHR + pi/2);
x_3_temp = x_1_temp + dHR3 .* cos(thHR2-th2_offsetHR - pi/2);
y_3_temp = y_1_temp + dHR3 .* sin(thHR2-th2_offsetHR - pi/2);
x_4_temp = x_foot1 + dHR10 .* cos(thHR2-th2_offsetHR + pi);
y_4_temp = y_foot1 + dHR10 .* sin(thHR2-th2_offsetHR + pi);
x_5_temp = dHR6 * cos(thHR2-th2_offsetHR-atan2(dHR3,dHR4));
y_5_temp = dHR6 * sin(thHR2-th2_offsetHR-atan2(dHR3,dHR4));
% Convert to the classic CS
x_HR1 = xHindRightHip + y_1_temp;
y_HR1 = yHindRightHip  -x_1_temp;
x_HR2 = xHindRightHip + y_2_temp;
y_HR2 = yHindRightHip  -x_2_temp;
x_HR3 = xHindRightHip + y_3_temp;
y_HR3 = yHindRightHip  -x_3_temp;
x_HR4 = xHindRightHip + y_4_temp;
y_HR4 = yHindRightHip  -x_4_temp;
x_HR5 = xHindRightHip + y_5_temp;
y_HR5 = yHindRightHip  -x_5_temp;
x_HRknee = xHindRightHip + y_knee1;
y_HRknee = yHindRightHip  -x_knee1;
x_HRfoot = xHindRightHip + y_foot1;
y_HRfoot = yHindRightHip  -x_foot1;


%-------------------------------------------------------------------------%
% Fore Left Leg Coordinates
%-------------------------------------------------------------------------%
% leg parameters
lFL1 = 2*dF1; %0.25; 
lFL2 = (dF2+dF3+lFL); 
dFL2 = d2;
dFL3 = d3;
dFL4 = d4;
dFL6 = sqrt(dFL4^2+dFL3^2);
dFL1 = sqrt(lFL2.^2-dFL2^2)-dFL4;
dFL10 = d10;
th2_offsetFL = atan2(dFL2,dFL4+dFL1);

x_knee1 = lFL1 * cos(thFL1);
y_knee1 = lFL1 * sin(thFL1);
x_foot1 = lFL1 * cos(thFL1) + lFL2 .* cos(thFL2);
y_foot1 = lFL1 * sin(thFL1) + lFL2 .* sin(thFL2);
x_1_temp = x_knee1 + dFL4 .* cos(thFL2-th2_offsetFL);
y_1_temp = y_knee1 + dFL4 .* sin(thFL2-th2_offsetFL);
x_2_temp = x_1_temp + dFL2 .* cos(thFL2-th2_offsetFL + pi/2);
y_2_temp = y_1_temp + dFL2 .* sin(thFL2-th2_offsetFL + pi/2);
x_3_temp = x_1_temp + dFL3 .* cos(thFL2-th2_offsetFL - pi/2);
y_3_temp = y_1_temp + dFL3 .* sin(thFL2-th2_offsetFL - pi/2);
x_4_temp = x_foot1 + dFL10 .* cos(thFL2-th2_offsetFL + pi);
y_4_temp = y_foot1 + dFL10 .* sin(thFL2-th2_offsetFL + pi);
x_5_temp = dFL6 * cos(thFL2-th2_offsetFL-atan2(dFL3,dFL4));
y_5_temp = dFL6 * sin(thFL2-th2_offsetFL-atan2(dFL3,dFL4));
% Convert to the classic CS
x_FL1 = xForeLeftHip + y_1_temp;
y_FL1 = yForeLeftHip  -x_1_temp;
x_FL2 = xForeLeftHip + y_2_temp;
y_FL2 = yForeLeftHip  -x_2_temp;
x_FL3 = xForeLeftHip + y_3_temp;
y_FL3 = yForeLeftHip  -x_3_temp;
x_FL4 = xForeLeftHip + y_4_temp;
y_FL4 = yForeLeftHip  -x_4_temp;
x_FL5 = xForeLeftHip + y_5_temp;
y_FL5 = yForeLeftHip  -x_5_temp;
x_FLknee = xForeLeftHip + y_knee1;
y_FLknee = yForeLeftHip  -x_knee1;
x_FLfoot = xForeLeftHip + y_foot1;
y_FLfoot = yForeLeftHip  -x_foot1;


%-------------------------------------------------------------------------%
% Hind Left Leg Coordinates
%-------------------------------------------------------------------------%
% leg parameters
lHL1 = 2*dH1; %0.25; 
lHL2 = (dH2+dH3+lHL); 
dHL2 = d2;
dHL3 = d3;
dHL4 = d4;
dHL6 = sqrt(dHL4^2+dHL3^2);
dHL1 = sqrt(lHL2.^2-dHL2^2)-dHL4;
dHL10 = d10;
th2_offsetHL = atan2(dHL2,dHL4+dHL1);

x_knee1 = lHL1 * cos(thHL1);
y_knee1 = lHL1 * sin(thHL1);
x_foot1 = lHL1 * cos(thHL1) + lHL2 .* cos(thHL2);
y_foot1 = lHL1 * sin(thHL1) + lHL2 .* sin(thHL2);
x_1_temp = x_knee1 + dHL4 .* cos(thHL2-th2_offsetHL);
y_1_temp = y_knee1 + dHL4 .* sin(thHL2-th2_offsetHL);
x_2_temp = x_1_temp + dHL2 .* cos(thHL2-th2_offsetHL + pi/2);
y_2_temp = y_1_temp + dHL2 .* sin(thHL2-th2_offsetHL + pi/2);
x_3_temp = x_1_temp + dHL3 .* cos(thHL2-th2_offsetHL - pi/2);
y_3_temp = y_1_temp + dHL3 .* sin(thHL2-th2_offsetHL - pi/2);
x_4_temp = x_foot1 + dHL10 .* cos(thHL2-th2_offsetHL + pi);
y_4_temp = y_foot1 + dHL10 .* sin(thHL2-th2_offsetHL + pi);
x_5_temp = dHL6 * cos(thHL2-th2_offsetHL-atan2(dHL3,dHL4));
y_5_temp = dHL6 * sin(thHL2-th2_offsetHL-atan2(dHL3,dHL4));
% Convert to the classic CS
x_HL1 = xHindLeftHip + y_1_temp;
y_HL1 = yHindLeftHip  -x_1_temp;
x_HL2 = xHindLeftHip + y_2_temp;
y_HL2 = yHindLeftHip  -x_2_temp;
x_HL3 = xHindLeftHip + y_3_temp;
y_HL3 = yHindLeftHip  -x_3_temp;
x_HL4 = xHindLeftHip + y_4_temp;
y_HL4 = yHindLeftHip  -x_4_temp;
x_HL5 = xHindLeftHip + y_5_temp;
y_HL5 = yHindLeftHip  -x_5_temp;
x_HLknee = xHindLeftHip + y_knee1;
y_HLknee = yHindLeftHip  -x_knee1;
x_HLfoot = xHindLeftHip + y_foot1;
y_HLfoot = yHindLeftHip  -x_foot1;

frame_no = 0;


%-------------------------------------------------------------------------%
% Animation Loop
%-------------------------------------------------------------------------%
for i = 1:step:n-1

% Counter
frame_no = frame_no +1;

% Background color
set(gcf,'color','w');

%-------------------------------------------------------------------------%
% Robot animation
%-------------------------------------------------------------------------%
subplot(2,2,1)  

% Plot ground
plot([xb(i)-10 xb(i)+10],[0 0],'k','LineWidth',1)
hold on

% Plot friction cone
r_fr_cone = 0.1;
% Fore right leg
if yForeRightFoot(i)<=0
p_right_x = xForeRightFoot(i) + r_fr_cone * sin(atan(mu_d));
p_right_y = r_fr_cone * cos(atan(mu_d));
p_left_x = xForeRightFoot(i) - r_fr_cone * sin(atan(mu_d));
p_left_y = r_fr_cone * cos(atan(mu_d));
fill([xForeRightFoot(i) p_right_x p_left_x xForeRightFoot(i)], ...
    [0 p_right_y p_left_y 0], [0.9 0.9 0.9],'EdgeColor','none')
end
% Hind right leg
if yHindRightFoot(i)<=0
p_right_x = xHindRightFoot(i) + r_fr_cone * sin(atan(mu_d));
p_right_y = r_fr_cone * cos(atan(mu_d));
p_left_x = xHindRightFoot(i) - r_fr_cone * sin(atan(mu_d));
p_left_y = r_fr_cone * cos(atan(mu_d));
fill([xHindRightFoot(i) p_right_x p_left_x xHindRightFoot(i)], ...
    [0 p_right_y p_left_y 0], [0.9 0.9 0.9],'EdgeColor','none')
end
% Fore left leg
if yForeLeftFoot(i)<=0
p_right_x = xForeLeftFoot(i) + r_fr_cone * sin(atan(mu_d));
p_right_y = r_fr_cone * cos(atan(mu_d));
p_left_x = xForeLeftFoot(i) - r_fr_cone * sin(atan(mu_d));
p_left_y = r_fr_cone * cos(atan(mu_d));
fill([xForeLeftFoot(i) p_right_x p_left_x xForeLeftFoot(i)], ...
    [0 p_right_y p_left_y 0], [0.9 0.9 0.9],'EdgeColor','none')
end
% Hind left leg
if yHindLeftFoot(i)<=0
p_right_x = xHindLeftFoot(i) + r_fr_cone * sin(atan(mu_d));
p_right_y = r_fr_cone * cos(atan(mu_d));
p_left_x = xHindLeftFoot(i) - r_fr_cone * sin(atan(mu_d));
p_left_y = r_fr_cone * cos(atan(mu_d));
fill([xHindLeftFoot(i) p_right_x p_left_x xHindLeftFoot(i)], ...
    [0 p_right_y p_left_y 0], [0.9 0.9 0.9],'EdgeColor','none')
end


%-------------------------------------------------------------------------%
% Plot Fore Left Leg
%-------------------------------------------------------------------------%
plot([xForeLeftHip(i) x_FLknee(i)],[yForeLeftHip(i) y_FLknee(i)],'Color',color_l,'LineWidth',4)
%plot([x_FLknee(i) x_FLfoot(i)],[y_FLknee(i) y_FLfoot(i)],':','LineWidth',1)
plot([x_FLknee(i) x_FL1(i)],[y_FLknee(i) y_FL1(i)],'Color',color_l,'LineWidth',3)
plot([x_FL1(i) x_FL2(i)],[y_FL1(i) y_FL2(i)],'Color',color_l,'LineWidth',3)
plot([x_FL1(i) x_FL3(i)],[y_FL1(i) y_FL3(i)],'Color',color_l,'LineWidth',3)
plot([x_FL4(i) x_FLfoot(i)],[y_FL4(i) y_FLfoot(i)],'Color',color_l,'LineWidth',3)
plot([xForeLeftHip(i) x_FL5(i)],[yForeLeftHip(i) y_FL5(i)],'Color',color_l,'LineWidth',3)
plot([x_FL5(i) x_FL3(i)],[y_FL5(i) y_FL3(i)],'Color',color_l,'LineWidth',2)
% Plot joints
plot(x_FLknee(i),y_FLknee(i),'ko','MarkerFaceColor','w','MarkerSize',4)
plot(x_FL5(i),y_FL5(i),'ko','MarkerFaceColor','w','MarkerSize',4) 
plot(x_FL3(i),y_FL3(i),'ko','MarkerFaceColor','w','MarkerSize',4)
plot(xForeLeftHip(i),yForeLeftHip(i),'ko','MarkerFaceColor','w','MarkerSize',4)
plot(x_FLfoot(i),y_FLfoot(i),'ko','MarkerFaceColor','w','MarkerSize',4)  


%-------------------------------------------------------------------------%
% Plot Hind Left Leg
%-------------------------------------------------------------------------%
plot([xHindLeftHip(i) x_HLknee(i)],[yHindLeftHip(i) y_HLknee(i)],'Color',color_l,'LineWidth',4)
%plot([x_HLknee(i) x_HLfoot(i)],[y_HLknee(i) y_HLfoot(i)],':','LineWidth',1)
plot([x_HLknee(i) x_HL1(i)],[y_HLknee(i) y_HL1(i)],'Color',color_l,'LineWidth',3)
plot([x_HL1(i) x_HL2(i)],[y_HL1(i) y_HL2(i)],'Color',color_l,'LineWidth',3)
plot([x_HL1(i) x_HL3(i)],[y_HL1(i) y_HL3(i)],'Color',color_l,'LineWidth',3)
plot([x_HL4(i) x_HLfoot(i)],[y_HL4(i) y_HLfoot(i)],'Color',color_l,'LineWidth',3)
plot([xHindLeftHip(i) x_HL5(i)],[yHindLeftHip(i) y_HL5(i)],'Color',color_l,'LineWidth',3)
plot([x_HL5(i) x_HL3(i)],[y_HL5(i) y_HL3(i)],'Color',color_l,'LineWidth',2)
% Plot joints
plot(x_HLknee(i),y_HLknee(i),'ko','MarkerFaceColor','w','MarkerSize',4)
plot(x_HL5(i),y_HL5(i),'ko','MarkerFaceColor','w','MarkerSize',4) 
plot(x_HL3(i),y_HL3(i),'ko','MarkerFaceColor','w','MarkerSize',4)
plot(xHindLeftHip(i),yHindLeftHip(i),'ko','MarkerFaceColor','w','MarkerSize',4)
plot(x_HLfoot(i),y_HLfoot(i),'ko','MarkerFaceColor','w','MarkerSize',4)  


%-------------------------------------------------------------------------%
% Plot Body
%-------------------------------------------------------------------------%
% plot([xForeRightHip(i) xHindRightHip(i)],[yForeRightHip(i)...
%     yHindRightHip(i)],'r-o','LineWidth',2)
% Plot Body as a rectangle
Rect2(xForeRightHip(i),yForeRightHip(i), xHindRightHip(i), yHindRightHip(i), 0.1, 0.12)


%-------------------------------------------------------------------------%
% Plot Fore Right Leg
%-------------------------------------------------------------------------%
plot([xForeRightHip(i) x_FRknee(i)],[yForeRightHip(i) y_FRknee(i)],'k','LineWidth',4)
%plot([x_FRknee(i) x_FRfoot(i)],[y_FRknee(i) y_FRfoot(i)],':','LineWidth',1)
plot([x_FRknee(i) x_FR1(i)],[y_FRknee(i) y_FR1(i)],'k','LineWidth',3)
plot([x_FR1(i) x_FR2(i)],[y_FR1(i) y_FR2(i)],'k','LineWidth',3)
plot([x_FR1(i) x_FR3(i)],[y_FR1(i) y_FR3(i)],'k','LineWidth',3)
plot([x_FR4(i) x_FRfoot(i)],[y_FR4(i) y_FRfoot(i)],'k','LineWidth',3)
plot([xForeRightHip(i) x_FR5(i)],[yForeRightHip(i) y_FR5(i)],'k','LineWidth',3)
plot([x_FR5(i) x_FR3(i)],[y_FR5(i) y_FR3(i)],'k','LineWidth',2)
% Plot joints
plot(x_FRknee(i),y_FRknee(i),'ko','MarkerFaceColor','w','MarkerSize',4)
plot(x_FR5(i),y_FR5(i),'ko','MarkerFaceColor','w','MarkerSize',4) 
plot(x_FR3(i),y_FR3(i),'ko','MarkerFaceColor','w','MarkerSize',4)
plot(xForeRightHip(i),yForeRightHip(i),'ko','MarkerFaceColor','w','MarkerSize',4)
plot(x_FRfoot(i),y_FRfoot(i),'ko','MarkerFaceColor','w','MarkerSize',4)   

%-------------------------------------------------------------------------%
% Plot Hind Right Leg
%-------------------------------------------------------------------------%
plot([xHindRightHip(i) x_HRknee(i)],[yHindRightHip(i) y_HRknee(i)],'k','LineWidth',4)
%plot([x_HRknee(i) x_HRfoot(i)],[y_HRknee(i) y_HRfoot(i)],':','LineWidth',1)
plot([x_HRknee(i) x_HR1(i)],[y_HRknee(i) y_HR1(i)],'k','LineWidth',3)
plot([x_HR1(i) x_HR2(i)],[y_HR1(i) y_HR2(i)],'k','LineWidth',3)
plot([x_HR1(i) x_HR3(i)],[y_HR1(i) y_HR3(i)],'k','LineWidth',3)
plot([x_HR4(i) x_HRfoot(i)],[y_HR4(i) y_HRfoot(i)],'k','LineWidth',3)
plot([xHindRightHip(i) x_HR5(i)],[yHindRightHip(i) y_HR5(i)],'k','LineWidth',3)
plot([x_HR5(i) x_HR3(i)],[y_HR5(i) y_HR3(i)],'k','LineWidth',2)
% Plot joints
plot(x_HRknee(i),y_HRknee(i),'ko','MarkerFaceColor','w','MarkerSize',4)
plot(x_HR5(i),y_HR5(i),'ko','MarkerFaceColor','w','MarkerSize',4) 
plot(x_HR3(i),y_HR3(i),'ko','MarkerFaceColor','w','MarkerSize',4)
plot(xHindRightHip(i),yHindRightHip(i),'ko','MarkerFaceColor','w','MarkerSize',4)
plot(x_HRfoot(i),y_HRfoot(i),'ko','MarkerFaceColor','w','MarkerSize',4)  


% Plot Force Vectors from the Ground
force_scale = 1000;
% Fore right leg
quiver(xForeRightFoot(i), yForeRightFoot(i), ...
    FForces(i,1)/(force_scale), NForces(i,1)/(force_scale),'r')
% Hind right leg
quiver(xHindRightFoot(i), yHindRightFoot(i), ...
    FForces(i,2)/(force_scale), NForces(i,2)/(force_scale),'r')
% Fore left leg
quiver(xForeLeftFoot(i), yForeLeftFoot(i), ...
    FForces(i,3)/(force_scale), NForces(i,3)/(force_scale),'r')
% Hind left leg
quiver(xHindLeftFoot(i), yHindLeftFoot(i), ...
    FForces(i,4)/(force_scale), NForces(i,4)/(force_scale),'r')



% Plot Axis
axis equal
axis([-1 max(xout(end,1)+1) -0.5 1.5])
%axis([-1 6 -0.5 1.5])

% grid on
hold off

% Print Time
x_time = -0.7;
y_time = +1.3;
label = num2str(tout(i));
text(x_time,...
    y_time,...
    'Time [s]:',...
    'Color', 'k',...
    'FontSize', 10);
text(x_time,...
    y_time - 0.2,...
    label,...
    'Color', 'k',...
    'FontSize', 10);


%-------------------------------------------------------------------------%
% Plot Body Velocity
%-------------------------------------------------------------------------%
subplot(2,2,[3,4])   
plot(tout(1:i),xb(1:i), 'LineWidth',1);
ylabel('Body CoM Velocity (m/s)') 
xlabel('t (s)') 
%title('FL Hip and Knee Torque (Hip: Blue, Knee: Orange)')
%set(gca, 'xTickLabel', []);
%axis([start_point_x end_point_x 1.1*y_limit_down 1.1*y_limit_up])
axis([0 max(tout) -1 max(xb)+1])
%axis([tout(i)-2 tout(i)+2 1.1*y_limit_down 1.1*y_limit_up])
grid on
%legend('Hip','Knee')

%-------------------------------------------------------------------------%
% Gait Graph
%-------------------------------------------------------------------------%
subplot(2,2,2)   
Rect2(0, 0.5, 1, 0.5, 0, 0.5)
hold on

x_FR_step = 1;
y_FR_step = 1.2;
x_HR_step = 1;
y_HR_step = -0.2;
x_FL_step = 0;
y_FL_step = 1.2;
x_HL_step = 0;
y_HL_step = -0.2;

% HL leg
if Stance_events(i,1)==1
    plot(x_HL_step,y_HL_step,'ko', 'MarkerSize', 10, 'MarkerFaceColor',[0,0,0])
else
    plot(x_HL_step,y_HL_step,'ko', 'MarkerSize', 10, 'MarkerFaceColor',[0.9,0.9,0.9])    
end

% FR leg
if Stance_events(i,2)==1
    plot(x_FR_step,y_FR_step,'ko', 'MarkerSize', 10, 'MarkerFaceColor',[0,0,0])
else
    plot(x_FR_step,y_FR_step,'ko', 'MarkerSize', 10, 'MarkerFaceColor',[0.9,0.9,0.9])    
end

% HR leg
if Stance_events(i,3)==1
    plot(x_HR_step,y_HR_step,'ko', 'MarkerSize', 10, 'MarkerFaceColor',[0,0,0])
else
    plot(x_HR_step,y_HR_step,'ko', 'MarkerSize', 10, 'MarkerFaceColor',[0.9,0.9,0.9])    
end

% FL leg
if Stance_events(i,4)==1
    plot(x_FL_step,y_FL_step,'ko', 'MarkerSize', 10, 'MarkerFaceColor',[0,0,0])
else
    plot(x_FL_step,y_FL_step,'ko', 'MarkerSize', 10, 'MarkerFaceColor',[0.9,0.9,0.9])    
end

hold off
axis equal
axis([-1 2 -1 2])
set(gca, 'xTickLabel', []);
set(gca, 'yTickLabel', []);

% Print labels
text(x_FR_step + 0.2,y_FR_step + 0.2, 'FR', 'Color', 'k', 'FontSize', 10);
text(x_HR_step + 0.2,y_HR_step - 0.2, 'HR', 'Color', 'k', 'FontSize', 10);
text(x_FL_step - 0.4,y_FL_step + 0.2, 'FL', 'Color', 'k', 'FontSize', 10);
text(x_HL_step - 0.4,y_HL_step - 0.2, 'HL', 'Color', 'k', 'FontSize', 10);

%-------------------------------------------------------------------------%
% Save frames for video
%-------------------------------------------------------------------------%
    
frame = getframe(1);
im = frame2im(frame);
[imind,cm] = rgb2ind(im,256);
outputFileName = sprintf('img_%d.png',frame_no);
imwrite(imind,cm, outputFileName);


% Pause between frames
if i < length(tout)
    %pause(anim_speed*(tout(i+1) -tout(i)));
    pause(0.0001)
end

end


step = step + 100;

%-------------------------------------------------------------------------%
% Animation Loop
%-------------------------------------------------------------------------%
for i = 1:step:round(n)

% Background color
set(gcf,'color','w');

% Counter
frame_no = frame_no +1;

%-------------------------------------------------------------------------%
subplot(4,4,[1, 2, 5, 6 ,9 , 10, 13, 14]) 
%-------------------------------------------------------------------------%

% Plot ground
plot([xb(i)-2 xb(i)+2],[0 0],'k','LineWidth',1)
hold on

% Plot friction cone
r_fr_cone = 0.1;
% Fore right leg
if yForeRightFoot(i)<=0
p_right_x = xForeRightFoot(i) + r_fr_cone * sin(atan(mu_d));
p_right_y = r_fr_cone * cos(atan(mu_d));
p_left_x = xForeRightFoot(i) - r_fr_cone * sin(atan(mu_d));
p_left_y = r_fr_cone * cos(atan(mu_d));
fill([xForeRightFoot(i) p_right_x p_left_x xForeRightFoot(i)], ...
    [0 p_right_y p_left_y 0], [0.9 0.9 0.9],'EdgeColor','none')
end
% Hind right leg
if yHindRightFoot(i)<=0
p_right_x = xHindRightFoot(i) + r_fr_cone * sin(atan(mu_d));
p_right_y = r_fr_cone * cos(atan(mu_d));
p_left_x = xHindRightFoot(i) - r_fr_cone * sin(atan(mu_d));
p_left_y = r_fr_cone * cos(atan(mu_d));
fill([xHindRightFoot(i) p_right_x p_left_x xHindRightFoot(i)], ...
    [0 p_right_y p_left_y 0], [0.9 0.9 0.9],'EdgeColor','none')
end
% Fore left leg
if yForeLeftFoot(i)<=0
p_right_x = xForeLeftFoot(i) + r_fr_cone * sin(atan(mu_d));
p_right_y = r_fr_cone * cos(atan(mu_d));
p_left_x = xForeLeftFoot(i) - r_fr_cone * sin(atan(mu_d));
p_left_y = r_fr_cone * cos(atan(mu_d));
fill([xForeLeftFoot(i) p_right_x p_left_x xForeLeftFoot(i)], ...
    [0 p_right_y p_left_y 0], [0.9 0.9 0.9],'EdgeColor','none')
end
% Hind left leg
if yHindLeftFoot(i)<=0
p_right_x = xHindLeftFoot(i) + r_fr_cone * sin(atan(mu_d));
p_right_y = r_fr_cone * cos(atan(mu_d));
p_left_x = xHindLeftFoot(i) - r_fr_cone * sin(atan(mu_d));
p_left_y = r_fr_cone * cos(atan(mu_d));
fill([xHindLeftFoot(i) p_right_x p_left_x xHindLeftFoot(i)], ...
    [0 p_right_y p_left_y 0], [0.9 0.9 0.9],'EdgeColor','none')
end


%-------------------------------------------------------------------------%
% Plot Fore Left Leg
%-------------------------------------------------------------------------%
plot([xForeLeftHip(i) x_FLknee(i)],[yForeLeftHip(i) y_FLknee(i)],'Color',color_l,'LineWidth',4)
%plot([x_FLknee(i) x_FLfoot(i)],[y_FLknee(i) y_FLfoot(i)],':','LineWidth',1)
plot([x_FLknee(i) x_FL1(i)],[y_FLknee(i) y_FL1(i)],'Color',color_l,'LineWidth',3)
plot([x_FL1(i) x_FL2(i)],[y_FL1(i) y_FL2(i)],'Color',color_l,'LineWidth',3)
plot([x_FL1(i) x_FL3(i)],[y_FL1(i) y_FL3(i)],'Color',color_l,'LineWidth',3)
plot([x_FL4(i) x_FLfoot(i)],[y_FL4(i) y_FLfoot(i)],'Color',color_l,'LineWidth',3)
plot([xForeLeftHip(i) x_FL5(i)],[yForeLeftHip(i) y_FL5(i)],'Color',color_l,'LineWidth',3)
plot([x_FL5(i) x_FL3(i)],[y_FL5(i) y_FL3(i)],'Color',color_l,'LineWidth',2)
% Plot joints
plot(x_FLknee(i),y_FLknee(i),'ko','MarkerFaceColor','w','MarkerSize',4)
plot(x_FL5(i),y_FL5(i),'ko','MarkerFaceColor','w','MarkerSize',4) 
plot(x_FL3(i),y_FL3(i),'ko','MarkerFaceColor','w','MarkerSize',4)
plot(xForeLeftHip(i),yForeLeftHip(i),'ko','MarkerFaceColor','w','MarkerSize',4)
plot(x_FLfoot(i),y_FLfoot(i),'ko','MarkerFaceColor','w','MarkerSize',4)  


%-------------------------------------------------------------------------%
% Plot Hind Left Leg
%-------------------------------------------------------------------------%
plot([xHindLeftHip(i) x_HLknee(i)],[yHindLeftHip(i) y_HLknee(i)],'Color',color_l,'LineWidth',4)
%plot([x_HLknee(i) x_HLfoot(i)],[y_HLknee(i) y_HLfoot(i)],':','LineWidth',1)
plot([x_HLknee(i) x_HL1(i)],[y_HLknee(i) y_HL1(i)],'Color',color_l,'LineWidth',3)
plot([x_HL1(i) x_HL2(i)],[y_HL1(i) y_HL2(i)],'Color',color_l,'LineWidth',3)
plot([x_HL1(i) x_HL3(i)],[y_HL1(i) y_HL3(i)],'Color',color_l,'LineWidth',3)
plot([x_HL4(i) x_HLfoot(i)],[y_HL4(i) y_HLfoot(i)],'Color',color_l,'LineWidth',3)
plot([xHindLeftHip(i) x_HL5(i)],[yHindLeftHip(i) y_HL5(i)],'Color',color_l,'LineWidth',3)
plot([x_HL5(i) x_HL3(i)],[y_HL5(i) y_HL3(i)],'Color',color_l,'LineWidth',2)
% Plot joints
plot(x_HLknee(i),y_HLknee(i),'ko','MarkerFaceColor','w','MarkerSize',4)
plot(x_HL5(i),y_HL5(i),'ko','MarkerFaceColor','w','MarkerSize',4) 
plot(x_HL3(i),y_HL3(i),'ko','MarkerFaceColor','w','MarkerSize',4)
plot(xHindLeftHip(i),yHindLeftHip(i),'ko','MarkerFaceColor','w','MarkerSize',4)
plot(x_HLfoot(i),y_HLfoot(i),'ko','MarkerFaceColor','w','MarkerSize',4)  


%-------------------------------------------------------------------------%
% Plot Body
%-------------------------------------------------------------------------%
% plot([xForeRightHip(i) xHindRightHip(i)],[yForeRightHip(i)...
%     yHindRightHip(i)],'r-o','LineWidth',2)
% Plot Body as a rectangle
Rect2(xForeRightHip(i),yForeRightHip(i), xHindRightHip(i), yHindRightHip(i), 0.1, 0.12)


%-------------------------------------------------------------------------%
% Plot Fore Right Leg
%-------------------------------------------------------------------------%
plot([xForeRightHip(i) x_FRknee(i)],[yForeRightHip(i) y_FRknee(i)],'k','LineWidth',4)
%plot([x_FRknee(i) x_FRfoot(i)],[y_FRknee(i) y_FRfoot(i)],':','LineWidth',1)
plot([x_FRknee(i) x_FR1(i)],[y_FRknee(i) y_FR1(i)],'k','LineWidth',3)
plot([x_FR1(i) x_FR2(i)],[y_FR1(i) y_FR2(i)],'k','LineWidth',3)
plot([x_FR1(i) x_FR3(i)],[y_FR1(i) y_FR3(i)],'k','LineWidth',3)
plot([x_FR4(i) x_FRfoot(i)],[y_FR4(i) y_FRfoot(i)],'k','LineWidth',3)
plot([xForeRightHip(i) x_FR5(i)],[yForeRightHip(i) y_FR5(i)],'k','LineWidth',3)
plot([x_FR5(i) x_FR3(i)],[y_FR5(i) y_FR3(i)],'k','LineWidth',2)
% Plot joints
plot(x_FRknee(i),y_FRknee(i),'ko','MarkerFaceColor','w','MarkerSize',4)
plot(x_FR5(i),y_FR5(i),'ko','MarkerFaceColor','w','MarkerSize',4) 
plot(x_FR3(i),y_FR3(i),'ko','MarkerFaceColor','w','MarkerSize',4)
plot(xForeRightHip(i),yForeRightHip(i),'ko','MarkerFaceColor','w','MarkerSize',4)
plot(x_FRfoot(i),y_FRfoot(i),'ko','MarkerFaceColor','w','MarkerSize',4)   

%-------------------------------------------------------------------------%
% Plot Hind Right Leg
%-------------------------------------------------------------------------%
plot([xHindRightHip(i) x_HRknee(i)],[yHindRightHip(i) y_HRknee(i)],'k','LineWidth',4)
%plot([x_HRknee(i) x_HRfoot(i)],[y_HRknee(i) y_HRfoot(i)],':','LineWidth',1)
plot([x_HRknee(i) x_HR1(i)],[y_HRknee(i) y_HR1(i)],'k','LineWidth',3)
plot([x_HR1(i) x_HR2(i)],[y_HR1(i) y_HR2(i)],'k','LineWidth',3)
plot([x_HR1(i) x_HR3(i)],[y_HR1(i) y_HR3(i)],'k','LineWidth',3)
plot([x_HR4(i) x_HRfoot(i)],[y_HR4(i) y_HRfoot(i)],'k','LineWidth',3)
plot([xHindRightHip(i) x_HR5(i)],[yHindRightHip(i) y_HR5(i)],'k','LineWidth',3)
plot([x_HR5(i) x_HR3(i)],[y_HR5(i) y_HR3(i)],'k','LineWidth',2)
% Plot joints
plot(x_HRknee(i),y_HRknee(i),'ko','MarkerFaceColor','w','MarkerSize',4)
plot(x_HR5(i),y_HR5(i),'ko','MarkerFaceColor','w','MarkerSize',4) 
plot(x_HR3(i),y_HR3(i),'ko','MarkerFaceColor','w','MarkerSize',4)
plot(xHindRightHip(i),yHindRightHip(i),'ko','MarkerFaceColor','w','MarkerSize',4)
plot(x_HRfoot(i),y_HRfoot(i),'ko','MarkerFaceColor','w','MarkerSize',4)  


% Plot Force Vectors from the Ground
force_scale = 1000;
% Fore right leg
quiver(xForeRightFoot(i), yForeRightFoot(i), ...
    FForces(i,1)/(force_scale), NForces(i,1)/(force_scale),'r')
% Hind right leg
quiver(xHindRightFoot(i), yHindRightFoot(i), ...
    FForces(i,2)/(force_scale), NForces(i,2)/(force_scale),'r')
% Fore left leg
quiver(xForeLeftFoot(i), yForeLeftFoot(i), ...
    FForces(i,3)/(force_scale), NForces(i,3)/(force_scale),'r')
% Hind left leg
quiver(xHindLeftFoot(i), yHindLeftFoot(i), ...
    FForces(i,4)/(force_scale), NForces(i,4)/(force_scale),'r')


axis equal
% Plot Axis
axis([xb(i)-1.1 xb(i)+0.9 -0.65 1.65])



% grid on
hold off

% Print Time
x_time = xb(i) - 0.9;
y_time = +1.5;
label = num2str(tout(i));
text(x_time,...
    y_time,...
    'Time [s]:',...
    'Color', 'k',...
    'FontSize', 10);
text(x_time,...
    y_time - 0.1,...
    label,...
    'Color', 'k',...
    'FontSize', 10);


% if mod(tout(i),4)<0.3
%     start_point_x = tout(i);
%     end_point_x = tout(i)+4;
% end

%-------------------------------------------------------------------------%    
% Animation FL Leg
%-------------------------------------------------------------------------%
subplot(4,4,[3, 4])   
p1 = plot(tout(1:i),Torques(1:i,5), 'LineWidth',1);
hold on
p2 = plot(tout(1:i),Torques(1:i,6), 'LineWidth',1);
hold off
ylabel('Torque (Nm)') 
%xlabel('t (s)') 
title('FL Hip and Knee Torque (Hip: Blue, Knee: Orange)')
set(gca, 'xTickLabel', []);
%axis([start_point_x end_point_x 1.1*y_limit_down 1.1*y_limit_up])
%axis([0 max(tout) 1.1*y_limit_down 1.1*y_limit_up])
axis([tout(i)-2 tout(i)+2 1.1*y_limit_down 1.1*y_limit_up])
grid on
%legend('Hip','Knee')


%-------------------------------------------------------------------------%    
% Animation FR Leg
%-------------------------------------------------------------------------%
subplot(4,4,[7,8])   
p1 = plot(tout(1:i),Torques(1:i,1), 'LineWidth',1);
hold on
p2 = plot(tout(1:i),Torques(1:i,2), 'LineWidth',1);
hold off
ylabel('Torque (Nm)') 
%xlabel('t (s)') 
title('FR Hip and Knee Torque (Hip: Blue, Knee: Orange)')
set(gca, 'xTickLabel', []);
%axis([start_point_x end_point_x 1.1*y_limit_down 1.1*y_limit_up])
%axis([0 max(tout) 1.1*y_limit_down 1.1*y_limit_up])
axis([tout(i)-2 tout(i)+2 1.1*y_limit_down 1.1*y_limit_up])
grid on

%-------------------------------------------------------------------------%    
% Animation HL Leg
%-------------------------------------------------------------------------%
subplot(4,4,[11, 12])   
p1 = plot(tout(1:i),Torques(1:i,7), 'LineWidth',1);
hold on
p2 = plot(tout(1:i),Torques(1:i,8), 'LineWidth',1);
hold off
ylabel('Torque (Nm)') 
%xlabel('t (s)') 
title('HL Hip and Knee Torque (Hip: Blue, Knee: Orange)')
set(gca, 'xTickLabel', []);
%axis([start_point_x end_point_x 1.1*y_limit_down 1.1*y_limit_up])
%axis([0 max(tout) 1.1*y_limit_down 1.1*y_limit_up])
axis([tout(i)-2 tout(i)+2 1.1*y_limit_down 1.1*y_limit_up])
grid on

%-------------------------------------------------------------------------%    
% Animation HR Leg
%-------------------------------------------------------------------------%
subplot(4,4,[15, 16])   
p1 = plot(tout(1:i),Torques(1:i,3), 'LineWidth',1);
hold on
p2 = plot(tout(1:i),Torques(1:i,4), 'LineWidth',1);
hold off
ylabel('Torque (Nm)') 
xlabel('t (s)') 
title('HR Hip and Knee Torque (Hip: Blue, Knee: Orange)')
%axis([start_point_x end_point_x 1.1*y_limit_down 1.1*y_limit_up])
%axis([0 max(tout) 1.1*y_limit_down 1.1*y_limit_up])
axis([tout(i)-2 tout(i)+2 1.1*y_limit_down 1.1*y_limit_up])
grid on


% Pause between frames
if i < length(tout)
    %pause(anim_speed*(tout(i+1) -tout(i)));
    pause(0.0001)
end


%-------------------------------------------------------------------------%
% Save frames for video
%-------------------------------------------------------------------------%
    
frame = getframe(1);
im = frame2im(frame);
[imind,cm] = rgb2ind(im,256);
outputFileName = sprintf('img_%d.png',frame_no);
imwrite(imind,cm, outputFileName);
end

%step = 100;

%-------------------------------------------------------------------------%
% Animation Loop 3
%-------------------------------------------------------------------------%
for i = 1:step:round(n)

% Background color
set(gcf,'color','w');

% Counter
frame_no = frame_no +1;


% Background color
set(gcf,'color','w');


%-------------------------------------------------------------------------%
% Fore Right Toe Trajectory
%-------------------------------------------------------------------------%
subplot(2,2,2)
hold on
st_elements = find(Stance_events(1:i,1)==1); 
fl_elements = find(Stance_events(1:i,1)==0); 
plot(Toe_coords_des(:,1), Toe_coords_des(:,2),'k.','MarkerSize',1);
plot(Toe_coords(st_elements,1), Toe_coords(st_elements,2),'.','MarkerSize',1,'Color', [0, 0.4470, 0.7410]);
plot(Toe_coords(fl_elements,1), Toe_coords(fl_elements,2),'.','MarkerSize',1,'Color', [0.8500, 0.3250, 0.0980]);
hold off
ylabel('y (m)') 
xlabel('x (m)') 
title('FR Toe-Trajectory')
grid on
box on
axis equal
drawnow

%-------------------------------------------------------------------------%
% Hind Right Toe Trajectory
%-------------------------------------------------------------------------%
subplot(2,2,4)
hold all
st_elements = find(Stance_events(1:i,2)==1); 
fl_elements = find(Stance_events(1:i,2)==0); 
plot(Toe_coords_des(:,3), Toe_coords_des(:,4),'k.','MarkerSize',1);
plot(Toe_coords(st_elements,3), Toe_coords(st_elements,4),'.','MarkerSize',1,'Color', [0, 0.4470, 0.7410]);
plot(Toe_coords(fl_elements,3), Toe_coords(fl_elements,4),'.','MarkerSize',1,'Color', [0.8500, 0.3250, 0.0980]);
hold off
ylabel('y (m)') 
xlabel('x (m)') 
title('HR Toe-Trajectory')
grid on
box on
axis equal
drawnow

%-------------------------------------------------------------------------%
% Fore Left Toe Trajectory
%-------------------------------------------------------------------------%
subplot(2,2,1)
hold all
st_elements = find(Stance_events(1:i,3)==1); 
fl_elements = find(Stance_events(1:i,3)==0); 
plot(Toe_coords_des(:,5), Toe_coords_des(:,6),'k.','MarkerSize',1);
plot(Toe_coords(st_elements,5), Toe_coords(st_elements,6),'.','MarkerSize',1,'Color', [0, 0.4470, 0.7410]);
plot(Toe_coords(fl_elements,5), Toe_coords(fl_elements,6),'.','MarkerSize',1,'Color', [0.8500, 0.3250, 0.0980]);
hold off
ylabel('y (m)') 
xlabel('x (m)') 
title('FL Toe-Trajectory')
grid on
box on
axis equal
drawnow

%-------------------------------------------------------------------------%
% Hind Left Toe Trajectory
%-------------------------------------------------------------------------%
subplot(2,2,3)
hold all
st_elements = find(Stance_events(1:i,4)==1); 
fl_elements = find(Stance_events(1:i,4)==0); 
plot(Toe_coords_des(:,7), Toe_coords_des(:,8),'k.','MarkerSize',1);
plot(Toe_coords(st_elements,7), Toe_coords(st_elements,8),'.','MarkerSize',1,'Color', [0, 0.4470, 0.7410]);
plot(Toe_coords(fl_elements,7), Toe_coords(fl_elements,8),'.','MarkerSize',1,'Color', [0.8500, 0.3250, 0.0980]);

hold off
ylabel('y (m)') 
xlabel('x (m)') 
title('HL Toe-Trajectory')
grid on
box on
axis equal
drawnow

%-------------------------------------------------------------------------%
% Save frames for video
%-------------------------------------------------------------------------%
    
frame = getframe(1);
im = frame2im(frame);
[imind,cm] = rgb2ind(im,256);
outputFileName = sprintf('img_%d.png',frame_no);
imwrite(imind,cm, outputFileName);



end

