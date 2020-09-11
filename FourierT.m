function FT=FourierT(t,N,To)

  %Desarollo Laboratorio 1, punto 1

  % Para el intevalo [-To/4 , To/4] -> a0 = 1
  % N - Valor de truncamiento
  % To - Periodo fundamental 
  
  wo = 2*pi/To; 

  xt = 1/2;
  
  for k=1:N
    
    acos = inline('cos(k * wo * x)','x');
    bsin = inline('sin(k * wo * x)','x');
    
    ak = 2/To * quad(acos,-To/4,To/4);
    bk = 2/To * quad(bsin,-To/4,To/4);
    
    xt = xt + ak * cos(k * wo * t) + bk * sin(k * wo * t);
  endfor  
  
  FT = xt;
  
endfunction  

