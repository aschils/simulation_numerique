function [ y ] = h_pot(N,m,k,V0,alpha)
    
    [ u,w ] = hermquad(N+1);
    
    x = u/(sqrt(1+alpha));
 
     % implémentation vectorisée de la somme :
    y = sum ((-V0*prod_coef(m,k)/(sqrt(1+alpha)))*w.*hermiteH(m,x).*hermiteH(k,x));
         
     % boucle (beaucoup plus lent) :
        % s = 0;
         % for j = 1:N+1
          % s = s -((w(j)*prod_coef(m,k)*V0*hermiteH(m,x(j))*hermiteH(k,x(j)))/sqrt(1+alpha));
          % end
        % y = s;
    
  end
