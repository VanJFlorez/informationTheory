%GENERACIÓN DE CADENAS REPETIDAS

function str=strRandom(N)
  
  %N - Numero de caracteres en la palabra
  %str - Cadena generada aleatoriamente
  
  str = "";
  
  for i=1:N
    
    a = floor(unifrnd(0,26)) + 97;
    str = strcat(str,char(a)); 
  
  endfor
  
endfunction
