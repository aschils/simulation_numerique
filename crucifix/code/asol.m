%w(t) = C2 exp(C1 t)
%pre: D != 0
function [ u ] = asol( x,t,a,b,D,C1,C2,C3,C4)
    w = C2*exp(C1*t);
    rho = a^2+4*D*(C1+b);

    if(rho > 0)
        disp('rho > 0');
        r1 = (a+sqrt(rho))/(2*D);
        r2 = (a-sqrt(rho))/(2*D);
        v = C3*exp(r1*x)+C4*exp(r2*x);
    elseif(rho == 0)
        disp('rho = 0');
        r = a/(2*D);
        v = (C3+C4*x)*exp(r*x);
    else
        disp('rho < 0');
        alpha = a/(2*D);
        beta = sqrt(-rho)/(2*D);
        v = (C3*cos(beta*x)+C4*sin(beta*x))*exp(alpha*x);
    end
    u = w*v;
end

