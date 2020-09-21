%

To = 1;   
fo = 1;
f = 50*fo;    
T = 1/f;  
a = 0.25;     %Segmento -> T/4

pa = inline('(abs(t) < a)','t');
t = [-To/2:T:To/2];

%Grafica de pulso rectangular pa

subplot(3,1,1);
stem(t, pa(t),'b');
xlabel("t");ylabel('x(t)');legend('x(t)');
grid;

%Transformada de Fourier normal

sa = inline('(sin(x) + (x==0))./ (x + (x==0))','x');
w = [-f/2:f/2];
subplot(3,1,2);
stem(w,abs(2*a*sa(w*a)), 'm');
xlabel("w");ylabel('X(w)');legend('F(x(t))');
grid;

%Transformada de Fourier usando FFT

subplot(3,1,3);
stem(w,abs(fftshift(fft(pa(t)) * T)));
xlabel("w");ylabel('X(w)');legend('FFT(x(t))');
grid;

%--------------------Filtros------------------

wc = 5;
wc2 = 15;

%Low Pass Filter

LPF = inline('(abs(w) <= wc)','w');
y1 = fftshift(fft(pa(t)) * T) .* LPF(w);

figure(2);

subplot(4,3,1);
plot(w,fftshift(fft(pa(t)) * T));
xlabel('\omega');ylabel('X(\omega)');title('FFT');
axis([-30 30 -0.4 0.8]);
grid;

subplot(4,3,2);
plot(w,y1);
xlabel('\omega');ylabel('Y(\omega)');title('LPF de FFT');
axis([-30 30 -0.4 0.8]);
grid;

subplot(4,3,3);
plot(t,abs(ifft(ifftshift(y1))) / T,'r',t, pa(t),'c');
xlabel('t');ylabel('y(t)');title('LPF de senal');
axis([-0.8 0.8 -0.5 1.2]);legend('y(t)','pa(t)');
grid;

%High Pass Filter

HPF = inline('(abs(w) >= wc)','w');
y2 = fftshift(fft(pa(t)) * T) .* HPF(w);

subplot(4,3,4);
plot(w,fftshift(fft(pa(t)) * T));
xlabel('\omega');ylabel('X(\omega)');title('FFT');
axis([-30 30 -0.4 0.8]);
grid;

subplot(4,3,5);
plot(w,y2);
xlabel('\omega');ylabel('Y(\omega)');title('HPF de FFT');
axis([-30 30 -0.4 0.8]);
grid;

subplot(4,3,6);
plot(t,abs(ifft(ifftshift(y2))) / T,'r',t, pa(t),'c');
xlabel('\t');ylabel('y(t)');title('HPF de señal');
axis([-0.8 0.8 -0.5 1.2]);legend('y(t)','pa(t)');
grid;

%Band Pass Filter

BPF = inline('(wc <= abs(w)) & (abs(w) <= wc2)','w');
y3 = fftshift(fft(pa(t)) * T) .* BPF(w);

subplot(4,3,7);
plot(w,fftshift(fft(pa(t)) * T));
xlabel('\omega');ylabel('X(\omega)');title('FFT');
axis([-30 30 -0.4 0.8]);
grid;

subplot(4,3,8);
plot(w,y3);
xlabel('\omega');ylabel('Y(\omega)');title('BPF de FFT');
axis([-30 30 -0.4 0.8]);
grid;

subplot(4,3,9);
plot(t,abs(ifft(ifftshift(y3))) / T,'r',t, pa(t),'c');
xlabel('t');ylabel('y(t)');title('BPF de señal');
axis([-0.8 0.8 -0.5 1.2]);legend('y(t)','pa(t)');
grid;

%Band Pass Filter

BSF = inline('!((wc <= abs(w)) & (abs(w) <= wc2))','w');
y4 = fftshift(fft(pa(t)) * T) .* BSF(w);

subplot(4,3,10);
plot(w,fftshift(fft(pa(t)) * T));
xlabel('\omega');ylabel('X(\omega)');title('FFT');
axis([-30 30 -0.4 0.8]);
grid;

subplot(4,3,11);
plot(w,y4);
xlabel('\omega');ylabel('Y(\omega)');title('BSF de FFT');
axis([-30 30 -0.4 0.8]);
grid;

subplot(4,3,12);
plot(t,abs(ifft(ifftshift(y4))) / T,'r',t, pa(t),'c');
xlabel('\t');ylabel('y(t)');title('BSF de señal');
axis([-0.8 0.8 -0.5 1.2]);legend('y(t)','pa(t)');
grid;

figure(3)
subplot(4, 1, 1)
plot(w,LPF(w));
subplot(4, 1, 2)
plot(w,HPF(w));
subplot(4, 1, 3)
plot(w,BPF(w));
subplot(4, 1, 4)
plot(w,BSF(w));


