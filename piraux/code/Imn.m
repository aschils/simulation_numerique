
function [S] = Imn(V,N)

S = zeros(N+1,N+1);

for i=1:N+1
  for j=1:N+1
    S(i,j) = Imn2(V,N,i,j);
  end
end
