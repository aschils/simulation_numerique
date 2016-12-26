function [S] = Imn(N,Vsort)

% calcul la matrice I_mn

S = zeros(N+1,N+1);

for i=1:N+1
  for j=1:N+1
    S(i,j) = Imn2(Vsort,N,i,j);
  end
end
