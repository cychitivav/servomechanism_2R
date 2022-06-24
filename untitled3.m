clc, clear, close all
%% Parameters
m1=1.18*30*0.8*4*0.001;%kg
m2=1.18*20*0.8*4*0.001;%kg
mp=0.050;%kg
g=9.81; %m/S^2


L1 = 0.3;
L2 = 0.2;

Vc = 0.1;

L = 0.221;
xc = 0.1605;
yc = 0.3;
%% Initial position
[x0, y0] = forwardKinematics(pi/2,-19*pi/20);
q0 = inverseKinematics(x0,y0);


%% Computations
s = 0:0.05:4*pi;
[xf,yf] = path(s);
xi=xf(1);
yi=yf(1);
qf = inverseKinematics(xf,yf);



qs = interp1([0,1],[q0;qf(1,:)],(0:0.01:1));
q = [qs(1:end-1,:);qf];

ta = 1;
tc = 2;
td = 1;


t = linspace(0,ta+tc+td,length(qs));
dt = t(2);

Wi = [gradient(qf(:,1))/dt, ...
      gradient(qf(:,2))/dt];

Wc = (qf(1,:)-q0-1/2*Wi(1,:)*td)/(1/2*ta+tc+1/2*td); 

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
theta=cumsum(W,1)*dt+q0;

t = 0:dt:(length(W)-1)*dt;

alpha1=gradient(W(:,1))/dt;
alpha2=gradient(W(:,2))/dt;




A=W(:,1).^2*L1;
B=W(:,1).^2*L2/2;
Fx=m2*(A.*cos(theta(:,1))+B.*cos(theta(:,1)+theta(:,2)));
Fy=m2*(A.*sin(theta(:,1))+B.*sin(theta(:,1)+theta(:,2))+g)+mp*g;
I1=m1*(L1^2)/2+m2*(L1^2+ (L2^2)/4+L1*L2*cos(theta(:,2)));
I2=m2*(L2^2)/4;

tau1=(I1.*alpha1+m1*L1/2*g*cos(theta(:,1))+L1*Fy.*L1.*cos(theta(:,1))-Fx.*L1.*sin(theta(:,1)))*1000;
tau2=(I2*alpha2+m2*L2/2*g*cos(theta(:,1)+theta(:,2)))*1000;

[x,y] = forwardKinematics(q);
%% Selection
Tau1m=max(abs(tau1));
Tau2m=max(abs(tau2));
Tau1r=rms(tau1);
Tau2r=rms(tau2);
Wm1=max(abs(W(:,1)));
Wm2=max(abs(W(:,2)));
%% Signal creation
signal.time = t;
signal.signals.values = q;
%% Plots    
figure(1)
plot(t,W)
grid on
legend("\omega_{1} motor 1","\omega_{2} motor 2")
grid on
xlabel("Tiempo(s)")
ylabel("velocidad ángular (rad/s)")


figure(2)
plot(t,theta)
legend("\theta_{1} motor 1","\theta_{2} motor 2")
grid on
xlabel("Tiempo(s)")
ylabel("posición ángular (rad)")

figure(3)
hold on
plot(t,alpha1)
plot(t,alpha2)
legend("\alpha_{1} motor 1","\alpha_{2} motor 2")
grid on
xlabel("Tiempo(s)")
ylabel("aceleración ángular (rad/s^{2})")



figure(4)
hold on
plot(t,tau1)
plot(t,tau2)
legend("\tau_{m1} motor 1","\tau_{m2} motor 2")
grid on
xlabel("Tiempo(s)")
ylabel("torque del motor (mNm)")


for i=1:length(q(:,1))-1
    figure(5)
    clf
    rectangle('Position',[xc-L/2 yc-L/2 L L])
    hold on
    grid on
    axis equal
    
    
    yline(yc,'r--')
    xline(xc-L/2,'r--')
    axis([-0.01 0.5 -0.01 0.5])
    xm = L1*cos(q(i,1));
    ym = L1*sin(q(i,1));

    [xa,ya] = forwardKinematics(q(i,1),q(i,2));

    plot([0 xm],[0 ym],'r')
    plot([xm xa],[ym ya],'b')
    plot(x,y)

    plot(xi,yi,'o')

    legend(strcat('t=',num2str(t(i))))

    pause(0.01)
end




