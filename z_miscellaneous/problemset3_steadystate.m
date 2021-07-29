function [ys,params,check]  = problemset3_steadystate(ys,exo,M_,options_)

beta = M_.params(1);
psi = M_.params(2);
phi = M_.params(3);
alpha = M_.params(4);
delta = M_.params(5);
rho = M_.params(6);
se = M_.params(7);

n=((1-alpha)*(beta^(-1)-1+delta)/(psi*(beta^(-1)-1+delta-alpha*delta)))^(1/(phi+1));
k=n*(alpha/(beta^(-1)-1+delta))^(1/(1-alpha));
y=k^alpha*n^(1-alpha);
c=y-delta*k;
a=1;

n=log(n);
k=log(k);
y=log(y);
c=log(c);
a=log(a);
check=0;
ys=[y; k; c; a; n];
params=[beta; psi; phi; alpha; delta; rho; se];