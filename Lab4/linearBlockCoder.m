function lbc=linearBlockCoder(P, d, r, k)
  
  %P - matriz P
  %d - mensaje
  %r - palabra recibida
  %k - bits del mensaje

  ## ENCODER
  printf("CODIFICADOR\n");
  I = eye(k);
  G = [I P'];

  printf("Entrada:\n");
  d

  printf("Salida:\n");
  c = mod(d*G, 2)

  ## DECODER
  printf("DECODIFICADOR\n");
  printf("Entrada:\n");
  r
  H = [P I]
  s = mod(r*(H'), 2)

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
    printf("Hay errores en la posicion %d ! \n", i);
    r(i) = !r(i);  
  endif

  printf("Salida:\n");
  r(1:k)
endfunction