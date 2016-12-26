function [ D ] = matrice_derivee( N )
%matrice_derivee donne la matrice dérivée D
D=zeros(N+1,N+1);
for i=1:N+1 % parcourir les lignes
   if (i==1)
      alpha = 0.5;
   else
      alpha = 1;
   end
    for j=1:N+1 % parcourir les colonnes
        if (i<j && mod(i+j,2)==1) % si i<j, i+j impair
        D(i,j)=2*(j-1)*alpha;
        end
    end
        
   
end
end