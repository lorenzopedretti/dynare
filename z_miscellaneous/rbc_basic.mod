%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Lorenzo Pedretti
%Hansen Basic Model from McCandless - The ABCs of RBCs
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

var c (long_name='Consumption') h (long_name='Labor') r (long_name='Implicit Interest Rate') w (long_name='Implicit Wage') y (long_name='Output') k (long_name='Capital Stock') i (long_name='Investment');
varexo lambda;

parameters beta delta theta A gamma;
beta=0.99;
delta=0.025;
theta=0.36;
A=1.72;
gamma=0.95;

model;
exp(c(+1))=exp(c)*beta*(exp(r(+1))+1-delta);
(1-exp(h))*(1-theta)*exp(y)/exp(h)=A*exp(c);
exp(w)=exp(lambda)*(1-theta)*(exp(k(-1))/exp(h))^theta;
exp(r)=exp(lambda)*theta*(exp(h)/exp(k(-1)))^(1-theta);
exp(y)=exp(lambda)*(exp(k(-1))^theta)*exp(h)^(1-theta);
exp(y)=exp(c)+exp(i);
exp(k)=exp(i)+(1-delta)*exp(k(-1));
end;

initval;
lambda=log(1);
end;

steady;

init_steady_state=zeros(7,1);
for i=1:7
    init_steady_state(i)=oo_.steady_state(i);
end

endval;
lambda=log(1.1);
end;

steady;
simul(periods=200);


tt=0:201;

figure
subplot(3,3,1);
plot(tt, oo_.endo_simul(1,:), tt, oo_.steady_state(1)*ones(1,202), tt, init_steady_state(1)*ones(1,202));
title('c')
subplot(3,3,2);
plot(tt, oo_.endo_simul(2,:), tt, oo_.steady_state(2)*ones(1,202), tt, init_steady_state(2)*ones(1,202));
title('h')
subplot(3,3,3);
plot(tt, oo_.endo_simul(3,:), tt, oo_.steady_state(3)*ones(1,202), tt, init_steady_state(3)*ones(1,202));
title('r')
subplot(3,3,4);
plot(tt, oo_.endo_simul(4,:), tt, oo_.steady_state(4)*ones(1,202), tt, init_steady_state(4)*ones(1,202));
title('w')
subplot(3,3,5);
plot(tt, oo_.endo_simul(5,:), tt, oo_.steady_state(5)*ones(1,202), tt, init_steady_state(5)*ones(1,202));
title('y')
subplot(3,3,6);
plot(tt, oo_.endo_simul(6,:), tt, oo_.steady_state(6)*ones(1,202), tt, init_steady_state(6)*ones(1,202));
title('k')
subplot(3,3,7);
plot(tt, oo_.endo_simul(7,:), tt, oo_.steady_state(7)*ones(1,202), tt, init_steady_state(7)*ones(1,202));
title('i')

write_latex_parameter_table;
