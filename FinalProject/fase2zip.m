##########################################################################
# Fase 2
# Genero cadenas con diferentes generadores aleatorios. Voy a ver la aleatoriedad
# de cada uno a partir de los valores obtenidos con la funcion kolmogorov.
# En este caso usamos Kolmogorov para medir aleatoriedad (randomness).
#
# Espero que entre m�s kolmogorov -> m�s sofisticado es el generador -> m�s complejidad
# -> m�s ruido tendr� mi imagen. 
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
clc
clear


pkg load statistics

N = 35*35; #   5   5   7   7
strings = [];
#       rep -----------> purely random
frac = [1, 5, 25, 35, 49, 175, 1225];

# Generar cadenas de complejidad variable
disp("Cadenas de texto cada vez m�s aleatorias, todas miden lo mismo");
for i = frac
  str = strCust(i, N/i);
  size(str)
  
  # escribir para comprimir
  name = strcat("out/", num2str(i), ".txt")
  file = fopen(name,'w');
  fprintf(file, '%s', str);
  fclose(name);
  
  zip
  
  strings = [strings; [str]];
endfor

# Kolmogorov de las cadenas

kolmo = [];

for str = strings'
  str'
  k = kolmogorov(str');
  kolmo = [kolmo; k];
endfor
disp("Kolmogorov para cada cadena respectivamente");
kolmo

# Pintar imagenes
figure(2)
i = 1;
for k = strings
  fig = writeImage(str);
  subplot(3,3,i);
  image(fig);
  i++;
endfor