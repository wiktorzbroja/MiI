clear all
T=10;
N=2000;
fs=40;
A=2;
w0=pi;
ilosc_skladowych=100;

k=1:10;
y=zeros(1,N);
t=(T./N):(T./N):T;
for i=1:length(t)
   for k=1:ilosc_skladowych
       if mod(k,2)==1
          y(i)=y(i)+(4*A/(k*pi)*sin(k*w0*t(i)));
       end
    end
end
plot(t,y)
xlabel('czas [s]')
ylabel('amlituda [-]')
title(['Wykes funkcji dla ', num2str(ilosc_skladowych), ' sk³adowych'])
grid on
