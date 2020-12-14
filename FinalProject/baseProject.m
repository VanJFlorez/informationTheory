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

# GENERO
N = 100;
strRan = strRandom(N);
strRep = strRep("abcd", N/4);

strRanFilename = "strRan.txt"
strRepFilename = "strRep.txt"

# ESCRIBO
file = fopen(strRanFilename,'w');
fprintf(file, '%s', strRan);
fclose(strRanFilename);

file = fopen(strRepFilename,'w');
fprintf(file, '%s', strRep);
fclose(strRepFilename);

# Definición
zip("out/strRan", strRanFilename);
zip("out/strRep", strRepFilename);



# Kolmogorov Lempel Ziv
kRan = kolmogorov(strRan);
kRep = kolmogorov(strRep);

if kRan > kRep
  printf("la aleatoria es mas compleja\n");
endif

#################################
# Fase 2
# Una descripción más compleja de un objeto implica más kolmogorov
# - Una imágen vale más que mil palabras
#################################

# cargar archivo
#   - texto
#   - palabras
#   - gif
% carjson = getBitStream('car.json');
%cartxt = getBitStream('car.txt');
%carjpg = getBitStream('car.jpg');
%carpng = getBitStream('car.png');
%cargif = getBitStream('car.gif');

# comprimir
# https://octave.org/doc/v4.4.1/File-Archiving-Utilities.html
#   - texto
#   - palabras
#   - gif
% zip('car.json', 'car.txt')
zip('out/cartxt', 'car.txt')
zip('out/carjpg', 'car.jpg')
zip('out/carpng', 'car.png')
zip('out/cargif', 'car.gif')


# leer tamaños de archivo antes y despues...
# https://octave.sourceforge.io/octave/function/dir.html
#   - texto
#   - palabras
#   - gif

# leer como cadena de bits
# https://octave.org/doc/v6.1.0/Opening-and-Closing-Files.html#XREFfopen
# https://octave.org/doc/v5.2.0/Binary-I_002fO.html
#   - texto
#   - palabras
#   - gif

# comparar, esperar complejidad mayor en descripción compleja (gif)
#   - texto
#   - palabras
#   - gif

# esto quiere decir que entre más detallado un objeto, más único
# es y por tanto poseer el objeto especial, único y detallado 
# causará más sorpresa, lo cual quiere decir mayor entropia. Esto
# está directamente relacionado con las cotas que mostramos en el
# primer avance.


