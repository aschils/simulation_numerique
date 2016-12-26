function [ b ] = Galerkin( N )
%Galerkin renvoie le vecteur des coefficients ak par la méthode Galerkin
G=zeros(N-1,N+1);
for i=1:N-1 % parcourir les lignes
    for j=1:N+1 % parcourir les colonnes
        if(j==1 && mod(i-1,2)==0) % si j=0 et i pair
        G(i,j)=-2;
        end
        if(j==2 && mod(i-1,2)==1) % si j=1 et i impair
        G(i,j)=-1;
        end
        if(j-i==2) % si j-i=2
        G(i,j)=1;
        end
    end
end
D=matrice_derivee2(N)+matrice_derivee(N)-2*eye(N+1);
F=G*D;
Z=zeros(N+1,1); Z(1)=2;
R=-G*Z;
C=CF(N);
H=[F;C];
Y=[R;0;0];
b=H\Y;
end

