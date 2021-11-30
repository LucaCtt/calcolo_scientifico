% problema ottica
T=213; % Temperatura corpo nero
f=@(x)2.39e-11./(x.^5.*(exp(1.432./(T*x))-1)); % Funzione integranda
a=3e-4;b=14e-4;
npunti=51;

% Nodi di quadratura
x=linspace(a,b,npunti);
y=f(x);
E=trapz(x,y);

fprintf("Energia emessa=%e\n",E);

%% Stimo l'errore

syms xs
f=2.39e-11./(x.^5.*(exp(1.432./(T*x))-1));
f2=diff(f,xs,2);

F2=matlabFunction(f2) % Function handle

figure(1); clf
fplot(F2,[a,b])
grid on
xlabel("x");ylabel("f(x)")

xx=linspace(a,b,1000);
yf2=F2(xx);

maxf2=max(abs(yf2));

H=(b-a)/(npunti-1) % Ampiezza intervallini
stima_errore=(b-a)/13*H^2*maxf2;
fprintf("Stima dell'errore = %e\n", stima_errore);

%% Stimo H
epsilon=1e-10;
H=sqrt(12*epsilon/(b-a)/maxf2) % Numero degli intervallini
M=ceil((b-a)/H)