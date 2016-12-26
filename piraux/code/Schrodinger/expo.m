function [S] = expo(E,N,t)

%Calcul la matrice exp(-i(E_m - E_n)t)

S = zeros(N+1,N+1);

for i=1:N+1
  for j=1:N+1
    S(i,j) = exp2(E,i,j,t);
  end
end

