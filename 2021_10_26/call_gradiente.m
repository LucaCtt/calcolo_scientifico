A=[6 1 -2 2 1;
   1 3 1 -2 0;
   -2 1 4 -1 -1;
   2 -2 -1 4 2;
   1 0 -1 2 3;];

b=[15;2;3;21;21];

x0=rand(5,1);
tol=1e-12;
kmax=500;

% Gradiente
[x,res,k,resv]=gradiente(A,b,x0,tol,kmax)

% Gradiente coniugato
[x1,res1,k1,resv1]=gradiente_coniugato(A,b,x0,tol,kmax)

%% Grafico
figure(1); clf
semilogy(0:k,resv,"LineWidth",2, "DisplayName", "Gradiente");
legend("-DynamicLegend")
hold on
semilogy(0:k1,resv1,"LineWidth",2,"DisplayName","Gradiente coniugato")
grid on
xlabel("k")
ylabel("residui")

% Dal grafico vedo che il gradiente normale fa abbastanza schifo, mentre
% quello coniugato è molto buono