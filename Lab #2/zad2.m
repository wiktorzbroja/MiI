clc
clear all

[x, fs]=audioread('whitenoise2018.wav');
[y, fs]=audioread('whitenoise_rec2018.wav');

fn = fs/2;

Y=fft(y);
Y=Y(1:length(Y)/2+1);
X=fft(x);
X=X(1:length(X)/2+1);

df=fn/length(Y);
f=0:df:fn-df;

%filtr dolnoprzepustowy
%            K
%G(s) = -------------
%       T*2pi*j*f + 1

fgr = 500; %[Hz] Dobrałem tak, żeby w paśmie przenoszenia w miarę było gładkie
% K = ones(1,length(f));
% w0=2*pi/fgr;
% F = K./(1+w0.*f.*1i);
H=Y./X;
% Hf=H.*(F');
Hf=lowpass(H,fgr,fs);
%H = Hf;

mod = abs(H);
phase = unwrap(angle(H));

figure(1)
set(gcf,'color','w');

subplot(221)
semilogx(f,20*log10(mod))
title('Wykres amplitudowo-częstotliwościowy (skala logarytmiczna)')
ylabel('Wzmocnienie [dB]');
xlabel('Częstotliwość [Hz]');
grid on
axis tight
%axis([min(f) fn -5 5])

subplot(223)
semilogx(f, phase)
title('Wykres fazowo-częstotliwościowy')
ylabel('Przesunięcie w fazie [rad]');
xlabel('Częstotliwość [Hz]');
grid on
axis tight

subplot(222)
plot(f,20*log10(mod))
title('Wykres amplitudowo-częstotliwościowy (skala liniowa)')
ylabel('Wzmocnienie [dB]');
xlabel('Częstotliwość [Hz]');
grid on
axis tight
%axis([min(f) fn -5 5])

subplot(224)
plot(f, phase)
title('Wykres fazowo-częstotliwościowy')
ylabel('Przesunięcie w fazie [rad]');
xlabel('Częstotliwość [Hz]');
grid on
axis tight