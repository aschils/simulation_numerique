function [ u_v ] = asol_vec( x_v, t, m_end, a, b, D, l, cm_v)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

x_v_size = length(x_v);
u_v = zeros(1,x_v_size);

for i=1:x_v_size
    u_v(i) = asol(x_v(i), t, m_end, a, b, D, l, cm_v);
end
end
