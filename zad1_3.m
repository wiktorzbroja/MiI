fs=1000; %cz�stotliwo�� pr�bkowania
N=1000; %ilo�� pr�bek
t=[1:N]*1/fs; %okre�lanie wektora czasu
x=2*sin(2*pi*10*t); %generowanie sygna�u
white_noise=0.8*rand(1,1000)-0.4; %generowanie szumu

y=x+white_noise; %sumowanie sygna�u i szumu

%generowanie wykresu
plot(t,y)
set(gcf,'color','w');
xlabel('czas [s]')
ylabel('amlituda [-]')
title(['\rmWykes funkcji \itx(t)=sin(2\cdot\pi\cdot10\cdott)\rm w czasie dla \itf_{pr�bkowania}= ', num2str(fs), ' Hz'])
grid on

wart_sr=mean(y) % warto�� �rednia
wart_max=max(y) % wartos� maksymalna
wart_min=min(y) % wartos� minimalna

wariancja_ML=var(y) %wariancja przy u�yciu wzoru wbudowanego
wariancja=mean(power(y-wart_sr,2)).*(N/(N-1)) %wbudowana w MatLabie komenda
% korzysta z wersji nieobci��onej dlatego aby wyniki si� zgadza�y
% zastosowano odpowiednie przeskalowanie ^ N/(N-1) 

odchylenie_std_ML=std(y) %odchylenie standardowe przy u�yciu wzoru wbudowanego
odchylenie_std=sqrt(sigma_kw) %odchylenie standardowe

energia=sum(y.^2) %energia sygna�u

moc_ML=bandpower(y) %moc �rednia sygna�u przy u�yciu wzoru wbudowanego
moc=energia/N %moc �rednia sygna�u
 
wart_sk_ML=rms(y) %warto�� skuteczna sygna�u przy u�yciu wzoru wbudowanego
wart_sk=sqrt(moc_sr)%warto�� skuteczna sygna�u

SNR_ML=snr(x,white_noise)% SNR sygna�u wbudowany wz�r

moc_szumu=sum(white_noise.^2)/N; %moc szumu niezb�dna do wyznaczenia SNR
SNR=10*log10(moc_syg_baz/moc_szumu) %SNR funkcja w�asna
