function [ y ] = hermite(m,x)
    c = 1/sqrt(2^m*factorial(m)*sqrt(pi));
    y = c*hermiteH(m,x)*exp(-x*x/2);
end

