clc
clear all

load('wyniki3_3.mat')

N=4000;
fs=4000;
y2=N*ifft(ifftshift(M));

t = [0:1:length(y)-1]/fs; %recompute time index 
plot(y2,':');%reconstructed signal
hold on
plot(y, 'r--')
xlim([0 400])
legend('orgina³','odtworzony')
