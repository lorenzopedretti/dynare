var y k c i;
varexo A;
parameters alpha sigma delta;
alpha=1/3;
sigma=1/4;
delta=0.025;
model;

exp(y)=A*exp(k(-1))^(alpha);
exp(k)=exp(i)+(1-delta)*exp(k(-1));
exp(c)=exp(y)-exp(i);
exp(i)=sigma*exp(y);


end;

initval;
A=1;
k=log(100);
end;
steady;

endval;
A=1.2;
end;
steady;

simul(periods=200);

tt=0:200;
figure
subplot(2,2,1);
plot(tt, oo_.endo_simul(1,:), tt, oo_.steady_state(1)*ones(1,201));
title('y')
subplot(2,2,2);
plot(tt, oo_.endo_simul(2,:), tt, oo_.steady_state(2)*ones(1,201));
title('k')
subplot(2,2,3);
plot(tt, oo_.endo_simul(3,:), tt, oo_.steady_state(3)*ones(1,201));
title('c')
subplot(2,2,4);
plot(tt, oo_.endo_simul(4,:), tt, oo_.steady_state(4)*ones(1,201));
title('i')
