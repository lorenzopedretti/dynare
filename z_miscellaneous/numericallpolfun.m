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


gamma=beta*(alpha*(alpha-1)*kstar^(alpha-1)/(sigma*(alpha*kstar^(alpha-1)+1-delta)));
syms R;
eqn=(R/(R-gamma))^2==((1-delta)+alpha*kstar^alpha-gamma*cstar)*R/(R-gamma)-cstar*R;
s=vpasolve(eqn,R,[0.01 10]);
numpolfun=zeros(points+1,1);
for j=1:(points+1)
  numpolfun(j,1)=exp(s*(log(kmat(j,1)/kstar)))*cstar;
end

figure
plot(kmat,numpolfun(:,1))
title('Consumption')
xlabel('k')
ylabel('C')