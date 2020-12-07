%P - matriz P
%d - mensaje
%r - palabra recibida
%k - bits del mensaje
clc
clear

P = [1 0 1; 1 1 1; 1 1 0];
k = size(P)(1);
%r = [1 0 1 0 0 1];
r = [1 1 1 1 1 1]; 

if (k==length(r)/2)

  d = [1 0 1]                 
  linearBlockCoder(P,d,r,k);
  #{
  for i=0:2^k-1
    d = flip(bitget(i,1:k))                
    linearBlockCoder(P,d,r,k)
  endfor
  #}
else
  printf("Las dimensiones no coinciden");
endif



