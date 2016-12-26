function [ E ] = exp2(E,m,n,t)

%Calcul terme (m,n) de la matrice exp(-i(E_m - E_n)t)

E =exp(-1i*(E(m)-E(n))*t);


end