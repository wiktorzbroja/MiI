
fs = 400; % częstotliwość próbkowania                                     
T = 1/fs; % okres próbkowania       
t = 0:T:1-T; %wektor czasu
N=length(t); % zapisanie długości wekotra czasu do późniejszych obliczeń

fn=fs/2; %częstotliwość Nyquista
figure(1)
%tworzenie sygnału
y3=tripuls(t-0.5, 0.5)
plot(t,y3)


Y3 = 1/N*fftshift(fft(y3));%przeskalowanie wyniku FFT i odpowienie rozłożenie częstotliwości
  
df=fs/N; %określenie zmian częstotliwości    
f=(-N/2:N/2-1)*df; %wektor częstotliwości   
M=abs(Y3); %obliczanie amplitudy
	

%Generowanie wykresów
figure(2)
set(gcf,'color','w');
stem(f,M)
title('Wykres amplitudowo-czestotliwosciowy fukncji X(t)')
xlabel('Częstotliwość (Hz)')
ylabel('Amplituda [-]')
xline(fn, '--r', 'Linewidth', 3);
xline(-fn, '--r', 'Linewidth', 3);
grid on