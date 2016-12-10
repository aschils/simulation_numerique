a=1;
b=1;
D=1;
l=1;
x=0:0.01:l;
t=0;
t_end = 0.01;
k = 0.0001;
m_end = 50;

cm_v = zeros(1,m_end);

for m=1:m_end
   cm_v(m) = asol_cm(m, a, D, l);
end

while(t < t_end)
    u = asol_vec( x, t, m_end, a, b, D, l, cm_v);
    plot(x,u)
    t=t+k;
    pause(0.1);
end
