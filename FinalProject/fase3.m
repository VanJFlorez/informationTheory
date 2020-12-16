##########################################################################
# Fase 3
# Una descripci�n m�s compleja de un objeto implica m�s kolmogorov.
# Segun la relacion del art�culo 
#          H < E[K] < H + c       (15)
# o en otros terminos
#          E[K] ~~ nH             (19)
# Si Kolmogorov es grande, tambi�n lo es la entropia. Esto quiere
# decir que entre m�s complejo el objeto (o su descripci�n) en el 
# universo comun de descripci�n (en nuestro caso, cadenas de bits)
# obtener m�s detalle u obtener un objeto con cualidades m�s espec�ficas
# que un objeto genericob el elemento posee mayor entrop�a.
#
# En el siguiente ejemplo vamos a ver que en el mundo real una im�gen
# vale m�s que mil palabras. Aunque uno podr�a imaginarse que entre 
# humanos si la informaci�n se transmite de voz a voz, una descripcion
# en espa�ol plano tambi�n es igualmente poderosa; todos pueden imaginar.
# Sin embargo, en el mundo de las cadenas de bits y los decompresores
# las im�genes son m�s ricas.       
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

# leer tama�os de archivo antes y despues...
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
if Ktxt > Kjpg > Kpng > Kgif
  printf("complejidad por kolmogorov es ok\n")
endif

# comparar, esperar complejidad mayor en descripci�n compleja (gif)
#   - texto
#   - palabras
#   - gif

# esto quiere decir que entre m�s detallado un objeto, m�s �nico
# es y por tanto poseer el objeto especial, �nico y detallado 
# causar� m�s sorpresa, lo cual quiere decir mayor entropia. Esto
# est� directamente relacionado con las cotas que mostramos en el
# primer avance.