function exercice5( sigma, beta )
    k = 0.001;
    t_end = 20000;
    N = t_end/k+1;

    
    x0 = rand(1);
    y0 = rand(1);
    z0 = rand(1);
    pos0 = [x0 y0 z0];
    
    eps = 0.0001;
    dpos = eps*pos0/norm(pos0);
    
    V = zeros(1,3);
    data = zeros(1,N-1);
    
    %rhov = [5 10 28 45];
    rhov = 1:45;
    lambdav = zeros(1,length(rhov));
    
    j = 1;
    
    for rho=rhov 
        
        x = zeros(N,1);
        y = zeros(N,1);
        z = zeros(N,1);
        x(1,1) = x0;
        y(1,1) = y0;
        z(1,1) = z0;

        xd = x0+dpos(1,1);
        yd = y0+dpos(1,2);
        zd = z0+dpos(1,3);
        
        c = 0;
        l = 0;
        
        
        for i=2:N
            prev_i = i-1;
            [x(i,1),y(i,1),z(i,1)] = next_lorenz_pos(sigma,k,rho,beta,x(prev_i),y(prev_i),z(prev_i));
            [V(1,1), V(1,2), V(1,3)] = next_lorenz_pos(sigma,k,rho,beta,xd,yd,zd);

            diff = V-[x(i,1) y(i,1) z(i,1)];
            data(1,prev_i) = norm(diff);
            temp = [x(i,1) y(i,1) z(i,1)]+eps*(diff/data(1,prev_i));
            xd = temp(1);
            yd = temp(2);
            zd = temp(3);
            
            if i> N/10
                l = l+log(data(1,prev_i)/eps);
                c = c+1;
             end
        end
        
        lambdav(j) = l/(k*c);
        j = j+1;
    end
    lambdav
    scatter(rhov, lambdav);
    
end

