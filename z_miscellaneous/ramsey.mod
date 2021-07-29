var y k c i n w r;
varexo A;
parameters alpha beta delta phi;
alpha=1/3;
beta=0.99;
delta=0.025;
phi=0.5;

model;

exp(c(+1))=beta*exp(c)*(alpha*A*exp(k)^(alpha-1)*exp(n(+1))^(1-alpha)+1-delta);
exp(c)*exp(n)^(phi+alpha)=(1-alpha)*A*exp(k(-1))^alpha;
exp(k)=exp(i)+(1-delta)*exp(k(-1));
exp(y)=exp(c)+exp(i);
exp(y)=A*exp(k(-1))^(alpha)*exp(n)^(1-alpha);
exp(r)=alpha*A*exp(k)^(alpha-1)*exp(n)^(1-alpha)-delta;
exp(w)=(1-alpha)*A*exp(k(-1))^(alpha)*exp(n)^(-alpha);

end;

initval;
A=1;
end;
steady;

endval;
A=1.2;
end;

steady;

simul(periods=200);

tt=0:201;
figure
subplot(4,2,1);
plot(tt, oo_.endo_simul(1,:), tt, oo_.steady_state(1)*ones(1,202));
title('y')
subplot(4,2,2);
plot(tt, oo_.endo_simul(2,:), tt, oo_.steady_state(2)*ones(1,202));
title('k')
subplot(4,2,3);
plot(tt, oo_.endo_simul(3,:), tt, oo_.steady_state(3)*ones(1,202));
title('c')
subplot(4,2,4);
plot(tt, oo_.endo_simul(4,:), tt, oo_.steady_state(4)*ones(1,202));
title('i')
subplot(4,2,5);
plot(tt, oo_.endo_simul(5,:), tt, oo_.steady_state(5)*ones(1,202));
title('n')
subplot(4,2,6);
plot(tt, oo_.endo_simul(6,:), tt, oo_.steady_state(6)*ones(1,202));
title('w')
subplot(4,2,7);
plot(tt, oo_.endo_simul(7,:), tt, oo_.steady_state(7)*ones(1,202));
title('r')
