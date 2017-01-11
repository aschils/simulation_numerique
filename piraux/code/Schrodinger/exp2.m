function [ X ] = exp2(E,m,n,t)

%Calcul terme (m,n) de la matrice exp(-i(E_n - E_m)t)

X =exp(-1i*(E(n)-E(m))*t);


end