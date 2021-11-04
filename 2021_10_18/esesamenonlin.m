f1=@(x)(1/3)*log(x/2)+x.^2;
f2=@(x)x.^2+x-1;

% Per trovare le intersezioni considero f=f1-f2.
% Quando ho una intersezione tra f1 e f2 f vale 0.
f=@(x)f1(x)-f2(x);

figure(1);clf;
fplot(f,[0.0001,5]);
grid on
xlabel("x"); ylabel("f(x)");

% RISPOSTA LLA DOMANDA SU BISEZIONE
% kmin0=log((b-1)/eps)-1
kmin0=log(2/1e-8)-1

% kmin è il primo intero successivo a kmin0
% kmin=19

df=@(x)1./(3*x)-1;
tol=1e-8;
kmax=50;
x0=0.1;
[z,res,k,ERR]=newton(f,df,x0,tol,kmax)