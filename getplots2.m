function getplots2(T,Xm,Xmd,Xs,Xsd,u,ncase,A,w,p1,p2)
    out = num2str(A)+ "sin(" + num2str(w) + "t)";
    model = "Model s^{2} + " + num2str(p1+p2) +"s + " + num2str(p1*p2); 
    if ncase == 3
        title1 = {"Case 3 Initial: 0 deg To: " + out, model};
        title2 = "Error between system and model 3rd case";
        title3 = {'Case 3 Initial: 0 deg To: ' + out,'Model and expected ' + model};
        title4 = "System ouput";
        title5 = "Input to system 3rd case";
        title6 = {"Case 3 angular veloc Initial: 0 deg To: " + out, model};
    elseif ncase == 4
        title1 = {"Case 4 Initial: 0 deg To: " + out, model};
        title2 = "Error between system and model 4rd case";
        title3 = {'Case 4 Initial: 0 deg To: ' + out,' Model and expected' + model};
        title4 = "System ouput";
        title5 = "Input to system 4th case";
        title6 = {"Case 4 angular veloc Initial: 0 deg To: " + out, model};
    end    
    yes = 1;
    if yes 
        figure
        plot(T,inmpipi(Xm),'color',[1,0,0])
        hold on 
        plot(T,inmpipi(Xs),'color',[0,0,0])
        hold on
        legend("Model","System")
        title(title1)
    end
    figure
    subplot(2,1,1)
    plot(T,inmpipi(Xm),'color',[1,0,0])
    hold on 
    plot(T,inmpipi(Xs),'color',[0,0,0])
    legend("Model","System")
    title(title1)
    subplot(2,1,2)
    plot(T,Xs-Xm)
    title(title2)
    legend("Error sys-mod")
    figure
    subplot(2,1,1)
    plot(T,inmpipi(Xm),'color',[0,0,0])
    hold on
    fsin = @(t)(A*sin(w*t));
    plot(T,fsin(T))
    legend("Model","Expected Output")
    title(title3)
    subplot(2,1,2)
    plot(T,inmpipi(Xs),'color',[1,0,0])
    title(title4)
    legend("System")
    figure
    plot(T,u)
    title(title5)
    xlabel("Time in sec")
    ylabel("Torque in Nm")
    getplotsofspeed=1;
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
        title(title6)
        subplot(2,1,2)
        errorv = Xsd-Xmd;
        plot(T,errorv)
        xlabel("Time in sec")
        ylabel("Anglular veloc in rad/s")
        title(title2)
        legend("Error sys-mod")
    end
end