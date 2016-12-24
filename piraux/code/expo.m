function [S] = expo(D,N,t)

S = zeros(N+1,N+1);

for i=1:N+1
  for j=1:N+1
    S(i,j) = exp2(D,N,i,j,t);
  end
end

