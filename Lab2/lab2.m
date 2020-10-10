% LABORATORIO 2 - Transmisi�n digital de se�ales analogicas

%---------------Muestreo----------------------

to = 1;     %Duraci�n de la se�al mensaje 
fo = 1;       %Frecuencia de la se�al
T = 1/100;    %Intervalo de muestreo
F = 1/T;      %Frecuencia de muestreo

t = [0:T:to];                     %Muestras de tiempo
x = inline('3*cos(2*pi*t)','t');  %Se�al muestreada
 
%x = inline('1*cos(2*pi*t) + 1.5*sin(10*t)','t');

X = fft(x(t)) * T;                %Transformada de Fourier

subplot(2,1,1);
stem(t,x(t));
xlabel('');ylabel('');grid;
axis([-0.1 1.1 -3.1 3.1]);

%---------------Cuantizaci�n-------------------

xmax = 3;     %Amplitud maxima 
n = 2;        %Bits para cuantizaci�n (2^n = Zonas)
%n = 3;        
xq = cuantUni(x(t),xmax,n);   %Cuantificar vector

subplot(2,1,2);
stem(t,xq);
xlabel('');ylabel('');grid;
axis([-0.1 1.1 -3.1 3.1]);

%----------------Codificaci�n-------------------

xc = codifi(xq,xmax,n);     %Codificar vector (numeros)
xc = codifiBits(xc,n);      %Codificar vector (bits)

%-----------------Se�alizaci�n------------------

m = 5;                      %Muestras para graficar pulso de la se�alizaci�n
sm = sManchester(xc, 2, m); %Se�alizaci�n Manchester
t = 0:m*2*length(xc) - 1;   %Vector de tiempo para se�alizaci�n  

figure(2);
plot(t,sm);
xlabel('');ylabel('');grid;
axis([-1 m*2*length(xc)-1 -xmax-0.5 xmax+0.5]);

%-----------------Recuperaci�n se�al-------------