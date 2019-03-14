clc
clear all

[x, fs]=audioread('whitenoise2018.wav');
[y, fs]=audioread('whitenoise_rec2018.wav');

Rxx= xcorr(x,x);
Rxy= xcorr(x,y);

subplot(211)
plot((-length(Rxx)/2:length(Rxx)/2-1)/fs,Rxx)
axis tight
xlabel('time in [s]')
ylabel('Rxx')
title( 'Autocorrelation Rxx')
subplot(212)
plot((-length(Rxy)/2:length(Rxy)/2-1)/fs,Rxy)
axis tight
xlabel('time in [s]')
ylabel('Rxy')
title( 'Crosscorrelation Rxy')