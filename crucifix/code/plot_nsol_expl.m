
%
% Cette fonction plot l'evolution de la solution numerique a l'equation
% d'advection calculees en tous les points du vecteur x, depuis t=0 jusque
% t=t_end par pas de temps k.
%
% * a,b,D, D>0 sont des constantes de l'equation: D u_xx - a u_x - b u = u_t
% * x est le vecteur des points Xi ou la solution est evaluee: 0 < Xi < l
% * t_end > 0: la solution est evaluee de t=0 a t=t_end par pas de temps k
% * h: pas d'espace
% * k: pas de temps
% * g: g(x) = u(x,0) fonction qui fournit les conditions initiales
% *  plot_break_time est le temps de pause entre le plot de la solution
%   numerique pour t = t_j et t = t_j+k
%
function [u] = plot_nsol_expl(a,b,D,x,t_end,h,k,g,plot_break_time,show_plot)

lambda_a = a*k/h;
lambda_b = b*k;
lambda_d = D*k/h^2;

left_of_diag_el = lambda_d;
diag_el = -2*lambda_d+lambda_a-lambda_b+1;
right_of_diag_el = lambda_d-lambda_a;

N = length(x);
M = gallery('tridiag',N,left_of_diag_el,diag_el,right_of_diag_el);

%Adaptons la matrice aux frontieres
M([1,end]) = 1;
M(1,2) = 0;
M(N, N-1) = 0;
M(N-1,N) = 0;

u = g(x)';

t=0;
while(t < t_end)
    if(show_plot)
        plot(x,u)
    end
    u = M*u;
    t=t+k;
    pause(plot_break_time);
end

end

