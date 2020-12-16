clc 
clear
# Calcular Complejidad Kolmogorov
kolmogorov('abavavava')

# Calcular entropia
a = '000';
b = '001';
c = '010';
d = '011';
e = '100';
f = '101';
g = '110';
h = '111';

entropy

alpha = cellstr([a; b; c; d; e; f; g; h])
for i = [1:8]
  alpha(i)
endfor