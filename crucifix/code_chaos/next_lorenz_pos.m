function [ x,y,z ] = next_lorenz_pos(sigma,k,rho,beta,xp,yp,zp )
     x = sigma*k*yp+xp*(1-sigma*k);
     y = xp*k*(rho-zp)+yp*(1-k);
     z = k*xp*yp+zp*(1-beta*k);
end

