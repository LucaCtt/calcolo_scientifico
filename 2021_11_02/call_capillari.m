nc=10;
dati_letto_griglia; % Definisco i dati del problema
[A,b]=setup_system(G,pa,pv);

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