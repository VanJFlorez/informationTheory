%GENERACIÓN DE CADENAS REPETIDAS

function strN=strRep(str, N)
  
  %N - Número de repeticiones
  %str - Cadena a repetir
  
  strN="";
  
  for i=1:N   
    strN=strcat(strN, str);  
  endfor  
  
endfunction
