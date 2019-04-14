[x,fs]=audioread('noisyRecording.wav');
%sptool
[b,a]=tfdata(filt1,'v');
y=filter(b,a,x);

figure(1)
set(gcf,'color','w');
h1=bodeplot(filt1);
setoptions(h1,'FreqUnits','Hz', 'PhaseUnits', 'rad')
grid on
xlabel('Czestotliwosc')
ylabel('Faza')
title('Wykres Bodego dla filtru FIR')


figure(2)
set(gcf,'color','w');
h2=bodeplot(filt2);
setoptions(h2,'FreqUnits','Hz', 'PhaseUnits', 'rad')
grid on
xlabel('Czestotliwosc')
ylabel('Faza')
title('Wykres Bodego dla filtru IIR')
