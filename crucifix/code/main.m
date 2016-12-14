% constantes de l'equation
%a=25;
a=25;
%b=1;
b=1;
%D=1;
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

g = @(x) 1+cos(8*x*pi/l+pi); % condition initiale u(x,0) = g(x)

%plot_asol(a,b,D,l,xa,t_end,ka,m_end,g,plot_break_time);

alv = [-10 1 10];
Dlv = [1 10 50];
hlv = [0.0001 0.001 0.01];
klv = [0.000001 0.00001 0.0001];

for al=alv
    for bl = alv
        for Dl = Dlv
            for hl = hlv
                for kl = klv
                    if(is_stable_expl(al, bl, Dl, hl, kl))
                        plot_nsol_expl(al,bl,Dl,x,0.001,hl,kl,g,0.00001);
                    end
                end
            end
        end
    end
end
%plot_nsol_expl(a,b,D,x,t_end,h,k,g,plot_break_time);
%plot_nsol_impl(a,b,D,x,t_end,h,k,g,plot_break_time);


