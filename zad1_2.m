f1=20; %[Hz] czêstotliwoœæ sygna³u
fs=40; %[Hz] czêstotliwoœæ próbkowania
t=0:1./fs:10; %wektor czasu
y = sin(2*pi*f1*t); % generowanie sygna³u

%generowanie wykresu
plot(t,y)
txt='\itsin(40\pi\cdotf\cdott)';
text(2,1,txt)
set(gcf,'color','w');
xlabel('czas [s]')
ylabel('amlituda [-]')
legend('\itsin(40\pi\cdott)' )
title(['\rmWykes funkcji \itsin(2\pi\cdotf\cdott)\rm w czasie dla \itf_{próbkowania}= ', num2str(fs), ' Hz'])
grid on
