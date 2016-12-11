%
% Evalue la solution analytique pour un temps t et un ensemble de points
% de l'espace x(i)
%
function [ u_v ] = asol_vec( x_v, t, m_end, a, b, D, l, cm_v)

x_v_size = length(x_v);
u_v = zeros(1,x_v_size);

for i=1:x_v_size
    u_v(i) = asol(x_v(i), t, m_end, a, b, D, l, cm_v);
end
end
