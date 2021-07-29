function val=valfun(k)
global alpha beta delta v0 k0 kmat c0 cmat zeta

c=k0.^alpha+(1-delta).*k0-k;
g=interp2(cmat, kmat, v0, c, k, 'linear');

if c<0
    val=-99999999-99999999*abs(c);
else
    val=log(c)-zeta*log(c0)+beta*g;
end
val=-val;