function val=value_function_ramsey(k)
global alpha beta sigma delta v0 k0 kmat

g=interp1(kmat, v0, k, 'linear');

c=k0.^alpha+(1-delta).*k0-k;
if c<0
    val=-99999999-99999999*abs(c);
else
    val=(c.^(1-sigma)-1)/(1-sigma)+beta*g;
end
val=-val;