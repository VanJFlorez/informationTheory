clc
clear

% H < K < H + c
% 000
% 001
% 010
% 011
% 100
% 101
K = kolmogorov('ABCDEE')
H = entropy([1/6 1/6 1/6 1/6 1/6])

H < K
H - K

