% LABORATORIO 2 - Transmisi�n digital de se�ales analogicas

%---------------Muestreo----------------------
clear;
clc;

t0 = 1;     %Duraci�n de la se�al mensaje 
f0 = 1;       %Frecuencia de la se�al
T = 1/100;    %Intervalo de muestreo
F = 1/T;      %Frecuencia de muestreo

t = [0:T:t0];                     %Muestras de tiempo
%x = inline('3*cos(2*pi*t)','t');  %Se�al muestreada
%x = inline('4*cos(2*pi*t) + 1.5*cos(10*t)','t');
x = inline('0.5*sin(2*pi*t) + 1.5*sin(10*t)','t');
%x = inline('1*cos(2*pi*t) + 1.5*sin(10*t)','t');

X = fft(x(t)) * T;                %Transformada de Fourier

subplot(3,1,1);
stem(t,x(t));
xlabel('t');ylabel('x(t)');grid;
title('Muestreo');
axis([-0.1 1.1 -3.1 3.1]);

%---------------Cuantizaci�n-------------------

xmax = 5;     %Amplitud maxima 
n = 2;        %Bits para cuantizaci�n (2^n = Zonas)
%n = 3;        
xq = cuantUni(x(t),xmax,n);   %Cuantificar vector

subplot(3,1,2);
stem(t,xq);
xlabel('t');ylabel('x(t)');grid;
title('Cuantizaci�n');
axis([-0.1 1.1 -3.1 3.1]);

%----------------Codificaci�n-------------------

xc = codifi(xq,xmax,n)     %Codificar vector (numeros)
xc = codifiBits(xc,n)      %Codificar vector (bits)

%-----------------Se�alizaci�n------------------

m = 15;                 %Muestras para graficar pulso de la se�alizaci�n
figure(2);

%UNRZ

sm = repelem(UNRZ(xc, xmax),m); %Se�alizaci�n UNRZ
t = 0:m*length(xc) - 1  ; %Vector de tiempo para se�alizaci�n  

subplot(3,2,1);
plot(t,sm);
xlabel('');ylabel('');grid;
title('Se�alizaci�n UNRZ');
axis([-1 m*length(xc)-1 -xmax-0.5 xmax+0.5]);

%BNRZ

sm = repelem(BNRZ(xc, xmax),m); %Se�alizaci�n BNRZ
t = 0:m*length(xc) - 1;   %Vector de tiempo para se�alizaci�n  

subplot(3,2,2);
plot(t,sm);
xlabel('');ylabel('');grid;
title('Se�alizaci�n BNRZ');
axis([-1 m*length(xc)-1 -xmax-0.5 xmax+0.5]);

%URZ

sm = repelem(URZ(xc, xmax),m); %Se�alizaci�n URZ
t = 0:m*2*length(xc) - 1 ;  %Vector de tiempo para se�alizaci�n  

subplot(3,2,3);
plot(t,sm);
xlabel('');ylabel('');grid;
title('Se�alizaci�n URZ');
axis([-1 m*2*length(xc)-1 -xmax-0.5 xmax+0.5]);

%BRZ

sm = repelem(BRZ(xc, xmax),m); %Se�alizaci�n BRZ
t = 0:m*2*length(xc) - 1 ;  %Vector de tiempo para se�alizaci�n  

subplot(3,2,4);
plot(t,sm);
xlabel('');ylabel('');grid;
title('Se�alizaci�n BRZ');
axis([-1 m*2*length(xc)-1 -xmax-0.5 xmax+0.5]);

%AMI RZ

sm = repelem(AMIRZ(xc, xmax),m); %Se�alizaci�n AMI RZ
t = 0:m*2*length(xc) - 1;   %Vector de tiempo para se�alizaci�n  

subplot(3,2,5);
plot(t,sm);
xlabel('');ylabel('');grid;
title('Se�alizaci�n AMI RZ');
axis([-1 m*2*length(xc)-1 -xmax-0.5 xmax+0.5]);

%MANCHESTER

sm = repelem(sManchester(xc, xmax),m); %Se�alizaci�n Manchester
t = 0:m*2*length(xc) - 1;   %Vector de tiempo para se�alizaci�n  

subplot(3,2,6);
plot(t,sm);
xlabel('');ylabel('');grid;
title('Se�alizaci�n Manchester');
axis([-1 m*2*length(xc)-1 -xmax-0.5 xmax+0.5]);

%-----------------Recuperaci�n se�al-------------

figure(1);
sa=inline('(sin(x)+(x==0))./(x+(x==0))','x');
t = 0:T:t0;
decoded_ms = 0;
for j = t  % cada j es un paso de Ts
  decoded_ms += x(j)*sa(2*pi*f0*(t - j)); % la forma correcta es multiplicar por ms, no por m(ts)
endfor
subplot(3,1,3);
plot(t,decoded_ms,'-k');
xlabel('t');ylabel('x(t)');grid;
title('Recuperaci�n');
