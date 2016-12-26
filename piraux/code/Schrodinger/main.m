% Initialisation des paramètres :

N = 20;  % si on monte à 50, on obtient la 6ème décimale donnée au cours pour E1
V0 = 3;
alpha = 1;
A0 = 1;
omega = 1;
K = 1;
t0 = 0;
H = zeros(N+1,N+1);


% Schrödinger stationnaire

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
    [E,Index] = sort(diag(D));
    Vsort = V(:,Index);
    format long
    E0 = E(1);
    E1 = E(2);


%Schrödinger dépendant du temps

    b(A0,t0,omega,K,N,Vsort,E);

