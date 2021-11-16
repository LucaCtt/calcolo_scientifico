f=@(x)1./(1+x.^2);
xa=-5;xb=5;

x1=linspace(xa,xb,1000)';
yf=f(x1);

n=100;
x=linspace(xa,xb,n+1);
y=f(x);
% Interpolatore composito lineare
yp1c=interp1(x,y,x1);

%spline
ys=spline(x,y,x1);

errp1c=norm(yf-yp1c,inf);
errs=norm(yf-ys,inf);
fprintf("n=%d, errp1c=%e, errs=%e\n",n,errp1c,errs);

figure(1); clf
plot(x1,yf,"LineWidth",2,"DisplayName","f(x)")
legend("-dynamicLegend")
hold on
plot(x1,yp1c,"LineWidth",2,"DisplayName","p1c")
plot(x1,ys,"LineWidth",2,"DisplayName","spline")
grid on
xlabel("x");ylabel("y")
legend("Location","northwest")