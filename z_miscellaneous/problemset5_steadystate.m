function [ys,params,check]  = problemset5_steadystate(ys,exo,M_,options_)

theta = M_.params(1);
chi = M_.params(2);
beta = M_.params(3);
phi1 = M_.params(4);
phi2 = M_.params(5);
alpha = M_.params(6);
delta0 = M_.params(7);
rhonu = M_.params(8);
sigmanu = M_.params(9);
rhoA = M_.params(10);
sigmaA = M_.params(11);

R=1/beta-1+delta0;
r=1/beta-1;
u=1;
kn=(alpha/R)^(1/(1-alpha));
w=(1-alpha)*kn^alpha;
N=(w/theta*(kn^alpha-delta0/R*(kn^alpha-w))^(-1))^(1/(chi+1));
K=kn*N;
C=kn^alpha*N-delta0*K;
Y=K^alpha*N^(1-alpha);
I=Y-C;
A=1;
Khat=K*u;
nu=1;
delta=delta0;
tfp=A;

w=log(w);
C=log(C);
nu=log(nu);
N=log(N);
delta=log(delta);
R=log(R);
u=log(u);
r=log(r);
Y=log(Y);
Khat=log(Khat);
K=log(K);
A=log(A);
I=log(I);
tfp=log(tfp);

check=0;
ys=[w; C; nu; N; delta; R; u; r; Y; Khat; K; A; I; tfp];
params=[theta; chi; beta; phi1; phi2; alpha; delta0; rhonu; sigmanu; rhoA; sigmaA];