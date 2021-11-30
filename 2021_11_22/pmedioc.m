function [Imp] = pmedioc(f,a,b,M)
% Formula di quadratura di punto medio composito
% Input: f=function handle
%        a,b=estremi dell'intervallo di integrazione
%        M=numero di intervallini
% Output: Imp=valore approssimato dell'integrale

Imp=0;
somm=0;
x=linspace(a,b,M+1);
H=x(2)-x(1); % (b-a)/M

for k=1:M
xm=(x(k)+x(k+1))/2;
somm=somm+f(xm);
end

Imp=H*somm;