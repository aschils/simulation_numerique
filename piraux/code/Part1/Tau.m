function [ a ] = Tau( N )
%Tau renvoie le vecteur des coefficients ak par la méthode Tau
D=matrice_derivee2(N)+matrice_derivee(N)-2*eye(N+1);
C=CF(N);
F=D(1:N-1,:);
H=[F;C];
J=zeros(N+1,1); J(1)=-2; %H*a=J
a=H\J;
end