clc, clear, close all
%% This is an example
L1 = 50;
s=0:0.001:1;
[x,y] = path(s);
q = inverseKinematics(x,y);

vx = gradient(x);
vy = gradient(y);

for i=1:10:length(q)    
    xm = L1*cos(q(i,1));
    ym = L1*sin(q(i,1));
    
    figure(1)
    subplot(2,1,1)
    plot([0 xm],[0 ym])
    grid on
    hold on
    axis equal
    plot(x,y)
    plot([xm x(i)],[ym y(i)])

    plot([0 x(i)],[0 y(i)],':')
    xlim([-20 80])
    ylim([-5 80])
    hold off

    subplot(2,2,3)
    plot(q(1:i,1),q(1:i,2),'r.')
    grid on
    axis equal
    xlim([0 pi])
    ylim([0 pi])

    subplot(2,2,4)
    plot(i,vx(i),'b*')
    hold on
    grid on
    plot(i,vy(i),'r*')
    plot(vx,'b')
    plot(vy,'r')
    hold off

%     pause(0.00001)
end

 
