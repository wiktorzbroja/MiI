clear all
N=1000;
T=5

t=(T./N):(T./N):T;
x=sin(2*pi*2*t)+0.5*sin(2*pi*8*t);
h=sin(2*pi*2*t).*exp(-4*t);
y=conv(x,h);

subplot(3,1,1)
plot(x)
xlabel('Próbki? [-]')
ylabel('amlituda [-]')
title('Wykes funkcji x(k)')
grid on

subplot(3,1,2)
plot(h)
xlabel('Próbki? [-]')
ylabel('amlituda [-]')
title('Wykes funkcji y(k)')
grid on

%ogarn¹æ osie
subplot(3,1,3)
plot(y)
xlabel('Próbki? [-]')
ylabel('amlituda [-]')
title('Wykes funkcji splotu x(k)*h(k)')
grid on