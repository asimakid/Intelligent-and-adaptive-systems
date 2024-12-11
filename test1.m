clc
close all 
clear all
% for case 1 2 r=0 p1=3 p2=4
p1 = 1;
p2 = 5;
r = @(t)(0*t);
Ts = [0,10];
%l0 the choice for the filter
l0 = 5;
Smatrix = [1 0 0;2 0 2;20 2 2*l0];
Pvector = [2-p1-p2;20-p1*p2+l0*(2-p1-p2);l0*(20-p1*p2)];
thetas = Smatrix\Pvector;
thetas = [thetas; 0.5];
%% case 1 
x0 = [0.1745;0;0;0;0.1745;0];
[T1,X1] = ode45(@(t,x)referenceandsystemmodel(t,x,r,p1,p2,l0,thetas),Ts,x0);
u1 = [X1(:,3) X1(:,4) X1(:,5) r(T1)]*thetas;
getplots(T1,X1(:,1),X1(:,2),X1(:,5),X1(:,6),u1,1,0.1745,p1,p2);
%% case 2
x0 = [0.8727;0;0;0;0.8727;0];
[T2,X2] = ode45(@(t,x)referenceandsystemmodel(t,x,r,p1,p2,l0,thetas),Ts,x0);
u2 = [X2(:,3) X2(:,4) X2(:,5) r(T2)]*thetas;
getplots(T2,X2(:,1),X2(:,2),X2(:,5),X2(:,6),u2,2,0.8727,p1,p2);
%% case 3
p1 = 2;
p2 = 3;
l0 = 2;
Smatrix = [1 0 0;2 0 2;20 2 2*l0];
Pvector = [2-p1-p2;20-p1*p2+l0*(2-p1-p2);l0*(20-p1*p2)];
thetas = Smatrix\Pvector;
thetas = [thetas; 0.5];
%for sinusodial output of model 
A = 0.0175;
w = 0.5;
r = @(t)(A*w*(p1+p2)*cos(w*t)+A*(p1*p2-w^2)*sin(w*t));
Ts = [0,40];
x0 = [0;A*w;A*w/2;0;0;A*w];
[T3,X3] = ode45(@(t,x)referenceandsystemmodel(t,x,r,p1,p2,l0,thetas),Ts,x0);
u3 = [X3(:,3) X3(:,4) X3(:,5) r(T3)]*thetas;
getplots2(T3,X3(:,1),X3(:,2),X3(:,5),X3(:,6),u3,3,A,w,p1,p2)
%% case 4
p1 = 2;
p2 = 3;
l0 = 2;
Smatrix = [1 0 0;2 0 2;20 2 2*l0];
Pvector = [2-p1-p2;20-p1*p2+l0*(2-p1-p2);l0*(20-p1*p2)];
thetas = Smatrix\Pvector;
thetas = [thetas; 0.5];
%for sinusodial output of model 
A = 0.0873;
w = 90;
r = @(t)(A*w*(p1+p2)*cos(w*t)+A*(p1*p2-w^2)*sin(w*t));
Ts = [0,5];
x0 = [0;A*w;A*w/2;0;0;A*w];
[T4,X4] = ode45(@(t,x)referenceandsystemmodel(t,x,r,p1,p2,l0,thetas),Ts,x0);
u4 = [X4(:,3) X4(:,4) X4(:,5) r(T4)]*thetas;
getplots2(T4,X4(:,1),X4(:,2),X4(:,5),X4(:,6),u4,4,A,w,p1,p2)

