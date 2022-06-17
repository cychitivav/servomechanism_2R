clc, clear, close all
%% This is an example
L1 = 0.3;
L2 = 0.2;

[x0, y0] = forwardKinematics(pi/2,-19*pi/20);
q0 = inverseKinematics(x0,y0);

L = 0.221;
xc = 0.1605;
yc = 0.3;

s = 0:0.001:2*pi;
[xf,yf] = path(s);
xi=xf(1);
yi=yf(1);
qf = inverseKinematics(xf,yf);

qs = interp1([0,1],[q0;qf(1,:)],(0:0.001:1));
qs = [qs;qf];

[x,y] = forwardKinematics(qs);

Dx = gradient(x);
Dy = gradient(y);

vx = zeros(1,length(x));
vy = zeros(1,length(x));


t = ones(length(x),1);
Vc = 1.*(t>0);
for i=2:length(x)
    dx = x(i) - x(i-1);
    dy = y(i) - y(i-1);

    dt = sqrt(dx^2+dy^2)./Vc(i);

    vx(i) = dx/dt;
    vy(i) = dy/dt;

    t(i) = t(i-1)+ dt;
end
%% Plots
for i=1:100:length(qs(:,1))-1
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
    plot(x,y)

    plot(xi,yi,'o')

%     legend(strcat('t=',num2str(t(i))))

    pause(t(i+1)-t(i))
    hold off
end


figure
subplot(2,1,1)
hold on
plot(t,sqrt(vx.^2+vy.^2))
grid on
title('Velocity tip')


subplot(2,1,2)
hold on
plot(t,vx)
plot(t,vy)
grid on
title('Velocity tip')
legend('x','y')

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
title('Acceleration motors')
legend('Motor 1','Motor 2')
