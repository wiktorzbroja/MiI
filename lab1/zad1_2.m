fs=20;
f1=40;
t=0:1./fs:10;
y = sin(2*pi*f1*t);

plot(t,y)
xlabel('czas [s]')
ylabel('amlituda [-]')
title('Wykes warto�ci funkcji w czasie dla f_{pr�bkowania}=20 Hz')
grid on