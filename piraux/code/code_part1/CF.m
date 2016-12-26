function [ C ] = CF( N )
%CF remplit la matrice à 2 lignes des conditions aux frontières
C=ones(2,N+1);
for l=1:N+1
C(1,l)=(-1)^(l-1);
end
end

