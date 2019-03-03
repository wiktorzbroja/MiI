f1=10;
f2=80;
f3=120;
A=2;
fs = 4000; % cz�stotliwo�� pr�bkowania                    
T = 1/fs; % okres pr�bkowania       
t = 0:T:1-T; %wektor czasu
N=length(t); % zapisanie d�ugo�ci wekotra czasu do p�niejszych oblicze�

fn=fs/2; %cz�stotliwo�� Nyquista

%tworzenie trzech sk��dowych
y1 = A*sin(2*pi*f1*t);
y2 = 3*A*sin(2*pi*f2*t+deg2rad(20));
y3 = A*sin(2*pi*f3*t+deg2rad(40));
y=y1+y2+y3; % z�o�enie sygna��w

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

%Generowanie wykres�w
subplot(2,1,1)
set(gcf,'color','w');
stem(f,M)
title('Wykres amplitudowo-czestotliwosciowy fukncji X(t)')
xlabel('Cz�stotliwo�� (Hz)')
ylabel('Amplituda [-]')
xline(fn, '--r', 'Linewidth', 3);
xline(-fn, '--r', 'Linewidth', 3);
grid on

subplot(2,1,2)
stem(f,Fi)
title('Wykres fazowo-czestotliwosciowy fukncji X(t)')
xlabel('Cz�stotliwo�� (Hz)')
ylabel('Przesuni�cie fazowe [\circ]')
xline(fn, '--r', 'Linewidth', 3);
xline(-fn, '--r', 'Linewidth', 3);
grid on

save ('wyniki3_3.mat', 'f', 'M', 'y');