clc
clear 


f_saw = @(t) 2 * mod(t, 5);
% fplot(f, [-10 10])

% t = -2*pi : 0.001 : 2*pi;
% plot(t, square(t))

% t = linspace(0,3*pi)';
% x = square(t);

% Script OCTAVE para la serie de Fourier de una onda periódica cuadrada.

t=[-1:0.01:1];
f_square = inline('(t >= 0) & (t < 1)', 't')
T_0 = 1;
y = f_square(t)';
f_square_06 = f_square(-1) %% should equal 0
% plot(t, f_square(t)); axis([-2 2 -2 2]);

t_0 = 0;
w_0 = 2*pi/T_0;
integrand = f(t)*cos(n*w_0*t);
a = quad(integrand, t_0, t_0 + T_0)



function square(t)
  t=t*(1/(pi));
  y=ones(size(t));
  y(find(bitand(abs(floor(t)),1)))=-1;
  
  %t = -0.02:.0001:.0625;
  %y = square(t);
  %plot(t,y,'-o')
end

fourierTrigonometricSeries(4, f_square, 0, 1)



