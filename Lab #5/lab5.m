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
periodogram(yp,[],[],fs);
hold on

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
<<<<<<< HEAD
set(gcf,'color','w');
% subplot(221)
% plot(y1)
% subplot(222)
% plot(y2,'r')
t=1/fs:1/fs:length(Y)/fs;
subplot(211)
plot(t,z1)
title('Kana³ lewy')
xlabel('Czas [s]')
ylabel('Amplituda [-]')
axis([0 9 -0.1 0.1])
subplot(212)
plot(t,z2)
title('Kana³ prawy')
xlabel('Czas [s]')
ylabel('Amplituda [-]')
axis([0 9 -0.1 0.1])
%% spektrogramy kana³ów po filtrowanku
=======
subplot(221)
plot(y1)
subplot(222)
plot(y2,'r')
subplot(223)
plot(z1)
subplot(224)
plot(z2,'r')

%% periodogramy kana³ów po filtrowanku
>>>>>>> 1c19b4a91f3edcfdf66e2765fdd8b331513da1d6
figure(4)
subplot(211)
periodogram(z1,[],[],fs)
subplot(212)
periodogram(z2,[],[],fs)
<<<<<<< HEAD
%% 
figure(5)
set(gcf,'color','w');
t=1/fs:1/fs:length(Y)/fs;
subplot(211)
plot(t,y2)
title('Kana³ prawy -przed filtracj¹')
xlabel('Czas [s]')
ylabel('Amplituda [-]')
axis([0 9 -0.3 0.3])
subplot(212)
plot(t,z2)
title('Kana³ prawy - po filtracji')
xlabel('Czas [s]')
ylabel('Amplituda [-]')
axis([0 9 -0.1 0.1])
%% 
% figure(6)
% set(gcf,'color','w');
% w = linspace(0,34636,10000);
% h1=bodeplot(filt1,w);
% setoptions(h1,'FreqUnits','kHz', 'PhaseUnits', 'rad','FreqScale','linear')
% grid on
% xlabel('Czestotliwosc')
% ylabel('Faza')
% title('Wykres Bodego dla filtru FIR')


=======

%% spektogram odfiltrowanego chuja
figure(5)
subplot(211)
spectrogram(z1,WINDOW,NOVERLAP,NFFT,fs)
axis([0 0.25 2 3]);
subplot(212)
axis([0 0.25 2 3]);
spectrogram(z2,WINDOW,NOVERLAP,NFFT,fs)
axis([0 0.25 2 3]);

%% autokorelacja (prawy kana³ wygryw)
[Rxy(:,1) lags] = xcorr(y1,yp);
[Rxy(:,2) lags] = xcorr(y2,yp);
n1 = length(Rxy(:,2));
figure(6)
subplot(121)
plot(Rxy(n1/2:n1,1))
subplot(122)
plot(Rxy(n1/2:n1,2))
[ val, t1 ] = max(Rxy(n1/2:n1,2));
t1 = t1/fs % wtedy siê zaczyna

%% jakiœ inny filter
Z = filter(fliplr(yp),1,Y);

%% wykresy czasowe przed i po filtrowanku
figure(7)
subplot(211)
plot(Z(:,1))
subplot(212)
plot(Z(:,1),'r')

%% czesc 3 -- nieeee too  chyba trzeba by³o
Yp = fft(fliplr([yp zeros(1,length(Y)-length(yp))]));
% Yp = fft([fliplr(yp), zeros(1,length(Y)-length(yp))]);
Yf = fft(Y);
% Rxy2(:,1) = ifft(Yf(:,1)'.*conj(Yp)); %nie to samo :C
% Rxy2(:,2) = ifft(Yf(:,2)'.*conj(Yp));
% n2 = length(Rxy2(:,2));
% figure(8)
% subplot(121)
% plot(Rxy2(n2/2:n2,1))
% subplot(122)
% plot(Rxy2(n2/2:n2,2))

%% liczenie odpowiedzi (powinno wyjœæ to co na F. 7)
Z2(:,1) = ifft(Yf(:,1)'.*(Yp));
Z2(:,2) = ifft((Yp).*Yf(:,2)');
figure(8)
subplot(211)
plot(Z2(:,1))
subplot(212)
plot(Z2(:,2))
>>>>>>> 1c19b4a91f3edcfdf66e2765fdd8b331513da1d6
