clc
close all 
clear all
% for case 1 2 r=0
p1 = 1;
p2 = 5;
r = @(t)(0*t);
Ts = [0,10];
%% case 1 
p1 = 1;
p2 = 5;
r = @(t)(0*t);
Ts = [0,10];
Qmatrix = 10^4* eye(2);
init1 = 0.1745;
x0 = [init1,0,init1,0,-10,3,1];
[T1,X1] = ode45(@(t,x)referenceandsystemmodelmatrix(t,x,r,p1,p2,Qmatrix),Ts,x0);
%-K1x1 -K2x2 + L*r(t)
u1 = -X1(:,5).*X1(:,3)-X1(:,6).*X1(:,4) +X1(:,7).*r(T1);
getplots(T1,X1(:,1),X1(:,2),X1(:,3),X1(:,4),u1,1,init1,p1,p2);
getklplots(T1,X1(:,5),X1(:,6),X1(:,7),1,init1,p1,p2);
%% case 2 
Qmatrix = 10^4*eye(2);
init2 = 0.8727;
x0 = [init2,0,init2,0,0,0,0];
[T2,X2] = ode45(@(t,x)referenceandsystemmodelmatrix(t,x,r,p1,p2,Qmatrix),Ts,x0);
u2 = -X2(:,5).*X2(:,3)-X2(:,6).*X2(:,4) +X2(:,7).*r(T2);
getplots(T2,X2(:,1),X2(:,2),X2(:,3),X2(:,4),u2,2,0.8727,p1,p2);
getklplots(T2,X2(:,5),X2(:,6),X2(:,7),2,init2,p1,p2);
%% case 3 other system and input
%opts = odeset('InitialStep',1e-10);
A = 0.0175;
w = 0.5;
x0 = [0,A*w,0,0,0,0,0];
p1 = 3;
p2 = 4;
Ts = [0,80];
Qmatrix = 10^6*eye(2);
%for sinusodial output of model 
r = @(t)(A*w*(p1+p2)*cos(w*t)+A*(p1*p2-w^2)*sin(w*t));
[T3,X3] = ode45(@(t,x)referenceandsystemmodelmatrix(t,x,r,p1,p2,Qmatrix),Ts,x0);
u3 = -X3(:,5).*X3(:,3)-X3(:,6).*X3(:,4) +X3(:,7).*r(T3);
getplots2(T3,X3(:,1),X3(:,2),X3(:,3),X3(:,4),u3,3,A,w,p1,p2)
getklplots(T3,X3(:,5),X3(:,6),X3(:,7),3,0,p1,p2);
%% case 4 other system and input
A = 0.0873;
w = 90;
x0 = [0,A*w,0,0,0,0,0];
p1 = 3;
p2 = 4;
Ts = [0,1.5];
Qmatrix = 10^5*eye(2);
%for sinusodial output of model 
r = @(t)(A*w*(p1+p2)*cos(w*t)+A*(p1*p2-w^2)*sin(w*t));
[T4,X4] = ode45(@(t,x)referenceandsystemmodelmatrix(t,x,r,p1,p2,Qmatrix),Ts,x0);
u4 = -X4(:,5).*X4(:,3)-X4(:,6).*X4(:,4) +X4(:,7).*r(T4);
getplots2(T4,X4(:,1),X4(:,2),X4(:,3),X4(:,4),u4,4,A,w,p1,p2)
getklplots(T4,X4(:,5),X4(:,6),X4(:,7),4,0,p1,p2);



