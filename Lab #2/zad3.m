clc
clear all

[x, fs]=audioread('whitenoise2018.wav');
[y, fs]=audioread('whitenoise_rec2018.wav');

t=[0:1/fs:(length(x)-1)/fs]*1000;

Y=fft(y);
X=fft(x);
H=Y./X;

h=ifft(H);

plot(t,h)
set(gcf,'color','w');
axis([0 50 min(h) max(h)])
xlabel('Czas [ms]')
ylabel('Amplituda [j]')
title( 'Odpowiedü impulsowa')

[wmax index] = max(h);
v_dz = 320;
d = t(index) * v_dz
t(index)
