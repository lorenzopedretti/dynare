var y k c a n;
varexo e;

parameters beta psi phi alpha delta rho se;
load param_problemset3;
set_param_value('alpha',alpha);
set_param_value('beta',beta);
set_param_value('delta',delta);
set_param_value('psi',psi);
set_param_value('phi',phi);
set_param_value('rho',rho);
set_param_value('se',se);

model;
exp(k)=exp(y)-exp(c)+(1-delta)*exp(k(-1));
exp(c(+1))=beta*exp(c)*(alpha*exp(y(+1))/exp(k)+1-delta);
psi*exp(n)^phi*exp(c)=(1-alpha)*exp(y)/exp(n);
exp(y)=exp(a)*exp(k(-1))^alpha*exp(n)^(1-alpha);
a=rho*a(-1)+e;
end;

steady;

shocks;
var e=se^2;
end;

stoch_simul(order=1);