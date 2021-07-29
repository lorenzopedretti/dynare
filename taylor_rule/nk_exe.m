clear all
close all
phi=0.75;
save param_phi phi;
dynare nk
sticky_prices=oo_.irfs;
phi=0;
save param_phi phi;
dynare nk
flex_prices=oo_.irfs;
X_eA=sticky_prices.Y_eA-flex_prices.Y_eA;
X_em=sticky_prices.Y_em-flex_prices.Y_em;
close all
tt=1:40;
ss=zeros(1,40);
figure
subplot(3,3,1);
plot(tt,sticky_prices.A_eA,tt,flex_prices.A_eA,':',tt,ss,'--','LineWidth',2)
title('A')
xlim([1 40])
legend('Sticky','Flex')
subplot(3,3,2);
plot(tt,sticky_prices.Y_eA,tt,flex_prices.Y_eA,':',tt,ss,'--','LineWidth',2)
title('Y=C')
xlim([1 40])
subplot(3,3,3);
plot(tt,sticky_prices.pi_eA,tt,flex_prices.pi_eA,':',tt,ss,'--','LineWidth',2)
title('\pi')
xlim([1 40])
subplot(3,3,4);
plot(tt,sticky_prices.i_eA,tt,flex_prices.i_eA,':',tt,ss,'--','LineWidth',2)
title('i')
xlim([1 40])
subplot(3,3,5);
plot(tt,sticky_prices.r_eA,tt,flex_prices.r_eA,':',tt,ss,'--','LineWidth',2)
title('r')
xlim([1 40])
subplot(3,3,6);
plot(tt,sticky_prices.mc_eA,tt,flex_prices.mc_eA,':',tt,ss,'--','LineWidth',2)
title('mc')
xlim([1 40])
subplot(3,3,7);
plot(tt,sticky_prices.N_eA,tt,flex_prices.N_eA,':',tt,ss,'--','LineWidth',2)
title('N')
xlim([1 40])
subplot(3,3,8);
plot(tt,sticky_prices.m_eA,tt,flex_prices.m_eA,':',tt,ss,'--','LineWidth',2)
title('m')
xlim([1 40])
subplot(3,3,9);
plot(tt,X_eA,tt,ss,':','LineWidth',2)
title('X')
xlim([1 40])

figure
subplot(3,3,1);
plot(tt,sticky_prices.w_em,tt,flex_prices.w_em,':',tt,ss,'--','LineWidth',2)
title('w')
xlim([1 40])
legend('Sticky','Flex')
subplot(3,3,2);
plot(tt,sticky_prices.Y_em,tt,flex_prices.Y_em,':',tt,ss,'--','LineWidth',2)
title('Y=C')
xlim([1 40])
subplot(3,3,3);
plot(tt,sticky_prices.pi_em,tt,flex_prices.pi_em,':',tt,ss,'--','LineWidth',2)
title('\pi')
xlim([1 40])
subplot(3,3,4);
plot(tt,sticky_prices.i_em,tt,flex_prices.i_em,':',tt,ss,'--','LineWidth',2)
title('i')
xlim([1 40])
subplot(3,3,5);
plot(tt,sticky_prices.r_em,tt,flex_prices.r_em,':',tt,ss,'--','LineWidth',2)
title('r')
xlim([1 40])
subplot(3,3,6);
plot(tt,sticky_prices.mc_em,tt,flex_prices.mc_em,':',tt,ss,'--','LineWidth',2)
title('mc')
xlim([1 40])
subplot(3,3,7);
plot(tt,sticky_prices.N_em,tt,flex_prices.N_em,':',tt,ss,'--','LineWidth',2)
title('N')
xlim([1 40])
subplot(3,3,8);
plot(tt,sticky_prices.m_em,tt,flex_prices.m_em,':',tt,ss,'--','LineWidth',2)
title('m')
xlim([1 40])
subplot(3,3,9);
plot(tt,X_em,tt,ss,':','LineWidth',2)
title('X')
xlim([1 40])