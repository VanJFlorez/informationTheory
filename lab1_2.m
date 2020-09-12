clc
clear 

%% PROGRAM PARAMS
a = 5;          % for the sa function 
L = 10;
dx = 0.01;
tl = -L:dx:0;   % left 
tr = dx:dx:L;   % right
t = [tl tr];

%% FUNC DEF sin(a*w)/a*w

sa = @(w) 2*a*(sin(a*w)+(w==0))./(a*w+(w==0));
subplot(3,1,1);
plot(t,sa(t)); xlabel('t'); ylabel('sin(a*w)/a*w');

%% FUNC DEF unitary pulse
% sq = 0*t;
f = inline('(-5 < x) & (x < 5)', 'x');
subplot(3,1,2); xlabel('t'); ylabel('pulse');
plot(t, f(t));

%% FFT COMP.
Y = fft(f(t));
subplot(3,1,3); xlabel('t'); ylabel('fft');
plot(t, Y);