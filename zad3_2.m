f1=10;
f2=80;
f3=120;
A=2;
fs=500;
fn=fs/2; %cz. Nyquista
il_probek=2000;
t=(0:il_probek-1)/fs;
y1 = A*sin(2*pi*f1*t);
y2 = 3*A*sin(2*pi*f2*t+deg2rad(20));
y3 = A*sin(2*pi*f3*t+deg2rad(40));
y=y1+y2+y3;

% %Sprawdzenie wykresów
% plot(t,y1, 'LineWidth',1.5)
% hold on
% plot(t, y2,'r','LineWidth',1.5)
% hold on
% plot(t, y3,'g','LineWidth',1.5)
% xlabel('czas [s]')
% ylabel('amlituda [-]')
% title(['Wykes wartoœci funkcji w czasie dla f_{próbkowania}= ', num2str(fs), ' Hz'])
% grid on
% legend(['f=', num2str(f1), 'Hz'],['f=', num2str(f2), 'Hz'],['f=', num2str(f3), 'Hz'])

Y=fft(y);

P2=abs(Y/il_probek)
P1=P2(1:il_probek/2+1);
P1(2:end-1) = 2*P1(2:end-1);
f = fs*(0:(il_probek/2))/il_probek;
stem(f,P1) 
title('Wykres amplitudowo czestotliwosciowy fukncji X(t)')
xlabel('f (Hz)')
ylabel('|P1(f)|')
xline(fn, '--r', 'Linewidth', 3)
grid on


