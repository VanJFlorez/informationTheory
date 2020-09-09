clc
clear 


% f = @(t) 2 * mod(t, 5);
% fplot(f, [-10 10])

% t = -2*pi : 0.001 : 2*pi;
% plot(t, square(t))

% t = linspace(0,3*pi)';
% x = square(t);

% Script OCTAVE para la serie de Fourier de una onda periódica cuadrada.

t=[-5:0.01:5];
square = inline('(t > 0) & (t < 1)', 't')
% plot(t, square(t));
% axis([-2 2 -2 2]);

function fourierTrigonometricSeries(N, f)
  disp(N)
end

fourierTrigonometricSeries(4, square)



