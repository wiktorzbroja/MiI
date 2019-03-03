
fs = 400; % cz�stotliwo�� pr�bkowania                                     
T = 1/fs; % okres pr�bkowania       
t = 0:T:1-T; %wektor czasu
N=length(t); % zapisanie d�ugo�ci wekotra czasu do p�niejszych oblicze�

fn=fs/2; %cz�stotliwo�� Nyquista
figure(1)
%tworzenie sygna�u
y3=tripuls(t-0.5, 0.5)
plot(t,y3)


Y3 = 1/N*fftshift(fft(y3));%przeskalowanie wyniku FFT i odpowienie roz�o�enie cz�stotliwo�ci
  
df=fs/N; %okre�lenie zmian cz�stotliwo�ci    
f=(-N/2:N/2-1)*df; %wektor cz�stotliwo�ci   
M=abs(Y3); %obliczanie amplitudy
	

%Generowanie wykres�w
figure(2)
set(gcf,'color','w');
stem(f,M)
title('Wykres amplitudowo-czestotliwosciowy fukncji X(t)')
xlabel('Cz�stotliwo�� (Hz)')
ylabel('Amplituda [-]')
xline(fn, '--r', 'Linewidth', 3);
xline(-fn, '--r', 'Linewidth', 3);
grid on