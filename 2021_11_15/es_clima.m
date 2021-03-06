x=(-55:10:65)';
y=[3.7 3.7 3.52 3.27 3.2 3.15 3.15 3.25 3.47 3.52 3.65 3.62 3.52]';

%% Interpolazione globale di Lagrange
% Matrice di Vandermonde
X=vander(x);

% Risolvo il sistema lineare Xa=y
% a=vettore dei coeff rispetto alla base dei monomi
a=meg_pivot(X,y);

% Definisco un vettore di punti ben più fitti dei nodi di interpolazione
% per valutare il polinomio
x1=linspace(x(1),x(end),100);

% Valuto p_11(x) nei nodi x1 (11 perchè ho 12 dati)
y1=polyval(a,x1);

%% Interpolatore composito lineare
yp1c=interp1(x,y,x1);

%% Interpolazione con spline cubiche
ys=spline(x,y,x1);

%% Valuto i punti con spline e p1c
x2=[42;59]
y2c=interp1(x,y,x2);
y2s=spline(x,y,x2);
fprintf("DeltaT a Roma (p1c)= %e\n",y2c(1))
fprintf("DeltaT a Roma (spline)= %e\n",y2s(1))
fprintf("DeltaT a Oslo (p1c)= %e\n",y2c(2))
fprintf("DeltaT a Oslo (spline)= %e\n",y2s(2))

%% Disegno
figure(1); clf
% Disegno i dati del problema
plot(x,y,".","MarkerSize",20,"DisplayName","Dati")
legend("-DynamicLegend")
hold on
grid on
plot(x1,y1,"LineWidth",2,"DisplayName","Glob. Lagrange V")
plot(x1,yp1c,"LineWidth",2,"DisplayName","Lagrange comp. lin")
plot(x1,ys,"LineWidth",2,"DisplayName","Spline cubiche")

plot(x2,y2c,"s")
plot(x2,y2s,"s")

xlabel("x"); ylabel("y")