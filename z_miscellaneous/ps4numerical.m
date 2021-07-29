clear all
global theta chi alpha beta delta debttogdp psi u1 u2
beta=0.99;
delta=0.025;
alpha=1/3;
theta=5;
chi=1;
psi=0.3;
debttogdp=1;

omega=fminbnd(@ufun,0,1);
tau=(alpha)^(-1)*(omega+(beta^(-1)-1)*debttogdp);
u1=-ufun(omega)/(1-beta);
disp(omega);
disp(tau);
disp(u1)

debttogdp=0;

omega=fminbnd(@ufun,0,1);
tau=(alpha)^(-1)*(omega+(beta^(-1)-1)*debttogdp);
u2=-ufun(omega)/(1-beta);
disp(omega);
disp(tau);
disp(u2)

Delta=fminbnd(@delta_metric,0,1);
disp(Delta);
