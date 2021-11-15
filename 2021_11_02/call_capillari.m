nc=10;
dati_letto_griglia; % Definisco i dati del problema
[A,b]=setup_system(G,pa,pv);

%%
% Per verificare se una matrice è simmetrica
% Se A è simmetrica il risultato è = 0
norm(full(A-A'))

% Risulta A non simmetrica => no simmetrica def pos => no Cholesky ne grad
% coniugato. Le mie scelte sono MEG, fatt LU, o  bcgstab

% Metodo diretto (un solo sistema, MEG e LU fanno la stessa cosa)
% Calcolo p vettore delle pressioni
p=meg_pivot(A,b);

%% Calcolo le velocità e le rappresento graficamente
v=velocita(p,G,R,Area);

%% Errore sui dati
err_dati=1e-6;
err=cond(full(A))*err_dati;

%% Risolvo con bcgstab
n=length(A); % Dimensione della matrice
x0=zeros(n,1); % Vettore iniziale
tol=1e-8;
kmax=100;

[x,res,k,resv]=bcgstab(A,b,x0,tol,kmax)

v=velocita(p,G,R,Area);

figure(1);clf
semilogy(resv,"LineWidth",2);
grid on
xlabel("k")
ylabel("residuo normalizzato")