function [ cc ] = prod_coef(x,y)
    
    % Calcul du produit des coefficients des fonctions d'Hermites

cc = 1/(sqrt((2^x)*factorial(x)*(2^y)*factorial(y)*pi));
    % pour ne pas que Matlab calcul deux racines de pi --> erreurs
    % d'arrondis.
end
