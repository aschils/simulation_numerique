function [ C ] = CF( N )
%CF remplit la matrice � 2 lignes des conditions aux fronti�res
C=ones(2,N+1);
for l=1:N+1
C(1,l)=(-1)^(l-1);
end
end

