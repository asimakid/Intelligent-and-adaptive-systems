function xdot = referenceandsystemmodelunknown(t,x,r,a,b,l0,Gmatrix,p0)
    % a,b the poles of transfer function
    % tf = 1/(s^2 + (a+b)s + ab)
    % u symbolic function of t
    %here
    %x1,x2 -> model
    %x3,x4 -> w1,w2
    %x5,x6,x7,x8 -> φ
    %x9 x10 x11 x12 -> Θ
    %x13 x14 -> system
    xdot(1) = x(2);                             %xmdot1 = xm2 
    xdot(2) = -a*b*x(1) -(a+b)*x(2)  + r(t);    %xmdot2 = -a*b*xm1 -(a+b)xm2 + r
    xdot(5) = -p0*x(5) + x(3);                  %φ1dot = -ρ0*φ1 + ω1
    xdot(6) = -p0*x(6) + x(4);                  %φ2dot = -ρ0*φ2 + ω2
    xdot(7) = -p0*x(7) + x(13);                 %φ3dot = -ρ0*φ3 + y
    xdot(8) = -p0*x(8) + r(t);                  %φ4dot = -ρ0*φ4 + r
    thetadot = -Gmatrix*(x(13)-x(1))*x(5:8);     %thetadot = - Γ*ε*Φ    
    xdot(9:12) = thetadot;
    u = x(9:12)'*[x(3);x(4);x(13);r(t)] + thetadot'*x(5:8);
    xdot(3) = -l0*x(3) + u;                     %ω1dot = -l0* ω1 + u
    xdot(4) = -l0*x(4) + x(13);                 %ω1dot = -l0* ω1 + y
    xdot(13) = x(14);                           %xdot1 = x2
    xdot(14) = -20*sin(x(13)) -2*x(14) + 2*u;   %xdot2 = -20sin(x1) -2*x2 + 2
    xdot = xdot';
end