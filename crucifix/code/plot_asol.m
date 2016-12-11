
%Fonction qui fournit un graphique de l'evolution de la solution
%analytique u(x,t) de l'equation aux derivees partielles
% D u_xx - a u_x - b u = u_t
%en fonction du temps.
%
% Notons que cette solution analytique a ete calculee avec les 
% conditions aux bords u(0,t) = u(l, t) = 0 et conditions initiales
% u(x,0) = g(x).
%
% Description des parametres de la fonction plot_asol et des preconditions
% associess:
%
% * a, b, D sont des constantes de l'equation avec D > 0
% * pour tout i, 0 < x(i) < l, l est donc la frontiere du domaine et x le vecteur des
% points dans l'espace ou la solution sera evaluee a chaque temps t.
% * t_end est le temps de fin: la solution est evaluee entre t=0 et t=t_end
%   par pas de temps k. t_end > 0
% * k est le pas de temps, k > 0
% * m_end est le nombre d'elements de la serie qui constitue la solution
%   analytique qui seront evalues. m_end entier et m_end > 0
% * g est la fonction g(x) qui specifie les conditions initiales, i.e.
%   u(x,0) = g(x). On doit avoir g(0) = g(l) = 0.
% * plot_break_time est le temps de pause entre le plot de la solution
%   analytique pour t = t_j et t = t_j+k
%
function plot_asol(a,b,D,l,x,t_end,k,m_end,g,plot_break_time)

%Plus rapide de calculer les coefficients C_m en dehors de la boucle sur le
%temps
cm_v = zeros(1,m_end);
for m=1:m_end
   cm_v(m) = asol_cm(m, a, D, l, g);
end

t=0;
while(t < t_end)
    u = asol_vec( x, t, m_end, a, b, D, l, cm_v);
    plot(x,u)
    t=t+k;
    pause(plot_break_time);
end

end

