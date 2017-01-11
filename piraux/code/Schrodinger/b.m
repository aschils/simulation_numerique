function [ B ] = b( A0,t0, omega,K,N,Vsort,E )

%calcul des b(t) et plot |b_0(t)|^2 , |b_1(t)|^2

    function dbdt = odefun (t, b)
       % dbdt = zeros(N+1,1);
        dbdt = -A(A0,t, t0, omega, K)*(Imn(N,Vsort).*expo(E,N,t))*b;  % équation vectoriel de b'(t)
    end

tspan = [0,50]; % abscisse temps t
y0 = [1; zeros(N,1)]; % valeur initial : b_0 = 1
[t,b] = ode15s(@odefun,tspan,y0);
b = (abs(b)).^2; % probabitlité |b|^2

figure();
plot(t,b(:,1));
hold on;
plot(t,b(:,2));
hold on;
plot(t,1-b(:,1)-b(:,2));
title('N = 20, omega = 1.59383, K = 20 et A_0 = 1');
xlabel('Temps t');
ylabel('Probabilité');
legend('|b_0|^2','|b_1|^2','Probabilité d''ionisation');
hold off;
end

