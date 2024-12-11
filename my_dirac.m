function y = my_dirac(t)
    if t <= 10^-4
        y = 10^4;
    else
        y = 0;
    end
end