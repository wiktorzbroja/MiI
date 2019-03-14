clear all;  %wyczyszczenie przestrzeni roboczej

h=[0 1 1 1 0 0 0]; %definiowanie sygna�u h
x=[0 1 1 1 1 0 0]; %definiowanie sygna�u x

h_fliped=fliplr(h);% obrucenie choryzontalnie macierzy h
x_new=[zeros(1,length(h)) x]; % utworzenie nowego wektora sygna�u x poprzez dodanie przed starym wektorem sygna�u zer o ilo�ci r�wnej liczbie pr�bek sygna�u h
h_fliped=[h_fliped zeros(1,length(x))]; % utworzenie nowego wektora sygna�u h poprzez dodanie po starym wektorem sygna�u zer o ilo�ci r�wnej liczbie pr�bek sygna�u x

figure(1) %wy�wietlanie na jednym wykresie przebiegu sygna��w h i x
stem(h_fliped) 
hold on
stem(x_new)
legend('h','x')

for n=1:length(x)+length(h)-1 %...
h_fliped_moved=[zeros(1,n) h_fliped(1:end-n) ]; %przesuwanie macierzy h 
y_conv(n)=sum(h_fliped_moved.*x_new); %sumowanie iloczyn�w warto�ci obu funkcji dla danego aktualnego przesuni�cia h

figure(2)
clf %czyszczenie wykresu
subplot(2,1,1)
stem(h_fliped_moved,'r') %prezentacja aktualnego przesuni�cia h
hold all
stem(x_new,'--b')
legend('h','x')
xlabel('m')

subplot(2,1,2)
stem(y_conv,'-*k') %wynik kowariancji
title('Wynik splotu sygna�u x[m] i h[m]')
xlabel('Przesuni�cie n')
pause(1)% zatrzymanie wykonywania si� programu na sekund�
end
