function [ B ] = b( A,Imn,expo )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

    function dbdt = ODEFUN (t, b)
        dbdt = zeros(1:N+1,1)
        dbdt = -A*Imn.*expo*b;
    end

tspan = [0, 10]
yo = [1 ; zeros(N,1)]
[t,b] = ode15s(@odefun,tspan,y0)
plot(t, b(0)); hold on;

end

