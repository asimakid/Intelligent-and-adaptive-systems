function xdot = systemmodel(t,x,u)
    % a,b the poles of transfer function
    % tf = 1/(s^2 + (a+b)s + ab)
    % u symbolic function of t
    xdot(1) = x(2);
    xdot(2) = -20*sin(x(1)) -2*x(2) + 2*u(t);
    xdot = xdot';
end