function getplots(T,Xm,Xmd,Xs,Xsd,u,ncase,init,p1,p2)
    init = 360*init/(2*pi);
    model = "Model s^{2} + " + num2str(p1+p2) + "s + " + num2str(p1*p2); 
    if ncase == 1
        title1 = {("Case 1 Initial: " + num2str(init) + " deg To: 0 deg"),model};
        title2 = {"Error between system and model 1st case",model};
        title3 = {"Input to system 1st case",model};
        title4 = {("Case 1 angular velocities Initial: " + num2str(init) + " deg To: 0 deg"),model};
    elseif ncase == 2
        title1 = {("Case 2 Initial: " + num2str(init) +" deg To: 0 deg"),model};
        title2 = {"Error between system and model 2nd case",model};
        title3 = {"Input to system 2nd case",model};
        title4 = {("Case 2 angular velocities Initial: " + num2str(init) + " deg To: 0 deg"),model};
    end    
    yes  = 1;
    if yes 
        figure
        plot(T,inmpipi(Xm),'color',[1,0,0])
        hold on 
        plot(T,inmpipi(Xs),'color',[0,0,0])
        hold on
        legend("Model","System")
        xlabel("Time in sec")
        ylabel("Angle in rad")
        title(title1)        
    end
    figure
    subplot(2,1,1)
    plot(T,inmpipi(Xm),'color',[1,0,0])
    hold on 
    plot(T,inmpipi(Xs),'color',[0,0,0])
    hold on
    legend("Model","System")
    xlabel("Time in sec")
    ylabel("Angle in rad")
    title(title1)
    subplot(2,1,2)
    error = Xs-Xm;
    plot(T,error)
    xlabel("Time in sec")
    ylabel("Angle in rad")
    title(title2)
    legend("Error sys-mod")
    figure
    plot(T,u)
    title(title3)
    xlabel("Time in sec")
    ylabel("Torque in Nm")
    getplotsofspeed = 1;
    if getplotsofspeed
        figure
        subplot(2,1,1)
        plot(T,Xmd,'color',[1,0,0])
        hold on 
        plot(T,Xsd,'color',[0,0,0])
        hold on
        legend("Model","System")
        xlabel("Time in sec")
        ylabel("Anglular veloc in rad/s")
        title(title4)
        subplot(2,1,2)
        errorv = Xsd-Xmd;
        plot(T,errorv)
        xlabel("Time in sec")
        ylabel("Anglular veloc in rad/s")
        title(title2)
        legend("Error sys-mod")
    end
end