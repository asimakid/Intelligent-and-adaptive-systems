function getthetaplots(T,u1,u2,u3,u4,ncase,init,p1,p2,thetas)
    init = 360*init/(2*pi);
    model = "Model s^{2} + " + num2str(p1+p2) + "s + " + num2str(p1*p2);
    if ncase == 1
         title1 = {("Case 1 Initial: " + num2str(init) + " Θ1 in time"),model};
         title2 = {("Case 1 Initial: " + num2str(init) + " Θ2 in time")};
         title3 = {("Case 1 Initial: " + num2str(init) + " Θ3 in time"),model};
         title4 = {("Case 1 Initial: " + num2str(init) + " Θ4 in time"),model};
    elseif ncase ==2
         title1 = {("Case 2 Initial: " + num2str(init) + " Θ1 in time"),model};
         title2 = {("Case 2 Initial: " + num2str(init) + " Θ2 in time")};
         title3 = {("Case 2 Initial: " + num2str(init) + " Θ3 in time"),model};
         title4 = {("Case 2 Initial: " + num2str(init) + " Θ4 in time")};
    elseif ncase == 3 
        title1 = {("Case 3 Θ1 in time"),model};
        title2 = {("Case 3 Θ2 in time")};
        title3 = {("Case 3 Θ3 in time"),model};
        title4 = {("Case 3 Θ4 in time")};
    elseif ncase == 4
        title1 = {("Case 4 Θ1 in time"),model};
        title2 = {("Case 4 Θ2 in time")};
        title3 = {("Case 4 Θ3 in time"),model};
        title4 = {("Case 4 Θ4 in time")};
    end
    figure
    subplot(1,2,1)
    plot(T,u1)
    hold on 
    plot(T,thetas(1)*ones(size(T)))  
    legend("Θ1","Θ1*")
    title(title1) 
    hold off
    subplot(1,2,2)
    plot(T,u2)
    hold on
    plot(T,thetas(2)*ones(size(T)))    
    legend("Θ2","Θ2*")
    title(title2)
    hold off
    figure
    subplot(1,2,1)
    plot(T,u3)
    hold on 
    plot(T,thetas(3)*ones(size(T)))  
    legend("Θ3","Θ3*")
    title(title3) 
    hold off
    subplot(1,2,2)
    plot(T,u4)
    hold on
    plot(T,thetas(4)*ones(size(T)))    
    legend("Θ4","Θ4*")
    title(title4)
    hold off
end