a=1;
b=-1;
D=1;
C1=-1;
C2=1;
C3=1;
C4=1;
x=0:0.1:10;
t=0;
t_end = 10;
k = 0.1;

while(t < t_end)
    u = asol_vecx(x,t,a,b,D,C1,C2,C3,C4);
    %u = asol2_vecx(x,t,a,b,D,C1,C2, C3, C4);
    %u = asol3_vecx(x,t,a,b, D,C1,C2, C3, C4);
    plot(x,u)
    t=t+k;
    pause(0.1);
end
