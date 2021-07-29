beta=0.99;
alpha=1/3;
sigma=1;
delta=0.025;
rho=0.99;
sA = 0.01;
kstar=(alpha/((1-beta)/beta+delta)).^(1/(1-alpha));
cstar=kstar^alpha-delta*kstar;
ystar=kstar^alpha;
istar=ystar-cstar;
b11=[sigma (1-alpha)*alpha*kstar^(alpha-1) (-alpha)*beta*kstar^(alpha-1); 0 kstar 0; 0 0 1];
c11=[sigma 0 0; -cstar alpha*kstar^alpha+(1-delta)*kstar kstar^alpha; 0 0 rho];
M=b11^(-1)*c11;
[lam V j] = eig_order(M);
G=V^(-1);
G3=G(j,1);
G4=G(j,2:3);
coeff=-G3^(-1)*G4;
disp(coeff);
M11=M(1,1);
M12=M(1,2:3);
M21=M(2:3,1);
M22=M(2:3,2:3);
H=[0 M11*coeff+M12; [0;0] M21*coeff+M22];
disp(H);
a=sA/(1-rho);
k=0;
irf=zeros(41,5);
irf(1,:)=[coeff*[k a]' k a a+alpha*k (ystar*(a+alpha*k)-coeff*[k a]'*cstar)/istar];
for i=1:40
    irf(i+1,1:3)=(H^i*[coeff*[k a]' k a]')';
    irf(i+1,4:5)=[irf(i+1,3)+alpha*irf(i+1,2) (ystar*(irf(i+1,3)+alpha*irf(i+1,2))-coeff*[irf(i+1,2) irf(i+1,3)]'*cstar)/istar];
end
tt=0:40;

figure
subplot(3,2,1);
plot(tt,irf(:,1))
title('Consumption')
subplot(3,2,2);
plot(tt,irf(:,2))
title('Capital')
subplot(3,2,3);
plot(tt,irf(:,3))
title('Productivity')
subplot(3,2,4);
plot(tt,irf(:,4))
title('Output')
subplot(3,2,5);
plot(tt,irf(:,5))
title('Investment')

simul=zeros(10001,5);
a=0;
k=0;
for j=0:10000
        y=a+alpha*k;
        i=(ystar*(a+alpha*k)-coeff*[k a]'*cstar)/istar;
        simul(j+1,:)=[coeff*[k a]' k a y i];
        x=(H*[coeff*[k a]' k a]')+[0 0 sA]'*randn;
        k=x(2);
        a=x(3);
end

for j=0:100
    simul(j+1,:)=[];
end
var_simul=var(simul);
sd_simul=var_simul.^(1/2);
disp(sd_simul);
disp(sd_simul(1)/sd_simul(4));%consumption to output
disp(sd_simul(5)/sd_simul(4));%investment to output