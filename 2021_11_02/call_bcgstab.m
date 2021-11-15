A=[6 1 -2 2 1;0 -3 3 -2 1;2 0.5 5 -1 -2;0 1 2 -3 2;0.5 -1 1 0.4 2];
b=[15 0 4 6 13.1];

% Dati per richiamare i metodi
x0=rand(5,1);
tol=1e-12;
kmax=500;

% Chiamo gradiente
[xg,resg,kg,resvg]=gradiente(A,b,x0,tol,kmax);
xg

% Chiamo gradiente coniugato
[xgc,resgc,kgc,resvgc]=gradiente_coniugato(A,b,x0,tol,kmax);
xgc

% Chiamo bcgstab
[xb,resb,kb,resvb]=bcgstab(A,b,x0,tol,kmax);
xb

% Visualizzo la storia di convergenza dei tre metodi
figure(1); clf
semilogy((0:kg)',resvg,"DisplayName","Gradiente")
legend("-dynamiclegend")
hold on
grid on

semilogy((0:kgc)',resvgc,"DisplayName","Gradiente coniugato")
semilogy((0:kb)',resvb,"DisplayName","bcgstab")

xlabel("k")
ylabel("norme dei residui")


