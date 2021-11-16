% Interpolazione globale di Lagrange
% Funzione da interpolare
f=@(x)1./(1+x.^2);
xa=-5;xb=5; % intervallo

% nodi per il disegno e il calcolo dell'errore
x1=linspace(xa,xb,200)';

% valuto la funzione f nei nodi x1
yf=f(x1);

errore=[];
nodi=menu("Scegli i nodi di interpolazione","Equispaziati","Gauss-Chebyshev");

% costruisco il polinomio p_n
for n=2:14

% costruisco i nodi di interpolazione
if nodi==1
    x=linspace(xa,xb,n+1)'; % equispaziati
elseif nodi==2
    % gauss-chebyshev
    xs=-cos(pi*(0:n)'/n);
    x=(xb-xa)/2*xs+(xb+xa)/2;
end

% valuto f nei nodi di interpolazione
y=f(x);

% costruisco il polinomio con la formula baricentrica
y1=barycentric(x,y,x1);

figure(1); clf
plot(x1,yf,"LineWidth",2,"DisplayName","f(x)")
legend("-dynamicLegend")
hold on
plot(x1,y1,"LineWidth",2,"DisplayName",['p_{',num2str(n),'}(x)'])
plot(x,y,"ko","MarkerFaceColor","k","DisplayName","Nodi di interpolazione")
grid on
xlabel("x");ylabel("y")
legend("Location","northwest")

err=norm(yf-y1,inf);
errore=[errore;err];
fprintf("n=%d, errore=%e\n",n,err)
pause
end

%%
% Disegno gli errore al variare di n
figure(2); clf
semilogy(2:14,errore,"-o","MarkerFaceColor","k","LineWidth",2)
grid on
xlabel("grado polinomiale"); ylabel("errore di interpolazione")