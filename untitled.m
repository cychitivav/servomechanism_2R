clc, clear, close all
%% This is an example
L1 = 0.3;
L2 = 0.2;

[x0, y0] = forwardKinematics(pi/2,-19*pi/20);
x0 =0.0313;
y0 =0.1025;
q0 = inverseKinematics(x0,y0);



L = 0.221;
xc = 0.1605;
yc = 0.3;


s=0:0.05:2*pi;
[xf,yf] = path(s);
qf = inverseKinematics(xf,yf);

xi=xf(1);
yi=yf(1);

qi = inverseKinematics(xi,yi);

qs = interp1([0,1],[q0;qi],(0:0.05:1));


[x,y] = inverseKinematics(qf);

vx = gradient(xf);
vy = gradient(yf);

qs = [qs;qf];
%% Plots
for i=1:length(qs(:,1))
    clf
    rectangle('Position',[xc-L/2 yc-L/2 L L])
    hold on
    grid on
    axis equal
    
    
    yline(yc,'r--')
    xline(xc-L/2,'r--')
    axis([-0.01 0.5 -0.01 0.5])
    xm = L1*cos(qs(i,1));
    ym = L1*sin(qs(i,1));

    [xa,ya] = forwardKinematics(qs(i,1),qs(i,2));

    plot([0 xm],[0 ym],'r')
    plot([xm xa],[ym ya],'b')
    plot(xf,yf)

    plot(xi,yi,'o')

    pause(0.001)
    hold off
end


figure
hold on
plot(sqrt(vx.^2+vy.^2))
grid on
title('Velocity tip')

figure()
hold on
plot(gradient(qs(:,1)))
plot(gradient(qs(:,2)))
grid on
title('Velocity motors')
legend('Motor 1','Motor 2')

figure()
hold on
plot(gradient(gradient(qs(:,1))))
plot(gradient(gradient(qs(:,2))))
grid on
title('Aceleration motors')
legend('Motor 1','Motor 2')
