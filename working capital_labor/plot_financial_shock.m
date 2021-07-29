clear all
close all
phi=4;
save param_phi phi;
dynare constrained

close all
tt=1:40;
ss=zeros(1,40);
figure
subplot(3,3,1);
plot(tt,oo_.irfs.C_eXi,tt,ss,'--','LineWidth',2)
title('C')
legend('Constrained','Unconstrained')
subplot(3,3,2);
plot(tt,oo_.irfs.N_eXi,tt,ss,'--','LineWidth',2)
title('N')
subplot(3,3,3);
plot(tt,oo_.irfs.w_eXi,tt,ss,'--','LineWidth',2)
title('w')
subplot(3,3,4);
plot(tt,oo_.irfs.r_eXi,tt,ss,'--','LineWidth',2)
title('r')
subplot(3,3,5);
plot(tt,oo_.irfs.mu_eXi,tt,ss,'--','LineWidth',2)
title('\mu')
subplot(3,3,6);
plot(tt,oo_.irfs.Y_eXi,tt,ss,'--','LineWidth',2)
title('Y')
subplot(3,3,7);
plot(tt,oo_.irfs.q_eXi,tt,ss,'--','LineWidth',2)
title('q')
subplot(3,3,8);
plot(tt,oo_.irfs.K_eXi,tt,ss,'--','LineWidth',2)
title('K')
subplot(3,3,9);
plot(tt,oo_.irfs.I_eXi,tt,ss,'--','LineWidth',2)
title('I')