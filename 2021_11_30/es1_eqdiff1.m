% Esercizio 1 eqdiff1

% Definisco i dati
odefun=@(t,y)t-y;
tspan=[-1,3];
y0=1;

% Scelgo la discretizzazione
% Aumentando h, aumenta la precisione dell'approssimazione
Nh=8; % h=0.5 => Nh=(3-(-1))/h=8
[tn,un]=eulero_esp(odefun,tspan,y0,Nh);

% Soluzione esatta
yex=@(t)t-1+3*exp(-t-1);
t1=linspace(tspan(1),tspan(2),500);

figure(1);clf
plot(tn,un,".--","DisplayName","Approx") % Tra un puntino e l'altro non conosco la soluzione!
xlabel("t");ylabel("y(t)")
hold on
grid on
plot(t1,yex(t1),"DisplayName","Sol esatta");
legend("-DynamicLegend")
