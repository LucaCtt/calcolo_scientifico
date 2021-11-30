function [tn,un]=eulero_esp(odefun,tspan,y0,Nh)
% [tn,un]=eulero_esp(odefun,tspan,y0,Nh)
% Metodo di Eulero in avanti
% Input: odefun=espressione della f
%        tspan=[t0,T]=vettore con istante iniziale e finale
%        y0=condizione iniziale
%        Nh=numero intero di passi temporali
% Output: tn=vettore colonna contenente gli istanti temp tra t0 e tNh
%         un=vettore colonna contenente la sol numerica negli istanti tn

un=zeros(Nh+1,1);
tn=linspace(tspan(1),tspan(2),Nh+1);
h=tn(2)-tn(1);

% Applico la condizione iniziale
un(1)=y0;

for n=2:Nh+1
    un(n)=un(n-1)+h*odefun(tn(n-1),un(n-1));
end

% Oppure:
% for n=1:Nh
%     un(n+1)=un(n)+h*odefun(tn(n),un(n))
% end

end