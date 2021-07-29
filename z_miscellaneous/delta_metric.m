function u=delta_metric(Delta)
global u1 u2 beta

u=abs((u2-u1)*(1-beta)+log(1-Delta));