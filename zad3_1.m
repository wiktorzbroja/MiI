clear all
T=4; % d³ugoœæ sygna³u
N=1000; % iloœæ próbek
fs=40;  % czêstotliwoœæ próbkowania
A=2;    % amplituda sygna³u
w0=pi;  % czêstoœæ
%ilosc_skladowych=[1 3 10 20 100]; %wektor sk³adowych
ilosc_skladowych=10000
t=(T./N):(T./N):T; % wektor czasu

for j=1:length(ilosc_skladowych) % pêtla w celu uzyskania wykresu dla ka¿dej zadanej iloœci sk³¹dowych
y=zeros(1,N); %zerowanie macierzy
    for i=1:length(t)   
        for k=1:ilosc_skladowych(j) % sumowanie sk³adowych
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
title(['Wykes funkcji dla ', num2str(ilosc_skladowych(j)), ' sk³adowych'])
grid on

subplot(2,1,2)
k=1:ilosc_skladowych(j);
plot( 4*A./(k*pi),(k*w0/(2*pi)),'o' )
ylabel('$$ \frac{4A}{k\pi} $$','Interpreter','latex')
%set(get(gca,'ylabel'),'rotation',0)
xlabel('$$ \frac{k\omega_0}{2\pi} $$','Interpreter','latex')

end



