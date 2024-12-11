clc
close all 
clear all
allmarkers = ["-o","-+","-+","-x","-square","-diamond","-^","-v","->","-<","-hexagram"]
%% case 3 different p0
Gmatrix = diag([70,800,50,0.6]*10^5);
p1 = 1;
p2 = 5;
p0s = 1:5;
l0 = 5;
if any(p0s >= p1 + p2) 
    display("Wrong choice of p0")
    return
end
Ts = [0,80]; 
A = 0.0175;
w = 0.5;
r = @(t)(A*w*(p1+p2)*cos(w*t)+A*(p1*p2-w^2)*sin(w*t));
x0 = [0,A*w,0,0,0,0,0,0,0,0,0,0,0,0];
labels =["Model"];
figure(1)
figure(2)
for i = 1: length(p0s)
    p0 = p0s(i);
    labels = [labels, "P0 = " + num2str(p0)];    
    [T1,X1] = ode45(@(t,x)referenceandsystemmodelunknown(t,x,r,p1,p2,l0,Gmatrix,p0),Ts,x0); 
    figure(1)
    subplot(round(length(p0s)/2),2,i)
    plot(T1,X1(:,1),'LineWidth',1.5)
    hold on
    plot(T1,X1(:,13),allmarkers(i),'MarkerIndices',round(length(T1)/2))
    legend("Model", "P0 = " + num2str(p0))
    xlabel("Time in sec")
    ylabel("Angle in rad")
    figure(2)
    subplot(round(length(p0s)/2),2,i)
    plot(T1,X1(:,13)- X1(:,1),allmarkers(i),'MarkerIndices',round(length(T1)/2))
    legend("P0 = " + num2str(p0))
    xlabel("Time in sec")
    ylabel("Angle in rad")
end
model = "Model s^{2} + " + num2str(p1+p2) + "s + " + num2str(p1*p2) + ". l0 = " + num2str(l0); 
figure(1)
sgtitle({"Case 3 Ouput for different p0 choices " + model,"Gmatrix : " + num2str(Gmatrix(1,1))...
    + " " + num2str(Gmatrix(2,2)) + " " + num2str(Gmatrix(3,3))+ " " + num2str(Gmatrix(4,4))} )
figure(2)
sgtitle({"Case 3 Error for different p0 choices " + model,"Gmatrix : " + num2str(Gmatrix(1,1))...
    + " " + num2str(Gmatrix(2,2))+ " " + num2str(Gmatrix(3,3))+ " " + num2str(Gmatrix(4,4))} ) 

%% case 3 different l0
Gmatrix = diag([70,800,50,0.6]*10^5);
p1 = 1;
p2 = 5;
p0 = 5;
l0s = [1,5,10,25,100,1000];
if p0 >= p1 + p2 
    display("Wrong choice of p0")
    return
end
Ts = [0,80]; 
A = 0.0175;
w = 0.5;
r = @(t)(A*w*(p1+p2)*cos(w*t)+A*(p1*p2-w^2)*sin(w*t));
x0 = [0,A*w,0,0,0,0,0,0,0,0,0,0,0,0];
labels =["Model"];
figure(3)
figure(4)
for i = 1: length(l0s)
    l0 = l0s(i);
    [T1,X1] = ode45(@(t,x)referenceandsystemmodelunknown(t,x,r,p1,p2,l0,Gmatrix,p0),Ts,x0); 
    figure(3)
    subplot(round(length(l0s)/2),2,i)
    plot(T1,X1(:,1),'LineWidth',1.5)
    hold on
    plot(T1,X1(:,13),allmarkers(i),'MarkerIndices',round(length(T1)/2))
    legend("Model", "l0 = " + num2str(l0))
    xlabel("Time in sec")
    ylabel("Angle in rad")
    figure(4)
    subplot(round(length(l0s)/2),2,i)
    plot(T1,X1(:,13)- X1(:,1),allmarkers(i),'MarkerIndices',round(length(T1)/2))
    legend("l0 = " + num2str(l0))
    xlabel("Time in sec")
    ylabel("Angle in rad")
end
model = " Model s^{2} + " + num2str(p1+p2) + "s + " + num2str(p1*p2) + ". p0 = " + num2str(p0) ;
figure(3)
sgtitle({"Case 3 Ouput for different l0 choices " + model,"Gmatrix : " + num2str(Gmatrix(1,1))...
    + " " + num2str(Gmatrix(2,2)) + " " + num2str(Gmatrix(3,3))+ " " + num2str(Gmatrix(4,4))} )
figure(4)
sgtitle({"Case 3 Error for different l0 choices " + model,"Gmatrix : " + num2str(Gmatrix(1,1))...
    + " " + num2str(Gmatrix(2,2))+ " " + num2str(Gmatrix(3,3))+ " " + num2str(Gmatrix(4,4))} )
 
%% case 3 different p1 model
Gmatrix = diag([70,800,50,0.6]*10^5);
p1s = [0.5,1,10,20];
p2 = 20;
p0 = 5;
l0 = 5;
if any(p0 -p2>= p1s) 
    display("Wrong choice of p0")
    return
end
Ts = [0,80]; 
A = 0.0175;
w = 0.5;
x0 = [0,A*w,0,0,0,0,0,0,0,0,0,0,0,0];
r = @(t)(A*w*(p1+p2)*cos(w*t)+A*(p1*p2-w^2)*sin(w*t));
labels =[];
figure(5)
figure(6)
for i = 1: length(p1s)
    p1 = p1s(i);
    [T1,X1] = ode45(@(t,x)referenceandsystemmodelunknown(t,x,r,p1,p2,l0,Gmatrix,p0),Ts,x0); 
    figure(5)
    subplot(round(length(p1s)/2),2,i)
    plot(T1,X1(:,1),'LineWidth',1.5)
    hold on
    plot(T1,X1(:,13),allmarkers(i),'MarkerIndices',round(length(T1)/2))
    legend("Model", "p1 = " + num2str(p1))
    xlabel("Time in sec")
    ylabel("Angle in rad")
    figure(6)
    subplot(round(length(p1s)/2),2,i)
    plot(T1,X1(:,13)- X1(:,1),allmarkers(i),'MarkerIndices',round(length(T1)/2))
    legend("p1 = " + num2str(p1))
    xlabel("Time in sec")
    ylabel("Angle in rad")
end
model =  " p2 = " + num2str(p2)  + " l0 = " + num2str(l0) + " p0 = " + num2str(p0)  ;
figure(5)
sgtitle({"Case 3 Ouput for different p1 choices " + model,"Gmatrix : " + num2str(Gmatrix(1,1))...
    + " " + num2str(Gmatrix(2,2)) + " " + num2str(Gmatrix(3,3))+ " " + num2str(Gmatrix(4,4))} )
figure(6)
sgtitle({"Case 3 Error for different p1 choices " + model,"Gmatrix : " + num2str(Gmatrix(1,1))...
    + " " + num2str(Gmatrix(2,2))+ " " + num2str(Gmatrix(3,3))+ " " + num2str(Gmatrix(4,4))} )
%% case 3 different G matrix
Gmatrices(:,:,1) = eye(4);
Gmatrices(:,:,2) = diag([70,800,50,0.6]*10)
Gmatrices(:,:,3) = eye(4)*10^6;
Gmatrices(:,:,4) = diag([70,800,50,0.6]*10^5);
p1 = 1;
p2 = 5;
p0 = 5;
l0 = 5;
if p0 >= p1 + p2 
    display("Wrong choice of p0")
    return
end
Ts = [0,80]; 
A = 0.0175;
w = 0.5;
x0 = [0,A*w,0,0,0,0,0,0,0,0,0,0,0,0]; 
r = @(t)(A*w*(p1+p2)*cos(w*t)+A*(p1*p2-w^2)*sin(w*t));
labels =["Model"];
figure(7)
figure(8)
for i = 1: size(Gmatrices,3)
    Gmatrix = Gmatrices(:,:,i);
    [T1,X1] = ode45(@(t,x)referenceandsystemmodelunknown(t,x,r,p1,p2,l0,Gmatrix,p0),Ts,x0); 
    figure(7)
    subplot(round(size(Gmatrices,3)/2),2,i)
    plot(T1,X1(:,1),'LineWidth',1.5)
    hold on
    plot(T1,X1(:,13),allmarkers(i),'MarkerIndices',round(length(T1)/2))
    legend("Model", "G = [ " + num2str(Gmatrix(1,1))+" " + num2str(Gmatrix(2,2))+...
        " " + num2str(Gmatrix(3,3))+" " + num2str(Gmatrix(4,4))+ " ]")
    xlabel("Time in sec")
    ylabel("Angle in rad")
    figure(8)
    subplot(round(size(Gmatrices,3)/2),2,i)
    plot(T1,X1(:,13)- X1(:,1),allmarkers(i),'MarkerIndices',round(length(T1)/2))
   legend("G = [ " + num2str(Gmatrix(1,1))+" " + num2str(Gmatrix(2,2))+...
        " " + num2str(Gmatrix(3,3))+" " + num2str(Gmatrix(4,4))+ " ]")
    xlabel("Time in sec")
    ylabel("Angle in rad")
end
model = " Model s^{2} + " + num2str(p1+p2) + "s + " + num2str(p1*p2) + ". p0 = " + num2str(p0) + ". l0 = " + num2str(l0);
figure(7)
sgtitle({"Case 3 Ouput for different Gmatrix choices " , model})
figure(8)
sgtitle({"Case 3 Error for different Gmatrix choices " , model})
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% case 4 different p0
Gmatrix = diag([70,800,50,0.6]*10^5);
p1 = 1;
p2 = 5;
p0s = 1:5;
l0 = 5;
if any(p0s >= p1 + p2) 
    display("Wrong choice of p0")
    return
end
Ts = [0,2]; 
A = 0.0873;
w = 90;
x0 = [0,A*w,0,0,0,0,0,0,0,0,0,0,0,0]; 
r = @(t)(A*w*(p1+p2)*cos(w*t)+A*(p1*p2-w^2)*sin(w*t));
labels =["Model"];
figure(9)
figure(10)
for i = 1: length(p0s)
    p0 = p0s(i);
    labels = [labels, "P0 = " + num2str(p0)];
    [T1,X1] = ode45(@(t,x)referenceandsystemmodelunknown(t,x,r,p1,p2,l0,Gmatrix,p0),Ts,x0); 
    figure(9)
    subplot(round(length(p0s)/2),2,i)
    plot(T1,X1(:,1),'LineWidth',1.5)
    hold on
    plot(T1,X1(:,13),allmarkers(i),'MarkerIndices',round(length(T1)/2))
    legend("Model", "P0 = " + num2str(p0))
    xlabel("Time in sec")
    ylabel("Angle in rad")
    figure(10)
    subplot(round(length(p0s)/2),2,i)
    plot(T1,X1(:,13)- X1(:,1),allmarkers(i),'MarkerIndices',round(length(T1)/2))
    legend("P0 = " + num2str(p0))
    xlabel("Time in sec")
    ylabel("Angle in rad")
end
model = "Model s^{2} + " + num2str(p1+p2) + "s + " + num2str(p1*p2) + ". l0 = " + num2str(l0); 
figure(9)
sgtitle({"Case 4 Ouput for different p0 choices " + model,"Gmatrix : " + num2str(Gmatrix(1,1))...
    + " " + num2str(Gmatrix(2,2)) + " " + num2str(Gmatrix(3,3))+ " " + num2str(Gmatrix(4,4))} )
figure(10)
sgtitle({"Case 4 Error for different p0 choices " + model,"Gmatrix : " + num2str(Gmatrix(1,1))...
    + " " + num2str(Gmatrix(2,2))+ " " + num2str(Gmatrix(3,3))+ " " + num2str(Gmatrix(4,4))} ) 

%% case 4 different l0
Gmatrix = diag([70,800,50,0.6]*10^5);
p1 = 1;
p2 = 5;
p0 = 5;
l0s = [1,5,10,25,100,1000];
if p0 >= p1 + p2 
    display("Wrong choice of p0")
    return
end
Ts = [0,1]; 
A = 0.0873;
w = 90;
x0 = [0,A*w,0,0,0,0,0,0,0,0,0,0,0,0]; 
r = @(t)(A*w*(p1+p2)*cos(w*t)+A*(p1*p2-w^2)*sin(w*t));
labels =["Model"];
figure(11)
figure(12)
for i = 1: length(l0s)
    l0 = l0s(i);
    [T1,X1] = ode45(@(t,x)referenceandsystemmodelunknown(t,x,r,p1,p2,l0,Gmatrix,p0),Ts,x0); 
    figure(11)
    subplot(round(length(l0s)/2),2,i)
    plot(T1,X1(:,1),'LineWidth',1.5)
    hold on
    plot(T1,X1(:,13),allmarkers(i),'MarkerIndices',round(length(T1)/2))
    legend("Model", "l0 = " + num2str(l0))
    xlabel("Time in sec")
    ylabel("Angle in rad")
    figure(12)
    subplot(round(length(l0s)/2),2,i)
    plot(T1,X1(:,13)- X1(:,1),allmarkers(i),'MarkerIndices',round(length(T1)/2))
    legend("l0 = " + num2str(l0))
    xlabel("Time in sec")
    ylabel("Angle in rad")
end
model = " Model s^{2} + " + num2str(p1+p2) + "s + " + num2str(p1*p2) + ". p0 = " + num2str(p0) ;
figure(11)
sgtitle({"Case 4 Ouput for different l0 choices " + model,"Gmatrix : " + num2str(Gmatrix(1,1))...
    + " " + num2str(Gmatrix(2,2)) + " " + num2str(Gmatrix(3,3))+ " " + num2str(Gmatrix(4,4))} )
figure(12)
sgtitle({"Case 4 Error for different l0 choices " + model,"Gmatrix : " + num2str(Gmatrix(1,1))...
    + " " + num2str(Gmatrix(2,2))+ " " + num2str(Gmatrix(3,3))+ " " + num2str(Gmatrix(4,4))} )
 
%% case 4 different p1 model
Gmatrix = diag([70,800,50,0.6]*10^5);
p1s = [0.5,1,10,20];
p2 = 20;
p0 = 5;
l0 = 5;
if any(p0 -p2>= p1s) 
    display("Wrong choice of p0")
    return
end
Ts = [0,2]; 
A = 0.0873;
w = 90;
x0 = [0,A*w,0,0,0,0,0,0,0,0,0,0,0,0]; 
r = @(t)(A*w*(p1+p2)*cos(w*t)+A*(p1*p2-w^2)*sin(w*t));
labels =["Model"];
figure(13)
figure(14)
for i = 1: length(p1s)
    p1 = p1s(i);
    [T1,X1] = ode45(@(t,x)referenceandsystemmodelunknown(t,x,r,p1,p2,l0,Gmatrix,p0),Ts,x0); 
    figure(13)
    subplot(round(length(p1s)/2),2,i)
    plot(T1,X1(:,1),'LineWidth',1.5)
    hold on
    plot(T1,X1(:,13),allmarkers(i),'MarkerIndices',round(length(T1)/2))
    legend("Model", "p1 = " + num2str(p1))
    xlabel("Time in sec")
    ylabel("Angle in rad")
    figure(14)
    subplot(round(length(p1s)/2),2,i)
    plot(T1,X1(:,13)- X1(:,1),allmarkers(i),'MarkerIndices',round(length(T1)/2))
    legend("p1 = " + num2str(p1))
    xlabel("Time in sec")
    ylabel("Angle in rad")
end
model =  " p2 = " + num2str(p2)  + " l0 = " + num2str(l0) + " p0 = " + num2str(p0)  ;
figure(13)
sgtitle({"Case 4 Ouput for different p1 choices " + model,"Gmatrix : " + num2str(Gmatrix(1,1))...
    + " " + num2str(Gmatrix(2,2)) + " " + num2str(Gmatrix(3,3))+ " " + num2str(Gmatrix(4,4))} )
figure(14)
sgtitle({"Case 4 Error for different p1 choices " + model,"Gmatrix : " + num2str(Gmatrix(1,1))...
    + " " + num2str(Gmatrix(2,2))+ " " + num2str(Gmatrix(3,3))+ " " + num2str(Gmatrix(4,4))} )
%% case 4 different G matrix
Gmatrices(:,:,1) = eye(4);
Gmatrices(:,:,2) = diag([70,800,50,0.6]*10)
Gmatrices(:,:,3) = eye(4)*10^6;
Gmatrices(:,:,4) = diag([70,800,50,0.6]*10^5);
p1 = 1;
p2 = 5;
p0 = 5;
l0 = 5;
if p0 >= p1 + p2 
    display("Wrong choice of p0")
    return
end
Ts = [0,2]; 
A = 0.0873;
w = 90;
x0 = [0,A*w,0,0,0,0,0,0,0,0,0,0,0,0]; 
r = @(t)(A*w*(p1+p2)*cos(w*t)+A*(p1*p2-w^2)*sin(w*t));
labels =["Model"];
figure(15)
figure(16)
for i = 1: size(Gmatrices,3)
    Gmatrix = Gmatrices(:,:,i);
    [T1,X1] = ode45(@(t,x)referenceandsystemmodelunknown(t,x,r,p1,p2,l0,Gmatrix,p0),Ts,x0); 
    figure(15)
    subplot(round(size(Gmatrices,3)/2),2,i)
    plot(T1,X1(:,1),'LineWidth',1.5)
    hold on
    plot(T1,X1(:,13),allmarkers(i),'MarkerIndices',round(length(T1)/2))
    legend("Model", "G = [ " + num2str(Gmatrix(1,1))+" " + num2str(Gmatrix(2,2))+...
        " " + num2str(Gmatrix(3,3))+" " + num2str(Gmatrix(4,4))+ " ]")
    xlabel("Time in sec")
    ylabel("Angle in rad")
    figure(16)
    subplot(round(size(Gmatrices,3)/2),2,i)
    plot(T1,X1(:,13)- X1(:,1),allmarkers(i),'MarkerIndices',round(length(T1)/2))
   legend("G = [ " + num2str(Gmatrix(1,1))+" " + num2str(Gmatrix(2,2))+...
        " " + num2str(Gmatrix(3,3))+" " + num2str(Gmatrix(4,4))+ " ]")
    xlabel("Time in sec")
    ylabel("Angle in rad")
end
model = " Model s^{2} + " + num2str(p1+p2) + "s + " + num2str(p1*p2) + ". p0 = " + num2str(p0) + ". l0 = " + num2str(l0);
figure(15)
sgtitle({"Case 4 Ouput for different Gmatrix choices " , model})
figure(16)
sgtitle({"Case 4 Error for different Gmatrix choices " , model})