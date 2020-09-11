clc
clear 

%% PROGRAM PARAMS
a = 1;          % for the sa function 
L = 6*pi;
N = 1024;       % must be a factor of 4
dx = 2*L/(N-1);
t = -L:dx:L;
T0 = 2*L;

%% FUNC DEF sin(a*w)/a*w
sa = @(w) 2*a*(sin(a*w)+(w==0))./(a*w+(w==0));
subplot(3,1,1);
plot(t,sa(t)); xlabel('t'); ylabel('sin(a*w)/a*w');

%% FUNC DEF unitary pulse
sq = 0*t;
sq(N/4:3*N/4) = 1;
subplot(3,1,2); xlabel('t'); ylabel('pulse');
plot(t, sq);

%% FFT COMP.
Y = fft(sq);
subplot(3,1,3); xlabel('t'); ylabel('fft');
plot(t, Y);