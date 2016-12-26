function [ c ] = Collocation( N )
%Collocation renvoie la matrice des coefficients ak par la méthode Collocation
P=zeros(N-1,N+1);
for i=1:N-1 % parcourir les lignes
    for j=1:N+1 % parcourir les colonnes
        P(i,j)=cos((i*(j-1)*pi)/N);
    end
end
D=matrice_derivee2(N)+matrice_derivee(N)-2*eye(N+1);
F=P*D;
Z=zeros(N+1,1); Z(1)=2;
R=-P*Z;
C=CF(N);
H=[C(1,:);F;C(2,:)];
Y=[0;R;0];
c=H\Y;
end
