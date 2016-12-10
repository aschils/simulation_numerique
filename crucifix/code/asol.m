function [ u ] = asol(x, t, m_end, a, b, D, l, cm_v)
%analytical sol for g(x) = exp(a x /(2D)) and l=1
u = 0;
for m=1:m_end
    %u = u+asol_cm(m, a, D, l)*sin(m*pi*x/l)*exp(a/(2*D)*(x-a/2*t)-(D*m^2*pi^2/l^2+b)*t);
     u = u+cm_v(m)*sin(m*pi*x/l)*exp(a/(2*D)*(x-a/2*t)-(D*m^2*pi^2/l^2+b)*t);
end

end

