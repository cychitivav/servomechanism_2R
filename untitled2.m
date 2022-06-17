clc, clear, close all
%% This is an example
L1 = 0.3;
L2 = 0.2;

Vc = 0.1;

[x0, y0] = forwardKinematics(pi/2,-19*pi/20);
q0 = inverseKinematics(x0,y0);

L = 0.221;
xc = 0.1605;
yc = 0.3;

s = 0:0.05:2*pi;
[xf,yf] = path(s);
xi=xf(1);
yi=yf(1);
qf = inverseKinematics(xf,yf);



ta = 1;
tc = 2;
td = 1;

dt = 0.1;
t = 0:dt:ta+tc+td;
Wi = [gradient(qf(:,1))/dt, ...
      gradient(qf(:,2))/dt];

Wc = -(qf(1,:)-q0-1/2*Wi(1,:)*td)/(1/2*ta+tc-1/2*td); 

for i=1:length(t)
    if t(i)<ta
        W(i,:) = Wc*t(i);
    elseif t(i) < ta+tc
        W(i,:) = Wc;
    elseif t(i)<ta+tc+td
        W(i,:) = (Wi(1,:)-Wc)/td*(t(i)-ta-tc) + Wc;
    end
end


W = [W;Wi];
t = linspace(0,50,length(W));


       
        
figure
plot(t,W)
grid on

figure
plot(t,cumsum(W,1)*dt)
grid on

figure
hold on
plot(t,gradient(W(:,1))/dt)
plot(t,gradient(W(:,2))/dt)
grid on



alphaRMS = rms(gradient(W(:,1))/dt)



qs = interp1([0,1],[q0;qf(1,:)],(0:0.05:1));

% qs = 
% 
% 
% 
qs = [qs;qf];
% 
% 
% Dqs=gradient(qs);
% 
% 
% q





[x,y] = forwardKinematics(qs);

Dx = gradient(x);
Dy = gradient(y);

vx = zeros(1,length(x));
vy = zeros(1,length(x));


t = zeros(1,length(x));
for i=2:length(x)
    dx = x(i) - x(i-1);
    dy = y(i) - y(i-1);

    dt = sqrt(dx^2+dy^2)/Vc;

    vx(i) = dx/dt;
    vy(i) = dy/dt;

    t(i) = t(i-1)+ dt;
end
%% Plots
% for i=1:10:length(qs(:,1))-1
%     clf
%     rectangle('Position',[xc-L/2 yc-L/2 L L])
%     hold on
%     grid on
%     axis equal
%     
%     
%     yline(yc,'r--')
%     xline(xc-L/2,'r--')
%     axis([-0.01 0.5 -0.01 0.5])
%     xm = L1*cos(qs(i,1));
%     ym = L1*sin(qs(i,1));
% 
%     [xa,ya] = forwardKinematics(qs(i,1),qs(i,2));
% 
%     plot([0 xm],[0 ym],'r')
%     plot([xm xa],[ym ya],'b')
%     plot(x,y)
% 
%     plot(xi,yi,'o')
% 
% %     legend(strcat('t=',num2str(t(i))))
% 
%     pause(t(i+1))
%     hold off
% end

