%-------------------------------------------------------------------------%
% Gait Graphs
%-------------------------------------------------------------------------%

f4 = figure(4);
set(f4, 'Position', [100, 70, 1000, 300]);
clf(f4);

% Background color
set(gcf,'color','w');

% FR
subplot(4,1,1)
hold all
area(tout,[Stance_events(:,1)],'FaceColor',[0.3 0.3 0.3],'LineStyle','no')
hold off
ylabel('FR') 
set(gca, 'xtick', [], 'ytick', []) ;
axis([0 tout(end) 0 1]);
box on

% HR
subplot(4,1,2)
area(tout,[Stance_events(:,2)],'FaceColor',[0.3 0.3 0.3],'LineStyle','no')
ylabel('HR') 
set(gca, 'xtick', [], 'ytick', []) ;
axis([0 tout(end) 0 1]);

% FL
subplot(4,1,3)
area(tout,[Stance_events(:,3)],'FaceColor',[0.3 0.3 0.3],'LineStyle','no')
ylabel('FL') 
set(gca, 'xtick', [], 'ytick', []) ;
axis([0 tout(end) 0 1]);

% HL
subplot(4,1,4)
area(tout,[Stance_events(:,4)],'FaceColor',[0.3 0.3 0.3],'LineStyle','no')
ylabel('HL')
% set(gca, 'xtick', [], 'ytick', []) ;
set(gca, 'ytick', []) ;

xlabel('t (s)') 
axis([0 tout(end) 0 1]);


%-------------------------------------------------------------------------%
% Alternative
%-------------------------------------------------------------------------%
% f5 = figure(5);
% set(f5, 'Position', [100, 100, 1100, 150]);
% clf(f5);
% 
% plot(tout,4*Stance_events(:,1),'ks','markers',1)
% hold all
% plot(tout,3*Stance_events(:,2),'ks','markers',1)
% plot(tout,2*Stance_events(:,3),'ks','markers',1)
% plot(tout,Stance_events(:,4),'ks','markers',1)
% hold off
% set(gca,'YTickLabel',[]);
% ylabel('HL  FL  HR  FR') 
% xlabel('t (s)') 
% %title('FR')
% % grid on
% axis([0 tout(end) 0.5 4.5]);
