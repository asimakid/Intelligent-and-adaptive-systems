function res = inmpipi(x)
    res = (x > -pi).*(x <=pi+0.01).*x + (x > pi+0.01).*mod(x,pi) + (x < -pi).*mod(abs(x),pi);
end