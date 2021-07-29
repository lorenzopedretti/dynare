%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Lorenzo Pedretti
%from Sims - Economics 60202: Macro Theory II 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

var C i pi N w m mc A Y vp pireset x1 x2 deltam r;
varexo eA em;
parameters sigma beta chi psi theta phi epsilon rhoA seA rhom sem PI;
sigma=1;
load param_phi;
set_param_value('phi',phi);
chi=1;
psi=1;
epsilon=10;
theta=1;
rhoA=0.95;
rhom=0;
PI=0;
beta=0.99;
seA=0.01;
sem=0.01;

model;
[name='FOC Consumption']
exp(C)^(-sigma)=beta*exp(C(+1))^(-sigma)*(1+i)/(1+pi(+1));
[name='Labor supply']
psi*exp(N)^chi=exp(C)^(-sigma)*exp(w);
[name='Money Demand']
exp(m)=theta*(1+i)/(i)*exp(C)^sigma;
[name='Labor Demand']
exp(mc)=exp(w)/exp(A);
[name='Aggregate feasibility']
exp(Y)=exp(C);
[name='Aggregate production']
exp(Y)=(exp(A)*exp(N))/exp(vp);
[name='Price dispersion']
exp(vp)=(1-phi)*(1+pireset)^(-epsilon)*(1+pi)^epsilon+(1+pi)^epsilon*phi*exp(vp(-1));
[name='Price level']
(1+pi)^(1-epsilon)=(1-phi)*(1+pireset)^(1-epsilon)+phi;
[name='Reset price']
1+pireset=epsilon/(epsilon-1)*(1+pi)*(exp(x1)/exp(x2));
[name='x1']
exp(x1)=exp(C)^(-sigma)*exp(mc)*exp(Y)+phi*beta*(1+pi(+1))^epsilon*exp(x1(+1));
[name='x2']
exp(x2)=exp(C)^(-sigma)*exp(Y)+phi*beta*(1+pi(+1))^(epsilon-1)*exp(x2(+1));
[name='Process for A']
A=rhoA*A(-1)+eA;
[name='Process for m']
deltam=(1-rhom)*PI-pi+rhom*(deltam(-1))+rhom*pi(-1)+em;
deltam=m-m(-1);
[name='Fisher']
1+i=(1+pi(+1))*(1+r);
end;
shocks;
var eA=seA^2;
var em=sem^2;
end;

initval;
A=0;
pi=PI;
i=beta^(-1)*(1+PI)-1;
pireset=(((1+PI)^(1-epsilon)-phi)/(1-phi))^(1/(1-epsilon))-1;
vp=log((1-phi)*((1+pi)/1+pireset)^epsilon/(1-phi*(1+pi)^epsilon));
mc=log((1-phi*beta*(1+pi)^epsilon)/(1-phi*beta*(1+pi)^(epsilon-1))*((1+pireset)/(1+pi))*(epsilon-1)/epsilon);
N=log((1/psi*exp(vp)^sigma*exp(mc))^(1/(chi+sigma)));
Y=log(exp(A)*exp(N));
m=log(theta*(1+i)/i*exp(Y)^sigma);
deltam=PI;
r=(1+i)/(1+pi)-1;
w=log(exp(mc)*exp(A));
C=log((psi*exp(N)^chi/exp(w))^(-1/sigma));
x1=log(exp(C)^(-sigma)*exp(mc)*exp(Y)/(1-phi*beta*(1+pi)^epsilon));
x2=log(exp(C)^(-sigma)*exp(Y)/(1-phi*beta*(1+pi)^(epsilon-1)));
end;
steady;
stoch_simul(order=1);
write_latex_dynamic_model;