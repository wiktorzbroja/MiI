
fs = 50; % częstotliwość próbkowania                                     
T = 1/fs; % okres próbkowania       
t = -3:T:3-T; %wektor czasu
N=length(t); % zapisanie długości wekotra czasu do późniejszych obliczeń

fn=fs/2; %częstotliwość Nyquista

%tworzenie sygnału
y1=dirac(t);
idx = y1 == Inf; % find Inf
y1(idx) = 1;     % set Inf to finite value
y2=rand(1,length(t));
y3=heaviside(t-2);
y4=sawtooth(2*pi*t,0.5);%tripuls(t-0.5, 0.5)
%sprawdzenie 
% figure(1)
% plot(t,y1,'k','Linewidth',2)
% hold on
% plot(t,y2)
% hold on
% plot(t,y3,'r','Linewidth',2)
% hold on
% plot(t,y4,'g','Linewidth',2)

Y1 = 1/N*fftshift(fft(y1));%przeskalowanie wyniku FFT i odpowienie rozłożenie częstotliwości
Y2 = 1/N*fftshift(fft(y2));
Y3 = 1/N*fftshift(fft(y3));
Y4 = 1/N*fftshift(fft(y4));
  
df=fs/N; %określenie zmian częstotliwości    
f=(-N/2:N/2-1)*df; %wektor częstotliwości 
M1=abs(Y1);
M2=abs(Y2);
M3=abs(Y3);
M4=abs(Y4); %obliczanie amplitudy
	

%Generowanie wykresów
figure(2)
set(gcf,'color','w');
stem(f,M1)
title('Wykres amplitudowo-czestotliwosciowy impulsu')
xlabel('Częstotliwość (Hz)')
ylabel('Amplituda [-]')
xline(fn, '--r', 'Linewidth', 3);
xline(-fn, '--r', 'Linewidth', 3);
grid on

% stem(f,M1)
% title('Wykres amplitudowo-czestotliwosciowy impulsu')
% stem(f,M2)
% title('Wykres amplitudowo-czestotliwosciowy szumu losowego')
% stem(f,M3)
% title('Wykres amplitudowo-czestotliwosciowy kroku jednostkowego')
% stem(f,M4)
% title('Wykres amplitudowo-czestotliwosciowy przebiegu trójkątnego')