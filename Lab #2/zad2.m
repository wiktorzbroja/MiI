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
figure(1)
set(gcf,'color','w');

subplot(221)
semilogx(f,20*log10(mod(1:length(Y)/2+1)))
title('wykres amplitudowo-częstotliwościowy (skala logarytmiczna)')
ylabel('Wzmocnienie [-]');
xlabel('częstotliwość [Hz]');
grid on

subplot(223)
semilogx(f, phase(1:length(Y)/2+1))
title('wykres fazowo-częstotliwościowy')
ylabel('przesunięcie w fazie [rad]');
xlabel('częstotliwość [Hz]');
grid on

subplot(222)
plot(f,20*log10(mod(1:length(Y)/2+1)))
title('wykres amplitudowo-częstotliwościowy (skala liniowa)')
ylabel('Wzmocnienie [-]');
xlabel('częstotliwość [Hz]');
grid on

subplot(224)
plot(f, phase(1:length(Y)/2+1))
title('wykres fazowo-częstotliwościowy')
ylabel('przesunięcie w fazie [rad]');
xlabel('częstotliwość [Hz]');
grid on
