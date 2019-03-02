fs=1000; %czêstotliwoœæ próbkowania
N=1000; %iloœæ próbek
t=[1:N]*1/fs; %okreœlanie wektora czasu
x=2*sin(2*pi*10*t); %generowanie sygna³u
white_noise=0.8*rand(1,1000)-0.4; %generowanie szumu

y=x+white_noise; %sumowanie sygna³u i szumu

%generowanie wykresu
plot(t,y)
set(gcf,'color','w');
xlabel('czas [s]')
ylabel('amlituda [-]')
title(['\rmWykes funkcji \itx(t)=sin(2\cdot\pi\cdot10\cdott)\rm w czasie dla \itf_{próbkowania}= ', num2str(fs), ' Hz'])
grid on

wart_sr=mean(y) % wartoœæ œrednia
wart_max=max(y) % wartosæ maksymalna
wart_min=min(y) % wartosæ minimalna

wariancja_ML=var(y) %wariancja przy u¿yciu wzoru wbudowanego
wariancja=mean(power(y-wart_sr,2)).*(N/(N-1)) %wbudowana w MatLabie komenda
% korzysta z wersji nieobci¹¿onej dlatego aby wyniki siê zgadza³y
% zastosowano odpowiednie przeskalowanie ^ N/(N-1) 

odchylenie_std_ML=std(y) %odchylenie standardowe przy u¿yciu wzoru wbudowanego
odchylenie_std=sqrt(sigma_kw) %odchylenie standardowe

energia=sum(y.^2) %energia sygna³u

moc_ML=bandpower(y) %moc œrednia sygna³u przy u¿yciu wzoru wbudowanego
moc=energia/N %moc œrednia sygna³u
 
wart_sk_ML=rms(y) %wartoœæ skuteczna sygna³u przy u¿yciu wzoru wbudowanego
wart_sk=sqrt(moc_sr)%wartoœæ skuteczna sygna³u

SNR_ML=snr(x,white_noise)% SNR sygna³u wbudowany wzór

moc_szumu=sum(white_noise.^2)/N; %moc szumu niezbêdna do wyznaczenia SNR
SNR=10*log10(moc_syg_baz/moc_szumu) %SNR funkcja w³asna
