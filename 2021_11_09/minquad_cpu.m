% minimi quadrati cpu

x=[10000;20000;30000;40000;50000]; % L
y=[0.31;0.95;2.45;4.10;6.46]; % CPUtime

% 2 incognite
n=3;
m=5;

% X=[x.^2,x,ones(m,1)];
% % calcolare la fattorizzazione QR di X
% [Q,R]=qr(X);
% % estrarre le matrici Qtilde e Rtilde
% Qtilde=Q(:,1:n);
% Rtilde=R(1:n,:);
% % risolvere il sistema Rtilde a = Qtilde' * y
% a=backsub(Rtilde,Qtilde'*y);

% Fa esattamente quello che c'è sopra
a=polyfit(x,y,2);

% rappresentazione grafica
figure(1); clf
plot(x,y,"bo","MarkerFaceColor","b","displayname","dati")
grid on
hold on
legend("-dynamiclegend")

% Per avere una parabola un po' più bella
x1=linspace(x(1),x(end),100)';
yg=polyval(a,x1);
plot(x1,yg,"Displayname","retta min quad", "LineWidth",2)
xlabel("L"); ylabel("CPUtime")

% valuto L in x=0.2
xs=55218;
ys=polyval(a,xs);
plot(xs,ys,"s","DisplayName","valore stimato")