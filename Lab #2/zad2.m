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
fgr = fn;
w0=2*pi/fgr;
F = K./(1+w0.*f.*1i);
H=Y./X;
Hf=H.*(F');
H = Hf;

mod = abs(H);
phase = unwrap(angle(F));

figure(1)
set(gcf,'color','w');

subplot(221)
semilogx(f,20*log10(mod))
title('wykres amplitudowo-czêstotliwoœciowy (skala logarytmiczna)')
ylabel('Wzmocnienie [dB]');
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
ylabel('Wzmocnienie [dB]');
xlabel('czêstotliwoœæ [Hz]');
grid on

subplot(224)
plot(f, phase)
title('wykres fazowo-czêstotliwoœciowy')
ylabel('przesuniêcie w fazie [rad]');
xlabel('czêstotliwoœæ [Hz]');
grid on

ma_nr = 100;
H_ma = H;
for i=1:length(H)
    if  length(H)-ma_nr > i > ma_nr
        H_ma(i) = mean(H(i-ma_nr:i+ma_nr)); 
    else
        if i < ma_nr
            H_ma(i) = mean(H(1:i+ma_nr));
        else
            H_ma(i) = mean(H(i-ma_nr:-1));
        end
    end
end
figure(2)
plot(f,abs(H_ma))
