clear all;


beta=0.99;
delta=0.025;
alpha=1/3;
theta=5;
chi=1;
psi=0.3;
debttogdp=1;
rhoa=0.95;
rhog=0.99;
rhot=0.8;
gammat=0.3;
sa=0.01;
sg=0.01;
omega=0.1692;
save param_problemset4 theta chi psi beta delta alpha rhog rhot rhoa gammat debttogdp omega sa sg;
dynare problemset4;