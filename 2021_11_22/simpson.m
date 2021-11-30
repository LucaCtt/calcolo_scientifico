function [Is] = simpson(f,a,b,M)
% Formula di quadratura di Simpson composito
% Input: f=function handle
%        a,b=estremi dell'intervallo di integrazione
%        M=numero di intervallini
% Output: Is=valore approssimato dell'integrale

Is=0;
somm=0;
x=linspace(a,b,M+1);
H=x(2)-x(1); % (b-a)/M

for k=1:M
xm=(x(k)+x(k+1))/2;
somm=somm+f(x(k))+4*f(xm)+f(x(k+1));
end

Is=H/6*somm;