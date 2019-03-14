clc
clear all

[x, fs]=audioread('whitenoise2018.wav');
[y, fs]=audioread('whitenoise_rec2018.wav');

fn=fs/2;
f=0:1/fs:fn;

Y=fft(y);
X=fft(x);
H=Y./X;
mod=abs(H);
phase=unwrap(angle(H));

df=2*fn/length(Y);
f=0:df:fn;

subplot(221)
title('wykres amplitudowo-cz�stotliwo�ciowy (skala logarytmiczna)')
ylabel('Wzmocnienie [-]');
xlabel('cz�stotliwo�� [Hz]');
semilogx(f,20*log10(mod(1:length(Y)/2+1)))
grid on
subplot(223)
title('wykres fazowo-cz�stotliwo�ciowy')
ylabel('przesuni�cie w fazie [rad]');
xlabel('cz�stotliwo�� [Hz]');
semilogx(f, phase(1:length(Y)/2+1))
grid on
subplot(222)
title('wykres amplitudowo-cz�stotliwo�ciowy (skala liniowa)')
ylabel('Wzmocnienie [-]');
xlabel('cz�stotliwo�� [Hz]');
plot(f,20*log10(mod(1:length(Y)/2+1)))
grid on
subplot(224)
title('wykres fazowo-cz�stotliwo�ciowy')
ylabel('przesuni�cie w fazie [rad]');
xlabel('cz�stotliwo�� [Hz]');
plot(f, phase(1:length(Y)/2+1))
grid on
