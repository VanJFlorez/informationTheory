% Script OCTAVE para verificar la operaci�n de la funci�n cuantUniforme.

% Se determinan las caracter�sticas de transferencia (entrada-salida) de un cuantizador de 3 bits operando sobre (-10,10).

x=(-10:.0001:10);
xsq=cuantUniforme(x,10,3);
% printf("Presione <ENTER> para ver una gr�fica de la caracter�stica de entrada-salida del cuantizador"); 
% pause; 
% clf;

plot(x,xsq,'k'); % esta grafica es analoga a la 5-5
grid; 
xlabel('Entrada cuantizador'); 
ylabel('Salida cuantizador');

% Cuantizando una se�al sinusoidal  de 1 Hz se ilustra c�mo la cuantizaci�n cambia una se�al y su espectro.

t0=1;           % duraci�n de la se�al
f = 1;          % frecuencia de la senal = 1 Hz
Ts=1/50;        % intervalo de muestreo 
fs=1/Ts;        % frecuencia de muestreo. Notar que fs = 50, estamos tomando 50
                % muestras por periodo, m�s alla del doble que sugiere el teorema
                % del muestreo, estamos sobrados. Aqu� el minimo de muestras ser�a
                % 2, pues es el minimo para el 1Hz con el que se esta trabajando 
                % para la senal sinunoidal de ejemplo.
                              
t=[0:Ts:t0];                  % vector de tiempo
x=cos(2*pi*f*t); 
X=fft(x)*Ts;   			    	  % sinusoidal muestreada y su transformada de Fourier
xq=cuantUniforme(x,1,2); 
Xq=fft(xq)*Ts;           	  % sinusoidal cuantizada y su transformada de Fourier
f=[0:50];                     % vector de frecuencias

% printf("Presione <ENTER> para ver gr�ficas de la sinusoidal muestreada y cuantizada y de sus espectros de magnitud"); 
% pause; 
% clf;

figure(2)

subplot(2,2,1); 
stem(t,x,'k'); 
axis([0 1 -1.1 1.1]); 
xlabel('nT_s'); 
ylabel('x(nT_s)');


subplot(2,2,2); 
stem(f-(fs/2),fftshift(abs(X)),'k');  % despla f - (fs/2) son corrimientos en frecuencia para q quede centrada
axis([-25 25 -0.6 0.6]); 
xlabel('f'); 
ylabel('|X(f)|');


subplot(2,2,3); 
stem(t,xq,'k'); 
axis([0 1 -1.1 1.1]); 
xlabel('nT_s'); 
ylabel('x_q(nT_s)');


subplot(2,2,4); 
stem(f-(fs/2),fftshift(abs(Xq)),'k'); 
axis([-25 25 -0.6 0.6]); 
xlabel('f'); 
ylabel('|X_q(f)|');