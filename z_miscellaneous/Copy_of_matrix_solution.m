beta=0.99;
alpha=1/3;
sigma=1;
delta=0.025;
rho=0.95;
se = 0.01;
kstar=(alpha/((1-beta)/beta+delta)).^(1/(1-alpha));
cstar=kstar^alpha-delta*kstar;
M=[1 alpha*beta*kstar^(alpha-1)*(alpha-1)/sigma alpha*beta*kstar^(alpha-1)/sigma; -cstar/kstar kstar^(alpha-1)*alpha+1-delta kstar^(alpha-1); 0 0 rho];
[lam V j] = eig_order(M);
G=V^(-1);
G3=G(j,1);
G4=G(j,2:3);
phi=-G3^(-1)*G4;
disp(phi);

A=M(2:3,2:3)+M(2:3,1)*phi;
B=[0;1];
C=M(1,2:3)+M(1,1)*phi;
D=phi(1,2);
[lam1 V1 j1] = eig_order(A-B*D^(-1)*C);
disp(lam1)

rho=zeros(100,1);
for j=1:100
    rho(j,1)=C*(A-B*D^(-1)*C)^(j-1)*B*D^(-1);
end

plot(rho)

simul=zeros(1000,3);
k0=0;
a0=0;
for t=1:1000
    simul(t,2:3)=A*[k0;a0]+B*se*randn;
    simul(t,1)=phi*simul(t,2:3)';
    k0=simul(t,2);
    a0=simul(t,3);
end

sys = ar(simul(:,1),1, 'ls')

sys = ar(simul(:,1),2, 'ls')

sys = ar(simul(:,1),4, 'ls')

sys = ar(simul(:,1),8, 'ls')

sys = ar(simul(:,1),12, 'ls')
