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

subplot(211)
title('ten pierwszy mod')
semilogx(f,20*log10(mod(1:length(Y)/2+1)))
grid on
subplot(212)
title('ten katowy')
semilogx(f, phase(1:length(Y)/2+1))
grid on
