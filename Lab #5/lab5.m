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
subplot(211)
spectrogram(z1,WINDOW,NOVERLAP,NFFT,fs)
axis([0 0.25 2 3]);
subplot(212)
axis([0 0.25 2 3]);
spectrogram(z2,WINDOW,NOVERLAP,NFFT,fs)
axis([0 0.25 2 3]);

%% autokorelacja (prawy kana� wygryw)
[Rxy(:,1) lags] = xcorr(y1,yp);
[Rxy(:,2) lags] = xcorr(y2,yp);
n1 = length(Rxy(:,2));
figure(6)
subplot(121)
plot(Rxy(n1/2:n1,1))
subplot(122)
plot(Rxy(n1/2:n1,2))
[ val, t1 ] = max(Rxy(n1/2:n1,2));
t1 = t1/fs % wtedy si� zaczyna

%% jaki� inny filter
Z = filter(fliplr(yp),1,Y);

%% wykresy czasowe przed i po filtrowanku
figure(7)
subplot(211)
plot(Z(:,1))
subplot(212)
plot(Z(:,1),'r')

%% czesc 3
Yp = fft([yp zeros(1,length(Y)-length(yp))]);
Yf = fft(Y);
Rxy2(:,1) = Yf(:,1).*conj(Yp);
Rxy2(:,2) = Yf(:,2).*conj(Yp);