%
% Cette fonction calcule les coefficients C_m de la solution analytique
% de l'equation d'advection-diffusion. Autrement dit:
%
% Cette fonction calcule la projection de la fonction g(x)*exp(-a*x/(2*D))
% sur la base des fonctions sin(m*pi*x/l), i.e. les coefficients de
% la serie de Fourier reelle de g(x)*exp(-a*x/(2*D)) en ne considerant
% que les fonctions de base de type sin (et pas cos).
% 
% * m est l'indice du coefficient a calculer
% * a et D, D>0, sont des constantes de l'equation d'advection-diffusion
% * l est la frontiere du domaine de la solution a l equation, i.e.
%    0 < x < l
% * g est la fonction qui implemente la condition initiale: u(x,0) = g(x)
%
function [ cm ] = asol_cm( m, a, D, l, g)

fun = @(x) 2/l*g(x).*sin(m*pi*x/l).*exp(-a*x/(2*D));
cm = integral(fun,0,l);
end

