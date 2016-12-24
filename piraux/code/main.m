N = 10;  % si on monte à 50, on obtient la 6ème décimale donnée au cours pour E1
V0 = 3;
alpha = 1;
A0 = 1;
omega = 1;
K = 1;
t0 = 0;
H = zeros(N+1,N+1);

%Schrödinger stationnaire

for i = 1:N+1
    m = i-1;
    for j = 1:N+1
        k = j-1;
        H(i,j) = h_cin(m,k)+h_pot(N,m,k,V0,alpha);
    end
end

[V,D] = eig(H);
% D : valeurs propres dans diagonale
% V : vecteurs propres (V est la matrice des phi)
[E, Indexes] = sort(diag(D));
format long
E0 = E(1);
E1 = E(2);

%Schrödinger dépendant du temps

h_dip(A0, omega, K , t0)

%Trie les vecteurs prores dans V dans le meme ordre que les vaps triees
%dans E, resultat dans V_ordered
Indexes = Indexes';
new_col_pos = zeros(1,length(Indexes));
for i=1:length(Indexes)
    new_col_pos(Indexes(i)) = i;
end
V_ordered(:,new_col_pos) = V 

Imn(V,N);
expo(D,N);

b( A,Imn,expo )

