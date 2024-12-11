clc
close all
clear all
u = @(t)(1*heaviside(t-4)-1*heaviside(t-4.1));
Ts = [0,20];
%% case 1 
%for initial
x0 = [pi;0];
[T1,X1] = ode45(@(t,x)systemmodel(t,x,u),Ts,x0);
figure
subplot(2,1,1)
plot(T1,inmpipi(X1(:,1)))
xlabel("Time in sec")
ylabel("Angle in rad")
legend("q")
title("Initial angle π rad (180 deg) for pulse input")
subplot(2,1,2)
plot(T1,u(T1))
ylim([-0.1,1.2])
xlabel("Time in sec")
ylabel("Input torque in Nm")
legend("Torque")
%% case 2
u = @(t)(0*t);
Ts = [0,10]; 
%for initial
x0 = [pi/3;0];
[T2,X2] = ode45(@(t,x)systemmodel(t,x,u),Ts,x0);
figure
subplot(2,1,1)
plot(T2,inmpipi(X2(:,1)))
xlabel("Time in sec")
ylabel("Angle in rad")
legend("q")
title("Initial angle π/3 rad (60 deg) for no input")
subplot(2,1,2)
plot(T2,u(T2))
ylim([-0.2,0.2])
xlabel("Time in sec")
ylabel("Input torque in Nm")
legend("Torque")

