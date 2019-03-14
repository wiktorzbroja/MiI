clear all
T=4; % d�ugo�� sygna�u
N=1000; % ilo�� pr�bek
fs=40;  % cz�stotliwo�� pr�bkowania
A=2;    % amplituda sygna�u
w0=pi;  % cz�sto��
ilosc_k=[1 3 10 20 100]; %wektor sk�adowych
%ilosc_skladowych=10000
t=(T./N):(T./N):T; % wektor czasu

for j=1:length(ilosc_k) % p�tla w celu uzyskania wykresu dla ka�dej zadanej ilo�ci sk��dowych
y=zeros(1,N); %zerowanie macierzy
    for i=1:length(t)   
        for k=1:ilosc_k(j) % sumowanie sk�adowych
            if mod(k,2)==1  %dla nieparzystych k
                y(i)=y(i)+(4*A/(k*pi)*sin(k*w0*t(i))); 
            end
        end
    end
    
figure(j)
set(gcf,'color','w');
subplot(2,1,1)
plot(t,y)
xlabel('czas [s]')
ylabel('amlituda [-]')
title(['Wykres funkcji y dla k=', num2str(ilosc_k(j))])
grid on
txt='$$ y(t)=\displaystyle\sum_{k=1}^{\infty} \frac{4A}{k\pi} \sin (k\omega_0t) $$';
text(2.7,1.5,txt,'Interpreter','latex')
subplot(2,1,2)
k=1:2:ilosc_k(j);
plot( (k*w0/(2*pi)),4*A./(k*pi),'o' )
ylabel('$$ \frac{4A}{k\pi} $$','Interpreter','latex')
%set(get(gca,'ylabel'),'rotation',0)
xlabel('$$ \frac{k\omega_0}{2\pi} $$','Interpreter','latex')

end



