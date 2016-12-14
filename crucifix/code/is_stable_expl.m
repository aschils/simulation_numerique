
%
% Cette fonction renvoie TRUE => la méthode explicite est stable pour
% les parametres a,b,D,h,k
% Une valeur de retour FALSE ne signifie pas que la methode explicite
% sera instable.
%
function [ is_stable ] = is_stable_expl( a,b,D,h,k )
    
    lambda_a = a*k/h;
    lambda_b = b*k;
    lambda_d = D*k/h^2;

    if(abs(1-lambda_b) > abs(1-lambda_b + 2*(lambda_a -2*lambda_d)))
        disp('cas1');
        is_stable = (1-lambda_b)^2+lambda_a^2 <= 1;
    else %if(s1 == s2)
        disp('cas2');
        is_stable = (1+2*(lambda_a-2*lambda_d)-lambda_b)^2 + lambda_a^2 <= 1;
    end

end

