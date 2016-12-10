a=25;
b=1;
D=1;
l=1; %longueur du domaine 0 < x < l 
x=0:0.01:l;
t_end = 0.01;
k = 0.0001; %pas de temps
m_end = 50; %nombre d'elements de la série de pour la solution analytique
plot_break_time = 0.1;

plot_asol(a,b,D,l,x,t_end,k,m_end,plot_break_time);
