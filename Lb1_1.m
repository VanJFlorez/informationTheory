
t = [-2:0.01:2];
To = 4; %Las ondas se repite cada 4 unidades

plot(t,(t<1)&(t>-1),'k',
     t,FourierT(t,1,To),'r',
     t,FourierT(t,5,To),'b',
     t,FourierT(t,10,To),'g',
     t,FourierT(t,20,To),'m',
     t,FourierT(t,40,To),'c');
           
grid;
xlabel('t');
ylabel('x(t)');
axis([-2.5 2.5 -0.25 1.25]);
legend('n=Inf.','n=1',' n=5','n=10','n=20','n=40');
