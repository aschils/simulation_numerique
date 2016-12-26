function [ y ] = h_cin(m,k)

  % Calcul de la partie cin�tique de l'Hamiltonien
  
    % calcul de la d�riv�e seconde :
    
    if m == k-2
        y = 0.5*sqrt(k*(k-1));
    elseif m == k
        y = -(k+0.5);
    elseif m == k+2
        y = 0.5*sqrt((k+1)*(k+2));
    else
        y=0;
    end
    
    % H cin�tique :
    
    y = -0.5*y; 
end
