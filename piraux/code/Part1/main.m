
% Ce code permet d'afficher sur un graphe les plus grandes erreurs
% des méthodes spectrales pour N polynômes de Tchebychev utilisés dans le dévellopement tronqué
% et de celle aux différence finie d'ordre 2
% par rapport à la solution exacte de l'équation différentielle.



% Initialisations %

n=1000; % nombre points d'abscisse
N_final=30; % degré max de la série de polynômes
x=linspace(-1,1,n);
f=zeros(1,n);g=f;h=f;
erreur_tau=zeros(1,N_final+1);
erreur_galerkin=erreur_tau;
erreur_collocation=erreur_tau;
erreur_diff_fin=erreur_tau;

% Solution exacte %

u=1-((sinh(2)*exp(x)+sinh(1)*exp(-2*x))/sinh(3));


% Méthodes spectrales %

    % Coefficients  a_k de Tchebychev %
    
    for N=0:N_final % degré max de la série de polynômes
    a=Tau(N+1);
    b=Galerkin(N+1);
    c=Collocation(N+1);

    % Résidus %
    
        f(:)=0;g(:)=0;h(:)=0;
            for k=1:N+1
            f=f+a(k)*cos((k-1)*acos(x)); % Résidu pour Tau
            g=g+b(k)*cos((k-1)*acos(x)); % Résidu pour Galerkin
            h=h+c(k)*cos((k-1)*acos(x)); % Résidu pour Collocation
            end

    % Recherche plus grande erreur %

        for l=1:n
        % Tau %
        diff_T=abs(u(l)-f(l));
            if (erreur_tau(N+1)<diff_T)
            erreur_tau(N+1)=diff_T;
            end
        % Galerkin %
        diff_G=abs(u(l)-g(l));
            if (erreur_galerkin(N+1)<diff_G)
            erreur_galerkin(N+1)=diff_G;
            end
        % Collocation %
        diff_C=abs(u(l)-h(l));
            if (erreur_collocation(N+1)<diff_C)
            erreur_collocation(N+1)=diff_C;
            end
        end
    end


% Méthode par différences finies %


    for N=1:N_final+1 % points de grille sans compter les 2 points aux frontières
        
        % Initialisation %

        h=2/(1+N); % le pas d'espace entre -1 et 1
        U=zeros(N+2,1);
        U_N=zeros(N,1);
        Dup=ones(N-1,1)*(2+h);
        Ddown=ones(N-1,1)*(2-h);
        H=-4*(h^2+1)*eye(N)+diag(Ddown,-1)+diag(Dup,1);
        z=ones(N,1)*(-4*h^2);
        U_N=H\z; % solution système
        U(2:N+1)=U_N; % solution avec les CB

    % Recherche plus grande erreur %

    for l=1:N+2 % points de grille
        d=-1+h*(l-1); % d va de -1 jusque 1
        sol_exacte=1-((sinh(2)*exp(d)+sinh(1)*exp(-2*d))/sinh(3));
        diff_fin=abs(sol_exacte-U(l));
            if (erreur_diff_fin(N)<diff_fin)
            erreur_diff_fin(N)=diff_fin;
            end
        end
    end

 
    
% Affichage %

grille=1:N_final+1; % points de grille sans compter les 2 points aux frontières
nombre_polynomes=1:N_final+1;
figure()
semilogy(grille,erreur_diff_fin,'marker','.');
hold on
semilogy(nombre_polynomes,erreur_tau,'marker','o')
hold on
semilogy(nombre_polynomes,erreur_galerkin,'marker','+')
hold on
semilogy(nombre_polynomes,erreur_collocation,'marker','*')
xlabel('Nombre polynômes / points de grille')
ylabel('Erreur max')
legend('Différences finies','Méthode Tau','Méthode Galerkin','Méthode Collocation')
hold off;