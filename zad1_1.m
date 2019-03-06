% czestotliwoœci generowanych sygna³ów
f1=1; %[Hz]
f2=4; %[Hz]
f3=6; %[Hz]
fs=200; %[Hz] czêstotliwoœæ próbkowania
t=0:1./fs:1; %wektor czasu
% wygenerowanie trzech sygna³ów sinusoidalnych
y1 = sin(2*pi*f1*t);
y2 = sin(2*pi*f2*t);
y3 = sin(2*pi*f3*t);

%tworzenie wykresu
subplot(2,1,1)
plot(t,y1, 'LineWidth',1.5)
hold on
plot(t, y2,'r','LineWidth',1.5)
hold on
plot(t, y3,'g','LineWidth',1.5)
set(gcf,'color','w');
xlabel('czas [s]')
ylabel('amlituda [-]')
title(['\rmWykes funkcji \itsin(2\pi\cdotf\cdott)\rm w czasie dla \itf_{próbkowania}= ', num2str(fs), ' Hz'])
grid on
legend(['f=', num2str(f1), 'Hz'],['f=', num2str(f2), 'Hz'],['f=', num2str(f3), 'Hz'])


subplot(2,1,2)

fs=5 %[Hz] Zmiana czêstotliwoœci próbkowania
t=0:1./fs:1; %nowy wektor czasu
%Generowanie sygna³ów
y1 = sin(2*pi*f1*t);
y2 = sin(2*pi*f2*t);
y3 = sin(2*pi*f3*t);

%tworzenie kolejnego wykresu
plot(t,y1,':', 'LineWidth',1.5)
hold on
plot(t, y2,'r','LineWidth',1.5)
hold on
plot(t, y3,'g-.','LineWidth',1)
xlabel('czas [s]')
ylabel('amlituda [-]')
title(['\rmWykres funkcji \itsin(2\pi\cdotf\cdott)\rm w czasie dla \itf_{próbkowania}= ', num2str(fs), ' Hz'])
grid on
legend(['f=', num2str(f1), 'Hz'],['f=', num2str(f2), 'Hz'],['f=', num2str(f3), 'Hz'])