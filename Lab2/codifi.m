%Función de codificación

function [codes]=codifi(xq, xmax, n)
    
    %xq - Vector cuantizado a codificar
    %xmax - Amplitud maxima 
    %n - Numero de bits
   
    L = 2^n;                       %Numero de zonas
    delta = 2*xmax/L;              %Delta
    codeBase = [(-xmax + delta/2):delta:(xmax - delta/2)];  %Valor delta/2 entre zonas
    codes = [];
    for q=xq
      code = find(q == codeBase) - 1;     %Codigo numerico
      codes = [codes code];               %Lista de codigos
    endfor
endfunction
