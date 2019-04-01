[lpc_n,fs]=audioread('LPC_noise2018.wav');
figure (1)
set(gcf,'color','w');
subplot(211)
periodogram(lpc_n,[],[],fs)
title('Gêstoœæ widmowa mocy sygna³u - Periodogram')
xlabel('Czêstotliwoœæ [kHz]')
ylabel('Gêstoœæ widmowa mocy [dB/Hz]')

subplot(212)
pwelch(lpc_n,[],[],[],fs)
title('Gêstoœæ widmowa mocy sygna³u - met. Welcha')
xlabel('Czêstotliwoœæ [kHz]')
ylabel('Gêstoœæ widmowa mocy [dB/Hz]')

figure (2)
p=13;
[a,g] = lpc(lpc_n,p);
est_x= filter([0 -a(2:end)],1,lpc_n);
e = lpc_n -est_x;
[acs,lags] = xcorr(e,'coeff');
set(gcf,'color','w');
subplot(211)
plot(lags,acs), grid
title 'Autokorelacja b³êdu predykcji'
xlabel 'OpóŸnienie', ylabel 'Wartoœæ znormalizowana'

subplot(212)
yi = randn(length(lpc_n),1);
[acs2,lags] = xcorr(yi,'coeff');
plot(lags,acs2)
title 'Autokorelacja szumu bia³ego'
xlabel 'OpóŸnienie', ylabel 'Wartoœæ znormalizowana'

figure (3)
set(gcf,'color','w');
[h,w] = freqz(1,a);
plot(w/pi*fs/2*1e-3,20*log10(abs(h)))
grid
ylabel('Amplituda (dB)')
xlabel('Czêstotliwoœæ [kHz]')
title('OdpowiedŸ impulsowa odwróconego filtru wybielaj¹cego')

figure(4)
set(gcf,'color','w');
X = fft(lpc_n)
plot(20.*log10(abs(X(1:length(X)/2))))
grid on
axis tight