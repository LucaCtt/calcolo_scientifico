% minimi quadrati cpu

x=(1:24);
y=[73.72;23.39;17.11;20.31;29.37;74.74;117.02;298.04;348.13;294.75;253.78;
   250.48;239.48;236.52;245.04;286.74;304.78;288.76;247.11;216.73;185.78;
   171.19;171.73;164.05];

%%
a=polyfit(x,y,8);

% rappresentazione grafica
figure(1); clf
plot(x,y,"bo","MarkerFaceColor","b","displayname","dati")
grid on
hold on
legend("-dynamiclegend")

x1=linspace(x(1),x(end),100)';
yg=polyval(a,x1);
plot(x1,yg,"Displayname","retta min quad", "LineWidth",2)
xlabel("t"); ylabel("y")

%%
omega=pi/2;
X=[ones(m,1),sin(omega*x),cos(omega*x),sin(2*omega*tol),cos(2*omega*tol)...
   sin(3*omega*x),cos(3*omega*x),sin(4*omega*tol),cos(4*omega*tol)];
% calcolare la fattorizzazione QR di X
[Q,R]=qr(X);
% estrarre le matrici Qtilde e Rtilde
Qtilde=Q(:,1:n);
Rtilde=R(1:n,:);
% risolvere il sistema Rtilde a = Qtilde' * y
a=backsub(Rtilde,Qtilde'*y);

% rappresentazione grafica
figure(2); clf
plot(x,y,"bo","MarkerFaceColor","b","displayname","dati")
grid on
hold on
legend("-dynamiclegend")

x1=linspace(x(1),x(end),100)';
% definire g2 con i coefficienti trovati
g2=@(x)a(1)+a(2)*sin(omega*x)+a(3)*cos(omega*x)+a(4)*sin(2*omega*tol)+...
    +a(5)*cos(2*omega*tol)+a(6)*sin(3*omega*x)+a(7)*cos(3*omega*x)+...
    +a(8)*sin(4*omega*tol)+a(9)*cos(4*omega*tol);

yg=g2(x1);
plot(x1,yg,"Displayname","retta min quad", "LineWidth",2)
xlabel("ora"); ylabel("NO")