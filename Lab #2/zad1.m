clc
clear all

[x, fs]=audioread('whitenoise2018.wav');
[y, fs]=audioread('whitenoise_rec2018.wav');


Rxx= xcorr(x,x);
Rxy= xcorr(x,y);

t=(-length(Rxx)/2:length(Rxx)/2-1)/fs;%wektor czasu w Hz
subplot(211)
set(gcf,'color','w');
plot(t,Rxx)
axis tight %ustawienie limitu osi do zakresu danych
%axis([-100 100 min(Rxx) max(Rxx)])
xlabel('Czas [s]')
ylabel('Rxx [j^2]')
title( 'Autokorelacja Rxx')
subplot(212)
plot(t,Rxy)
axis tight
%axis([-100 100 min(Rxy) max(Rxy)])
xlabel('Czas [s]')
ylabel('Rxy [j^2]')
title( 'Korelacja Rxy')

[max index] = max(Rxy);
v_dz = 320;
d = t(index) * v_dz;