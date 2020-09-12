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

Y = fft(f);
plot(x,Y); hold on;