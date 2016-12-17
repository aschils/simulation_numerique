function [u] = plot_nsol_impl( a,b,D,x,t_end,h,k,g,plot_break_time,show_plot)

lambda_a = a*k/h;
lambda_b = b*k;
lambda_d = D*k/h^2;

left_of_diag_el = -lambda_d;
diag_el = 2*lambda_d-lambda_a+lambda_b+1;
right_of_diag_el = lambda_a-lambda_d;

N = length(x);
M = gallery('tridiag',N,left_of_diag_el,diag_el,right_of_diag_el);

%Adaptons la matrice aux frontieres
M([1,end]) = 1;
M(1,2) = 0;
M(N, N-1) = 0;
M(N-1,N) = 0;

%Plus rapide d'inverser une fois la matrice que de resoudre un systeme
%a chaque iteration dans la boucle while
M = inv(M);

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

