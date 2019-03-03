clear all

k=0:1:8
x=sin(2*pi*k/8).*(heaviside(k)-heaviside(k-8));
h=-sin(2*pi*k/8).*(heaviside(k)-heaviside(k-8));
y=conv(x,h)


%tworzenie wykres�w
subplot(3,1,1)
stem(k,x)
set(gcf,'color','w');
xlabel('Pr�bki [-]')
ylabel('Warto�� [-]')
title('Wykres funkcji x(k)')
grid on

subplot(3,1,2)
stem(k,h)
xlabel('Pr�bki [-]')
ylabel('Warto�� [-]')
title('Wykres funkcji y(k)')
grid on

subplot(3,1,3)
stem(y)
xlabel('Przesuni�cie [-]')
ylabel('Warto�� [-]')
title('Wykres funkcji splotu \itx(k)*h(k)')
grid on