% minimi quadrati dischi intervertebrali

x=[0;0.04;0.06;0.1;0.14;0.25;0.31]; % sforzo
y=[0;0.03;0.08;0.08;0.14;0.20;0.23]; % deformazione

% 2 incognite
n=2;
m=7;

X=[x,ones(m,1)];
% calcolare la fattorizzazione QR di X
[Q,R]=qr(X);
% estrarre le matrici Qtilde e Rtilde
Qtilde=Q(:,1:n);
Rtilde=R(1:n,:);
% risolvere il sistema Rtilde a = Qtilde' * y
a=backsub(Rtilde,Qtilde'*y);

% rappresentazione grafica
figure(1); clf
plot(x,y,"bo","MarkerFaceColor","b","displayname","dati")
grid on
hold on
legend("-dynamiclegend")

% yg=polyval(a,x) resituisce quanto vale il polinomio di coeff memorizzati
% in a in corrispondenza delle ascisse x.
% Uguale a dire g=@(x)a(1)*x+a(2) e yg=g(x);

yg=polyval(a,x);
plot(x,yg,"Displayname","retta min quad", "LineWidth",2)
xlabel("sforzo"); ylabel("deformazione")

% valuto lo sforzo in x=0.2
xs=0.2;
ys=polyval(a,xs);
plot(xs,ys,"s","DisplayName","valore stimato")