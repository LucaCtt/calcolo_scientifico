% Interpolazione globale di Lagrange
% Funzione da interpolare
f=@(x)1./(1+x.^2);
xa=-5;xb=5; % intervallo

% nodi per il disegno e il calcolo dell'errore
x1=linspace(xa,xb,200)';

% valuto la funzione f nei nodi x1
yf=f(x1);

errorev=[];erroreb=[];

for n=4:64

% gauss-chebyshev
xs=-cos(pi*(0:n)'/n);
x=(xb-xa)/2*xs+(xb+xa)/2;

% valuto f nei nodi di interpolazione
y=f(x);

% Vandermonde
X=vander(x);
a=meg_pivot(X,y);
y1v=polyval(a,x1);

% Formula baricentrica
y1b=barycentric(x,y,x1);

errv=norm(yf-y1v,inf); errorev=[errorev;errv];
errb=norm(yf-y1b,inf); erroreb=[erroreb;errb];
end

figure(2); clf
semilogy(4:64,errorev,"LineWidth",2,"DisplayName","Vandermonde")
grid on
hold on
legend("-DynamicLegend")
semilogy(4:64,erroreb,"LineWidth",2,"DisplayName","Barycentric")
xlabel("grado polinomiale n"); ylabel("errore di interpolazione")