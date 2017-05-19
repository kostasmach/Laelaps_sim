%-------------------------------------------------------------------------%
% These figures show when the feet slipped
%-------------------------------------------------------------------------%
% -1 : flight phase
%  0 : stance phase (not slipping)
%  1 : stance phase (slipping)
%-------------------------------------------------------------------------%

f12 = figure(12);
set(f12, 'Position', [100, 70, 1000, 700]);
clf(f12);

% Background color
set(gcf,'color','w');

% Slip FR
subplot(2,2,1)
plot(tout,Slip_events(:,1),'o-')
ylabel('Slip FR') 
xlabel('t (s)') 
title('Slip FR')
grid on

% Slip HR
subplot(2,2,2)
plot(tout,Slip_events(:,2),'o-')
ylabel('Slip HR') 
xlabel('t (s)') 
title('Slip HR')
grid on

% Slip FL
subplot(2,2,3)
plot(tout,Slip_events(:,3),'o-')
ylabel('Slip FL') 
xlabel('t (s)') 
title('Slip FL')
grid on

% Slip HL
subplot(2,2,4)
plot(tout,Slip_events(:,4),'o-')
ylabel('Slip HL') 
xlabel('t (s)') 
title('Slip HL')
grid on
