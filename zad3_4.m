clc
clear all

load('wyniki3_3.mat')

N=4000;
fs=4000;
T = 1/fs; % okres pr�bkowania       
t = 0:T:1-T; %wektor czasu
y2=N*ifft(ifftshift(Y2));

t = [0:1:length(y)-1]/fs; %recompute time index 
plot(t,y2,':','LineWidth',1.5);%reconstructed signal
hold on
plot(t,y, 'r--')
set(gcf,'color','w');
xlim([0 0.2])
title('Por�wnanie orginalnego i odtworzonego sygna�u z �w. 3.2')

legend('orgina�','odtworzony')
xlabel('czas [s]')
ylabel('warto�� sygna�u [-]')
