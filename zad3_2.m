f1=10;
f2=80;
f3=120;
A=2;
<<<<<<< .mine
fs = 4000; % cz�stotliwo�� pr�bkowania                    

















































=======

fs = 5000;            % Sampling frequency                    
T = 1/fs;             % Sampling period       
t = 0:T:1-T;        % Time vector


fn=fs/2; %cz. Nyquista

y1 = A*sin(2*pi*f1*t);
y2 = 3*A*sin(2*pi*f2*t+deg2rad(20));
y3 = A*sin(2*pi*f3*t+deg2rad(40));
y=y1+y2+y3;

% %Sprawdzenie wykres�w
% plot(t,y1, 'LineWidth',1.5)
% hold on
% plot(t, y2,'r','LineWidth',1.5)
% hold on
% plot(t, y3,'g','LineWidth',1.5)
% xlabel('czas [s]')
% ylabel('amlituda [-]')
% title(['Wykes warto�ci funkcji w czasie dla f_{pr�bkowania}= ', num2str(fs), ' Hz'])
% grid on
% legend(['f=', num2str(f1), 'Hz'],['f=', num2str(f2), 'Hz'],['f=', num2str(f3), 'Hz'])
%figure(2)

Y=fft(y);

P1=abs(Y);
P2=angle(Y)*180/pi;
    N2=round(length(t)/2);
    df=fs/(length(t));    
    f=(0:N2)*df     
    
    

subplot(2,1,1)
stem(f(1:N2),P1(1:N2))
title('Wykres amplitudowo-czestotliwosciowy fukncji X(t)')
xlabel('f (Hz)')
ylabel('|P1(f)|')
xline(fn, '--r', 'Linewidth', 3)
grid on

subplot(2,1,2)
plot(f(1:N2),unwrap(P2(1:N2)))
title('Wykres fazowo-czestotliwosciowy fukncji X(t)')
xlabel('f (Hz)')
=======
fs = 400; % cz�stotliwo�� pr�bkowania                    
>>>>>>> .theirs
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