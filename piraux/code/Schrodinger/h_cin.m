function [ y ] = h_cin(m,k)

  % Calcul de la partie cinétique de l'Hamiltonien
  
    % calcul de la dérivée seconde :
    
    if m == k-2
        y = 0.5*sqrt(k*(k-1));
    elseif m == k
        y = -(k+0.5);
    elseif m == k+2
        y = 0.5*sqrt((k+1)*(k+2));
    else
        y=0;
    end
    
    % H cinétique :
    
    y = -0.5*y; 
end
