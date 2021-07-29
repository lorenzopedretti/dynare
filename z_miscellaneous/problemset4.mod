var n $N$ c $C$ tau $\tau$ w $W$ R $R$ y $Y$ r $r$ k $K$ i $I$ g $G$ a $A$ d $D$;
varexo eg $\varepsilon_G$ ea $\varepsilon_A$;

parameters theta $\theta$ chi $\chi$ beta $\beta$ delta $\delta$ alpha $\alpha$ rhog $\rho_G$ rhot $\rho_\tau$ rhoa $\rho_A$ gammat $\gamma_\tau$ debttogdp $\frac{D^\ast}{Y^\ast}$ omega $\omega$ sa $\sigma_A$ sg $\sigma_G$ psi $\psi$;
load param_problemset4;
set_param_value('theta',theta);
set_param_value('chi',chi);
set_param_value('beta',beta);
set_param_value('delta',delta);
set_param_value('alpha',alpha);
set_param_value('rhog',rhog);
set_param_value('rhot',rhot);
set_param_value('rhoa',rhoa);
set_param_value('gammat',gammat);
set_param_value('debttogdp',debttogdp);
set_param_value('omega',omega);
set_param_value('sa',sa);
set_param_value('sg',sg);
set_param_value('psi',psi);

model;
theta*n^(chi)*c=(1-tau)*w;
c(+1)=beta*c*(1-delta+R(+1));
c(+1)=beta*c*(1+r);
w=((1-alpha)*y)/n;
R=alpha*y/k(-1);
y=c+i+g;
i=k-(1-delta)*k(-1);
y=a*k^alpha*n^(1-alpha);
log(g)=(1-rhog)*log(STEADY_STATE(g))+rhog*log(g(-1))+eg;
tau=(1-rhot)*STEADY_STATE(tau)+rhot*tau(-1)+(1-rhot)*gammat*(d/y-debttogdp);
log(a)=rhoa*log(a(-1))+ea;
g+(1+r(-1))*d(-1)=tau*w*n+d;
end;

steady_state_model;
tau=(1-alpha)^(-1)*(omega+(beta^(-1)-1)*debttogdp);
R=beta^(-1)-1+delta;
n=((1-tau)*(1-alpha)/(theta*(1-delta*alpha/R-omega)))^(1/(1+chi));
k=(alpha/R)^(1/(1-alpha))*n;
y=k^alpha*n^(1-alpha);
w=(1-alpha)*y/n;
c=(1-tau)*w/(theta*n^chi);
i=delta*k;
g=y*omega;
a=1;
r=beta^(-1)-1;
d=debttogdp*y;
end;

steady;

shocks;
%var ea=sa^2;
var eg=sg^2;
end;

stoch_simul(order=1, irf=40) y c i n r w tau d g;

disp('');
disp('GVT SPENDING MULTIPLIER');
disp(oo_.irfs.y_eg(1)/oo_.irfs.g_eg(1));
