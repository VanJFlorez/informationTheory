function integrand(t_i)
  f_wave(5)*cos(n*w_0*5)
endfunction

n = 1
t_0 = 0;
w_0 = 2*pi/T_0;
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
