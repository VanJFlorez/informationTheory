function str = strBinom(N, a, b)
  str = "";
  for i=1:N
    a = floor(unifrnd(0,26)) + 97;
    str = strcat(str,char(a)); 
  endfor
endfunction
