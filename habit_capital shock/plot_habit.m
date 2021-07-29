clear all
close all
dynare hansen_basic
dynare habit_1
dynare habit_2
dynare habit_3
close all

tt=1:40;
figure
subplot(3,3,1);
plot(tt,basic.c_e,tt,habit_1.c_e,'o',tt,habit_2.c_e,tt,habit_3.c_e,'LineWidth',2)
title('C')
legend('Basic','log(c)-\zeta log(c_{-1})', 'log(c-\zeta c_{-1})', 'Abel, 1990')
subplot(3,3,2);
plot(tt,basic.h_e,tt,habit_1.h_e,'o',tt,habit_2.h_e,tt,habit_3.h_e,'LineWidth',2)
title('H')
subplot(3,3,3);
plot(tt,basic.r_e,tt,habit_1.r_e,'o',tt,habit_2.r_e,tt,habit_3.r_e,'LineWidth',2)
title('R')
subplot(3,3,4);
plot(tt,basic.w_e,tt,habit_1.w_e,'o',tt,habit_2.w_e,tt,habit_3.w_e,'LineWidth',2)
title('w')
subplot(3,3,5);
plot(tt,basic.y_e,tt,habit_1.y_e,'o',tt,habit_2.y_e,tt,habit_3.y_e,'LineWidth',2)
title('Y')
subplot(3,3,6);
plot(tt,basic.k_e,tt,habit_1.k_e,'o',tt,habit_2.k_e,tt,habit_3.k_e,'LineWidth',2)
title('K')
subplot(3,3,7);
plot(tt,basic.i_e,tt,habit_1.i_e,'o',tt,habit_2.i_e,tt,habit_3.i_e,'LineWidth',2)
title('I')