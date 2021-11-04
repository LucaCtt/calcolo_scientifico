function [z,k,res] = bisezione(f,a,b,tol,kmax)
% bisezione [z,k,res] = bisezione(f,a,b,tol,kmax)
% input:
% output:

k=0; % contatore iterazioni
err=1+tol; % stimatore
c=[]; y=[];

while err > tol && k <= kmax
    c=(a+b)/2;
    y=f(c);
    err=(b-a)/2;
    if y==0
        % c == alpha
        err=0;
    else
        if y*f(a)<0
            b=c; % modifico solo l'estremo destro dell'intervallo
        else
            a=c; % modifico solo l'estremo sinistro dell'intervallo
        end
        k=k+1;
    end
end
z=c; % approssimazione di alpha
res=y;
end

