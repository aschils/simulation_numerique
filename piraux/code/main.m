N = 7;
V0 = 3;
alpha = 1;

H = zeros(N,N);

for i = 1:N
    k = i-1;
    for j = 1:N
        m = j-1;
        H(i,j) = h_cin(m,k)+h_pot(N,i,j,V0,alpha);
    end
end


[V,D] = eig(H)
D %Attention resultat faux il faut debuger, on doit avoir seulement
%2 etats lies, i.e. deux valeurs negatives


