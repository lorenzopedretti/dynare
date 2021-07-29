clear all;
close all;

alpha=0.33;
beta=0.99;
delta=0.025;
psi=2;
phi=1;
rho=0.95;
se=0.01;

save param_problemset3  beta psi phi alpha delta rho se;
dynare problemset3;

irfs1=oo_.irfs;

%phi=0.25;
%save param_problemset3  beta psi phi alpha delta rho se;
%dynare problemset3;

%irfs2=oo_.irfs;

%phi=3;
%save param_problemset3  beta psi phi alpha delta rho se;
%dynare problemset3;

%irfs3=oo_.irfs;

%close all;



rho=0.5;
save param_problemset3  beta psi phi alpha delta rho se;
dynare problemset3;
irfs2=oo_.irfs;
rho=0.99;
save param_problemset3  beta psi phi alpha delta rho se;
dynare problemset3;
irfs3=oo_.irfs;
tt=1:40;
close all;

figure
subplot(2,2,1)
plot(tt,irfs3.y_e,tt,irfs1.y_e,tt,irfs2.y_e)
legend('\rho=0.99','\phi=0.95','\phi=0.5')
title('y')
subplot(2,2,2)
plot(tt,irfs3.c_e,tt,irfs1.c_e,tt,irfs2.c_e)
legend('\rho=0.99','\phi=0.95','\phi=0.5')
title('c')
subplot(2,2,3)
plot(tt,irfs3.k_e,tt,irfs1.k_e,tt,irfs2.k_e)
legend('\rho=0.99','\phi=0.95','\phi=0.5')
title('k')
subplot(2,2,4)
plot(tt,irfs3.n_e,tt,irfs1.n_e,tt,irfs2.n_e)
legend('\phi=3','\phi=1','\phi=0.25')
title('n')
matlab2tikz;
