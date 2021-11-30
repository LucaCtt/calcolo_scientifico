% 
syms x
f=exp(x)*cos(x);
f2=diff(f,2); % derivata seconda
F2=matlabFunction(f2);
% calcolo max |f''(x)| su [0,pi]
xx=linspace(0,pi,1000);
maxf2=max(abs(F2(xx)));

% punto medio
% H^2 <= 24 * epsilon / ( (b-a) * maxf2)

Hpm=sqrt(24*1e-4 /(pi*maxf2))
Mpm=ceil(pi/Hpm)
% 440 intervallini per punto medio


% trapezi
% H^2 <= 12 * epsilon / ( (b-a) * maxf2)

Ht=sqrt(12*1e-4 /(pi*maxf2))
Mt=ceil(pi/Ht)
% trapezi richiede circa 660 intervallini

% Simpson
f4=diff(f,4); % derivata quarta
F4=matlabFunction(f4);
% calcolo max |f4(x)| su [0,pi]
xx=linspace(0,pi,1000);
maxf4=max(abs(F4(xx)));
% H^4 < = (180*16* epsilon /( (b-a)*maxf4)

Hs=(180*16*1e-4/(pi*maxf4))^0.25
Ms=ceil(pi/Hs)
% Simpson richiede 18 intervallini