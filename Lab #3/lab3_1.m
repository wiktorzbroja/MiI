[wn,fs]=audioread('WhiteNoise2018.wav');
[hn, fs]=audioread('HarmNoise2018.wav');
subplot(211)
set(gcf,'color','w');
periodogram(wn,[],[],fs)
title('Gêstoœæ widmowa mocy szumu bia³ego - Periodogram')
xlabel('Czêstotliwoœæ [kHz]')
ylabel('Gêstoœæ widmowa mocy [dB/Hz]')

subplot(212)
periodogram(hn,[],[],fs)
title('Gêstoœæ widmowa mocy szumu bia³ego i sinusoidy - Periodogram')
xlabel('Czêstotliwoœæ [kHz]')
ylabel('Gêstoœæ widmowa mocy [dB/Hz]')

figure(2)
set(gcf,'color','w');
subplot(211)
pwelch(wn,[],[],[],fs)
title('Gêstoœæ widmowa mocy szumu bia³ego - met. Welcha')
xlabel('Czêstotliwoœæ [kHz]')
ylabel('Gêstoœæ widmowa mocy [dB/Hz]')

subplot(212)
pwelch(hn,[],[],[],fs)
title('Gêstoœæ widmowa mocy szumu bia³ego i sinusoidy - met. Welcha')
xlabel('Czêstotliwoœæ [kHz]')
ylabel('Gêstoœæ widmowa mocy [dB/Hz]')