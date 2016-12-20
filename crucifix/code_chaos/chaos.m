
%x0 = pi/(2*sqrt(5));
x0 = 0.1;
i_max = 100;
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
print('../rapport/images/x0_0dot1_i_x_i.png', '-dpng')

%scatter(x_wo_last,x_shifted)
%xlabel('x_i')
%ylabel('x_{i+1}')
%print('../rapport/images/x0en_x_i_x_i_plus_1.png', '-dpng')

