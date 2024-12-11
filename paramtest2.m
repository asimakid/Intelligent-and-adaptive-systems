clc
close all 
clear all
% for case 1 2 r=0 p1=3 p2=4
allmarkers = ["-o","-+","-+","-x","-square","-diamond","-^","-v","->","-<","-hexagram"]
%% case 1  Q matrix
p1 = 1;
p2 = 5;
r = @(t)(0*t);
Ts = [0,10];
Qs = [1,100,500,1000,100000]
labels = ["Model"];
figure(1)
figure(2)
for i = 1:length(Qs)
    Qmatrix =  Qs(i)*eye(2);
    labels = [labels, "Q = " + num2str(Qs(i)) + " I"];
    init1 = 0.1745;
    x0 = [init1,0,init1,0,0,0,0];
    [T1,X1] = ode45(@(t,x)referenceandsystemmodelmatrix(t,x,r,p1,p2,Qmatrix),Ts,x0);
    %u1 = [X1(:,3) X1(:,4) X1(:,5) r(T1)]*thetas;
    %getplots(T1,X1(:,1),X1(:,2),X1(:,5),X1(:,6),u1,1,0.1745,p1,p2);
    figure(1)
    if i == 1
        plot(T1,X1(:,1),'LineWidth',1.5)
        hold on
    end
    plot(T1,X1(:,3),allmarkers(i),'MarkerIndices',round(length(T1)/2))
    hold on
    figure(2)
    plot(T1,X1(:,3)- X1(:,1),allmarkers(i),'MarkerIndices',round(length(T1)/2))
    hold on
end
model = "Model s^{2} + " + num2str(p1+p2) + "s + " + num2str(p1*p2); 
figure(1)    
hold off
xlabel("Time in sec")
ylabel("Angle in rad")
title({"Case 1:Output for different Q choices",model})
size(labels)
legend(labels)
figure(2) 
xlabel("Time in sec")
ylabel("Angle in rad")
title({"Case 1:Error for different Q choices",model})
legend(labels(2:end))
hold off
%% case 2 Q matrix
p1 = 1;
p2 = 5;
r = @(t)(0*t);
Ts = [0,10];
Qs = [1,10,100,1000,10^5]
labels = ["Model"];
figure(3)
figure(4)
for i = 1:length(Qs)
    Qmatrix =  Qs(i)*eye(2);
    labels = [labels, "Q = " + num2str(Qs(i)) + " I"];
    init1 = 0.8727;
    x0 = [init1,0,init1,0,0,0,0];
    [T1,X1] = ode45(@(t,x)referenceandsystemmodelmatrix(t,x,r,p1,p2,Qmatrix),Ts,x0);
    %u1 = [X1(:,3) X1(:,4) X1(:,5) r(T1)]*thetas;
    %getplots(T1,X1(:,1),X1(:,2),X1(:,5),X1(:,6),u1,1,0.1745,p1,p2);
    figure(3)
    if i == 1
        plot(T1,X1(:,1),'LineWidth',1.5)
        hold on
    end
    plot(T1,X1(:,3),allmarkers(i),'MarkerIndices',round(length(T1)/2))
    hold on
    figure(4)
    plot(T1,X1(:,3)- X1(:,1),allmarkers(i),'MarkerIndices',round(length(T1)/2))
    hold on
end
model = "Model s^{2} + " + num2str(p1+p2) + "s + " + num2str(p1*p2); 
figure(3)    
hold off
xlabel("Time in sec")
ylabel("Angle in rad")
title({"Case 2:Output for different Q choices",model})
size(labels)
legend(labels)
figure(4) 
xlabel("Time in sec")
ylabel("Angle in rad")
title({"Case 2:Error for different Q choices",model})
legend(labels(2:end))
hold off
%% case 1  poles
p1s = [0.4,2,10];
p2 = 10;
r = @(t)(0*t);
Ts = [0,10];
Qmatrix = 10^4*eye(2);
labels = [];
figure(5)
figure(6)
for i = 1:length(p1s)
    p1=  p1s(i);
    labels = [labels, " Model p1 = " + num2str(p1)," System p1 = " + num2str(p1)];
    init1 = 0.1745;
    x0 = [init1,0,init1,0,0,0,0];
    [T1,X1] = ode45(@(t,x)referenceandsystemmodelmatrix(t,x,r,p1,p2,Qmatrix),Ts,x0);
    %u1 = [X1(:,3) X1(:,4) X1(:,5) r(T1)]*thetas;
    %getplots(T1,X1(:,1),X1(:,2),X1(:,5),X1(:,6),u1,1,0.1745,p1,p2);
    figure(5) 
    plot(T1,X1(:,1),'LineWidth',1.5)
    hold on
    plot(T1,X1(:,3),allmarkers(i),'MarkerIndices',round(length(T1)/3))
    hold on
    figure(6)
    plot(T1,X1(:,3)- X1(:,1),allmarkers(i),'MarkerIndices',round(length(T1)/3))
    hold on
end
model = "Different models Q = "+ num2str(Qmatrix(1,1)) +" I p2= " +num2str(p2);
figure(5)    
hold off
xlabel("Time in sec")
ylabel("Angle in rad")
title({"Case 1:Output for different p1 choices",model})
legend(labels)
figure(6) 
xlabel("Time in sec")
ylabel("Angle in rad")
title({"Case 1:Error for different p1 choices",model})
legend(labels(1:2:end))
hold off
%% case 2  poles
p1s = [0.4,2,10];
p2 = 10;
r = @(t)(0*t);
Ts = [0,10];
Qmatrix = 10^4*eye(2);
labels = [];
figure(7)
figure(8)
for i = 1:length(p1s)
    p1=  p1s(i);
    labels = [labels, " Model p1 = " + num2str(p1)," System p1 = " + num2str(p1)];
    init1 = 0.8727;
    x0 = [init1,0,init1,0,0,0,0];
    [T2,X2] = ode45(@(t,x)referenceandsystemmodelmatrix(t,x,r,p1,p2,Qmatrix),Ts,x0);
    %u1 = [X1(:,3) X1(:,4) X1(:,5) r(T1)]*thetas;
    %getplots(T1,X1(:,1),X1(:,2),X1(:,5),X1(:,6),u1,1,0.1745,p1,p2);
    figure(7)   
    plot(T2,X2(:,1),'LineWidth',1.5)
    hold on   
    plot(T2,X2(:,3),allmarkers(i),'MarkerIndices',round(length(T2)/2))
    hold on
    figure(8)
    plot(T2,X2(:,3)- X2(:,1),allmarkers(i),'MarkerIndices',round(length(T2)/2))
    hold on
end
model = "Different models Q = "+ num2str(Qmatrix(1,1)) +" I p2= " +num2str(p2);figure(7)    
hold off
xlabel("Time in sec")
ylabel("Angle in rad")
title({"Case 2:Output for different p1 choices",model})
legend(labels)
figure(8) 
xlabel("Time in sec")
ylabel("Angle in rad")
title({"Case 2:Error for different p1 choices",model})
legend(labels(1:2:end))
hold off
%% case 3  Q sin
p1 = 2;
p2 = 3;
Qs = [1,1000,10^5,10^6];
labels = ["Model"];
figure(9)
figure(10)
for i = 1:length(Qs)
    Qmatrix =  Qs(i)*eye(2);
    labels = [labels, "Q = " + num2str(Qs(i)) + " I"];
   %for sinusodial output of model 
    A = 0.0175;
    w = 0.5;
    r = @(t)(A*w*(p1+p2)*cos(w*t)+A*(p1*p2-w^2)*sin(w*t));
    Ts = [0,40];
    x0 = [0,A*w,0,0,0,0,0];
    [T1,X1] = ode45(@(t,x)referenceandsystemmodelmatrix(t,x,r,p1,p2,Qmatrix),Ts,x0);;
    figure(9)
    if i == 1
        plot(T1,X1(:,1),'LineWidth',1.5)
        hold on
    end
    plot(T1,X1(:,3),allmarkers(i),'MarkerIndices',round(length(T1)/2))
    hold on
    figure(10)
    plot(T1,X1(:,3)- X1(:,1),allmarkers(i),'MarkerIndices',round(length(T1)/2))
    hold on
end
model = "Model s^{2} + " + num2str(p1+p2) + "s + " + num2str(p1*p2); 
figure(9)    
hold off
xlabel("Time in sec")
ylabel("Angle in rad")
title({"Case 3:Output for different Q choices",model})
legend(labels)
figure(10) 
xlabel("Time in sec")
ylabel("Angle in rad")
title({"Case 3:Error for different Q choices",model})
legend(labels(2:end))
hold off
%% case 4  Q sin
p1 = 2;
p2 = 3;
Qs = [1,1000,10^5,10^6];
labels = ["Model"];
figure(11)
figure(12)
for i = 1:length(Qs)
    Qmatrix =  Qs(i)*eye(2);
    labels = [labels, "Q = " + num2str(Qs(i)) + " I"];
   %for sinusodial output of model 
    A = 0.0873;
    w = 90;
    r = @(t)(A*w*(p1+p2)*cos(w*t)+A*(p1*p2-w^2)*sin(w*t));
    Ts = [0,1];
    x0 = [0,A*w,0,0,0,0,0];
    [T1,X1] = ode45(@(t,x)referenceandsystemmodelmatrix(t,x,r,p1,p2,Qmatrix),Ts,x0);;
    figure(11)
    if i == 1
        plot(T1,X1(:,1),'LineWidth',1.5)
        hold on
    end
    plot(T1,X1(:,3),allmarkers(i),'MarkerIndices',round(length(T1)/2))
    hold on
    figure(12)
    plot(T1,X1(:,3)- X1(:,1),allmarkers(i),'MarkerIndices',round(length(T1)/2))
    hold on
end
model = "Model s^{2} + " + num2str(p1+p2) + "s + " + num2str(p1*p2); 
figure(11)    
hold off
xlabel("Time in sec")
ylabel("Angle in rad")
title({"Case 4:Output for different Q choices",model})
legend(labels)
figure(12) 
xlabel("Time in sec")
ylabel("Angle in rad")
title({"Case 4:Error for different Q choices",model})
legend(labels(2:end))
hold off
%% case 3  poles sin
p1s = [1,10,100,500];
p2 = 10;
Qmatrix = 10^5*eye(2);
labels = [];
figure(13)
figure(14)
for i = 1:length(p1s)
    p1 = p1s(i);
    labels = [labels, " Model p1 = " + num2str(p1)," System p1 = " + num2str(p1)];
   %for sinusodial output of model 
    A = 0.0175;
    w = 0.5;
    r = @(t)(A*w*(p1+p2)*cos(w*t)+A*(p1*p2-w^2)*sin(w*t));
    Ts = [0,40];
    x0 = [0,A*w,0,0,0,0,0];
    [T1,X1] = ode45(@(t,x)referenceandsystemmodelmatrix(t,x,r,p1,p2,Qmatrix),Ts,x0);;
    figure(13)
    plot(T1,X1(:,1),'LineWidth',1.5)
    hold on 
    plot(T1,X1(:,3),allmarkers(i),'MarkerIndices',round(length(T1)/2))
    hold on
    figure(14)
    plot(T1,X1(:,3)- X1(:,1),allmarkers(i),'MarkerIndices',round(length(T1)/2))
    hold on
end
model = "Different models Qmatrix = " +num2str(Qmatrix(1,1)) +" p2= " +num2str(p2); 
figure(13)    
hold off
xlabel("Time in sec")
ylabel("Angle in rad")
title({"Case 3:Output for different p1 choices",model})
legend(labels)
figure(14) 
xlabel("Time in sec")
ylabel("Angle in rad")
title({"Case 3:Error for different p1 choices",model})
legend(labels(1:2:end))
hold off
%% case 4  poles sin
p1s = [1,10,100,500];
p2 = 10;
Qmatrix = 10^5*eye(2);
labels = [];
figure(15)
figure(16)
for i = 1:length(p1s)
    p1 =  p1s(i);
   labels = [labels, " Model p1 = " + num2str(p1)," System p1 = " + num2str(p1)];
   %for sinusodial output of model 
    A = 0.0873;
    w = 90;
    r = @(t)(A*w*(p1+p2)*cos(w*t)+A*(p1*p2-w^2)*sin(w*t));
    Ts = [0,1];
    x0 = [0,A*w,0,0,0,0,0];
    [T1,X1] = ode45(@(t,x)referenceandsystemmodelmatrix(t,x,r,p1,p2,Qmatrix),Ts,x0);;
    figure(15)
    plot(T1,X1(:,1),'LineWidth',1.5)
    hold on
    plot(T1,X1(:,3),allmarkers(i),'MarkerIndices',round(length(T1)/2))
    hold on
    figure(16)
    plot(T1,X1(:,3)- X1(:,1),allmarkers(i),'MarkerIndices',round(length(T1)/2))
    hold on
end
model = "Different models Qmatrix = " +num2str(Qmatrix(1,1)) +" p2= " +num2str(p2); 
figure(15)    
hold off
xlabel("Time in sec")
ylabel("Angle in rad")
title({"Case 4:Output for different p1 choices",model})
legend(labels)
figure(16) 
xlabel("Time in sec")
ylabel("Angle in rad")
title({"Case 4:Error for different p1 choices",model})
legend(labels(1:2:end))
hold off