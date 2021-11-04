A=[1 1+0.5e-15 3;2 2 20;3 6 4];
b=[5+0.5e-15;24;13];

[L,U]=fattorizzazionelu(A,0);

y=forsub(L,b);
x=backsub(U,y)

[L1,U1,P1]=fattorizzazionelu(A,1);

y1=forsub(L1,P1*b);
x1=backsub(U1,y1)

% Nel primo caso ottengo un risultato sbagliato!
% Se guardo L, ho molti valori piccolissimi (lo vedo con format short e)
% Ho un fattore di e+15, che moltiplicato per gli errori di arrotondamento
% danno degli errori molto grossi.

% Se invece faccio la pivotazione questo problema non si presenta



