fs=1000; %czêstotliwoœæ próbkowania
N=1000; %iloœæ próbek
t=[1:N]*1/fs; %okreœlanie wektora czasu
x=2*sin(2*pi*10*t); %generowanie sygna³u

kor_ML=xcorr(x,x);%koreleacja przy u¿yciu wbudowanej funkcji MatLab

% utworzenie dwóch macierzy, które bêd¹ natêpnie wzglêdem siebie przesuwane
x1=horzcat(zeros(1,N), x); % dodanie N zer przed wektorem funkcji
x2=horzcat(x, zeros(1,N)); % dodanie N zer za wektorem funkcji

for k=1:(2*N-1)
        x2_mv=horzcat(zeros(1,k), x2(1:end-k));% przesuwanie funkcji x2
        kor(k)=sum(x1.*x2_mv); %sumowanie wszystkich iloczynów przesuniêtej 
        % funkcji x2 oraz x1 
end
t2=[1:length(kor)]*1/fs;
%tworzenie wykresu
plot(t2,kor,':','LineWidth',2)
set(gcf,'color','w');
hold on
plot(t2,kor_ML, 'r--')
legend('korelacja - w³asna funkcja', 'korelacja MatLab')
xlabel('t [s]')
ylabel('amlituda [-]')
title('Wykes autokorelacji funkcji x(t)')
title(['\rmWykes autokorelacji funkcji \itx(t)=sin(2\cdot\pi\cdot10\cdott)\rm '])
grid on