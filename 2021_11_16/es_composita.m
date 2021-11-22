f=@(x)1./(1+x.^2);
xa=-5;xb=5;

x1=linspace(xa,xb,1000)';
yf=f(x1);

ERR1=[];ERR2=[];H=[];
for n=10:10:500
    H=[H,(xb-xa)/n];
    x=linspace(xa,xb,n+1);
    y=f(x);
    % Interpolatore composito lineare
    yp1c=interp1(x,y,x1);
    
    %spline
    ys=spline(x,y,x1);
    
    errp1c=norm(yf-yp1c,inf);
    ERR1=[ERR1;errp1c];
    errs=norm(yf-ys,inf);
    ERR2=[ERR2;errs];

    fprintf("n=%d, errp1c=%e, errs=%e\n",n,errp1c,errs);
end

%% Grafico errori
figure(2); clf
loglog(H,ERR1,"LineWidth",2,"DisplayName","Errore interp comp lin")
hold on
grid on
legend("-DynamicLegend")
legend("Location","southeast")
loglog(H,ERR2,"LineWidth",2,"DisplayName","Errore spline")
loglog(H,H.^2,"DisplayName","H^2")
loglog(H,H.^4,"DisplayName","H^4")
xlabel("H"); ylabel("ERR")
