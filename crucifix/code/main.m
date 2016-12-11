a=25;
b=1;
D=1;
l=1; %longueur du domaine 0 < x < l 
ha = 0.01; %pas d'espace
h = 0.01; %pas d'espace
xa = linspace(0,l,l/ha+1);
x = linspace(0,l,l/h+1);
t_end = 0.01;
ka = 0.0001; %pas de temps
k = 0.00001; %pas de temps

m_end = 50; %nombre d'elements de la série de pour la solution analytique
plot_break_time = 0.001;

g = @(x) 1+cos(8*x*pi/l+pi);
plot_asol(a,b,D,l,x,t_end,ka,m_end,g,plot_break_time);

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
    plot(x,u)
    u = M*u;
    t=t+k;
    pause(plot_break_time);
end


