%-------------------------------------------------------------------------%
% Hind Right Leg Plots
%-------------------------------------------------------------------------%

f9 = figure(9);
set(f9, 'Position', [100, 70, 1000, 700]);
clf(f9);

% Background color
set(gcf,'color','w');

suptitle('Hind Right Leg')

% Hip Torque (Nm) - Speed (rpm)
subplot(3,2,1)
plot(Torques(:,3),(xout(:,14)-xout(:,6))*9.5493,'LineWidth',1)
ylabel('Speed (rpm)') 
xlabel('Torque (Nm)') 
title('Hip Torque - Speed')
grid on

% Knee Torque (Nm) - Speed (rpm)
subplot(3,2,2)
plot(Torques(:,4),(xout(:,16)-xout(:,6))*9.5493,'LineWidth',1)
ylabel('Speed (rpm)') 
xlabel('Torque (Nm)') 
title('Knee Torque - Speed')
grid on

% Hip and Knee Torque (Nm) - t (s)
subplot(3,2,3)
y_limit_up = max([Torques(:,3);Torques(:,4)]);
y_limit_down = min([Torques(:,3);Torques(:,4)]);
hold all
area(tout,1.1*y_limit_up.*Stance_events(:,2),'FaceColor',[0.9 0.9 0.9],'LineStyle','no')
area(tout,1.1*y_limit_down.*Stance_events(:,2),'FaceColor',[0.9 0.9 0.9],'LineStyle','no')
p1 = plot(tout,Torques(:,3),'LineWidth',1);
p2 = plot(tout,Torques(:,4),'LineWidth',1);
hold off
ylabel('Torque (Nm)') 
xlabel('t (s)') 
title('Hip and Knee Torque - Time')
axis([0 max(tout) 1.2*y_limit_down 1.2*y_limit_up])
%grid on
legend([p1 p2], 'Hip','Knee');

% Hip and Knee Speed (rpm) - t (s)
subplot(3,2,4)
y_limit_up = max([(xout(:,14)-xout(:,6))*9.5493; (xout(:,16)-xout(:,6))*9.5493]);
y_limit_down = min([(xout(:,14)-xout(:,6))*9.5493; (xout(:,16)-xout(:,6))*9.5493]);
hold all
area(tout,1.1*y_limit_up.*Stance_events(:,2),'FaceColor',[0.9 0.9 0.9],'LineStyle','no')
area(tout,1.1*y_limit_down.*Stance_events(:,2),'FaceColor',[0.9 0.9 0.9],'LineStyle','no')
p1 = plot(tout,(xout(:,14)-xout(:,6))*9.5493,'LineWidth',1);
p2 = plot(tout,(xout(:,16)-xout(:,6))*9.5493,'LineWidth',1);
hold off
ylabel('Speed (rpm)') 
xlabel('t (s)') 
title('Hip and Knee Speed - Time')
axis([0 max(tout) 1.2*y_limit_down 1.2*y_limit_up])
%grid on
legend([p1 p2], 'Hip','Knee');

% Hip and Knee Joint Angle (degrees) - t (s)
subplot(3,2,5)
y_limit_up = max([rad2deg(xout(:,13)-xout(:,5)); rad2deg(xout(:,15)-xout(:,5))]);
y_limit_down = min([rad2deg(xout(:,13)-xout(:,5)); rad2deg(xout(:,15)-xout(:,5))]);
hold all
area(tout,1.1*y_limit_up.*Stance_events(:,2),'FaceColor',[0.9 0.9 0.9],'LineStyle','no')
area(tout,1.1*y_limit_down.*Stance_events(:,2),'FaceColor',[0.9 0.9 0.9],'LineStyle','no')
p1 = plot(tout,rad2deg(xout(:,13)-xout(:,5)),'LineWidth',1);
p2 = plot(tout,rad2deg(xout(:,15)-xout(:,5)),'LineWidth',1);
hold off
ylabel('Joint Angle (degrees)') 
xlabel('t (s)') 
title('Hip and Knee Joint Angle - Time')
axis([0 max(tout) 1.2*y_limit_down 1.2*y_limit_up])
%grid on
legend([p1 p2], 'Hip','Knee');

% Hip and Knee Power (W) - t (s)
subplot(3,2,6)
power1 = Torques(:,3) .* (xout(:,14)-xout(:,6));
power2 = Torques(:,4) .* (xout(:,16)-xout(:,6));
y_limit_up = max([power1; power2]);
y_limit_down = min([power1; power2]);
hold all
area(tout,1.1*y_limit_up.*Stance_events(:,2),'FaceColor',[0.9 0.9 0.9],'LineStyle','no')
area(tout,1.1*y_limit_down.*Stance_events(:,2),'FaceColor',[0.9 0.9 0.9],'LineStyle','no')
p1 = plot(tout,power1,'LineWidth',1);
p2 = plot(tout,power2,'LineWidth',1);
hold off
ylabel('Power (W)') 
xlabel('t (s)') 
title('Hip and knee Power - Time')
axis([0 max(tout) -300 300])
axis([0 max(tout) 1.2*y_limit_down 1.2*y_limit_up])
%grid on
legend([p1 p2], 'Hip','Knee');








