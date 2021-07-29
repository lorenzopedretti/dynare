function u=ufun(omega)
global theta chi alpha beta delta debttogdp psi


tau=(1-alpha)^(-1)*(omega+(beta^(-1)-1)*debttogdp);
R=beta^(-1)-1+delta;
n=((1-tau)*(1-alpha)/(theta*(1-delta*alpha/R-omega)))^(1/(1+chi));
k=(alpha/R)^(1/(1-alpha))*n;
y=k^alpha*n^(1-alpha);
w=(1-alpha)*y/n;
c=(1-tau)*w/(theta*n^chi);
i=delta*k;
g=y*omega;
u=log(c)-theta*(n^(1+chi)/(1+chi))+psi*log(g);
u=-u;
