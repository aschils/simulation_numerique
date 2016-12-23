function [ Imn ] = Imn2(V,N,m,n)

%dim de V est (N+1, N+1)

%calcul du premier terme

Imn = 0;

for k=0:N-1
  Imn = Imn + sqrt((k+1)/2)*conj(V(k+1,m))*V(k+2,n);
end

for k=1:N
  Imn = Imn - conj(V(k+1,m))*V(k,n)*0.5*sqrt(2*k);
end

end
