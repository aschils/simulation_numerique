%pre: b/D >0
function [ u ] = asol2( x, t, a, b, D, C1, C2, C3, C4)
    exp_arg = sqrt(b/D)*(x-a*t);
    u = C3*exp(exp_arg)+C4*exp(-exp_arg);
    u = u*C2*exp(C1*t);
end

