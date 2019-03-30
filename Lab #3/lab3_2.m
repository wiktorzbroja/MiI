%[lpc_n,fs]=audioread('LPC_noise2018.wav');
figure (1)
subplot(211)
periodogram(lpc_n,[],[],fs)
subplot(212)
pwelch(lpc_n,[],[],[],fs)

p=13;
[a,g] = lpc(lpc_n,p);
est_x= filter([0 -a(2:end)],1,lpc_n);
e = lpc_n -est_x;
[acs,lags] = xcorr(e,'coeff');
figure (2)
subplot(211)
plot(lags,acs), grid
title 'Autocorrelation of the Prediction Error'
xlabel 'Lags', ylabel 'Normalized value'
subplot(212)
yi = randn(length(lpc_n),1);
[acs2,lags] = xcorr(yi,'coeff');
plot(lags,acs2)

figure (3)
[h,w] = freqz(1,a);
plot(w/pi*fs/2*1e-3,20*log10(abs(h)))
grid
ylabel('Magnitude (dB)')
xlabel('Frequency in kHz')
title('Estimated spectrum')

figure(4)
X = fft(lpc_n)
plot(20.*log10(abs(X(1:length(X)/2))))
grid on
axis tight