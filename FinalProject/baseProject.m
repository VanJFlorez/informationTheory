#######
## En la practica no es posible calcular la complejidad de Kolmogorov.
## En otros terminos, es imposible escribir un programa que calcule la
## complejidad de kolmogorov de cualquier flujo de bits.
## Lo que se hace es obtener un estimado y una cota superior para el 
## valor 
#######

#################################
# Fase 1
# Generar cadenas de texto, entre m�s aleatorias m�s complejas....
#################################
% str1 = Generar cadena texto repetida
% str2 = Generar cadena de texto aleatoria
% calcular kolmogorov(str1)
% calcular kolmogorov(str2)
% comparar
% esperar K(str1) < K(str2)
% comentar que la entrop�a de str1 es m�s baja por que es m�s 
% sencilla pues es m�s facil que aparezca en la naturaleza y
% que por tanto tenga menos sorpresa


# TODO generar aleatoria
# TODO generar repetida
strRan = "fasdkjfa�sldjfkasdpfjasdpfkasj�dfkjasd�flk";
strRep = "abcabcabcabcabcabcabcabcabcabcabcabcabcabc";

kRan = kolmogorov(strRan);
kRep = kolmogorov(strRep);

if kRan > kRep
  printf("la aleatoria es mas compleja\n");
endif

#################################
# Fase 2
# Una descripci�n m�s compleja de un objeto implica m�s kolmogorov
# - Una im�gen vale m�s que mil palabras
#################################

# cargar archivo
#   - texto
#   - palabras
#   - gif
cartxt = getBitStream('car.txt');
cartxt

cartxt = fopen('car.jpg', 'r')
cartxt = fopen('car.webp', 'r')

# comprimir
# https://octave.org/doc/v4.4.1/File-Archiving-Utilities.html
#   - texto
#   - palabras
#   - gif

# leer tama�os de archivo antes y despues...
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
file = fopen('in.txt', 'r')
fread(file) % 97 - ascii

# comparar, esperar complejidad mayor en descripci�n compleja (gif)
#   - texto
#   - palabras
#   - gif

# esto quiere decir que entre m�s detallado un objeto, m�s �nico
# es y por tanto poseer el objeto especial, �nico y detallado 
# causar� m�s sorpresa, lo cual quiere decir mayor entropia. Esto
# est� directamente relacionado con las cotas que mostramos en el
# primer avance.


