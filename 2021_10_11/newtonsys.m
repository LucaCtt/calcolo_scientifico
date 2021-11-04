function [zero,res,k,errv]=newtonsys(f,Jf,x0,tol,kmax)
% Newton per sistemi di eq non lineari

k=0;
err=tol+1;
errv=[err];
while k<kmax && err>tol
    b=-f(x0); %vettore di funzioni
    A=Jf(x0); %matrice di funzioni
    %risolvo Az=b con \
    z=A\b;
    xnew=x0+z;
    err=norm(z);
    k=k+1;
    x0=xnew;
end
zero=xnew;
res=f(zero);