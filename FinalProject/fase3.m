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
if Ktxt > Kjpg > Kpng > Kgif
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