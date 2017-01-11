function [ y ] = plotE(V0,alpha,N,E)

% affiche le graphe de la répartition des niveaux d'énergie

x = linspace(-5,5,1000);

figure();
for i=1:N+1 
plot (x,ones(size(x))*E(i));
hold on;
end
p1=plot (x,-V0*exp(-alpha*x.^2),'k');
title('Répartition des 81 niveaux d''énergie E_n pour N=80.');
ylabel('Energie');
legend(p1,'Potentiel');
hold off;
end

