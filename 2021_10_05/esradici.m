f=@(x)sin(x-1)-0.5*sin(2*(x-1));

figure(1); clf;
fplot(f,[-3,3]);
hold on
grid on;
xlabel("x");ylabel("y");

%%
% Newton
df=@(x)cos(x-1)-cos(2*(x-1));

% Calcolo la radice a sinistra
x0=-2;
tol=1e-8;
kmax=100;
[z1,res1,k1,ERR1]=newton(f,df,x0,tol,kmax)
plot(z1,res1,'o');

% Calcolo la radice a destra
x0=1.1;
[z2,res2,k2,ERR2]=newton(f,df,x0,tol,kmax)
plot(z2,res2,'o');

% Rappresento ERR1 e ERR2 su un grafico
figure(2); clf;
% Vedo che l'errore scende quadraticamente
semilogy(0:length(ERR1)-1, ERR1, "DisplayName", "Errore per radice sinistra");
legend("-dynamiclegend");
hold on;
% Dopo la prima interazione l'errore scende in modo lineare
semilogy(0:length(ERR2)-1, ERR2, "DisplayName", "Errore per radice destra");
grid on;
xlabel("k"); ylabel("errori")

%%
% Secanti

% Calcolo la radice a sinistra
x0=-1.5;
x1=-1.6;
[z2,res2,k2,ERR2]=secanti(f,x0,x1,tol,kmax)
plot(z2,res2,'o');


% Calcolo la radice a destra
x0=0.1;
x1=0.4;
tol=1e-8;
kmax=100;
[z1,res1,k1,ERR1]=secanti(f,x0,x1,tol,kmax)
plot(z1,res1,'o');

% Rappresento ERR1 e ERR2 su un grafico
figure(2); clf;
% Vedo che l'errore scende quadraticamente
semilogy(0:length(ERR1)-1, ERR1, "DisplayName", "Errore per radice sinistra");
legend("-dynamiclegend");
hold on;
% Dopo la prima interazione l'errore scende in modo lineare
semilogy(0:length(ERR2)-1, ERR2, "DisplayName", "Errore per radice destra");
grid on;
xlabel("k"); ylabel("errori")