function [alpha,k,errv]=puntofisso(phi,x0,tol,kmax)
% Funzione per la ricerca di un punto fisso di phi

k=0;
err=1+tol;
errv=err;
while err>tol && k<kmax
    xnew=phi(x0);
    err=abs(xnew-x0); % stimatore dell'errore sull'incremento
    errv=[errv;err];
    k=k+1;
    x0=xnew;
end
alpha=xnew;