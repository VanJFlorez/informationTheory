clc
clear 
L = pi;
N = 1024;
dx = 2*L/(N-1);
x = -L:dx:L;

f = 0*x;
% f(N/4:N/2) = 4*(1:N/4+1)/N;
% f(N/2+1:3*N/4) = 1-4*(0:N/4-1)/N;
f(N/4:3*N/4) = 1;
% plot(x,f,'-k','LineWidth',1.5); hold on; axis([-2 2 -2 2])

CC = jet(20);
A0 = quad('f', -L, L)








