function xdot = referenceandsystemmodelmatrix(t,x,r,a,b,Qmatrix)
    % a,b the poles of transfer function
    % tf = 1/(s^2 + (a+b)s + ab)
    % u symbolic function of t
    Am = [0 1; -a*b -(a+b)]; 
    Bm = [0; 1];
    xdot(1:2) = Am*x(1:2) +Bm*r(t);
    P = lyap(Am',Am,Qmatrix);
    %x3 -> system
    %x4 -> system
    % error x -xm size 2 x 1 
    e = x(3:4) - x(1:2);
    u = -x(5:6)'*x(3:4) + x(7)*r(t);
    xdot(3) = x(4);
    xdot(4) = -20*sin(x(3)) -2*x(4) + 2*u;
    %x5 K1 estimation
    %x6 K2 estimation
    %x7 L estimation
    Kdot = Bm'*P*e*x(3:4)';
    Ldot = -Bm'*P*e*r(t);
    xdot(5:6) = Kdot;
    xdot(7) = Ldot;
    xdot = xdot';
end