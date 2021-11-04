function [z,res,k,ERR]=newton(f,df,x0,tol,kmax)
err=1+tol;
k=0;
x=x0;
ERR=[err];

while err>tol && k<kmax
    xnew=x-(f(x)/df(x));
    err=abs(xnew-x);
    ERR=[ERR;err];
    k=k+1;
    x=xnew;
end
z=x;
res=f(z);
end