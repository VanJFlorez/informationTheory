clear;
clc;
###########################################################
# SIGNAL DEF
###########################################################


t0 = 1;                    % duraci�n de la se�al
f  = 1;                    % frecuencia de la senal = 1 Hz
A  = 1;                    % amplitud (max. val.)
m  = @(tt) A*sin(2*pi*f*tt); % senal original
         
###########################################################
# SIGNAL ENCODING
###########################################################

# SAMPLING ------------------
Ts = 1/10;        % intervalo de muestreo 
fs = 1/Ts;       % frecuencia de muestreo. Notar que fs > f ~> 5 > 1
ts = [0:Ts:t0];    % tiempo muestreo
ms = m(ts);      % senal muestreada '(ms) m sampled'

subplot(2, 2, 1); 
plot(ts, ms, 'k'); 
axis([0 t0 -1.1 1.1]); 
xlabel('nT_s'); 
ylabel('x(nT_s)');

# QUANTIZING ----------------
WW = 3;             % wordsize in bits. number of levels L = 2^W
ms_q = cuantUniforme(ms, A, WW);   % senal muestreada cuatizada '(msq) m sampled quatized'
subplot(2, 2, 3);
plot(ts, ms_q, 'k');
grid;
grid minor;

# ENCODING ------------------
ms_qcodes = encodeQuant(ms_q, A, WW)
ms_qcodes_bin = []; % senal muestreada cuatizada '(msq_codes) m sampled quatized with code level numbers'

# u = repelem(v,3)


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
  # plot(t,decoded_ms,'-k'); hold on
  # pause(.1);
endfor
plot(t,decoded_ms,'-k');
