function [codesB] = codifiBits(codes, n)
    %codes - Lista de codigos numericos
    %n - numero de bits
    codesB = [];
    for c = codes
      code = bitget(c,n:-1:1);
      codesB = [codesB code];
    endfor  
endfunction
