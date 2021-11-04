% inserimento dati
theta=[pi/6,2*pi/9,5*pi/36,pi/3];

phi=[pi/6,pi/3,pi/2,2*pi/3];
rs=42.168e6; % raggio orbita geostazionaria in metri
c=299792; % velocità della luce in metri

% tempi di spedizione del segnale
ts=[0.0,0.1,0.2,0.05];
% tempi di ricezione del segnale
tr=[120.3312573558543,121.9281015231533,125.5843020645584,136.4331045023147];

% trasformazione delel coordinate sferiche in coordinate cartesiane
S=zeros(4,3); % S conterrà le coordinate cartesiane
% riga <--> satellite
for i=1:4
    S(i,:)=[rs*sin(theta(i))*cos(phi(i)), rs*sin(theta(i))*sin(phi(i)), rs*cos(theta(i))];
end

% definisco la funzione F del sistema
% x(1)=x_R, x(2)=y_R, x(3)=z_R, x(4)=delta
f=@(x)[sqrt((S(1,1)-x(1))^2+(S(1,2)-x(2))^2+(S(1,3)-x(3))^2)-c*(tr(1)-ts(1))-c*x(4);
       sqrt((S(2,1)-x(1))^2+(S(2,2)-x(2))^2+(S(2,3)-x(3))^2)-c*(tr(2)-ts(2))-c*x(4);
       sqrt((S(3,1)-x(1))^2+(S(3,2)-x(2))^2+(S(3,3)-x(3))^2)-c*(tr(3)-ts(3))-c*x(4);
       sqrt((S(4,1)-x(1))^2+(S(4,2)-x(2))^2+(S(4,3)-x(3))^2)-c*(tr(4)-ts(4))-c*x(4)];

tol=1e-9;
kmax=100;
B0=eye(4); % matrice identità

[x,y,z]=sphere; % valuta n punti sulla superficie della sfera di centro l'origine e raggio 1
rt=6.371e6;
x0=[rt*sin(theta(1))*cos(phi(1));rt*sin(theta(1))*sin(phi(1));rt*cos(theta(1));0];

xt=x*rt;yt=y*rt;zt=z*rt;
surf(xt,yt,zt); axis equal;
hold on

% disegno i satelliti
plot3(S(1,1),S(1,2),S(1,3),"ko","Markersize",10,"Markerfacecolor","k")
plot3(S(2,1),S(2,2),S(2,3),"ko","Markersize",10,"Markerfacecolor","b")
plot3(S(3,1),S(3,2),S(3,3),"ko","Markersize",10,"Markerfacecolor","r")
plot3(S(4,1),S(4,2),S(4,3),"ko","Markersize",10,"Markerfacecolor","g")
xlabel("x"); ylabel("y"); zlabel("z")

% chiamo Broyden
[zero,res,niter,err]=broyden(f,B0,x0,tol,kmax)
plot3(zero(1),zero(2),zero(3),"ko","Markersize",10,"Markerfacecolor","k")