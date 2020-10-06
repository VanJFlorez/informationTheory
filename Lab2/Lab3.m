clear;
clc;
###########################################################
# SIGNAL DEF
###########################################################


t0 = 1;                    % duración de la señal
f  = 1;                    % frecuencia de la senal = 1 Hz         
m  = @(tt) cos(2*pi*f*tt); % senal original
         
###########################################################
# SIGNAL ENCODING
###########################################################

# SAMPLING ------------------
Ts = 1/10;        % intervalo de muestreo 
fs = 1/Ts;       % frecuencia de muestreo. Notar que fs > f ~> 5 > 1
ts=[0:Ts:t0];    % tiempo muestreo
ms = m(ts);      % senal muestreada

# QUANTIZING ----------------
xq=cuantUniforme(ms,1,2); 

figure(1)
subplot(2,2,1); 
plot(ts,ms,'k'); 
axis([0 t0 -1.1 1.1]); 
xlabel('nT_s'); 
ylabel('x(nT_s)');

# ENCODING ------------------
# TODO
# TODO


###########################################################
# SIGNAL DECODING
###########################################################
sa=inline('(sin(x)+(x==0))./(x+(x==0))','x');
t = 0:0.1:t0;
decoded_ms = 0;
for j = ts  % cada j es un paso de Ts
  decoded_ms += m(j)*sa(2*pi*f*(t - j)); % la forma correcta es multiplicar por ms, no por m(ts)
  subplot(2,2,2); 
  plot(t,decoded_ms,'-k'); hold on
  pause(.1);
endfor


# axis([0 t0 -1.1 1.1]); 
