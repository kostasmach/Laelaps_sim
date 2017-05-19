%-------------------------------------------------------------------------%
% Fore Left Leg Plots
%-------------------------------------------------------------------------%

f6 = figure(6);
set(f6, 'Position', [100, 70, 1000, 700]);
clf(f6);

% Background color
set(gcf,'color','w');

suptitle('Fore Left Leg')

% Hip Torque (Nm) - Speed (rpm)
subplot(3,2,1)
plot(Torques(:,5),(xout(:,20)-xout(:,6))*9.5493,'LineWidth',1)
ylabel('Speed (rpm)') 
xlabel('Torque (Nm)') 
title('Hip Torque - Speed')
grid on

% Knee Torque (Nm) - Speed (rpm)
subplot(3,2,2)
plot(Torques(:,6),(xout(:,22)-xout(:,6))*9.5493,'LineWidth',1)
ylabel('Speed (rpm)') 
xlabel('Torque (Nm)') 
title('Knee Torque - Speed')
grid on

% Hip and Knee Torque (Nm) - t (s)
subplot(3,2,3)
y_limit_up = max([Torques(:,5);Torques(:,6)]);
y_limit_down = min([Torques(:,5);Torques(:,6)]);
hold all
area(tout,1.1*y_limit_up.*Stance_events(:,3),'FaceColor',[0.9 0.9 0.9],'LineStyle','no')
area(tout,1.1*y_limit_down.*Stance_events(:,3),'FaceColor',[0.9 0.9 0.9],'LineStyle','no')
p1 = plot(tout,Torques(:,5),'LineWidth',1);
p2 = plot(tout,Torques(:,6),'LineWidth',1);
hold off
ylabel('Torque (Nm)') 
xlabel('t (s)') 
title('Hip and Knee Torque - Time')
axis([0 max(tout) 1.2*y_limit_down 1.2*y_limit_up])
%grid on
legend([p1 p2], 'Hip','Knee');

% Hip and Knee Speed (rpm) - t (s)
subplot(3,2,4)
y_limit_up = max([(xout(:,20)-xout(:,6))*9.5493; (xout(:,22)-xout(:,6))*9.5493]);
y_limit_down = min([(xout(:,20)-xout(:,6))*9.5493; (xout(:,22)-xout(:,6))*9.5493]);
hold all
area(tout,1.1*y_limit_up.*Stance_events(:,3),'FaceColor',[0.9 0.9 0.9],'LineStyle','no')
area(tout,1.1*y_limit_down.*Stance_events(:,3),'FaceColor',[0.9 0.9 0.9],'LineStyle','no')
p1 = plot(tout,(xout(:,20)-xout(:,6))*9.5493,'LineWidth',1);
p2 = plot(tout,(xout(:,22)-xout(:,6))*9.5493,'LineWidth',1);
hold off
ylabel('Speed (rpm)') 
xlabel('t (s)') 
title('Hip and Knee Speed - Time')
axis([0 max(tout) 1.2*y_limit_down 1.2*y_limit_up])
%grid on
legend([p1 p2], 'Hip','Knee');

% Hip and Knee Joint Angle (degrees) - t (s)
subplot(3,2,5)
y_limit_up = max([rad2deg(xout(:,19)-xout(:,5)); rad2deg(xout(:,21)-xout(:,5))]);
y_limit_down = min([rad2deg(xout(:,19)-xout(:,5)); rad2deg(xout(:,21)-xout(:,5))]);
hold all
area(tout,1.1*y_limit_up.*Stance_events(:,3),'FaceColor',[0.9 0.9 0.9],'LineStyle','no')
area(tout,1.1*y_limit_down.*Stance_events(:,3),'FaceColor',[0.9 0.9 0.9],'LineStyle','no')
p1 = plot(tout,rad2deg(xout(:,19)-xout(:,5)),'LineWidth',1);
p2 = plot(tout,rad2deg(xout(:,21)-xout(:,5)),'LineWidth',1);
hold off
ylabel('Joint Angle (degrees)') 
xlabel('t (s)') 
title('Hip and Knee Joint Angle - Time')
axis([0 max(tout) 1.2*y_limit_down 1.2*y_limit_up])
%grid on
legend([p1 p2], 'Hip','Knee');

% Hip and Knee Power (W) - t (s)
subplot(3,2,6)
power1 = Torques(:,5) .* (xout(:,20)-xout(:,6));
power2 = Torques(:,6) .* (xout(:,22)-xout(:,6));
y_limit_up = max([power1; power2]);
y_limit_down = min([power1; power2]);
hold all
area(tout,1.1*y_limit_up.*Stance_events(:,3),'FaceColor',[0.9 0.9 0.9],'LineStyle','no')
area(tout,1.1*y_limit_down.*Stance_events(:,3),'FaceColor',[0.9 0.9 0.9],'LineStyle','no')
p1 = plot(tout,power1,'LineWidth',1);
p2 = plot(tout,power2,'LineWidth',1);
hold off
ylabel('Power (W)') 
xlabel('t (s)') 
title('Hip and knee Power - Time')
axis([0 max(tout) 1.2*y_limit_down 1.2*y_limit_up])
%grid on
legend([p1 p2], 'Hip','Knee');






