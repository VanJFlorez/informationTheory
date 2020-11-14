%LABORATORIO 3.2 - Codificación Huffman

function HF=Huffman(P)
  
  %P - Probabilidad
  
  P = sort(P);  %Ordenar de menor a mayor
  Aux = [];     %Vector para ordenar de mayor a menor
  PLength = length(P);
  for i=1:PLength
    Aux = [P(i) Aux];
  endfor
  Aux
  if (PLength <= 2)
    HF = {Aux(1),Aux(2),[0],[1]};   %Caso base, si solo hay dos elementos
  else  
    probA = Aux(PLength-1);         %Probabilidad menor A
    probB = Aux(PLength);           %Probabilidad menor B
    sumP = probA + probB;           %Suma de las 2 probabilidades menores
    Aux = [Aux(1:PLength-2) sumP];
    HF = Huffman(Aux);              %Calculo recursivo

    positions = [];                 %Arreglo para guardar posiciones diferentes de la suma
    positionsSum = 0;               %Arreglo para guardar posición de la suma 
     
    checkSumP = 0;
    for i=1:length(HF)/2            %CheckSum se utiliza para revisar si dos numeros son iguales, y solo utilizar el ultimo de ellos para la asignación
      if HF{1,i} == sumP 
        checkSumP = checkSumP + 1;
      endif
    endfor
  
    for i=1:length(HF)/2
      if HF{1,i} != sumP            %Revisa que otro numero no sea igual a la suma
        positions = [positions i];
      else      
        if checkSumP == 1
          positionsSum = i;
        elseif checkSumP > 1
          positions = [positions i];
        endif
        checkSumP = checkSumP - 1;
      endif
    endfor
    a = {HF{1,positions} probA  probB}   %Primera parte del vector (Probabilidades)
    b = {HF{1,positions + length(HF)/2} [HF{1,positionsSum + length(HF)/2} 0] [HF{1,positionsSum + length(HF)/2} 1]} %Segunda parte del vector (Codigo)
    HF = {a{} b{}};
  endif
endfunction
