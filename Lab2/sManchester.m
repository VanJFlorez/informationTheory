function [sm] = sManchester(xc, A, m)
   
   %xc - Vector codificado
   %A  - Amplitud
   %m -  muestras por bit
   
   size = length(xc)          %Tamaño del venctor de bits
   sm = zeros(1,m*2*size);    %Tamaño del vector muestrado
   for i=1:size
     if xc(i) == 1;
       for j=1:m
         sm(m*2*(i-1) + j) = A;       %Primeras m muestras del bit (+A)
         sm(m*2*(i-1) + m + j) = -A;  %Siguientes m muestras del bit (-A)
       endfor
     else xc(i) == 0;
       for j=1:m
         sm(m*2*(i-1) + j) = -A;      %Primeras m muestras del bit (+A)
         sm(m*2*(i-1) + m + j) = A;   %Siguientes m muestras del bit (-A)
       endfor
     endif  
   endfor
endfunction
