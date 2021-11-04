function [x,res,k,resv]=gradiente(A,b,x0,tol,kmax)
% Metodo del gradiente per risolvere Ax=b
% [x,res,k,resv]=gradiente(A,b,x0,tol,kmax)
% Input: A=matrice quadrata s.d.p
%        b=termine noto
%        x0=vettore iniziale
%        tol=tolleranza
%        kmax=n max iterazione per test d'arresto
% Output: x=vettore soluzione
%         res=||r*k||/||b||
%         k=numero iterazioni
%         resv=vettore dei valori ||r*k||/||b||

x=x0;
r=b-A*x; % residuo
d=r; % direzione di discesa
k=0; % iterazione
res=tol+1; % stimatore errore
nb=norm(b);
resv=norm(r)/nb;

while k<kmax && res>tol
    v=A*d;
    alpha=(d'*r)/(d'*v);
    x=x+alpha*d;
    r=r-alpha*v;
    d=r;
    nr=norm(r);
    res=nr/nb;
    k=k+1;
    resv=[resv;res];
end