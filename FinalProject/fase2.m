clc
clear
pkg load statistics
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