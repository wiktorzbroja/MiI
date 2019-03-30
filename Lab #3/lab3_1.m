%[wn,fs]=audioread('WhiteNoise2018.wav');
%[hn, fs]=audioread('HarmNoise2018.wav');
subplot(211)
periodogram(wn,[],[],fs)
subplot(212)
periodogram(hn,[],[],fs)

figure(2)

subplot(211)
pwelch(wn,[],[],[],fs)
subplot(212)
pwelch(hn,[],[],[],fs)