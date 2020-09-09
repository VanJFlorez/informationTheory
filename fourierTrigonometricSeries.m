% https://savannah.gnu.org/bugs/?49068
% https://stackoverflow.com/questions/33723561/octave-set-break-point-in-a-class-function

clc 
clear 

1;
print("buahhahaha") 
function s=fourierTrigonometricSeries(N, f, t_0, T_0)
  t=[-1.5:0.01:1.5];
  plot(t, f(t)); axis([-2 2 -2 2]);
  l = t_0
  r = T_0
endfunction

function a_n_coeff(n, T_0, f, t)
  w_0 = 2*pi/T_0;
  integrand = f(t)*cos(n*w_0*t);
  
  
  % (1/T_0)*
  
  % quad(f, l, r)*; % left integration breaks at t = -1.7455
endfunction
