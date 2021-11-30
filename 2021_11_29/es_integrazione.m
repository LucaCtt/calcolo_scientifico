% esercizio integrazione
% prima funzione
a=0; b=5; 
f=@(x)1./(1+(x-2).^2);
Iex=atan(3)+atan(2);

% seconda funzione 
% a=0; b=5;
% f=@(x)sqrt(x);
% Iex=2/3*5^(3/2);

% terza scelta
%a=1; b=5;
%f=@(x)sqrt(x); % primitiva e' 2/3 * x^(3/2)
%Iex=2/3*5^(3/2)-2/3;


H=[ ];
Err=[ ];

for M=10:10:1000
    % calcolo l'integrale approssimato
    Ipm=pmedioc(f,a,b,M);
    errore=abs(Iex-Ipm);
    Err=[Err, errore];
    H=[H, (b-a)/M];
end

figure(1); clf
loglog(H,Err,'Linewidth',2,'Displayname','errore')
legend('-dynamiclegend')
hold on
loglog(H,H.^2,'Linewidth',2,'Displayname','H^2')
grid on
xlabel('H')
ylabel('errori')