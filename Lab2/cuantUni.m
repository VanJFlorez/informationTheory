%Función de cuantización uniforme

function [xq] = cuantUni(x,xmax,n)
  
  %x - Vector a cuantizar
  %xmax - Amplitud maxima (mp)
  %n - numero de bits -> 2^n = L (Zonas)
  
  L = 2^n;    %Numero de zonas
  delta = 2*xmax/L; 
  q = floor(L*(x+xmax)/(2*xmax));
  i=find(q>L-1);  q(i)=L-1;
  i=find(q<0);  q(i)=0; 
  xq=(q*delta)-xmax+(0.5*delta); 
endfunction
