N = 25;  % si on monte � 50, on a exactement la m�me valeur � 6 d�cimals donn�e au cours pour E1
V0 = 3;
alpha = 1;

H = zeros(N+1,N+1);

for i = 1:N+1
    m = i-1;
    for j = 1:N+1
        k = j-1;
        H(i,j) = h_cin(m,k)+h_pot(N,m,k,V0,alpha);
    end
end

[V,D] = eig(H);
% D : valeurs propres dans diagonale
% V : vecteurs propres
E = sort(diag(D));
format long
E0 = E(1)
E1 = E(2)
