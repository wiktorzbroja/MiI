clear all; 

h=[0 1 1 1 0 0 0];
x=[0 1 1 1 1 0 0];

h_fliped=fliplr(h);
x_new=[zeros(1,length(h)) x]; 
h_fliped=[h_fliped zeros(1,length(x))];

k=-5:1:10
x=sin(2*pi*k/8).*(heaviside(k)-heaviside(k-8));
h=-sin(2*pi*k/8).*(heaviside(k)-heaviside(k-8));
y=conv(x,h)

figure(1)
stem(h_fliped)
hold on
stem(x_new)
legend('h','x')

for n=1:length(x)+length(h)-1 
h_fliped_moved=[zeros(1,n) h_fliped(1:end-n) ];
y_conv(n)=sum(h_fliped_moved.*x_new);

figure(2)
clf
subplot(2,1,1)
stem(h_fliped_moved,'r')
hold all
stem(x_new,'--b')
legend('h','x')
xlabel('m')

subplot(2,1,2)
stem(y_conv,'-*k')
title('Wynik splotu sygna³u x[m] i h[m]')
xlabel('Przesuniêcie n')
pause(1)
end
