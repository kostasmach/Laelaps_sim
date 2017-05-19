global db dF1 dF2 dF3 dH1 dH2 dH3

%-------------------------------------------------------------------------%
% Animation Speed
%-------------------------------------------------------------------------%
step = 100;

f1 = figure(1);
clf(f1);

set(f1, 'Position', [50, 70, 600, 500]);

% Size of data
n = size(xout,1);

step = 10;

for i = 1:step:n-1


Rect2(0, 0.5, 1, 0.5, 0, 0.5)
hold on

% HL leg
if Stance_events(i,4)==1
    plot(0,-0.2,'ko', 'MarkerSize', 20, 'MarkerFaceColor',[0,0,0])
else
    plot(0,-0.2,'ko', 'MarkerSize', 20, 'MarkerFaceColor',[0.9,0.9,0.9])    
end

% FR leg
if Stance_events(i,1)==1
    plot(1,1.2,'ko', 'MarkerSize', 20, 'MarkerFaceColor',[0,0,0])
else
    plot(1,1.2,'ko', 'MarkerSize', 20, 'MarkerFaceColor',[0.9,0.9,0.9])    
end

% HR leg
if Stance_events(i,2)==1
    plot(1,-0.2,'ko', 'MarkerSize', 20, 'MarkerFaceColor',[0,0,0])
else
    plot(1,-0.2,'ko', 'MarkerSize', 20, 'MarkerFaceColor',[0.9,0.9,0.9])    
end

% FL leg
if Stance_events(i,3)==1
    plot(0,1.2,'ko', 'MarkerSize', 20, 'MarkerFaceColor',[0,0,0])
else
    plot(0,1.2,'ko', 'MarkerSize', 20, 'MarkerFaceColor',[0.9,0.9,0.9])    
end

% Print Time
x_time = -0.8;
y_time = 1.8;
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

hold off
axis equal
axis([-1 2 -1 2])
set(gca, 'xTickLabel', []);
set(gca, 'yTickLabel', []);
drawnow



end





