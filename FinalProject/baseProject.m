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

