%---------------------Entropia----------------
pkg load communications;
%x = [0.25 0.1 0.05 0.4 0.2]
clc
clear
% x = [0.3 0.25 0.2 0.12 0.08 0.05]
% x = [0.5 0.25 0.15 0.1]
% x = [0.25 0.25 0.25 0.25]

sz = 10;
x = round(10*rand(1,sz));
x = x/sum(x);

x =  [0.2 0.4 0.2 0.1 0.1] 
hf = huffmandict(1:sz,x,0);


HF = Huffman(x);

H = 0;    %Entropia
L = 0;    %Entropia minima
for i=1:length(HF)/2
  H = H - (x(i) * log2(x(i)));
  L = L + (x(i) * length(HF{i + length(HF)/2}));
endfor
H;
L;
n = H/L;   %Eficiancia de codigo 

hf
HF

