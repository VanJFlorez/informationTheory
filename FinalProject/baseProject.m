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

##########################################################################
# Fase 2
# Genero cadenas con diferentes generadores aleatorios. Voy a ver la aleatoriedad
# de cada uno a partir de los valores obtenidos con la funcion kolmogorov.
# En este caso usamos Kolmogorov para medir aleatoriedad (randomness).
#
# Espero que entre más kolmogorov -> más sofisticado es el generador -> más complejidad
# -> más ruido tendrá mi imagen. 
# Ejemplo del ranking
# -Purely random DEFAULT octave
# -Twisted (pseudorandom)
# -Beta Distribution	betarnd
# -Binomial Distribution	binornd
# -Cauchy Distribution	cauchy_rnd
# -Chi-Square Distribution	chi2rnd
# -Univariate Discrete Distribution	discrete_rnd
# -Empirical Distribution	empirical_rnd
# -Exponential Distribution	exprnd
# -F Distribution	frnd
# -Gamma Distribution	gamrnd
##########################################################################




##########################################################################
# Fase 3
# Una descripción más compleja de un objeto implica más kolmogorov.
# Segun la relacion del artículo 
#          H < E[K] < H + c       (15)
# o en otros terminos
#          E[K] ~~ nH             (19)
# Si Kolmogorov es grande, también lo es la entropia. Esto quiere
# decir que entre más complejo el objeto (o su descripción) en el 
# universo comun de descripción (en nuestro caso, cadenas de bits)
# obtener más detalle u obtener un objeto con cualidades más específicas
# que un objeto genericob el elemento posee mayor entropía.
#
# En el siguiente ejemplo vamos a ver que en el mundo real una imágen
# vale más que mil palabras. Aunque uno podría imaginarse que entre 
# humanos si la información se transmite de voz a voz, una descripcion
# en español plano también es igualmente poderosa; todos pueden imaginar.
# Sin embargo, en el mundo de las cadenas de bits y los decompresores
# las imágenes son más ricas.       
##########################################################################

# cargar archivo
#   - texto
#   - palabras
#   - gif
%carjson = getBitStream('car.json');
cartxt = getBitStream('in/car.txt');
carjpg = getBitStream('in/car.jpg');
carpng = getBitStream('in/car.png');
cargif = getBitStream('in/car.gif');

# comprimir
# https://octave.org/doc/v4.4.1/File-Archiving-Utilities.html
#   - texto
#   - palabras
#   - gif
% zip('out/carjson', 'car.json')
zip('out/cartxt', 'in/car.txt')
zip('out/carjpg', 'in/car.jpg')
zip('out/carpng', 'in/car.png')
zip('out/cargif', 'in/car.gif')

# leer tamaños de archivo antes y despues...
# https://octave.sourceforge.io/octave/function/dir.html
#   - texto
#   - palabras
#   - gif

% zipjson = dir('out/carjson.zip');
ziptxt = dir('out/cartxt.zip');
zipjpg = dir('out/carpng.zip');
zippng = dir('out/carjpg.zip');
zipgif = dir('out/cargif.zip');


% if zipjson.bytes < ziptxt.bytes < zipjpg.bytes < zippng.bytes < zipgif.bytes
if ziptxt.bytes < zipjpg.bytes < zippng.bytes < zipgif.bytes
  printf("complejidad por compression es ok\n")
endif

# leer como cadena de bits
# https://octave.org/doc/v6.1.0/Opening-and-Closing-Files.html#XREFfopen
# https://octave.org/doc/v5.2.0/Binary-I_002fO.html
#   - texto
#   - palabras
#   - gif

% Kjson = kolmogorov('out/car.json')
Ktxt = kolmogorov(cartxt);
Kjpg = kolmogorov(carjpg);
Kpng = kolmogorov(carpng);
Kgif = kolmogorov(cargif);

% if Kjson < Ktxt < Kjpg < Kpng < Kgif
if Ktxt < Kjpg < Kpng < Kgif
  printf("complejidad por kolmogorov es ok\n")
endif

# comparar, esperar complejidad mayor en descripción compleja (gif)
#   - texto
#   - palabras
#   - gif

# esto quiere decir que entre más detallado un objeto, más único
# es y por tanto poseer el objeto especial, único y detallado 
# causará más sorpresa, lo cual quiere decir mayor entropia. Esto
# está directamente relacionado con las cotas que mostramos en el
# primer avance.
