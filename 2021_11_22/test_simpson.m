% Grado di esattezza
f=@(x)x^3+x^2+x;
a=0;b=2;
got=simpson(f,a,b,1)

expected=int(x^3+x^2+x,x,a,b)

% Verifica dell'ordine
f=@(x)exp(x);
a=1;b=2;
lex=exp(2)-exp(1);

ERRORE=[]; H=[];
for M=10:10:200
    Is=simpson(f,a,b,M);
    err=abs(lex-Is);
    H=[H,(b-a)/M];
    ERRORE=[ERRORE,err];
end

figure(1); clf
loglog(H,ERRORE,"DisplayName","Errore Simpson","LineWidth",2)
legend("-DynamicLegend")
hold on
loglog(H,H.^4,"DisplayName","H^4")
grid on
xlabel("H"); ylabel("Errore")