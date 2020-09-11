clc
clear 

%% PROGRAM PARAMS
L = pi;
N = 1024;
dx = 2*L/(N-1);
x = -L:dx:L;
T0 = 2*L;

%% WAVE FUNCTION
f = 0*x;
f(N/4:3*N/4) = 1;
plot(x,f,'-k','LineWidth',1.5); hold on

%% 
CC = jet(20);
A0 = (1/T0)*sum(f.*ones(size(x)))*dx; % integral(f(t)*cos(0*w0*T))*dt = integral(f(t)*cos(0))*dt = integral(f(t))*dt = sum(f(t))*dt
total = A0
for k=1:40
  a_n = (2/T0)*sum(f.*cos(2*pi*k*x/T0))*dx; % (2/T0)*integral(f(t)*cos(n*w0*T))*dt
  b_n = (2/T0)*sum(f.*sin(2*pi*k*x/T0))*dx; % (2/T0)*integral(f(t)*sin(n*w0*T))*dt
  total = total + a_n*cos(2*pi*k*x/T0) + b_n*sin(2*pi*k*x/T0); 
  plot(x, total);
  pause(.1)
endfor
