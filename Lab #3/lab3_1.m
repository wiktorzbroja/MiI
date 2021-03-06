[wn,fs]=audioread('WhiteNoise2018.wav');
[hn, fs]=audioread('HarmNoise2018.wav');
% subplot(211)
% set(gcf,'color','w');
% periodogram(wn,[],[],fs)
% title('G�sto�� widmowa mocy szumu bia�ego - Periodogram')
% xlabel('Cz�stotliwo�� [kHz]')
% ylabel('G�sto�� widmowa mocy [dB/Hz]')
% 
% subplot(212)
% periodogram(hn,[],[],fs)
% title('G�sto�� widmowa mocy szumu bia�ego i sinusoidy - Periodogram')
% xlabel('Cz�stotliwo�� [kHz]')
% ylabel('G�sto�� widmowa mocy [dB/Hz]')

figure(2)
set(gcf,'color','w');
subplot(211)
pwelch(wn,win,orlp,[],fs)
title('G�sto�� widmowa mocy szumu bia�ego - met. Welcha')
xlabel('Cz�stotliwo�� [kHz]')
ylabel('G�sto�� widmowa mocy [dB/Hz]')
axis([0 50 -60 -42])
subplot(212)
pwelch(hn,win,orlp,[],fs);
% [Pxx,w]=pwelch(hn,[],80,[],fs);
% plot(w,Pxx)
title('G�sto�� widmowa mocy szumu bia�ego i sinusoidy - met. Welcha')
xlabel('Cz�stotliwo�� [kHz]')
ylabel('G�sto�� widmowa mocy [dB/Hz]')
axis([0 50 -60 -42])