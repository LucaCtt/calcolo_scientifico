function [z,res,k,ERR]=secanti(f,x0,x1,tol,kmax)
err=1+tol;
k=0;
ERR=[err];

while err>tol && k<kmax
    m=(f(x1)-f(x0))/(x1-x0);
    xnew=x1-f(x1)/m;
    err=abs(xnew-x1);
    ERR=[ERR;err];
    k=k+1;
    x0=x1;
    x1=xnew;
end
z=x;
res=f(z);
end