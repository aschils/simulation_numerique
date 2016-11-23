function [ vu ] = asol_vecx(vx,t,a,b,D,C1,C2,C3,C4)
    
    l = length(vx);
    vu = zeros(l);
    
    for i=1:l
        vu(i) = asol(vx(i),t,a,b,D,C1,C2,C3,C4);
    end

end

