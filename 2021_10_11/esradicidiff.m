syms t
b=2500/(1+9*exp(-t/3));
b2=diff(b,2);
f=matlabFunction(b2);

%disegno f per localizzare la radice
figure(1); clf
fplot(f, [0,20]);
grid on
hold on
xlabel("t"); ylabel("f(t)")

%scelgo il punto iniziale
x0=6; x1=9;
tol=1e-8; kmax=20;
[z,res,k,err]=secanti(f,x0,x1,tol,kmax)

plot(z,res,'o')

figure(2);
semilogy([0:k],err)
xlabel("k"); ylabel("err")
grid on