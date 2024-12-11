function getklplots(T,K1,K2,L,ncase,init,p1,p2)
    init = 360*init/(2*pi);
    model = "Model s^{2} + " + num2str(p1+p2) + "s + " + num2str(p1*p2);
    if ncase == 1
         title1 = {("Case 1 Initial: " + num2str(init) + " K1 in time"),model};
         title2 = {("Case 1 Initial: " + num2str(init) + " K2 in time")};
         title3 = {("Case 1 Initial: " + num2str(init) + " L in time"),model};
    elseif ncase ==2
         title1 = {("Case 2 Initial: " + num2str(init) + " K1 in time"),model};
         title2 = {("Case 2 Initial: " + num2str(init) + " K2 in time")};
         title3 = {("Case 2 Initial: " + num2str(init) + " L in time"),model};
    elseif ncase == 3 
        title1 = {("Case 3 K1 in time"),model};
        title2 = {("Case 3 K2 in time")};
        title3 = {("Case 3 L in time"),model};
    elseif ncase == 4
        title1 = {("Case 4 K1 in time"),model};
        title2 = {("Case 4 K2 in time")};
        title3 = {("Case 4 L in time"),model};
    end
    Am = [0 1;-p1*p2 -p1-p2];
    Bm = [0; 1];
    A = [0 1;-20 -2];
    B = [0; 2];
    Kstar = B'*(A-Am)/(norm(B))^2; 
    Lstar = B'*Bm/(norm(B))^2;   
    figure
    subplot(1,2,1)
    plot(T,K1)
    hold on 
    plot(T,Kstar(1)*ones(size(T)))  
    legend("K1","K1*")
    title(title1) 
    hold off
    subplot(1,2,2)
    plot(T,K2)
    hold on
    plot(T,Kstar(2)*ones(size(T)))    
    legend("K2","K2*")
    title(title2)
    hold off
    figure
    plot(T,L)
    hold on
    plot(T,Lstar*ones(size(T))) 
    hold off
    legend("L","L*")
    title(title3)   
end