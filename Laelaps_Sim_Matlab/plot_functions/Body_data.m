%-------------------------------------------------------------------------%
% Body Data Plots
%-------------------------------------------------------------------------%

f3 = figure(3);
%set(f3, 'Position', [100, 70, 1100, 400]);
set(f3, 'Position', [100, 70, 1000, 700]);
clf(f3);

% Background color
set(gcf,'color','w');

% Body CoM Trajectory 
subplot(3,1,1)
hold all
plot(xout(:,1),xout(:,3),'LineWidth',1,'Color',[0.850, 0.3250, 0.0980])
ylabel('y (m)') 
xlabel('x (m)') 
title('Body CoM Trajectory ')
grid on

% Body Horizontal Velocity (m/s) - t
subplot(3,1,2)
y_limit_up = max(xout(:,2));
y_limit_down = min(xout(:,2));
hold all
area(tout,1.1*y_limit_up.*Stance_events(:,1),'FaceColor',[0.9 0.9 0.9],'LineStyle','no')
area(tout,1.1*y_limit_down.*Stance_events(:,1),'FaceColor',[0.9 0.9 0.9],'LineStyle','no')
area(tout,1.1*y_limit_up.*Stance_events(:,2),'FaceColor',[0.9 0.9 0.9],'LineStyle','no')
area(tout,1.1*y_limit_down.*Stance_events(:,2),'FaceColor',[0.9 0.9 0.9],'LineStyle','no')
area(tout,1.1*y_limit_up.*Stance_events(:,3),'FaceColor',[0.9 0.9 0.9],'LineStyle','no')
area(tout,1.1*y_limit_down.*Stance_events(:,3),'FaceColor',[0.9 0.9 0.9],'LineStyle','no')
area(tout,1.1*y_limit_up.*Stance_events(:,4),'FaceColor',[0.9 0.9 0.9],'LineStyle','no')
area(tout,1.1*y_limit_down.*Stance_events(:,4),'FaceColor',[0.9 0.9 0.9],'LineStyle','no')
plot(tout,xout(:,2),'LineWidth',1,'Color',[0.850, 0.3250, 0.0980])
plot([0 max(tout)],[0 0],'k')
ylabel('Body Horizontal Velocity (m/s)') 
xlabel('Time (s)') 
title('Body Horizontal Velocity (m/s) - t(s)')
grid on
axis([0 max(tout) 1.1*y_limit_down 1.1*y_limit_up])

% Body Pitch Angle (rad) - t
subplot(3,1,3)
y_limit_up = max(xout(:,5));
y_limit_down = min(xout(:,5));
hold all
area(tout,1.1*y_limit_up.*Stance_events(:,1),'FaceColor',[0.9 0.9 0.9],'LineStyle','no')
area(tout,1.1*y_limit_down.*Stance_events(:,1),'FaceColor',[0.9 0.9 0.9],'LineStyle','no')
area(tout,1.1*y_limit_up.*Stance_events(:,2),'FaceColor',[0.9 0.9 0.9],'LineStyle','no')
area(tout,1.1*y_limit_down.*Stance_events(:,2),'FaceColor',[0.9 0.9 0.9],'LineStyle','no')
area(tout,1.1*y_limit_up.*Stance_events(:,3),'FaceColor',[0.9 0.9 0.9],'LineStyle','no')
area(tout,1.1*y_limit_down.*Stance_events(:,3),'FaceColor',[0.9 0.9 0.9],'LineStyle','no')
area(tout,1.1*y_limit_up.*Stance_events(:,4),'FaceColor',[0.9 0.9 0.9],'LineStyle','no')
area(tout,1.1*y_limit_down.*Stance_events(:,4),'FaceColor',[0.9 0.9 0.9],'LineStyle','no')
plot(tout,xout(:,5),'LineWidth',1,'Color',[0.850, 0.3250, 0.0980])
plot([0 max(tout)],[0 0],'k')
ylabel('Body Pitch Angle (rad)') 
xlabel('Time (s)') 
title('Body Pitch Angle (rad) - t(s)')
grid on
axis([0 max(tout) 1.1*y_limit_down 1.1*y_limit_up])
