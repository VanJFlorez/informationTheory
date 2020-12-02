clear;
clc;
###########################################################
# SIGNAL DEF
###########################################################

t0 = 1;                    % duración de la señal
f  = 1;                    % frecuencia de la senal = 1 Hz
A  = 1;                    % amplitud (max. val.)
m  = @(tt) A*sin(2*pi*f*tt); % senal original
         
###########################################################
# SIGNAL ENCODING
###########################################################

# SAMPLING ------------------
Ts = 1/10;        % intervalo de muestreo 
fs = 1/Ts;       % frecuencia de muestreo. Notar que fs > f ~> 10 > 1
ts = [0:Ts:t0];    % tiempo muestreo
ms = m(ts);      % senal muestreada '(ms) m sampled'

subplot(2, 3, 1); 
plot(ts, ms, 'k'); 
axis([0 t0 -1.1 1.1]); 
xlabel('nT_s'); 
ylabel('x(nT_s)');
legend('Muestreo')

# QUANTIZING ----------------
WW = 3;             % wordsize in bits. number of levels L = 2^W
ms_q = cuantUniforme(ms, A, WW);   % senal muestreada cuatizada '(msq) m sampled quatized'
subplot(2, 3, 2);
plot(ts, ms_q, 'k');
legend('Quatizacion')
grid;
grid minor;

# ENCODING ------------------
%  senal muestreada cuatizada codificada '(msq_codes) m sampled quatized with code level numbers'
ms_qcodes = encodeQuant(ms_q, A, WW);

subplot(2, 3, 3);
plot(ts, ms_qcodes, 'k');
legend('Codificación')
grid;
grid minor;

# DIGITAL ENCODING -----------
%  senal muestreada cuatizada codificada en binario '(msq_codes_bin) m sampled quatized with binary code levels'
ms_qcodes_bin = encodingToBinary(ms_qcodes, WW);
% se replican los elementos
factor = 10;
ms_qcodes_bin = repelem(ms_qcodes_bin, factor);
% tiempo en el canal, por cada muestra hay WW bits
t_ch = 0:t0/(size(ms_qcodes_bin)(2) - 1):t0;

subplot(2, 3, 4)
plot(t_ch, ms_qcodes_bin);
legend('Senal PCM')
axis([0 t0 -0.5 1.5]); 

###########################################################
# SIGNAL DECODING
###########################################################
t = 0:0.1:t0;
decoded_ms = 0;
for j = ts  % cada j es un paso de Ts
  decoded_ms += m(j)*sinc(2*f*(t - j)); % la forma correcta es multiplicar por ms, no por m(ts)
  % subplot(2,2,3); 
  % plot(t,decoded_ms,'-k'); hold on
  % pause(.1);
endfor
subplot(2, 3, 5)
plot(t,decoded_ms,'-k');
legend('Demodulacion')
