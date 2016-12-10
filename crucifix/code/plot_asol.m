function plot_asol(a,b,D,l,x,t_end,k,m_end,plot_break_time)

cm_v = zeros(1,m_end);

for m=1:m_end
   cm_v(m) = asol_cm(m, a, D, l);
end

t=0;
while(t < t_end)
    u = asol_vec( x, t, m_end, a, b, D, l, cm_v);
    plot(x,u)
    t=t+k;
    pause(plot_break_time);
end

end

