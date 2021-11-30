a=0;b=1;tol=1e-3;hmin=1e-4;
f=@(x)1./((x-0.3).^2+0.01)+1./((x-0.9).^2+0.04)-6;
[isa,nodi]=simpsonad(f,a,b,tol,hmin);

figure(1); clf
fplot(f,[a,b])
hold on
plot(nodi,zeros(size(nodi)),"r+")
xlabel("x"); ylabel("f(x)")
grid on

%%
a=0;b=2;tol=1e-6;hmin=1e-4;
f=@(x)1./(x.^3-2*x-5);
[isa,nodi]=simpsonad(f,a,b,tol,hmin);

figure(1); clf
fplot(f,[a,b])
hold on
plot(nodi,zeros(size(nodi)),"r+")
xlabel("x"); ylabel("f(x)")
grid on