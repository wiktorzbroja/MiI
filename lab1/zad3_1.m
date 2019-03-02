clear all
T=10;
N=2000;
fs=40;
A=2;
w0=pi;
k=1:10;
y=zeros(1,N);
t=(T./N):(T./N):T;
for i=1:length(t)
   for k=1:20
       if mod(k,2)==1
          y(i)=y(i)+(4*A/(k*pi)*sin(k*w0*t(i)));
       end
    end
end
plot(t,y)