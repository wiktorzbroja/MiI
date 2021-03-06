f1=10;
f2=80;
f3=120;
A=1;

fs = 400; % częstotliwość próbkowania                                     
T = 1/fs; % okres próbkowania       
t = 0:T:1-T; %wektor czasu
N=length(t); % zapisanie długości wekotra czasu do późniejszych obliczeń

fn=fs/2; %częstotliwość Nyquista

%tworzenie trzech skłądowych
y1 = 1*A*sin(2*pi*f1*t);
y2 = 3*A*sin(2*pi*f2*t+deg2rad(20));
y3 = 1*A*sin(2*pi*f3*t+deg2rad(40));
y=y1+y2+y3; % złożenie sygnałów

Y1=fft(y); %szybka transformata Fouriera

    
Y2 = 1/N*fftshift(Y1);%przeskalowanie wyniku FFT i odpowienie rozłożenie częstotliwości
  
df=fs/N; %określenie zmian częstotliwości    
f=(-N/2:N/2-1)*df; %wektor częstotliwości   
M=abs(Y2); %obliczanie amplitudy
	

%małe wartości(zaokrąglone zera) składowych rzeczywistych i urojonych
%programu powodują błędne określanie kąta
X2=Y2;
prog = max(abs(Y2))/10000; %określenie progu tolerancji
X2(abs(Y2)<prog) = 0; %dla małych wartości - przyrównane do zera
Fi=rad2deg(angle(X2)); % obliczanie częstotliwości, przeliczanie na stopnie  
Fi2=angle(Y2);% faza bez filtracji do zadania 3.4
%Generowanie wykresów
subplot(2,1,1)
set(gcf,'color','w');
stem(f,M)
title('Wykres amplitudowo-czestotliwosciowy fukncji X(t)')
xlabel('Częstotliwość (Hz)')
ylabel('Amplituda [-]')
xline(fn, '--r', 'Linewidth', 3);
xline(-fn, '--r', 'Linewidth', 3);
grid on

subplot(2,1,2)
stem(f,Fi)
title('Wykres fazowo-czestotliwosciowy fukncji X(t)')
xlabel('Częstotliwość (Hz)')
ylabel('Przesunięcie fazowe [\circ]')
xline(fn, '--r', 'Linewidth', 3);
xline(-fn, '--r', 'Linewidth', 3);
grid on

save ('wyniki3_2.mat','f','Y2','M','Fi2','y');