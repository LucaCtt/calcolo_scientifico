f1=@(x1,x2)x1.^2-x2.^2-1
f2=@(x1,x2)x1.^2+x2.^2-2*x1-3;

%% Rappresento le due funzioni
[x1,x2]=meshgrid(-3,1:3);
z1=f1(x1,x2);
z2=f2(x1,x2);

figure(1); clf
surfc(x1,x2,z1)
hold on
contour(x1,x2,z1,[0,0],"b","LineWidth",2);
xlabel("x_1"); ylabel("y_1")

figure(2); clf
surfc(x1,x2,z2);
hold on
contour(x1,x2,z2,[0,0],"r","LineWidth",2);
xlabel("x_1"); ylabel("y_1")

figure(3); clf
contour(x1,x2,z1,[0,0],"b","LineWidth",2);
hold on
contour(x1,x2,z2,[0,0],"r","LineWidth",2);
xlabel("x_1"); ylabel("y_1")
axis equal

%% Def input newton
f=@(x)[f1(x1,x2);f2(x1,x2)];

% Jacobiana
Jf=@(x)[2*x(1),-2*x(2);2*x(1)-2,2*x(2)];

tol=1e-8;
kmax=100;

%% Prima radice semplice
x0=[3;2];

[zero,res,k,errv]=newtonsys(f,Jf,x0,tol,kmax);

figure(3);clf
plot(zero(1),zero(2),"o");

%% Seconda radice semplice
x0=[3;-2];
[zero,res,k,errv]=newtonsys(f,Jf,x0,tol,kmax);
figure(3);clf
plot(zero(1),zero(2),"o");

%% Radice multipla
x0=[-2;-1];
[zero,res,k,errv]=newtonsys(f,Jf,x0,tol,kmax);
figure(3);clf
plot(zero(1),zero(2),"o");