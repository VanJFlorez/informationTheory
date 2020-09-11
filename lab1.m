clc
clear 


f_saw = @(t) 2 * mod(t, 5);
fplot(f, [-10 10])

N = 10
t=[-1:0.01:2];
f_wave = inline('(t >= 0)', 't')
T_0 = 1;
f_wave_06 = f_wave(-1) %% should equal 0
%% plot(t, f_wave(t)); axis([-2 2 -2 2]);

for i=1:N
  
endfor






