function [ y ] = h_pot(N,m,k,V0,alpha)
    
    % Calcul de la partie potentiel de l'Hamiltonien

    [ u,w ] = hermquad(N+1);
    
    x = u/(sqrt(1+alpha));
 
    % impl�mentation vectoris�e de la somme :
     
    y = sum ((-V0*prod_coef(m,k)/(sqrt(1+alpha)))*w.*hermiteH(m,x).*hermiteH(k,x));
         
  end
