
%x0 = pi/(2*sqrt(5));
x0 = 0.1;
i_max = 50;
x = exercice1( i_max, x0 );

%Construction des vecteurs pour ploter x_i+1 en fonction de x_i
x_shifted = zeros(1,length(x)-1);
for j=2:length(x)
    x_shifted(j-1) = x(j);
end
x_wo_last = x(1:(length(x)-1));
%scatter(x_wo_last,x_shifted)

%Plot x_i en fonction de i
i = 0:i_max;
scatter(i,x) %scatter(x_wo_last,x_shifted)
xlabel('i')
ylabel('x_i')
%print('../rapport/images/x0_0dot1_i_x_i.png', '-dpng')

%scatter(x_wo_last,x_shifted)
%xlabel('x_i')
%ylabel('x_{i+1}')
%print('../rapport/images/x0en_x_i_x_i_plus_1.png', '-dpng')

%Exercice 3
M = 1; %nombre de points dans l espace à tout temps t
%x0 = 1:M;
%y0 = 1:M;
%z0 = 1:M;
x0 = 10;
y0 = 10;
z0 = 1;
sigma = 10;
beta = 8/3;
t_end = 50;
k = 0.01;

rho_v = [5 10 28 45];

for rho=rho_v

    [x,y,z] = exercice3( x0,y0,z0,M,sigma,rho,beta,k,t_end);
    plot3(y,x,z)
    comet3(x,y,z)
    set(gca,'YDIR','Reverse')
    xlabel('y')
    ylabel('x')
    zlabel('z')
    file_path = strcat('../rapport/images/lorenz',num2str(rho));
    file_path = strcat(file_path, '.png');
    print(file_path, '-dpng')

end
