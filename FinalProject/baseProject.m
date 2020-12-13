clc
clear
#######
## Instalar el paquete de entropia con
## pkg install -forge informationtheory
## pkg load informationtheory
#######

% H < K < H + c
% 000
% 001
% 010
% 011
% 100
% 101
K = kolmogorov('ABCDE')
H = entropy([1/6 1/6 1/6 1/6 1/6])

H < K
H - K


K = kolmogorov('XYZ')
H = entropy([1/3 1/3 1/3])

H < K
H - K

K = kolmogorov('00011011')
H = entropy([1/4 1/4 1/4 1/4])

H < K
H - K

#################################
# Fase 1
# Generar cadenas de texto, entre más aleatorias más complejas....
#################################

% str1 = Generar cadena texto repetida
% str2 = Generar cadena de texto aleatoria
% calcular kolmogorov(str1)
% calcular kolmogorov(str2)
% comparar
% esperar str1 < str2
% comentar que la entropía de str1 es más baja por que es más 
% sencilla pues es más facil que aparezca en la naturaleza y
% que por tanto tenga menos sorpresa

#################################
# Fase 2
# Una descripción más compleja de un objeto implica más kolmogorov
# - Una imágen vale más que mil palabras
#################################

# cargar archivo
#   - texto
#   - palabras
#   - gif

# comprimir
# https://octave.org/doc/v4.4.1/File-Archiving-Utilities.html
#   - texto
#   - palabras
#   - gif

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
file = fopen('in.txt', 'r')
fread(file) % 97 - ascii

# comparar, esperar complejidad mayor en descripción compleja (gif)
#   - texto
#   - palabras
#   - gif

# esto quiere decir que entre más detallado un objeto, más único
# es y por tanto poseer el objeto especial, único y detallado 
# causará más sorpresa, lo cual quiere decir mayor entropia. Esto
# está directamente relacionado con las cotas que mostramos en el
# primer avance.


