f1=20; %[Hz] cz�stotliwo�� sygna�u
fs=40; %[Hz] cz�stotliwo�� pr�bkowania
t=0:1./fs:10; %wektor czasu
y = sin(2*pi*f1*t); % generowanie sygna�u

%generowanie wykresu
plot(t,y)
txt='\itsin(40\pi\cdotf\cdott)';
text(2,1,txt)
set(gcf,'color','w');
xlabel('czas [s]')
ylabel('amlituda [-]')
legend('\itsin(40\pi\cdott)' )
title(['\rmWykes funkcji \itsin(2\pi\cdotf\cdott)\rm w czasie dla \itf_{pr�bkowania}= ', num2str(fs), ' Hz'])
grid on
