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
figure(4)
subplot(211)
periodogram(z1,[],[],fs)
subplot(212)
periodogram(z2,[],[],fs)
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


