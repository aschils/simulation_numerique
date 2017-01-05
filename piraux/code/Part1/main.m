
% Ce code permet d'afficher sur un graphe les plus grandes erreurs
% des m�thodes spectrales pour N polyn�mes de Tchebychev utilis�s dans le d�vellopement tronqu�
% et de celle aux diff�rence finie d'ordre 2
% par rapport � la solution exacte de l'�quation diff�rentielle.



% Initialisations %

n=1000; % nombre points d'abscisse
N_final=30; % degr� max de la s�rie de polyn�mes
x=linspace(-1,1,n);
f=zeros(1,n);g=f;h=f;
erreur_tau=zeros(1,N_final+1);
erreur_galerkin=erreur_tau;
erreur_collocation=erreur_tau;
erreur_diff_fin=erreur_tau;

% Solution exacte %

u=1-((sinh(2)*exp(x)+sinh(1)*exp(-2*x))/sinh(3));


% M�thodes spectrales %

    % Coefficients  a_k de Tchebychev %
    
    for N=0:N_final % degr� max de la s�rie de polyn�mes
    a=Tau(N+1);
    b=Galerkin(N+1);
    c=Collocation(N+1);

    % R�sidus %
    
        f(:)=0;g(:)=0;h(:)=0;
            for k=1:N+1
            f=f+a(k)*cos((k-1)*acos(x)); % R�sidu pour Tau
            g=g+b(k)*cos((k-1)*acos(x)); % R�sidu pour Galerkin
            h=h+c(k)*cos((k-1)*acos(x)); % R�sidu pour Collocation
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


% M�thode par diff�rences finies %


    for N=1:N_final+1 % points de grille sans compter les 2 points aux fronti�res
        
        % Initialisation %

        h=2/(1+N); % le pas d'espace entre -1 et 1
        U=zeros(N+2,1);
        U_N=zeros(N,1);
        Dup=ones(N-1,1)*(2+h);
        Ddown=ones(N-1,1)*(2-h);
        H=-4*(h^2+1)*eye(N)+diag(Ddown,-1)+diag(Dup,1);
        z=ones(N,1)*(-4*h^2);
        U_N=H\z; % solution syst�me
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

grille=1:N_final+1; % points de grille sans compter les 2 points aux fronti�res
nombre_polynomes=1:N_final+1;
figure()
semilogy(grille,erreur_diff_fin,'marker','.');
hold on
semilogy(nombre_polynomes,erreur_tau,'marker','o')
hold on
semilogy(nombre_polynomes,erreur_galerkin,'marker','+')
hold on
semilogy(nombre_polynomes,erreur_collocation,'marker','*')
xlabel('Nombre polyn�mes / points de grille')
ylabel('Erreur max')
legend('Diff�rences finies','M�thode Tau','M�thode Galerkin','M�thode Collocation')
hold off;