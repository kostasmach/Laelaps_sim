%-------------------------------------------------------------------------%
% Phase portrait thb-thbdot
%-------------------------------------------------------------------------%

f10 = figure(10);
set(f10, 'Position', [100, 70, 1000, 600]);
clf(f10);

% Background color
set(gcf,'color','w');

% Phase Portrait through Time
subplot(2,3,1)
plot3(xout(:,5),xout(:,6), tout,'LineWidth',1)
ylabel('thdot (rad/s)') 
xlabel('th (rad)')  
zlabel('t(s)')
title('Phase Portraits through Time')
grid on

% Phase Portrait 
subplot(2,3,2)
hold all
plot(xout(:,5),xout(:,6),'LineWidth',1)
ylabel('thdot (rad/s)') 
xlabel('th (rad)')
title('thb Phase Portrait')
grid on

% Poincare Map
subplot(2,3,3)
[pks_y,locs_y] = findpeaks(xout(:,3));
plot(xout(locs_y,5),xout(locs_y,6),'.')

ylabel('thdot (rad/s)') 
xlabel('th (rad)') 
title('Poincare Map')
grid minor


%-------------------------------------------------------------------------%
% Phase portrait y-ydot
%-------------------------------------------------------------------------%
% Phase Portrait through Time
subplot(2,3,4)
plot3(xout(:,3),xout(:,4), tout,'LineWidth',1)
ylabel('ydot (m/s)') 
xlabel('y (m)') 
zlabel('t(s)')
title('Phase Portraits through Time')
grid on

% Phase Portrait 
subplot(2,3,5)
hold all
plot(xout(:,3),xout(:,4),'LineWidth',1)
ylabel('ydot (m/s)') 
xlabel('y (m)') 
title('yb Phase Portrait')
grid on

% Poincare Map
subplot(2,3,6)
[pks_y,locs_y] = findpeaks(xout(:,3));
plot(xout(locs_y,3),xout(locs_y,4),'.')
ylabel('ydot (m/s)') 
xlabel('y (m)') 
title('Poincare Map')
grid minor
axis([0.45 0.6 -0.5 0.5])



