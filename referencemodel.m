function xdot = referencemodel(t,x,u,a,b)
    % a,b the poles of transfer function
    % tf = 1/(s^2 + (a+b)s + ab)
    % u symbolic function of t
    xdot(1) = x(2);
    xdot(2) = -(a+b)*x(2) - a*b*x(1) + u(t);
    xdot = xdot';
end