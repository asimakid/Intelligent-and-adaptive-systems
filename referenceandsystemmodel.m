function xdot = referenceandsystemmodel(t,x,r,a,b,l0,thetas)
    % a,b the poles of transfer function
    % tf = 1/(s^2 + (a+b)s + ab)
    % r symbolic function of t
    xdot(1) = x(2);
    xdot(2) = - a*b*x(1) - (a+b)*x(2) + r(t);
    %x3 -> w1 
    %x4 -> w2  
    u = thetas'*[x(3);x(4);x(5);r(t)]; 
    xdot(3) = -l0*x(3) + u;
    xdot(4) = -l0*x(4) + x(5);
    xdot(5) = x(6);
    xdot(6) = 2*u -20*sin(x(5)) -2*x(6);
    xdot = xdot';
end