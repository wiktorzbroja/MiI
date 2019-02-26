f1=1;
f2=4;
f3=6;
fs=200;
t=0:1./fs:1;
y1 = sin(2*pi*f1*t);
y2 = sin(2*pi*f2*t);
y3 = sin(2*pi*f3*t);

subplot(2,1,1)
plot(t,y1, 'LineWidth',1.5)
hold on
plot(t, y2,'r','LineWidth',1.5)
hold on
plot(t, y3,'g','LineWidth',1.5)
xlabel('czas [s]')
ylabel('amlituda [-]')
title('Wykes wartoœci funkcji w czasie dla f_{próbkowania}=200 Hz')
grid on
legend('f=1Hz','f=4Hz','f=6Hz')


subplot(2,1,2)

fs=5
t=0:1./fs:1;
y1 = sin(2*pi*f1*t);
y2 = sin(2*pi*f2*t);
y3 = sin(2*pi*f3*t);

plot(t,y1,':', 'LineWidth',1.5)
hold on
plot(t, y2,'r','LineWidth',1.5)
hold on
plot(t, y3,'g-.','LineWidth',1)
xlabel('czas [s]')
ylabel('amlituda [-]')
title('Wykes wartoœci funkcji w czasie dla f_{próbkowania}=5 Hz')
grid on
legend('f=1Hz','f=4Hz','f=6Hz')