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

%filt dolnoprzepustowy
%            K
%G(s) = -------------
%       T*2pi*j*f + 1
K = ones(1,length(f));
w0=2*pi/fn;
F = K./(1+w0.*f.*1i);

H=Y.*(F')./X;

mod = abs(H);
phase = unwrap(angle(F));

figure(1)
set(gcf,'color','w');

subplot(221)
semilogx(f,20*log10(mod))
title('wykres amplitudowo-czêstotliwoœciowy (skala logarytmiczna)')
ylabel('Wzmocnienie [-]');
xlabel('czêstotliwoœæ [Hz]');
grid on

subplot(223)
semilogx(f, phase)
title('wykres fazowo-czêstotliwoœciowy')
ylabel('przesuniêcie w fazie [rad]');
xlabel('czêstotliwoœæ [Hz]');
grid on

subplot(222)
plot(f,20*log10(mod))
title('wykres amplitudowo-czêstotliwoœciowy (skala liniowa)')
ylabel('Wzmocnienie [-]');
xlabel('czêstotliwoœæ [Hz]');
grid on

subplot(224)
plot(f, phase)
title('wykres fazowo-czêstotliwoœciowy')
ylabel('przesuniêcie w fazie [rad]');
xlabel('czêstotliwoœæ [Hz]');
grid on
