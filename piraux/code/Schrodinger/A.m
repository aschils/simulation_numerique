function [ r ] = A(A0,t, t0, omega, K )

   % calcul la fonction A(t)
   
   r = A0*((cos((omega*(t-t0))/(2*K)))^2)*sin(omega*(t-t0));
   
end

