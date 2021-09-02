%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Lorenzo Pedretti
%Durable Consumption - 1 sector economy
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

var lambda $\lambda$ C D K N A d;
varexo e $\varepsilon$;
parameters eta $\eta$ alpha $\alpha$ chi $\chi$ psi $\psi$ deltaD $\delta_D$ deltaK $\delta_K$ rho $\rho$ beta $\beta$;
alpha=0.36;
chi=1;
deltaD=0.025;
deltaK=0.025;
rho=0.95;
beta=0.99;
eta=13.7523729171061*(1-beta*(1-deltaD));%from Nipa 1.1.10
psi=((1-alpha)*3^(chi+1)*(1+(deltaD*eta)/(1-beta*(1-deltaD)))*(1-(deltaK*alpha)/(1/beta-1+deltaK))^(-1)); %I calibrate psi s.t. N=1/3

model;
lambda=1/(C);
eta/(D)+beta*lambda(+1)*(1-deltaD)=lambda;
psi*N^chi=lambda*(1-alpha)*A*K(-1)^alpha*N^(-alpha);
lambda=beta*lambda(+1)*((1-deltaK)+alpha*A(+1)*K^(alpha-1)*N(+1)^(1-alpha));
log(A)=rho*log(A(-1))+e;
C+d+K=(1-deltaK)*K(-1)+A*K(-1)^alpha*N^(1-alpha);
d=D-D(-1)*(1-deltaD);
end;

steady_state_model;
A=1;
N=((1-alpha)/psi*(1+(deltaD*eta)/(1-beta*(1-deltaD)))*(1-(deltaK*alpha)/(1/beta-1+deltaK))^(-1))^(1/(chi+1));
D=(1-alpha)*eta/(psi*(1-beta*(1-deltaD)))*(alpha/(beta^(-1)-1+deltaK))^(alpha/(1-alpha))/N^chi;
d=deltaD*D;
C=D/eta*(1-beta*(1-deltaD));
K=N*(alpha/(beta^(-1)-1+deltaK))^(1/(1-alpha));
lambda=1/C;
end;

shocks;
var e=(0.01)^2;
end;
steady;
check;
stoch_simul(order=1);
write_latex_dynamic_model;
write_latex_steady_state_model;
write_latex_parameter_table;
