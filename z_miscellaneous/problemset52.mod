var w R Y N K G C A I r;
varexo ea eg;

parameters alpha theta chi beta delta rhoa rhog sea seg omega;
alpha=1/3;
beta=0.99;
chi=1;
delta=0.02;
rhoa=0.97;
rhog=0.95;
sea=0.01;
seg=0.01;
omega=0.20;
theta=10.3712296983759;


model;
exp(w)=exp(Y)/exp(N)*(1-alpha);
exp(R)=exp(Y)/exp(K(-1))*alpha;
theta*exp(N)^chi*exp(C)=exp(w);
exp(Y)=exp(A)*exp(N)^(1-alpha)*exp(K(-1))^alpha;
exp(C(+1))=beta*exp(C)*(exp(R(+1))+1-delta);
exp(C(+1))=beta*exp(C)*(exp(r)+1);
exp(Y)=exp(C)+exp(I)+exp(G);
exp(I)=exp(K)-(1-delta)*exp(K(-1));
G=(1-rhog)*STEADY_STATE(G)+rhog*G(-1)+eg;
A=rhoa*A(-1)+ea;
end;

steady;

shocks;
var ea=sea^2;
var eg=seg^2;
end;

stoch_simul(order=1, irf=20) Y C I N w r G;
disp('Government spending multiplier');
disp(oo_.irfs.Y_eg(1)*exp(oo_.steady_state(3,1))/(oo_.irfs.G_eg(1)*exp(oo_.steady_state(6,1))));