clear all;
close all;

global alpha beta sigma delta v0 k0 kmat
alpha=0.36;
beta=0.95;
sigma=2;
delta=0.1;

kstar=(alpha/((1-beta)/beta+delta)).^(1/(1-alpha));
cstar=kstar.^alpha-delta.*kstar;
kmin=0.25.*kstar;
kmax=1.75.*kstar;
points=299; %300-1
kgrid=(kmax-kmin)/points;
kmat=kmin:kgrid:kmax;
kmat=kmat';

imax=500;
i=0;
tol=0.01;
dif=1+tol;
v0=zeros(points+1,1);
polfun=zeros(points+1, 3); %row 1: v1 - row2: k1 - row3: consumption

while i<imax && dif>tol
    for j=1:(points+1)
        k0=kmat(j,1);
        k1=fminbnd(@value_function_ramsey,kmin,kmax);
        polfun(j,1)=-value_function_ramsey(k1);
        polfun(j,2)=k1;
    end
    dif=norm(polfun(:,1)-v0);
    v0=polfun(:,1);
    i=i+1;
end
for j=1:(points+1)
  k=polfun(j,2);
  polfun(j,3)=kmat(j,1).^alpha+(1-delta).*kmat(j,1)-polfun(j,2);
end

gamma=beta*(alpha*(alpha-1)*kstar^(alpha-1)/(sigma*(alpha*kstar^(alpha-1)+1-delta)));
syms R;
eqn=(R/(R-gamma))^2==((1-delta)+alpha*kstar^alpha-gamma*cstar)*R/(R-gamma)-cstar*R;
s=vpasolve(eqn,R,[0.01 10]);
numpolfun=zeros(points+1,1);
for j=1:(points+1)
  numpolfun(j,1)=exp(s*(log(kmat(j,1)/kstar)))*cstar;
end

figure
plot(kmat,polfun(:,1))
title('Value Function')
xlabel('k')
ylabel('v(k)')

figure
plot(kmat,polfun(:,2),kmin:kmax,kmin:kmax,':')
title('Capital')
xlabel('k')
ylabel('k+1')

figure
plot(kmat,polfun(:,3),kmat,numpolfun(:,1))
title('Consumption')
xlabel('k')
ylabel('c')
legend('Value Iteration', 'Numerical Solution')

