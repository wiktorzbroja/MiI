%Wywo�a� zad3_2.m
subplot(2,1,1)
set(gcf,'color','w');
stem(f,M)
title('Wykres amplitudowo-czestotliwosciowy funkcji z �w 3.2')
xlabel('Cz�stotliwo�� (Hz)')
ylabel('Amplituda [-]')
xline(fn, '--r', 'Linewidth', 3);
xline(-fn, '--r', 'Linewidth', 3);
grid on

f1=10;
f3=120;
A=2;
fs = 200; % cz�stotliwo�� pr�bkowania                    
T = 1/fs; % okres pr�bkowania       
t = 0:T:1-T; %wektor czasu
N=length(t); % zapisanie d�ugo�ci wekotra czasu do p�niejszych oblicze�

fn=fs/2; %cz�stotliwo�� Nyquista

%tworzenie trzech sk��dowych
y1 = A*sin(2*pi*f1*t);
y3 = A*sin(2*pi*f3*t+deg2rad(40));
y=y1+y3; % z�o�enie sygna��w

Y1=fft(y); %szybka transformata Fouriera

    
Y2 = 1/N*fftshift(Y1);%przeskalowanie wyniku FFT i odpowienie roz�o�enie cz�stotliwo�ci
  
df=fs/N; %okre�lenie zmian cz�stotliwo�ci    
f=(-N/2:N/2-1)*df; %wektor cz�stotliwo�ci   
M=abs(Y2); %obliczanie amplitudy
	

%ma�e warto�ci(zaokr�glone zera) sk�adowych rzeczywistych i urojonych
%programu powoduj� b��dne okre�lanie k�ta
X2=Y2;
prog = max(abs(Y2))/10000; %okre�lenie progu tolerancji
X2(abs(Y2)<prog) = 0; %dla ma�ych warto�ci - przyr�wnane do zera
Fi=rad2deg(angle(X2)); % obliczanie cz�stotliwo�ci, przeliczanie na stopnie  


subplot(2,1,2)
stem(f,M)
title('Wykres amplitudowo-czestotliwosciowy funkcji z �w 3.3')
xlabel('Cz�stotliwo�� (Hz)')
ylabel('Amplituda [-]')
xline(fn, '--r', 'Linewidth', 3);
xline(-fn, '--r', 'Linewidth', 3);
grid on


