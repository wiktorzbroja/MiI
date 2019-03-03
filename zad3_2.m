f1=10;
f2=80;
f3=120;
A=2;
fs = 4000; % czêstotliwoœæ próbkowania                    
T = 1/fs; % okres próbkowania       
t = 0:T:1-T; %wektor czasu
N=length(t); % zapisanie d³ugoœci wekotra czasu do póŸniejszych obliczeñ

fn=fs/2; %czêstotliwoœæ Nyquista

%tworzenie trzech sk³¹dowych
y1 = A*sin(2*pi*f1*t);
y2 = 3*A*sin(2*pi*f2*t+deg2rad(20));
y3 = A*sin(2*pi*f3*t+deg2rad(40));
y=y1+y2+y3; % z³o¿enie sygna³ów

Y1=fft(y); %szybka transformata Fouriera

    
Y2 = 1/N*fftshift(Y1);%przeskalowanie wyniku FFT i odpowienie roz³o¿enie czêstotliwoœci
  
df=fs/N; %okreœlenie zmian czêstotliwoœci    
f=(-N/2:N/2-1)*df; %wektor czêstotliwoœci   
M=abs(Y2); %obliczanie amplitudy
	

%ma³e wartoœci(zaokr¹glone zera) sk³adowych rzeczywistych i urojonych
%programu powoduj¹ b³êdne okreœlanie k¹ta
X2=Y2;
prog = max(abs(Y2))/10000; %okreœlenie progu tolerancji
X2(abs(Y2)<prog) = 0; %dla ma³ych wartoœci - przyrównane do zera
Fi=rad2deg(angle(X2)); % obliczanie czêstotliwoœci, przeliczanie na stopnie  

%Generowanie wykresów
subplot(2,1,1)
set(gcf,'color','w');
stem(f,M)
title('Wykres amplitudowo-czestotliwosciowy fukncji X(t)')
xlabel('Czêstotliwoœæ (Hz)')
ylabel('Amplituda [-]')
xline(fn, '--r', 'Linewidth', 3);
xline(-fn, '--r', 'Linewidth', 3);
grid on

subplot(2,1,2)
stem(f,Fi)
title('Wykres fazowo-czestotliwosciowy fukncji X(t)')
xlabel('Czêstotliwoœæ (Hz)')
ylabel('Przesuniêcie fazowe [\circ]')
xline(fn, '--r', 'Linewidth', 3);
xline(-fn, '--r', 'Linewidth', 3);
grid on

save ('wyniki3_3.mat', 'f', 'M', 'y');