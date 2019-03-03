clear all

k=-5:1:10
x=heaviside(k)-heaviside(k-8);
h=sin(2*pi*k/8).*(heaviside(k)-heaviside(k-8));
y=conv(x,h)


subplot(3,1,1)
stem(x)
xlabel('Próbki? [-]')
ylabel('amlituda [-]')
title('Wykes funkcji x(k)')
grid on

subplot(3,1,2)
stem(h)
xlabel('Próbki? [-]')
ylabel('amlituda [-]')
title('Wykes funkcji y(k)')
grid on

%ogarn¹æ osie
subplot(3,1,3)
stem(y)
xlabel('Próbki? [-]')
ylabel('amlituda [-]')
title('Wykes funkcji splotu x(k)*h(k)')
grid on