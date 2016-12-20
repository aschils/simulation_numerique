function [x,y,z] = exercice3( x0,y0,z0,M,sigma,rho,beta,k,t_end)
    
    N = t_end/k+1;
    
    x = zeros(N,M);
    y = zeros(N,M);
    z = zeros(N,M);
    
    x(1,:) = x0;
    y(1,:) = y0;
    z(1,:) = z0;
    
    for i=2:N
        prev_i = i-1;
        x(i,:) = sigma*k*y(prev_i)+x(prev_i)*(1-sigma*k);
        y(i,:) = x(prev_i)*k*(rho-z(prev_i))+y(prev_i)*(1-k);
        z(i,:) = k*x(prev_i)*y(prev_i)+z(prev_i)*(1-beta*k);
    end
end

