function [ys,params,check]  = problemset52_steadystate(ys,exo,M_,options_)

alpha = M_.params(1);
theta = M_.params(2);
chi = M_.params(3);
beta = M_.params(4);
delta = M_.params(5);
rhoa = M_.params(6);
rhog = M_.params(7);
sea = M_.params(8);
seg = M_.params(9);
omega = M_.params(10);

N=1/3;
K=(alpha/(beta^(-1)-1+delta))^(1/(1-alpha))*N;
Y=K^alpha*N^(1-alpha);
A=1;
G=omega*Y;
R=beta^(-1)-1+delta;
r=beta^(-1)-1;
w=(1-alpha)*(K/N)^(alpha);
C=Y-delta*K-omega*Y;
I=delta*K;
w=log(w);
R=log(R);
Y=log(Y);
N=log(N);
K=log(K);
G=log(G);
C=log(C);
A=log(A);
I=log(I);
r=log(r);

check=0;
ys=[w; R; Y; N; K; G; C; A; I; r];
params=[alpha; theta; chi; beta; delta; rhoa; rhog; sea; seg; omega];