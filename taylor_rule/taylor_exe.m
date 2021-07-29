clear all
close all
phi=0.75;
save param_phi phi;
dynare nk
sticky_prices=oo_.irfs;
dynare taylor
taylor_irf=oo_.irfs;
phi=0;
save param_phi phi;
dynare nk
flex_prices=oo_.irfs;
dynare taylor
flex_prices_tay=oo_.irfs;
Xnk_eA=sticky_prices.Y_eA-flex_prices.Y_eA;
Xtay_eA=taylor_irf.Y_eA-flex_prices_tay.Y_eA;
Xtay_ei=taylor_irf.Y_ei-flex_prices_tay.Y_ei;
close all
tt=1:40;
ss=zeros(1,40);
figure
subplot(3,3,1);
plot(tt,sticky_prices.A_eA,tt,taylor_irf.A_eA,':',tt,ss,'--','LineWidth',2)
title('A')
xlim([1 40])
legend('Exogenous mon pol','Taylor rule')
subplot(3,3,2);
plot(tt,sticky_prices.Y_eA,tt,taylor_irf.Y_eA,':',tt,ss,'--','LineWidth',2)
title('Y=C')
xlim([1 40])
subplot(3,3,3);
plot(tt,sticky_prices.pi_eA,tt,taylor_irf.pi_eA,':',tt,ss,'--','LineWidth',2)
title('\pi')
xlim([1 40])
subplot(3,3,4);
plot(tt,sticky_prices.i_eA,tt,taylor_irf.i_eA,':',tt,ss,'--','LineWidth',2)
title('i')
xlim([1 40])
subplot(3,3,5);
plot(tt,sticky_prices.r_eA,tt,taylor_irf.r_eA,':',tt,ss,'--','LineWidth',2)
title('r')
xlim([1 40])
subplot(3,3,6);
plot(tt,sticky_prices.mc_eA,tt,taylor_irf.mc_eA,':',tt,ss,'--','LineWidth',2)
title('mc')
xlim([1 40])
subplot(3,3,7);
plot(tt,sticky_prices.N_eA,tt,taylor_irf.N_eA,':',tt,ss,'--','LineWidth',2)
title('N')
xlim([1 40])
subplot(3,3,8);
plot(tt,sticky_prices.m_eA,tt,taylor_irf.m_eA,':',tt,ss,'--','LineWidth',2)
title('m')
xlim([1 40])
subplot(3,3,9);
plot(tt,Xnk_eA,tt,Xtay_eA,tt,ss,':','LineWidth',2)
title('X')
xlim([1 40])
tt=1:40;
ss=zeros(1,40);

figure
xlim([1 40])
subplot(3,3,1);
plot(tt,flex_prices_tay.Y_ei,tt,taylor_irf.Y_ei,':',tt,ss,'--','LineWidth',2)
title('Y=C')
xlim([1 40])
legend('Flex prices','Taylor rule')
subplot(3,3,2);
plot(tt,flex_prices_tay.pi_ei,tt,taylor_irf.pi_ei,':',tt,ss,'--','LineWidth',2)
title('\pi')
xlim([1 40])
subplot(3,3,3);
plot(tt,flex_prices_tay.i_ei,tt,taylor_irf.i_ei,':',tt,ss,'--','LineWidth',2)
title('i')
xlim([1 40])
subplot(3,3,4);
plot(tt,flex_prices_tay.r_ei,tt,taylor_irf.r_ei,':',tt,ss,'--','LineWidth',2)
title('r')
xlim([1 40])
subplot(3,3,5);
plot(tt,flex_prices_tay.mc_ei,tt,taylor_irf.mc_ei,':',tt,ss,'--','LineWidth',2)
title('mc')
xlim([1 40])
subplot(3,3,6);
plot(tt,flex_prices_tay.N_ei,tt,taylor_irf.N_ei,':',tt,ss,'--','LineWidth',2)
title('N')
xlim([1 40])
subplot(3,3,7);
plot(tt,flex_prices_tay.m_ei,tt,taylor_irf.m_ei,':',tt,ss,'--','LineWidth',2)
title('m')
xlim([1 40])
subplot(3,3,8);
plot(tt,ss,tt,Xtay_ei,tt,ss,':','LineWidth',2)
title('X')
xlim([1 40])
tt=1:40;
ss=zeros(1,40);