fs=1000;
N=1000;
t=[1:N]*1/fs;
x=2*sin(2*pi*10*t);
%white_noise=wgn(1,1000,20*log(2));
white_noise=0.8*rand(1,1000)-0.4;

y=x+white_noise;

%plot(t,white_noise)
plot(t,y)
xlabel('czas [s]')
ylabel('amlituda [-]')
title('Wykes wartoœci funkcji w czasie dla f_{próbkowania}=20 Hz')
grid on

wart_sr=mean(y)
wart_max=max(y)
wart_min=min(y)

sigma_kw=mean(power(y-wart_sr,2)).*(N/(N-1))
wariancja=var(y)%jest nieobci¹¿ona dlatego ^ N/(N-1)

sigma=sqrt(sigma_kw)
odchylenie_std=std(y)

energia=sum(y.^2)

moc_sr=energia/N
moc_srednia=bandpower(y)

wart_sk=sqrt(moc_sr)
wart_sk_ML=rms(y)

moc_szumu=sum(white_noise.^2)/N
moc_syg_baz=sum(x.^2)/N
SNR=10*log10(moc_syg_baz/moc_szumu)
SNR_ML=snr(x,white_noise)
