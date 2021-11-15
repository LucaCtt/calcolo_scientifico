% Tema esame 27_01_17
% Esercizio 2
A=[324,-45,246,-162,-9;
   -45,1048,442,96,113;
   246,442,435,-183,30;
   -162,96,-183,387,60;
   -9,113,30,60,20];
b=[615;2736;1838;-360;247];

%% 2.1
if norm(A-A')~=0
    disp("A non simmetrica")
end

E=eig(A);
if E<=0
    % Attenzione: calcolare gli autovalori è molto costoso per matrici
    % grandi, anche più costoso che risolvere un sistema lineare.
    % In molti casi si sa a priori che la matrice è SDP.
    disp("A non definita positiva")
    exit
end

disp("A simmetrica definita positiva")

%% 2.2
% La matrice è sdp => Choleski è la fattorizzazione più efficiente

%% 2.3
x0=rand(5,1);
tol=1e-8;
kmax=500;

[x,res,k,resv]=gradiente(A,b,x0,tol,kmax)
[xc,resc,kc,resvc]=gradiente_coniugato(A,b,x0,tol,kmax)

%% 2.4
figure(1); clf
semilogy(0:k,resv,"LineWidth",2,"DisplayName","Gradiente")
legend("-dynamiclegend")
hold on
grid on
semilogy(0:kc,resvc,"LineWidth",2,"DisplayName","Gradiente coniugato")
xlabel("k"); ylabel("residui")

% I risultati concordano con quanto visto a teoria
%
% La convergenza del metodo del gradiente dipende
% dalla quantita rho. Quando l'errore si riduce così piano vuol dire che
% rho è molto prossima a 1. Infatti se controllo cond(A), vedo che è molto
% alto. Se calcolo rho, vedo che è 0.999..., quindi l'errore al passo k+1 è
% di poco più piccolo di quello al passo k.
% Secondo la teoria il metodo del gradiente coniugato converge alla
% soluzione esatta in n iterazione. Nell'aritmetica del calcolatore si usa
% qualche iterazione in più. Questo è sempre dovuto al condizionamento
% alto, che => errori di arrotondamento vengono propagati molto di più.
% Dato che si riesce ad arrivare alla soluzione esatta non interviene la
% stima dell'errore (che è 0).
%
% Quindi coniugato più veloce e quello normale addirittura non arriva alla
% soluzione.

%% 2.5
ka=cond(A) % matrice mal condizionata
% Non sappiamo qual'è A segnato
% Prendo quindi come errore sui dati un numero che è dell'ordine della
% precisione di macchina

err=ka*eps