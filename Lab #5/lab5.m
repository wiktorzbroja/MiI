load Pulse
[Y,fs]=audioread('Nabucco.wav');
y1=Y(:,1);
y2=Y(:,2);

WINDOW=4000
NOVERLAP=2000
NFFT=5000
figure(1)
spectrogram(yp,WINDOW,NOVERLAP,NFFT,fs)
figure(2)
periodogram(yp,[],[],fs)

%%tworzenie filtru
% sptool -> bandpass 0.02 0.08 0.164 0.224
 [b,a] = tfdata(filt1,'v');
% sound(Y,fs)
 z = filter(b,a,Y);
 sound(z,fs)
 
%% filtrowanko
z1 = filter(b,a,y1);
z2 = filter(b,a,y2);

%% wykresy czasowe przed i po filtrowanku
figure(3)
subplot(221)
plot(y1)
subplot(222)
plot(y2,'r')
subplot(223)
plot(z1)
subplot(224)
plot(z2,'r')

%% periodogramy kana��w po filtrowanku
figure(4)
subplot(211)
periodogram(z1,[],[],fs)
subplot(212)
periodogram(z2,[],[],fs)

%% spektogram odfiltrowanego chuja
figure(5)
spectrogram(z2,WINDOW,NOVERLAP,NFFT,fs)