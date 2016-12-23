%E0,E1 les vap dont tu veux le vep
%D  ta matrice ou les vaps sont sur la diagonales (non triees)
%V  ta matrice des vecteurs propres qui sont mis en colonnes

j = 0;
for i=1:length(D)
  if(vaps(i,i) == E0)
    j = i;
    break
  end
end

V0 = veps(:,j);


j = 0;
for i=1:length(D)
  if(vaps(i,i) == E1)
    j = i;
    break
  end
end

V1 = veps(:,j);