%-------------------------------------------------------------------------%
% Ground Forces
%-------------------------------------------------------------------------%

f5 = figure(5);
set(f5, 'Position', [100, 70, 1000, 700]);
clf(f5);

% Background color
set(gcf,'color','w');

% Normal Forces (N) - t (s)
subplot(2,2,1)
plot(tout,NForces(:,1),'LineWidth',1)
hold all
plot(tout,NForces(:,2),'LineWidth',1)
plot(tout,NForces(:,3),'LineWidth',1)
plot(tout,NForces(:,4),'LineWidth',1)
hold off
ylabel('Normal Forces (N)') 
xlabel('t (s)') 
title('Normal Force (N) - t (s)')
grid on
legend('FR','HR','FL','HL')

% Normal Forces Sum
subplot(2,2,2)
plot(tout,NForces(:,1) + NForces(:,2) + NForces(:,3) ...
    + NForces(:,4),'LineWidth',1)
ylabel('Normal Forces Sum (N)') 
xlabel('t (s)') 
title('Normal Forces Sum (N) - t (s)')
grid on

% Frictional Forces (N) - t (s)
subplot(2,2,3)
plot(tout,FForces(:,1),'LineWidth',1)
hold all
plot(tout,FForces(:,2),'LineWidth',1)
plot(tout,FForces(:,3),'LineWidth',1)
plot(tout,FForces(:,4),'LineWidth',1)
hold off
ylabel('Frictional Forces (N)') 
xlabel('t (s)') 
title('Frictional Force (N) - t (s)')
grid on
legend('FR','HR','FL','HL')

% Frictional Forces Sum
subplot(2,2,4)
plot(tout,FForces(:,1) + FForces(:,2) + FForces(:,3) ...
    + FForces(:,4),'LineWidth',1)
ylabel('Frictional Forces Sum (N)') 
xlabel('t (s)') 
title('Frictional Forces Sum (N) - t (s)')
grid on

 
