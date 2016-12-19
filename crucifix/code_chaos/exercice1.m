function [ x ] = exercice1( i, x0 )
    
    %Preconditions non respectees
    if(i < 0)
        x = 0;
        return;
    end

    %De 0 a i -> i+1 elements
    x = zeros(1,i+1);

    xj = x0;
    j = 1;
    
    while(j ~= i+2)
        x(j) = xj;
        
        if(xj <= 0.5)
            xj = 2*xj;
        else
            xj = 2-2*xj;
        end
        
        j = j+1;
    end
end

