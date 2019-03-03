
fs = 400; % czêstotliwoœæ próbkowania                                     
T = 1/fs; % okres próbkowania       
t = 0:T:1-T; %wektor czasu
N=length(t); % zapisanie d³ugoœci wekotra czasu do póŸniejszych obliczeñ

fn=fs/2; %czêstotliwoœæ Nyquista
figure(1)
%tworzenie sygna³u
y3=tripuls(t-0.5, 0.5)
plot(t,y3)


Y3 = 1/N*fftshift(fft(y3));%przeskalowanie wyniku FFT i odpowienie roz³o¿enie czêstotliwoœci
  
df=fs/N; %okreœlenie zmian czêstotliwoœci    
f=(-N/2:N/2-1)*df; %wektor czêstotliwoœci   
M=abs(Y3); %obliczanie amplitudy
	

%Generowanie wykresów
figure(2)
set(gcf,'color','w');
stem(f,M)
title('Wykres amplitudowo-czestotliwosciowy fukncji X(t)')
xlabel('Czêstotliwoœæ (Hz)')
ylabel('Amplituda [-]')
xline(fn, '--r', 'Linewidth', 3);
xline(-fn, '--r', 'Linewidth', 3);
grid on