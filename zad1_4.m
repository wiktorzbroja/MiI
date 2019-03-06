fs=1000; %czêstotliwoœæ próbkowania
N=1000; %iloœæ próbek
t=[1:N]*1/fs; %okreœlanie wektora czasu
x=2*sin(2*pi*10*t); %generowanie sygna³u

kor_ML=xcorr(x,x);%koreleacja przy u¿yciu wbudowanej funkcji MatLab

% utworzenie dwóch macierzy, które bêd¹ natêpnie wzglêdem siebie przesuwane
x1=horzcat(zeros(1,N), x); % dodanie N zer przed wektorem funkcji
x2=horzcat(x, zeros(1,N)); % dodanie N zer za wektorem funkcji

%2 razy mniej obliczeñ hehehe
y1 = [x zeros(1,N)];
kor = zeros(1,2*N-1);
kor_unbiased = kor;

for k = 0:N-1
   y_mv = [zeros(1,k) y1(1:end-k)];
   kor(k+N) = sum(y_mv.*y1);
   kor_unbiased(k+N) = kor(k+N)/(N-k);
end

kor(1:N-1) = fliplr(kor(N+1:2*N-1));
kor_unbiased(1:N-1) = fliplr(kor_unbiased(N+1:2*N-1));

%for k=1:(2*N-1)
%        x2_mv=horzcat(zeros(1,k), x2(1:end-k));% przesuwanie funkcji x2
%        kor(k)=sum(x1.*x2_mv); %sumowanie wszystkich iloczynów przesuniêtej 
%        % funkcji x2 oraz x1 
%end

kor_biased = kor./N;

t2=[1:length(kor)]*1/fs-1;
%tworzenie wykresu
plot(t2,kor,':','LineWidth',2)
set(gcf,'color','w');
hold on
plot(t2,kor_ML, 'r--')
legend('korelacja - w³asna funkcja', 'korelacja MatLab')
xlabel('t [s]')
ylabel('amlituda [-]')
title('Wykres autokorelacji funkcji x(t)')
title(['\rmWykres autokorelacji nieunormowanej funkcji \itx(t)=sin(2\cdot\pi\cdot10\cdott)\rm '])
grid on

figure(2)
plot(t2,kor_biased,':','LineWidth',2)
set(gcf,'color','w');
hold on
plot(t2,xcorr(x,x,'biased'), 'r--')
legend('korelacja - w³asna funkcja', 'korelacja MatLab')
xlabel('t [s]')
ylabel('amlituda [-]')
title('Wykres autokorelacji funkcji x(t)')
title(['\rmWykres autokorelacji obci¹¿onej funkcji \itx(t)=sin(2\cdot\pi\cdot10\cdott)\rm '])
grid on

figure(3)
plot(t2,kor_unbiased,':','LineWidth',2)
set(gcf,'color','w');
hold on
plot(t2,xcorr(x,x,'unbiased'), 'r--')
legend('korelacja - w³asna funkcja', 'korelacja MatLab')
xlabel('t [s]')
ylabel('amlituda [-]')
title('Wykres autokorelacji funkcji x(t)')
title(['\rmWykres autokorelacji nieobci¹¿onej funkcji \itx(t)=sin(2\cdot\pi\cdot10\cdott)\rm '])
grid on