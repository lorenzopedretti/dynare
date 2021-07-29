%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Lorenzo Pedretti
%Habit in C Model from McCandless - The ABCs of RBCs
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

var c (long_name='Consumption') h (long_name='Labor') r (long_name='Implicit Interest Rate') w (long_name='Implicit Wage') y (long_name='Output') k (long_name='Capital Stock') i (long_name='Investment') mu $\mu$;
varexo e;

parameters beta $\beta$ delta $\delta$ theta $\theta$ A $A$ gamma $\gamma$ sigmae $\sigma_e$ zeta $\zeta$ lambda;
beta=0.99;
delta=0.025;
theta=0.36;
A=1.87628483;
gamma=0.95;
sigmae=0.01;
zeta=0.9;
lambda=0;

model;
exp(mu)=1/(exp(c)-zeta*exp(c(-1)));
exp(mu)=beta*exp(mu(+1))*(r(+1)+1-delta);
A/(1-exp(h))=exp(w)*exp(mu);
exp(w)=exp(lambda)*(1-theta)*(exp(k)/exp(h))^theta;
r=exp(lambda)*theta*(exp(h)/exp(k))^(1-theta);
exp(y)=exp(lambda)*(exp(k)^theta)*exp(h)^(1-theta);
exp(y)=exp(c)+exp(i);
exp(k)=(exp(-e))*(exp(i)+(1-delta)*exp(k(-1)));
end;


shocks;
var e = sigmae^2;
end;
initval;
c=-0.085439;
h=-1.09861;
r=exp(-3.34953);
w=0.863142;
y=0.210817;
k=2.53869;
i=-1.15019;
mu=0.171617;
end;
steady;

stoch_simul(order=1);
write_latex_parameter_table;
write_latex_dynamic_model;
habit_3=oo_.irfs;
