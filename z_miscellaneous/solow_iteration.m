k=zeros(400,1);
k(1,1)=1;
alpha=1/3;
sigma=1/2;
A=1;
for i=2:1000
    k(i,1)=sigma.*A.*k(i-1,1).^alpha+(1-0.025).*k(i-1,1);
    A=A.*1.001;
end
k1(1,1)=1;
alpha=1/3;
sigma=1/4;
A=1;
for i=2:1000
    k1(i,1)=sigma.*A.*k1(i-1,1).^alpha+(1-0.025).*k1(i-1,1);
    A=A.*1.001;
end
t=1:1000;
plot(t,log(k),t,log(k1));
slope=log(k(1000,1))-log(k(800,1));
slope1=log(k1(1000,1))-log(k1(800,1));
disp(slope);
disp(slope1);