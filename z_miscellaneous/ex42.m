clear all;
close all;

global alpha beta delta v0 k0 kmat c0 cmat zeta
alpha=0.36;
beta=0.95;
delta=0.1;
zeta=0.05;

kstar=(alpha/((1/beta)-1+delta-zeta ))^(1/(1-alpha));
kmin=0.95*kstar;
kmax=1.02*kstar;
kpoints=100;
kgrid=(kmax-kmin)/kpoints;
kmat=kmin:kgrid:kmax;
kmat=kmat';

cstar=kstar^alpha-delta*kstar;
cmin=0.75*cstar;
cmax=1.25*cstar;
cpoints=50; 
cgrid=(cmax-cmin)/cpoints;
cmat=cmin:cgrid:cmax;
cmat=cmat';

imax=240;
i=0;
v0=zeros(kpoints+1,cpoints+1);
v=zeros(kpoints+1,cpoints+1);

while i<imax
    for j=1:(kpoints+1)
        k0=kmat(j,1);
        for l=1:(cpoints+1)
            c0=cmat(l,1);
            k1=fminbnd(@valfun,kmin,kmax);
            v(j,l)=-valfun(k1);
        end
    end
    v0=v;
    i=i+1;
    disp(i);
end


figure
mesh(cmat,kmat,v)


