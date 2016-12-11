% Solution analytique de  l'equation d'advection-diffusion.
% 
% * x point d'espace ou evaluer la solution
% * t point de temps ou evaluer la solution
% * m_end nombre d'elements de la serie de la solution qui seront pris
%   en compte
% * a,b,D constantes de l'equation: D u_xx - a u_x - b u = u_t
% * l: frontiere du domaine spatial: 0 < x < l
% * cm_v: vecteur des coefficients C_m de la serie solution analytique
%
function [ u ] = asol(x, t, m_end, a, b, D, l, cm_v)
u = 0;
for m=1:m_end
     u = u+cm_v(m)*sin(m*pi*x/l)*exp(a/(2*D)*(x-a/2*t)-(D*m^2*pi^2/l^2+b)*t);
end

end

