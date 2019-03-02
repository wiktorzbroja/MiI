clear all


fs=1000;
N=1000;
t=[1:N]*1/fs;
x=2*sin(2*pi*10*t);

kor_ML=xcorr(x,x);


x1=horzcat(zeros(1,N), x);
x2=horzcat(x, zeros(1,N));

for k=1:(2*N-1)

        x2_mv=horzcat(zeros(1,k), x2(1:end-k));
        kor(k)=sum(x1.*x2_mv);
end


plot(kor,':','LineWidth',2)
hold on
plot(kor_ML, 'r--')
legend('korelacja nasza', 'korelacja ML')
xlabel('NIEWIEM [-]')
ylabel('amlituda [-]')
title('Wykes autokorelacji funkcji x(t)')
grid on