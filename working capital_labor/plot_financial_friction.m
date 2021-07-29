clear all
close all
phi=4;
save param_phi phi;
dynare constrained
constrained_1=oo_.irfs;
dynare unconstrained
unconstrained_1=oo_.irfs;
phi=0;
save param_phi phi;
dynare constrained
constrained_0=oo_.irfs;
dynare unconstrained
unconstrained_0=oo_.irfs;

close all
tt=1:40;
figure
subplot(3,3,1);
plot(tt,unconstrained_1.C_eA,tt,constrained_1.C_eA,tt,unconstrained_0.C_eA,'--',tt,constrained_0.C_eA,'--','LineWidth',2)
title('C')
legend('Unconstrained \phi=4','Constrained \phi=4','Unconstrained \phi=0','Constrained \phi=0')

subplot(3,3,2);
plot(tt,unconstrained_1.N_eA,tt,constrained_1.N_eA,tt,unconstrained_0.N_eA,'--',tt,constrained_0.N_eA,'--','LineWidth',2)
title('N')

subplot(3,3,3);
plot(tt,unconstrained_1.w_eA,tt,constrained_1.w_eA,tt,unconstrained_0.w_eA,'--',tt,constrained_0.w_eA,'--','LineWidth',2)
title('w')

subplot(3,3,4);
plot(tt,unconstrained_1.Y_eA,tt,constrained_1.Y_eA,tt,unconstrained_0.Y_eA,'--',tt,constrained_0.Y_eA,'--','LineWidth',2)
title('Y')

subplot(3,3,5);
plot(tt,unconstrained_1.q_eA,tt,constrained_1.q_eA,tt,unconstrained_0.q_eA,'--',tt,constrained_0.q_eA,'--','LineWidth',2)
title('q')

subplot(3,3,6);
plot(tt,unconstrained_1.K_eA,tt,constrained_1.K_eA,tt,unconstrained_0.K_eA,'--',tt,constrained_0.K_eA,'--','LineWidth',2)
title('K')

subplot(3,3,7);
plot(tt,unconstrained_1.I_eA,tt,constrained_1.I_eA,tt,unconstrained_0.I_eA,'--',tt,constrained_0.I_eA,'--','LineWidth',2)
title('I')

