% Script OCTAVE para observar la transformada de Fourier de una función periódica.
% Muestreando una señal sinusoidal  de 1 Hz se ilustra cómo es la señal y su espectro.

T=1;         % duración de la señal
f0=1;        % valor de la frecuencia lineal

fs=50*f0; 
Ts=1/fs;     % intervalo de muestreo y frecuencia de muestreo
t=[0:Ts:T];  % vector de tiempo
x=cos(20*pi*f0*t); 
X=fft(x)*Ts; % sinusoidal muestreada y su transformada de Fourier
f=[0:50];    % vector de frecuencias

% printf("Presione <ENTER> para ver gráficas de la sinusoidal muestreada y de su espectro de magnitud"); pause; clf;
%%%%%%%%%%%%%%%%
subplot(2,1,1); 
plot(t,x,'k'); 
axis([0 1 -1.1 1.1]); 
xlabel('nT_s'); 
ylabel('x(nT_s)');

%%%%%%%%%%%%%%%%
subplot(2,1,2); 
plot(f-(fs/2),fftshift(abs(X)),'k'); 
axis([-25 25 -0.6 0.6]); 
xlabel('f'); 
ylabel('|X(f)|');