clear all
N=1000; % ilo�� pr�bek
T=5 %czas trwania sygna�u
t=(T./N):(T./N):T; %wektor czsu

%okre�lenie funkcji i ich autokorelacji
x=sin(2*pi*2*t)+0.5*sin(2*pi*8*t);
h=sin(2*pi*2*t).*exp(-4*t);
y=conv(x,h);

%generowanie wykres�w
subplot(3,1,1)
plot(t,x)
xlabel('Czas [-]')
ylabel('amlituda [-]')
title('Wykes funkcji \itx(k)')
grid on

subplot(3,1,2)
plot(t,h)
xlabel('Czas [-]')
ylabel('amlituda [-]')
title('Wykes funkcji \ity(k)')
grid on

subplot(3,1,3)
tt=(T./N):(T./N):(length(x)+length(h)-1)*(T./N);
plot(tt,y)
xlabel('Przesuni�cie [s]')
ylabel('amlituda [-]')
title('Wykes funkcji splotu \itx(k)*h(k)')
grid on
set(gcf,'color','w');
