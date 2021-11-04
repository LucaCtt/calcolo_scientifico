% Script per verificare se le funzioni di punto fisso soddisfano le
% ipostesi del teorema di Ostrowski, per capire se la succ di punto fisso
% converge o no al punto fisso sqrt(2)

% funzione phi1
phi1=@(x)-1/4*x.^2+x+1/2;
b=@(x)x; % bisettrice

figure(1); clf
fplot(phi1, [0,3]) % dal grafico ho una intersezione con bisettrice -> pto fisso
hold on
fplot(b,[0,3],'k--')
grid on
xlabel("x"); ylabel("y")

% funzione phi2
phi2=@(x)-x.^2+x+2;
fplot(phi2, [0,2])

% funzione phi3
phi3=@(x)x/2+1./x;
fplot(phi3, [0.5,3])

legend("phi_1(x)","y=x","phi_2(x)","phi_3(x)")
axis equal

%% richiamo la function puntofisso sulle tre funzioni

% funzione phi1
x0=1;
tol=1e-10;
kmax=100;
[alpha1,k1,errv1]=puntofisso(phi1,x0,tol,kmax)
% vedo che ho convergenza lineare -> la derivata di phi1 in sqrt(2) e != 0

% funzione phi2
% [alpha2,k2,errv2]=puntofisso(phi2,x0,tol,kmax)
% l'errore rimane a 2 perchè sto oscillando tra due valori di x0 e xnew
% loop infinito! raggiungo il kmax
x0=1.5;
[alpha2,k2,errv2]=puntofisso(phi2,x0,tol,kmax)

% funzione phi3
[alpha3,k3,errv3]=puntofisso(phi3,x0,tol,kmax)

%%
figure(1); clf
semilogy([0:k1],errv1,"Displayname","phi1","Linewidth",2)
legend("-dynamiclegend");
hold on
semilogy([0:k2],errv2,"Displayname","phi2","Linewidth",2)
semilogy([0:k3],errv3,"Displayname","phi3","Linewidth",2)
grid on
xlabel("k"); ylabel("errori")