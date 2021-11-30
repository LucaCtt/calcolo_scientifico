% Esercizio 1 eqdiff1

% Definisco i dati
odefun=@(t,y)t-y;
tspan=[-1,3];
y0=1;

% Scelgo la discretizzazione
Nh=8; % h=0.5 => (3-(-1))/h=8
[tn,un]=eulero_esp(odefun,tspan,y0,Nh);

figure(1);clf
plot(tn,un,".") % Tra un puntino e l'altro non conosco la soluzione!
xlabel("t");ylabel("y(t)")