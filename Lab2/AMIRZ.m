function [sm] = AMIRZ(xc, A)
   
   %xc - Vector codificado
   %A  - Amplitud
   
   size = length(xc);          %Tamaño del venctor de bits
   sm = zeros(1,2*size);    %Tamaño del vector muestrado
   for i=1:size
     if xc(i) == 1;
         sm(2*i-1) = A;       %Primera seccion del bit (+A)
         sm(2*i) = 0;         %Segunda secciondel bit (0)
         A = -A;              %Invertir signo de A
     else xc(i) == 0;
         sm(2*i-1) = 0;      %Primera seccion del bit (0)
         sm(2*i) = 0;       %Segunda seccion del bit (0)
     endif  
   endfor
endfunction
