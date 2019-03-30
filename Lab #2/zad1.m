clc
clear all

[x, fs]=audioread('whitenoise2018.wav');
[y, fs]=audioread('whitenoise_rec2018.wav');


Rxx= xcorr(x,x);
Rxy= xcorr(x,y);

t=(-length(Rxx)/2:length(Rxx)/2-1)/fs;%wektor czasu w s
figure(1)
subplot(211)
set(gcf,'color','w');
%plot(t,Rxx)
semilogy(t,Rxx)
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

[wmax index] = max(Rxy);
v_dz = 320;
d = t(index) * v_dz;

% figure(2)
% periodogram(x)
% [Pxx, F] = periodogram(x,[],'power',fs);
% plot(F,Pxx);
% 
% figure(3)
% N=length(x);
% N2=round(N/2);
% T=max(t);
% df=fs/N; 
% f=(0:N2)*df ;
% X2=fft(x);
% %X=sqrt(X2.*conj(X2));
% X=abs(X2);
% Sx=X*(1/df)*(1/df)*N/2; %gêstoœæ energii
% Gx=Sx/T; % gêstoœæ mocy
% plot(f(1:N2),(Gx(1:N2)))

% znormalizowane PSD
figure(2)
L=length(x);
X=fft(x);
f = fs./2.*linspace(0,1,L/2);
% mno¿enie przez dwa daje jednostronne, dzielenie przez N^2 daje skalowanie
% tylko jeœli N to liczba próbek i dodatkowo u¿yta przy fft
Pxx = 2.*(X(1:L/2).*conj(X(1:L/2)))./L./L;
plot(f,Pxx);
axis tight;
grid on;
set(gcf,'color','w');
axis tight
title('Widmowa gestosc mocy');
xlabel('Czêstotliwoœæ [Hz]')
ylabel('Gêstoœæ widmowa [j^2/Hz]')