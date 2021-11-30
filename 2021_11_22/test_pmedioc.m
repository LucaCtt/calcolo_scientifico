% Grado di esattezza
f=@(x)x;
a=0;b=2;
Imp=pmedioc(f,a,b,1)

% Verifica dell'ordine
f=@(x)exp(x);
a=1;b=2;
lex=exp(2)-exp(1);

ERRORE=[]; H=[];
for M=10:10:200
    Imp=pmedioc(f,a,b,M);
    err=abs(lex-Imp);
    H=[H,(b-a)/M];
    ERRORE=[ERRORE,err];
end

figure(1); clf
loglog(H,ERRORE,"DisplayName","Errore PMc","LineWidth",2)
legend("-DynamicLegend")
hold on
loglog(H,H.^2,"DisplayName","H^2")
grid on
xlabel("H"); ylabel("Errore")