clear;
clc;
###########################################################
# SIGNAL DEF
###########################################################


t0 = 1;          % duración de la señal
f  = 1;          % frecuencia de la senal = 1 Hz         
m  = @(tt) cos(2*pi*f*tt);
         
###########################################################
# SIGNAL ENCODING
###########################################################

# SAMPLING ----------
Ts = 1/5;        % intervalo de muestreo 
fs = 1/Ts;       % frecuencia de muestreo. Notar que fs > f ~> 5 > 1
t=[0:Ts:t0];                      % vector de tiempo
ms = m(t);

# QUANTIZING ---------
xq=cuantUniforme(ms,1,2); 

figure(1)
subplot(2,2,1); 
plot(t,ms,'k'); 
axis([0 t0 -1.1 1.1]); 
xlabel('nT_s'); 
ylabel('x(nT_s)');


###########################################################
# SIGNAL DECODING
###########################################################

inf = 100
dom = 0:0.001:t0;
# decoded_m = zeros(dom);
for i = t
  i
  N = 100;
  sum = 0;
  for j = -inf:inf
    
  endfor
endfor 
