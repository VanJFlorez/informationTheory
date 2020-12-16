#######
## En la practica no es posible calcular la complejidad de Kolmogorov.
## En otros terminos, es imposible escribir un programa que calcule la
## complejidad de kolmogorov de cualquier flujo de bits.
## Lo que se hace es obtener un estimado y una cota superior para el 
## valor 
####### 

#################################
# Fase 1
# Generar cadenas de texto, entre más aleatorias más complejas....
#################################
% str1 = Generar cadena texto repetida
% str2 = Generar cadena de texto aleatoria
% calcular kolmogorov(str1)
% calcular kolmogorov(str2)
% comparar
% esperar K(str1) < K(str2)
% comentar que la entropía de str1 es más baja por que es más 
% sencilla pues es más facil que aparezca en la naturaleza y
% que por tanto tenga menos sorpresa

clc
clear

pkg load statistics

# Generar
N = 100;
strRan = strRandom(N);
strRep = strRep("abcd", N/4);

strRanFilename = "strRan.txt"
strRepFilename = "strRep.txt"

# Escribir
file = fopen(strRanFilename,'w');
fprintf(file, '%s', strRan);
fclose(strRanFilename);

file = fopen(strRepFilename,'w');
fprintf(file, '%s', strRep);
fclose(strRepFilename);

# Definición
zip("out/strRan", strRanFilename);
zip("out/strRep", strRepFilename);

zipRan = dir('out/strRan.zip');
zipRep = dir('out/strRep.zip');

if zipRan.bytes > zipRep.bytes
  printf("quedo bueno\n");
endif

# Kolmogorov Lempel Ziv
kRan = kolmogorov(strRan);
kRep = kolmogorov(strRep);

if kRan > kRep
  printf("la aleatoria es mas compleja\n");
endif