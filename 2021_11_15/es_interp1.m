% Interpolazione es. robot
% Non esiste un'interpolazione strettamente migliore, dipende tutto dal
% problema

x=[2.00;4.25;5.25;7.81;9.20;10.60];
y=[7.2;7.1;6.0;5.0;3.5;5.0];

%% Interpolazione globale di Lagrange
% Matrice di Vandermonde
X=vander(x);

% Risolvo il sistema lineare Xa=y
% a=vettore dei coeff rispetto alla base dei monomi
a=meg_pivot(X,y);

% Definisco un vettore di punti ben più fitti dei nodi di interpolazione
% per valutare il polinomio
x1=linspace(x(1),x(end),100);

% Valuto p_5(x) nei nodi x1 (5 perchè ho 6 dati)
y1=polyval(a,x1);

%% Calcolo polinomio globale di Lagrange con formula baricentrica
y1b=barycentric(x,y,x1);

%% Interpolatore composito lineare
yp1c=interp1(x,y,x1);
% Non ideale per il movimento di un macchinario

%% Interpolazione con spline cubiche
ys=spline(x,y,x1);

%% Disegno
figure(1); clf
% Disegno i dati del problema
plot(x,y,".","MarkerSize",20,"DisplayName","Dati")
legend("-DynamicLegend")
hold on
grid on
plot(x1,y1,"LineWidth",2,"DisplayName","Glob. Lagrange V")
plot(x1,y1b,"LineWidth",2,"DisplayName","Glob. Lagrange B")
plot(x1,yp1c,"LineWidth",2,"DisplayName","Lagrange comp. lin")
plot(x1,ys,"LineWidth",2,"DisplayName","Spline cubiche")

xlabel("x"); ylabel("y")

% Nel primo intervallo ho un comportamento un po' strano: questo è dovuto
% al fatto che esiste uno ed un solo polinomio, che per forza ha questo
% comportamento.