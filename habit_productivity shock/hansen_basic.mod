%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Lorenzo Pedretti
%Hansen Basic Model from McCandless - The ABCs of RBCs
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

var c (long_name='Consumption') h (long_name='Labor') r (long_name='Implicit Interest Rate') w (long_name='Implicit Wage') y (long_name='Output') k (long_name='Capital Stock') i (long_name='Investment') lambda (long_name='TFP');
varexo e;

parameters beta $\beta$ delta $\delta$ theta $\theta$ A $A$ gamma $\gamma$ sigmae $\sigma_e$;
beta=0.99;
delta=0.025;
theta=0.36;
A=1.72;
gamma=0.95;
sigmae=0.0032;

model;
exp(c(+1))=exp(c)*beta*(r(+1)+1-delta);
(1-exp(h))*(1-theta)*exp(y)/exp(h)=A*exp(c);
exp(w)=exp(lambda)*(1-theta)*(exp(k(-1))/exp(h))^theta;
r=exp(lambda)*theta*(exp(h)/exp(k(-1)))^(1-theta);
exp(y)=exp(lambda)*(exp(k(-1))^theta)*exp(h)^(1-theta);
exp(y)=exp(c)+exp(i);
exp(k)=exp(i)+(1-delta)*exp(k(-1));
lambda=gamma*lambda(-1)+e;
end;

initval;
c=log(0.9186);
h=log(0.3335);
r=0.0351;
w=log(2.3706);
y=log(1.2353);
k=log(12.6698);
i=log(0.3167);
lambda=log(1);
end;

shocks;
var e = sigmae^2;
end;

steady;

stoch_simul(order=1);
write_latex_parameter_table;
write_latex_dynamic_model;

basic=oo_.irfs;