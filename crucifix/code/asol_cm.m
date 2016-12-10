function [ cm ] = asol_cm( m, a, D, l )
%cm for g(x) = exp(a x /(2D)) and l=1
%cm = 2/(m*pi)*(1-(-1)^m);

%fun = @(x) 2/l*sin(x*pi).*sin(m*pi*x).*exp(-a*x/(2*D));

%g(x) = 1+cos(8*x*pi/l+pi)
fun = @(x) 2/l*(1+cos(8*x*pi/l+pi)).*sin(m*pi*x/l).*exp(-a*x/(2*D));

cm = integral(fun,0,l);
end

