clear all
T=4; % d�ugo�� sygna�u
N=1000; % ilo�� pr�bek
fs=40;  % cz�stotliwo�� pr�bkowania
A=2;    % amplituda sygna�u
w0=pi;  % cz�sto��
%ilosc_skladowych=[1 3 10 20 100]; %wektor sk�adowych
ilosc_skladowych=10000
t=(T./N):(T./N):T; % wektor czasu

for j=1:length(ilosc_skladowych) % p�tla w celu uzyskania wykresu dla ka�dej zadanej ilo�ci sk��dowych
y=zeros(1,N); %zerowanie macierzy
    for i=1:length(t)   
        for k=1:ilosc_skladowych(j) % sumowanie sk�adowych
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
title(['Wykes funkcji dla ', num2str(ilosc_skladowych(j)), ' sk�adowych'])
grid on

subplot(2,1,2)
k=1:ilosc_skladowych(j);
plot( 4*A./(k*pi),(k*w0/(2*pi)),'o' )
ylabel('$$ \frac{4A}{k\pi} $$','Interpreter','latex')
%set(get(gca,'ylabel'),'rotation',0)
xlabel('$$ \frac{k\omega_0}{2\pi} $$','Interpreter','latex')

end



