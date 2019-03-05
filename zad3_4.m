clc
clear all

load('wyniki3_3.mat')

N=4000;
fs=4000;
T = 1/fs; % okres próbkowania       
t = 0:T:1-T; %wektor czasu
y2=N*ifft(ifftshift(Y2));

t = [0:1:length(y)-1]/fs; %recompute time index 
plot(t,y2,':','LineWidth',1.5);%reconstructed signal
hold on
plot(t,y, 'r--')
set(gcf,'color','w');
xlim([0 0.2])
title('Porównanie orginalnego i odtworzonego sygna³u z æw. 3.2')

legend('orgina³','odtworzony')
xlabel('czas [s]')
ylabel('wartoœæ sygna³u [-]')
