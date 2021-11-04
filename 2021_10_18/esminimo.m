h=@(x)(x-5).^2-3*sin(x-5);
dh=@(x)2*(x-5)-3*cos(x-5);
dh2=@(x)2+3*sin(x-5);

% x0=0
x0=0;
tol=1e-8; kmax=100;
[z1,res1,k1,ERR1]=newton(dh,dh2,x0,tol,kmax)

% x0=1
x0=1;
[z2,res2,k2,ERR2]=newton(dh,dh2,x0,tol,kmax)

% Plotto gli errori
figure(1); clf;
semilogy(0:k1,ERR1,"DisplayName","x0=0");
hold on;
semilogy(0:k2,ERR2,"DisplayName","x0=1");
legend("-dynamiclegend");
grid on;
xlabel("k"); ylabel("err");
