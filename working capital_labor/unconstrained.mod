%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Lorenzo Pedretti
%from Sims - Economics 60202: Macro Theory II 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

var lambda C N w r Y q K I xi A;
varexo eA eXi;
parameters beta chi theta alpha delta phi sA sXi rhoA rhoXi XI KN mu;
load param_phi;
set_param_value('phi',phi);
chi=1;
beta=0.99;
alpha=1/3;
delta=0.02;
theta=7.71;
rhoA=0.98;
sA=0.01;
rhoXi=0.90;
sXi=0.01;
XI=log(0.05);
KN=(alpha/(1/beta-1+delta))^(1/(1-alpha));
mu=0;

model;
exp(lambda)=1/exp(C);%OK
theta*exp(N)^chi=exp(lambda)*exp(w);
exp(lambda)=beta*exp(lambda(+1))*(1+r);
exp(w)*(1)=(1-alpha)*exp(Y)/exp(N);
1=exp(q)*(1-phi*(exp(I)/exp(K(-1))-delta));
exp(q)=beta*exp(lambda(+1))/exp(lambda)*(alpha*exp(Y(+1))/exp(K)+exp(q(+1))*((1-delta)-phi/2*(exp(I(+1))/exp(K)-delta)^2+phi*(exp(I(+1))/exp(K)-delta)*exp(I(+1))/exp(K)));
exp(Y)=exp(A)*exp(K(-1))^alpha*exp(N)^(1-alpha);
exp(Y)=exp(C)+exp(I);
exp(K)=exp(I)-phi/2*(exp(I)/exp(K(-1))-delta)^2*exp(K(-1))+(1-delta)*exp(K(-1));
A=rhoA*A(-1)+sA*eA;
xi=(1-rhoXi)*XI+rhoXi*xi(-1)+sXi*eXi;
end;

shocks;
var eA = 1;
var eXi = 1;
end;


initval;
w=exp(XI)*KN; %if binding
N=(1/theta*(1+mu)^(-1)*(1-alpha)*(KN)^alpha/(KN^alpha-delta*KN))^(1/(1+chi));
K=KN*N;
C=N*(KN^alpha-delta*KN);
lambda=1/C;
I=delta*K;
r=beta^-1-1;
Y=C+I;
Y=log(Y);
q=0;
I=log(I);
C=log(C);
lambda=log(lambda);
xi=XI;
K=log(K);
A=0;
N=log(N);
w=log(w);
end;

steady;

stoch_simul(order=1);