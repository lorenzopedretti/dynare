var w C nu N delta R u r Y Khat K A I tfp;
varexo enu eA;

parameters theta chi beta phi1 phi2 alpha delta0 rhonu sigmanu rhoA sigmaA;
load param_problemset5;
set_param_value('alpha',alpha);
set_param_value('beta',beta);
set_param_value('delta0',delta0);
set_param_value('theta',theta);
set_param_value('phi1',phi1);
set_param_value('phi2',phi2);
set_param_value('chi',chi);
set_param_value('rhonu',rhonu);
set_param_value('rhoA',rhoA);
set_param_value('sigmanu',sigmanu);
set_param_value('sigmaA',sigmaA);

model;
exp(w)=exp(C)*exp(nu)*theta*exp(N)^chi;
exp(C(+1))=beta*exp(C)*(1-exp(delta(+1))+exp(R(+1))*exp(u(+1)));
exp(C(+1))=beta*exp(C)*(1+exp(r));
(phi1+phi2*(exp(u)-1))=exp(R);
exp(w)=(1-alpha)*exp(Y)/exp(N);
exp(R)=alpha*exp(Y)/exp(Khat);
exp(Khat)=exp(K(-1))*exp(u);
exp(Y)=exp(A)*exp(Khat)^alpha*exp(N)^(1-alpha);
exp(I)=exp(K)-(1-exp(delta))*exp(K(-1));
exp(Y)=exp(C)+exp(I);
exp(delta)=delta0+phi1*(1-exp(u))+phi2/2*(1-exp(u))^2;
nu=nu(-1)*rhonu+enu;
A=A(-1)*rhoA+eA;
tfp=A+alpha*u;
end;

steady;

shocks;
var eA=sigmaA^2;
var enu=sigmanu^2;
end;

stoch_simul(order=1, irf=40, noprint) w C N I R u r Y A tfp;
stoch_simul(order=1, hp_filter=1600, nocorr, nofunctions, nograph, nodecomposition, print) Y N;
