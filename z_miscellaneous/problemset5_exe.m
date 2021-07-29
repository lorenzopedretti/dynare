clear all;
close all;

chi=1;
beta=0.99;
phi2=100;
delta0=0.02;
alpha=1/3;
rhoA=0.97;
rhonu=0.95;
sigmaA=0.01;
sigmanu=0.02;
phi1=1/beta-1+delta0;
Nstar=1/3;
Kstar=Nstar*(alpha/phi1)^(1/(1-alpha));
theta=((1-alpha)*Kstar^alpha*Nstar^(-alpha))/((Kstar^alpha*Nstar^(1-alpha)-delta0*Kstar)*Nstar^chi);

phi2=0.1;
save param_problemset5  theta chi beta phi1 phi2 alpha delta0 rhonu sigmanu rhoA sigmaA;
dynare problemset5;
sigmanu=0;
save param_problemset5  theta chi beta phi1 phi2 alpha delta0 rhonu sigmanu rhoA sigmaA;
dynare problemset5;
% disp('Iteration 1')
% 
% save param_problemset5  theta chi beta phi1 phi2 alpha delta0 rhonu sigmanu rhoA sigmaA;
% dynare problemset5;
% irfs2=oo_.irfs;
% 
% phi2=0.1;
% 
% disp('Iteration 2')
% save param_problemset5  theta chi beta phi1 phi2 alpha delta0 rhonu sigmanu rhoA sigmaA;
% dynare problemset5;
% irfs1=oo_.irfs;
% 
% phi2=0.01;
% 
% disp('Iteration 3')
% save param_problemset5  theta chi beta phi1 phi2 alpha delta0 rhonu sigmanu rhoA sigmaA;
% dynare problemset5;
% irfs3=oo_.irfs;

%phi2=0.1;
%sigmanu=0;

%disp('Iteration 4')
%save param_problemset5  theta chi beta phi1 phi2 alpha delta0 rhonu sigmanu rhoA sigmaA;
%dynare problemset5;

% tt=1:40;
% close all;
% 
% % figure
% % title('Productivity shock')
% % subplot(4,2,1)
% % plot(tt,irfs3.Y_eA,tt,irfs1.Y_eA,tt,irfs2.Y_eA)
% % legend('\phi_2=0.01','\phi_2=0.1','\phi_2=100')
% % title('Y')
% % subplot(4,2,2)
% % plot(tt,irfs3.N_eA,tt,irfs1.N_eA,tt,irfs2.N_eA)
% % legend('\phi_2=0.01','\phi_2=0.1','\phi_2=100')
% % title('N')
% % subplot(4,2,3)
% % plot(tt,irfs3.C_eA,tt,irfs1.C_eA,tt,irfs2.C_eA)
% % legend('\phi_2=0.01','\phi_2=0.1','\phi_2=100')
% % title('C')
% % subplot(4,2,4)
% % plot(tt,irfs3.I_eA,tt,irfs1.I_eA,tt,irfs2.I_eA)
% % legend('\phi_2=0.01','\phi_2=0.1','\phi_2=100')
% % title('I')
% % subplot(4,2,5)
% % plot(tt,irfs3.u_eA,tt,irfs1.u_eA,tt,irfs2.u_eA)
% % legend('\phi_2=0.01','\phi_2=0.1','\phi_2=100')
% % title('u')
% % subplot(4,2,6)
% % plot(tt,irfs3.w_eA,tt,irfs1.w_eA,tt,irfs2.w_eA)
% % legend('\phi_2=0.01','\phi_2=0.1','\phi_2=100')
% % title('w')
% % subplot(4,2,7)
% % plot(tt,irfs3.r_eA,tt,irfs1.r_eA,tt,irfs2.r_eA)
% % legend('\phi_2=0.01','\phi_2=0.1','\phi_2=100')
% % title('r')
% 
% % %matlab2tikz;
% % close all;
% % figure
% % title('Productivity shock')
% % subplot(4,2,1)
% % plot(tt,irfs3.Y_enu,tt,irfs1.Y_enu,tt,irfs2.Y_enu)
% % legend('\phi_2=0.01','\phi_2=0.1','\phi_2=100')
% % title('Y')
% % subplot(4,2,2)
% % plot(tt,irfs3.N_enu,tt,irfs1.N_enu,tt,irfs2.N_enu)
% % legend('\phi_2=0.01','\phi_2=0.1','\phi_2=100')
% % title('N')
% % subplot(4,2,3)
% % plot(tt,irfs3.C_enu,tt,irfs1.C_enu,tt,irfs2.C_enu)
% % legend('\phi_2=0.01','\phi_2=0.1','\phi_2=100')
% % title('C')
% % subplot(4,2,4)
% % plot(tt,irfs3.I_enu,tt,irfs1.I_enu,tt,irfs2.I_enu)
% % legend('\phi_2=0.01','\phi_2=0.1','\phi_2=100')
% % title('I')
% % subplot(4,2,5)
% % plot(tt,irfs3.u_enu,tt,irfs1.u_enu,tt,irfs2.u_enu)
% % legend('\phi_2=0.01','\phi_2=0.1','\phi_2=100')
% % title('u')
% % subplot(4,2,6)
% % plot(tt,irfs3.w_enu,tt,irfs1.w_enu,tt,irfs2.w_enu)
% % legend('\phi_2=0.01','\phi_2=0.1','\phi_2=100')
% % title('w')
% % subplot(4,2,7)
% % plot(tt,irfs3.r_enu,tt,irfs1.r_enu,tt,irfs2.r_enu)
% % legend('\phi_2=0.01','\phi_2=0.1','\phi_2=100')
% % title('r')
% % %matlab2tikz;
% close all;
% 
% figure
% title('Productivity shock')
% subplot(1,2,1)
% plot(tt,irfs3.A_eA,tt,irfs1.A_eA,tt,irfs2.A_eA)
% legend('\phi_2=0.01','\phi_2=0.1','\phi_2=100')
% title('A')
% subplot(1,2,2)
% plot(tt,irfs3.tfp_eA,tt,irfs1.tfp_eA,tt,irfs2.tfp_eA)
% legend('\phi_2=0.01','\phi_2=0.1','\phi_2=100')
% title('tfp')
% 
% 
% matlab2tikz;
% close all;
% 
% figure
% title('Preference shock')
% subplot(1,2,1)
% plot(tt,irfs3.A_enu,tt,irfs1.A_enu,tt,irfs2.A_enu)
% legend('\phi_2=0.01','\phi_2=0.1','\phi_2=100')
% title('A')
% subplot(1,2,2)
% plot(tt,irfs3.tfp_enu,tt,irfs1.tfp_enu,tt,irfs2.tfp_enu)
% legend('\phi_2=0.01','\phi_2=0.1','\phi_2=100')
% title('tfp')
% matlab2tikz;