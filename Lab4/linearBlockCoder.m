clc
clear
## ENCODER
printf("CODIFICADOR\n");
P = [1 0 1; 1 1 1; 1 1 0];
k = size(P)(1);
I = eye(k);
G = [I P'];

printf("Entrada:\n");
d = [1 0 1]        %% 3-bit input

printf("Salida:\n");
c = mod(d*G, 2)

## DECODER
printf("DECODIFICADOR\n");
printf("Entrada:\n");
r = [0 1 0 1 1 1]  %% 6-bit input
H = [P I];
s = mod(r*(H'), 2);

if sum(s) == 0     %% si el vector es cero, no hay errores
  disp("No hay errores!")
else               %% de otra manera hay errores (al menos dos Teorema 11.2)
  i = 0; 
  for i = 1:rows(H')
    row = H'(i,1:end);
    if(isequal(row, s))
      %% esta es la ubicacion del error
      break;
    endif
  endfor
  printf("Hay errores en la posicion %d ! \n", 4);
  r(i) = !r(i);  
endif

printf("Salida:\n");
r(1:k)
