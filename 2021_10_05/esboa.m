% Funzione
R=0.055;
rhob=0.6;
f=@(x)x.^3-3*x.^2*R+4*R.^3*rhob;

% Parametri
a=0; b=2*R;
tol=1e-8;
kmax=100;

[z,~,res]=bisezione(f,a,b,tol,kmax)

figure(1); clf
fplot(f, [a,b])
hold on
plot(z, res, 'o')
grid on
xlabel('x'); ylabel('y')
hold off

% Il numero di iterazioni effettuate corrisponde a quanto ci si aspetta
% dalla teoria?
% calcolo kmin=ceil(log2((b-a)/tol)-1) e ottengo 24: mi aspet   to 23. Questo
% accade perchè nell'algoritmo implementato in Matlab conto anche il passo
% 0.

%%
% esboa con Newton
R=0.055;
rhob=0.6;
f=@(x)x.^3-3*x.^2*R+4*R.^3*rhob;
df=@(x)3*x.^2-6*x*R;
tol=1e-8;
kmax=100;

x0=0.04;
[z,res,k,ERR]=newton(f,df,x0,tol,kmax)
figure(1); clf
fplot(f, [0,2*R])
hold on
plot(z, res, 'o')
grid on
xlabel('x'); ylabel('y')
hold off

%%
% esboa con Secanti
R=0.055;
rhob=0.6;
f=@(x)x.^3-3*x.^2*R+4*R.^3*rhob;
tol=1e-8;
kmax=100;

x0=0.04;
x1=0.1;
[z,res,k,ERR]=secanti(f,x0,x1,tol,kmax)
figure(1); clf
fplot(f, [0,2*R])
hold on
plot(z, res, 'o')
grid on
xlabel('x'); ylabel('y')
hold off