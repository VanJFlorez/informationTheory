%GENERACI�N DE CADENAS REPETIDAS

function strN=strRep(str, N)
  
  %N - N�mero de repeticiones
  %str - Cadena a repetir
  
  strN="";
  
  for i=1:N   
    strN=strcat(strN, str);  
  endfor  
  
endfunction
