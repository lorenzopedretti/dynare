%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Lorenzo Pedretti
%Habit in C Model from McCandless - The ABCs of RBCs
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

var c (long_name='Consumption') h (long_name='Labor') r (long_name='Implicit Interest Rate') w (long_name='Implicit Wage') y (long_name='Output') k (long_name='Capital Stock') i (long_name='Investment') lambda $lambda$ (long_name='TFP');
varexo e;

parameters beta $\beta$ delta $\delta$ theta $\theta$ A $A$ gamma $\gamma$ sigmae $\sigma_e$ zeta $\zeta$;
beta=0.99;
delta=0.025;
theta=0.36;
A=0.44;
gamma=0.95;
sigmae=0.0032;
zeta=0.75;

model;
1/exp(c)*(1-beta*zeta)=beta*1/exp(c(+1))*(1-beta*zeta)*(r(+1)+1-delta);
(1-exp(h))*(1-theta)*exp(y)/exp(h)=A*exp(c)/(1-beta*zeta);
exp(w)=exp(lambda)*(1-theta)*(exp(k(-1))/exp(h))^theta;
r=exp(lambda)*theta*(exp(h)/exp(k(-1)))^(1-theta);
exp(y)=exp(lambda)*(exp(k(-1))^theta)*exp(h)^(1-theta);
exp(y)=exp(c)+exp(i);
exp(k)=exp(i)+(1-delta)*exp(k(-1));
lambda=gamma*lambda(-1)+e;
end;


shocks;
var e = sigmae^2;
end;

steady;

stoch_simul(order=1);
write_latex_parameter_table;
write_latex_dynamic_model;
habit_1=oo_.irfs;
