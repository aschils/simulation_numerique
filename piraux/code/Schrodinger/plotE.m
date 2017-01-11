function [ y ] = plotE(V0,alpha,N,E)

% affiche le graphe de la r�partition des niveaux d'�nergie

x = linspace(-5,5,1000);

figure();
for i=1:N+1 
plot (x,ones(size(x))*E(i));
hold on;
end
p1=plot (x,-V0*exp(-alpha*x.^2),'k');
title('R�partition des 81 niveaux d''�nergie E_n pour N=80.');
ylabel('Energie');
legend(p1,'Potentiel');
hold off;
end

