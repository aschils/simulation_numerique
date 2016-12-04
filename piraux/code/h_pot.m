function [ y ] = h_pot(N,m,k,V0,alpha)
    
    [ u,w ] = GaussHermite2(N);
    
    x = u/sqrt(1+alpha);
    
    r = 0;
    
    for j=1:N
        r = r-(w(j)*coef(m)*coef(k)*V0*hermite(m,x(j))*hermite(k,x(j))*exp(-u(j)*u(j)))/sqrt(1+alpha);
    end
    
    y = r;
       
end

