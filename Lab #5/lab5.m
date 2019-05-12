load Pulse
[Y,fs]=audioread('Nabucco.wav');
WINDOW=4000
NOVERLAP=2000
NFFT=5000
figure(1)
spectrogram(yp,WINDOW,NOVERLAP,NFFT,fs)
figure(2)
periodogram(yp,[],[],fs)


figure(3)
 [b,a] = tfdata(filt1,'v');
% sound(Y,fs)
 z = filter(b,a,Y);
 sound(z,fs)

y1=Y(:,1);
y2=Y(:,2);
subplot(211)
plot(y1)
subplot(212)
plot(y2,'r')
figure(4)
z1 = filter(b,a,y1);
z2 = filter(b,a,y2);
subplot(211)
plot(z1)
subplot(212)
plot(z2,'r')