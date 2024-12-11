clc
close all 
clear all

%% case 1 
Gmatrix = diag([70,800,50,0.6]*10^5);
p1 = 1;
p2 = 5;
p0 = 5;
l0 = 5;
if p0 >= p1 + p2 
    display("Wrong choice of p0")
    return
end
r = @(t)(0*t);
Ts = [0,10];
x0 = [0.1745,0,0,0,0,0,0,0,0,0,0,0,0.1745,0];
[T1,X1] = ode45(@(t,x)referenceandsystemmodelunknown(t,x,r,p1,p2,l0,Gmatrix,p0),Ts,x0);
%ε =χ(13)-χ(1)
%φ =χ5 χ56 χ7 χ8
%θdot =-Γ*ε*φ 
w1 = [X1(:,3) X1(:,4) X1(:,13) r(T1)];
f1 = [X1(:,5) X1(:,6) X1(:,7) X1(:,8)];
theta1 = [X1(:,9) X1(:,10) X1(:,11) X1(:,12)];
e1 = X1(:,13) - X1(:,1);
thetadot1 = [-e1 -e1 -e1 -e1].*(f1*Gmatrix');
u1 =sum(w1.*theta1,2)+sum(f1.*thetadot1,2);
getplots(T1,X1(:,1),X1(:,2),X1(:,13),X1(:,14),u1,1,0.1745,p1,p2);
%calculating the theta star for the plots 
Smatrix = [1 0 0;2 0 2;20 2 2*l0];
Pvector = [2-p1-p2;20-p1*p2+l0*(2-p1-p2);l0*(20-p1*p2)];
thetas = Smatrix\Pvector;
thetas = [thetas; 0.5];
getthetaplots(T1,X1(:,9),X1(:,10),X1(:,11),X1(:,12),1,0.1745,p1,p2,thetas)
%% case 2 
Gmatrix = diag([70,800,50,0.6]*10^5);
p1 = 1;
p2 = 5;
p0 = 5;
l0 = 5;
r = @(t)(0*t);
Ts = [0,10];
if p0 >= p1 + p2 
    display("Wrong choice of p0")
    return
end
x0 = [0.8727,0,0,0,0,0,0,0,0,0,0,0,0.8727,0];
[T2,X2] = ode45(@(t,x)referenceandsystemmodelunknown(t,x,r,p1,p2,l0,Gmatrix,p0),Ts,x0);
w2 = [X2(:,3) X2(:,4) X2(:,13) r(T2)];
f2 = [X2(:,5) X2(:,6) X2(:,7) X2(:,8)];
theta2 = [X2(:,9) X2(:,10) X2(:,11) X2(:,12)];
e2 = X2(:,13) - X2(:,1);
thetadot2 = [-e2 -e2 -e2 -e2].*(f2*Gmatrix');
u2 =sum(w2.*theta2,2)+sum(f2.*thetadot2,2) ;
getplots(T2,X2(:,1),X2(:,2),X2(:,13),X2(:,14),u2,2,0.8727,p1,p2);
%calculating the theta star for the plots 
Smatrix = [1 0 0;2 0 2;20 2 2*l0];
Pvector = [2-p1-p2;20-p1*p2+l0*(2-p1-p2);l0*(20-p1*p2)];
thetas = Smatrix\Pvector;
thetas = [thetas; 0.5];
getthetaplots(T2,X2(:,9),X2(:,10),X2(:,11),X2(:,12),2,0.8727,p1,p2,thetas)
%% case 3 other system and input
%for sinusodial output of model 
A = 0.0175;
w = 0.5;
x0 = [0,A*w,0,0,0,0,0,0,0,0,0,0,0,0];
p1 = 3;
p2 = 4;
p0 = 5;
l0 = 5;
Gmatrix = diag([70,800,50,0.6]*10^6);
Ts = [0,1000];
if p0 >= p1 + p2 
    display("Wrong choice of p0")
    return
end
r = @(t)(A*w*(p1+p2)*cos(w*t)+A*(p1*p2-w^2)*sin(w*t));
[T3,X3] = ode45(@(t,x)referenceandsystemmodelunknown(t,x,r,p1,p2,l0,Gmatrix,p0),Ts,x0);
w3 = [X3(:,3) X3(:,4) X3(:,13) r(T3)];
f3 = [X3(:,5) X3(:,6) X3(:,7) X3(:,8)];
theta3 = [X3(:,9) X3(:,10) X3(:,11) X3(:,12)];
e3 = X3(:,13) - X3(:,1);
thetadot3 = [-e3 -e3 -e3 -e3].*(f3*Gmatrix');
u3 =sum(w3.*theta3,2)+sum(f3.*thetadot3,2);
getplots2(T3,X3(:,1),X3(:,2),X3(:,13),X3(:,14),u3,3,A,w,p1,p2)
%calculating the theta star for the plots 
Smatrix = [1 0 0;2 0 2;20 2 2*l0];
Pvector = [2-p1-p2;20-p1*p2+l0*(2-p1-p2);l0*(20-p1*p2)];
thetas = Smatrix\Pvector;
thetas = [thetas; 0.5];
getthetaplots(T3,X3(:,9),X3(:,10),X3(:,11),X3(:,12),3,0,p1,p2,thetas)
%% case 4 other system and input
%for sinusodial output of model 
A = 0.0873;
w = 90;
x0 = [0,A*w,0,0,0,0,0,0,0,0,0,0,0,0];
p1 = 3;
p2 = 4;
p0 = 5;
l0 = 5;
if p0 >= p1 + p2 
    display("Wrong choice of p0")
    return
end
Gmatrix = diag([70,800,50,0.6]*10^6);
Ts = [0,10];
r = @(t)(A*w*(p1+p2)*cos(w*t)+A*(p1*p2-w^2)*sin(w*t));
[T4,X4] = ode45(@(t,x)referenceandsystemmodelunknown(t,x,r,p1,p2,l0,Gmatrix,p0),Ts,x0);
w4 = [X4(:,3) X4(:,4) X4(:,13) r(T4)];
f4 = [X4(:,5) X4(:,6) X4(:,7) X4(:,8)];
theta4 = [X4(:,9) X4(:,10) X4(:,11) X4(:,12)];
e4 = X4(:,13) - X4(:,1);
thetadot4 = [-e4 -e4 -e4 -e4].*(f4*Gmatrix');
u4 =sum(w4.*theta4,2)+sum(f4.*thetadot4,2);
getplots2(T4,X4(:,1),X4(:,2),X4(:,13),X4(:,14),u4,4,A,w,p1,p2)
%calculating the theta star for the plots 
Smatrix = [1 0 0;2 0 2;20 2 2*l0];
Pvector = [2-p1-p2;20-p1*p2+l0*(2-p1-p2);l0*(20-p1*p2)];
thetas = Smatrix\Pvector;
thetas = [thetas; 0.5];
getthetaplots(T4,X4(:,9),X4(:,10),X4(:,11),X4(:,12),4,0,p1,p2,thetas)
%{
u4test = theta4(:,1).*w4(:,1)+theta4(:,2).*w4(:,2)+theta4(:,3).*w4(:,3)+...
    theta4(:,4).*w4(:,4) +10^5*(- e4.*f4(:,1).*f4(:,1) - e4.*f4(:,2).*f4(:,2) - e4.*f4(:,3).*f4(:,3) ...
    -e4.*f4(:,4).*f4(:,4));
norm(u4-u4test)
figure
plot(T4,u4test)
title("Testing the ouput correctens")
%}



