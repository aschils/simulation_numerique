function [ Imn ] = Imn2(Vsort,N,m,n)

% Calcul terme (m,n) de la matrice I_mn

Imn = 0;

for k=0:N-1
  Imn = Imn + sqrt((k+1)/2)*conj(Vsort(k+1,m))*Vsort(k+2,n);
end

for k=1:N
  Imn = Imn - sqrt(k/2)*conj(Vsort(k+1,m))*Vsort(k,n);
end

end

