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

N = 35*35; #   5   5   7   7
strings = [];
#       rep -----------> purely random
frac = [1, 5, 25, 35, 49, 175, 1225];

# Generar cadenas de complejidad variable
disp("Cadenas de texto cada vez más aleatorias, todas miden lo mismo");
for i = frac
  str = strCust(i, N/i);
  size(str)
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


fig = writeImage(str)
figure(2)
subplot(3,3,1)
subplot(1,2,2)
image(fig)