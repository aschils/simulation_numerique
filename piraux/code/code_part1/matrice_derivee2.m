function [ D2 ] = matrice_derivee2( N )
%matrice_seconde donne la matrice dérivée seconde D^2
D2=zeros(N+1,N+1);
for i=1:N+1 % parcourir les lignes
      if (i==1)
        alpha = 0.5;
      else
        alpha = 1;
      end
    for j=1:N+1 % parcourir les colonnes
        if (i<j && mod(i+j,2)==0) % si i<j, i+j pair
        D2(i,j)=(j-1)*(i+j-2)*(j-i)*alpha;
        end
    end
end
end

